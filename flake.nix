{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.darwin.follows = "";
    };
    terranix = {
      url = "github:terranix/terranix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, flake-utils, agenix, terranix }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        terraform = pkgs.terraform;
        passage = pkgs.passage;
        terraformConfiguration = terranix.lib.terranixConfiguration {
          inherit system;
          modules = [ 
            ./backends/postgres.nix
            ./providers/proxmox.nix
            ./workspaces/production
            ];
        };
      in
      {
        defaultPackage = terraformConfiguration;
        # nix develop
        devShell = pkgs.mkShell {
          buildInputs = [
            pkgs.terraform
            pkgs.passage
            pkgs.age
            terranix.defaultPackage.${system}
          ];
        };
        # nix run ".#apply"
        apps = {
          export-secrets = {
            type = "app";
            program =  toString (pkgs.writers.writeBash "export-secrets" (builtins.readFile (pkgs.substituteAll { src = ./scripts/export_passage_secrets.sh; inherit passage; })));
          };
          init = {
            type = "app";
            program =  toString (pkgs.writers.writeBash "init" "rm -f config.tf.json; cp ${terraformConfiguration} config.tf.json && ${terraform}/bin/terraform init -backend-config=conn_str=$TF_PG_URL");
          };
          validate = {
            type = "app";
            program = toString (pkgs.writers.writeBash "validate" "nix run .\#init && ${terraform}/bin/terraform validate");
          };
          plan = {
            type = "app";
            program = toString (pkgs.writers.writeBash "plan" "nix run .\#init && ${terraform}/bin/terraform plan"); 
          };
          apply = {
            type = "app";
            # TODO find less hacky way to run init portion
            program = toString (pkgs.writers.writeBash "apply" "nix run .\#init && ${terraform}/bin/terraform apply \${1}");
          };
          # nix run ".#destroy"
          destroy = {
            type = "app";
            program = toString (pkgs.writers.writeBash "destroy" "nix run .\#init; ${terraform}/bin/terraform destroy");
          };
          
        };
        # nix run
        defaultApp = self.apps.${system}.validate;
      });
}
