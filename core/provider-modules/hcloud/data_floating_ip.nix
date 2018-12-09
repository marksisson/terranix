
# automatically generated, you should change data_floating_ip.json instead
# documentation : https://www.terraform.io/docs/providers/hcloud/d/floating_ip.html
{ config, lib, ... }:
with lib;
with types;
{
  options.hcloud.data.floating_ip = mkOption {
    default = {};
    description = "";
    type = with types; attrsOf ( submodule ( { name, ... }: {
      options = {
      # internal object that should not be overwritten.
      # used to generate references
      "_ref" = mkOption {
        type = with types; string;
        default = "data.hcloud_floating_ip.${name}";
        description = "";
      };

      # automatically generated
      extraConfig = mkOption {
        type = nullOr attrs;
        default = {};
        example = { provider = "aws.route53"; };
        description = "use this option to add options not coverd by this module";
      };

      # automatically generated, change the json file instead
      ip_address = mkOption {
        type = nullOr string;
        default = null;
        description = "- (Optional, string) IP address of the Floating IP.";
      };
      # automatically generated, change the json file instead
      selector = mkOption {
        type = nullOr string;
        default = null;
        description = "- (Optional, string)";
      };
    }; }));
  };

  config =
    let
      result = flip mapAttrs
        config.hcloud.data.floating_ip
          (key: value:
          let
            filteredValues = filterAttrs (key: _: key != "extraConfig") value;
            extraConfig = value.extraConfig;
          in
            filteredValues // extraConfig);
    in
      mkIf ( config.hcloud.enable && length (builtins.attrNames result) != 0 ) {
        data.hcloud_floating_ip = result;
      };
}
