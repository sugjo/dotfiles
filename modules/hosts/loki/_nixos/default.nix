{
    imports = [
        ./hardware.nix
        ./disko.nix
    ];

    time.hardwareClockInLocalTime = true;

    system.stateVersion = "25.11";
}
