{ ... }:
{
  variable = {
    backend_pg_url = {
      type = "string";
      description = "full path with credentials to pg server";
    };
  };

  terraform = {
    backend.pg = {
      conn_str = "\${ var.backend_pg_url }";
    };
  };
}