{
    flake.modules.nixos.torrserver = {pkgs, ...}:
    {

        networking.firewall.allowedTCPPorts = [ 8090 ];
        environment.systemPackages = [
            pkgs.torrserver
        ];
    };
}
