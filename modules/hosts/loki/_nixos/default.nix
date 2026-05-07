{
    imports = [
        ./hardware.nix
        ./disko.nix
    ];
 
    programs.ssh.startAgent = true;
    home-manager.backupFileExtension = "backup";

    time.hardwareClockInLocalTime = true;

    system.stateVersion = "25.11";
}
