{
	flake.modules.nixos.yubikey = { pkgs, ... }: {
		services.udev.packages = [ pkgs.yubikey-personalization ];

		programs.gnupg.agent = {
			enable = true;
		};
	};
}
