{ lib, inputs }:
let
    inherit (lib) mkOption types;
in
{ config, ... }:
{
    options = {
        system = mkOption {
            type = types.str;
        };

        unstable = mkOption {
            type = types.bool;
        };

        modules = mkOption {
            type = with types; listOf deferredModule;
        };

        tags = mkOption {
            type = with types; listOf str;
            default = [ ];
        };

        primaryUser = mkOption {
            type = types.str;
            default = "sugjo";
        };

        specialArgs = mkOption {
            type = with types; attrsOf anything;
            default = { };
        };

        nixpkgs = mkOption {
            type = types.pathInStore;
        };

        pkgs = mkOption {
            type = types.pkgs;
        };

        finalPackage = mkOption {
            type = types.package;
        };
    };
    config = {
        nixpkgs = if config.unstable then inputs.nixpkgs else inputs.nixpkgs-stable;
        pkgs = import config.nixpkgs {
            inherit (config) system;
            config.allowUnfree = true;
        };
        specialArgs = {
            inherit inputs;
            inherit (config) primaryUser;
        };
    };

}
