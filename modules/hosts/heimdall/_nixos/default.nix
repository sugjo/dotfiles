{
    imports = [
        ./hardware.nix
        ./disko.nix
        ./mount.nix
    ];
 
    programs.ssh.startAgent = true;

    time.hardwareClockInLocalTime = true;

    system.stateVersion = "26.05";
}
