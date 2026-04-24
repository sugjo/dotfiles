{ self, config, inputs, ... }: {
    flake.nixosModules.sleipnirConfiguration = { pkgs, lib, ... }: {
        imports = [
            self.nixosModules.sleipnirHardware
        ];

        nix.settings.experimental-features = [ "nix-command" "flakes" ];

        boot.loader.systemd-boot.enable = true;
        boot.loader.efi.canTouchEfiVariables = true;

        boot.kernelPackages = pkgs.linuxPackages_latest;

        networking.hostName = "sleipnir";

        networking.networkmanager.enable = true;

        time.timeZone = "Asia/Yekaterinburg";

        # Select internationalisation properties.
        # i18n.defaultLocale = "en_US.UTF-8";
        # console = {
        #   font = "Lat2-Terminus16";
        #   keyMap = "us";
        #   useXkbConfig = true; # use xkb.options in tty.
        # };

        # Enable the X11 windowing system.
        # services.xserver.enable = true;


        

        # Configure keymap in X11
        # services.xserver.xkb.layout = "us";
        # services.xserver.xkb.options = "eurosign:e,caps:escape";

        # Enable CUPS to print documents.
        # services.printing.enable = true;

        services.pipewire = {
          enable = true;
          pulse.enable = true;
        };

        services.libinput.enable = true;

        users.users.sugjo = {
          isNormalUser = true;
          extraGroups = [ "wheel" ];
          packages = with pkgs; [
            tree
          ];
        };

	programs.hyprland.enable = true;
        programs.firefox.enable = true;
	programs.zoom-us.enable = true;
	programs.throne = {
		enable = true;
		tunMode.enable = true;
	};

	nixpkgs.config.allowUnfree = true;
	

        # List packages installed in system profile.
        # You can use https://search.nixos.org/ to find more packages (and options).
        environment.systemPackages = with pkgs; [
	  pkgs.kitty
          vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
          wget
          git
	  pkgs.hyprlauncher
	  pkgs.telegram-desktop
        ];

        # Some programs need SUID wrappers, can be configured further or are
        # started in user sessions.
        # programs.mtr.enable = true;
        programs.gnupg.agent = {
          enable = true;
          enableSSHSupport = true;
        };

        services.openssh.enable = true;

        # Open ports in the firewall.
        # networking.firewall.allowedTCPPorts = [ ... ];
        # networking.firewall.allowedUDPPorts = [ ... ];
        # or disable the firewall altogether.
        # networking.firewall.enable = false;

        # Copy the NixOS configuration file and link it from the resulting system
        # (/run/current-system/configuration.nix). This is useful in case you
        # accidentally delete configuration.nix.
        # system.copySystemConfiguration = true;

        system.stateVersion = "25.11";
    };
}
