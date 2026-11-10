{
    imports = [
        ./hardware.nix
        ./disko.nix
        ./overlays.nix
    ];
 
    programs.ssh.startAgent = true;

    time.hardwareClockInLocalTime = true;

    system.stateVersion = "25.11";
}
