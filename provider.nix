{ ... }:
{
  terraform = {
    required_version = ">= 0.13.0";
    required_providers = {
      proxmox = {
        source = "telmate/proxmox";
        version = "2.9.3";
      };
      aws = {
       source = "hashicorp/aws";
      };
    };
  };
  variable = {
    proxmox_api_url = {
      type = "string";
      description = "This is the location of proxmox";
    };
    proxmox_api_token_id = {
      type = "string";
      description = "This is the token id";
    };
    proxmox_api_token_secret = {
      type = "string";
      description = "This is the location of proxmox";
    };
  };
  provider = {
    proxmox = {
      pm_api_url = "\${ var.proxmox_api_url }";
      pm_api_token_id = "\${ var.proxmox_api_token_id }";
      pm_api_token_secret = "\${ var.proxmox_api_token_secret }";
    };
  };
}