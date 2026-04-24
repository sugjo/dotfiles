{self, inputs, ... }: {
    flake.nixosModules.sleipnirHardware = { config, lib, pkgs, modulesPath, ... }: {
      imports = [
        (modulesPath + "/installer/scan/not-detected.nix")
      ];

      boot.initrd.availableKernelModules = [ "xhci_pci" "ehci_pci" "ahci" "usb_storage" "sd_mod" "sr_mod" "rtsx_pci_sdmmc" ];
      boot.initrd.kernelModules = [ "dm-snapshot" ];
      boot.kernelModules = [ "kvm-intel" ];
      boot.extraModulePackages = [ ];

      fileSystems."/" = { 
          device = "/dev/mapper/vg_system-root";
          fsType = "xfs";
      };

      fileSystems."/boot" = {
          device = "/dev/disk/by-uuid/1C9A-EDA7";
          fsType = "vfat";
          options = [ "fmask=0077" "dmask=0077" ];
      };

      fileSystems."/home" = {
          device = "/dev/mapper/vg_system-home";
          fsType = "ext4";
      };

      swapDevices = [ ];

      nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
      hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    };
}
