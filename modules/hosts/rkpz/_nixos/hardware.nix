{ lib, modulesPath, ... }: {
    imports = [
        (modulesPath + "/profiles/qemu-guest.nix")
    ];

    boot = {
        initrd.availableKernelModules = [ 
            "virtio_blk" 
            "virtio_scsi" 
            "virtio_net" 
            "virtio_pci"
        ];
        kernelModules = [ "kvm-amd" ];
    };

    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
