{ ... }:
{
  variable = {
    backend_s3_region = {
      type = "string";
      description = "region";
    };
    backend_s3_bucket = {
      type = "string";
      description = "This is the bucket for storage of state";
    };
    backend_s3_key = {
      type = "string";
      description = "the key used for bucket";
    };
  };
  backend = {
    s3 = {
      region = "US1"; #"\${ var.backend_s3_region }";
      bucket = "\${ var.backend_s3_bucket }";
      key = "\${ var.backend_s3_key }";
    };
  };
}