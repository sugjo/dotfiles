{
	flake.modules.nixos.yubikey = { pkgs, ... }: {
		services.udev.packages = [ pkgs.yubikey-personalization ];

        services.pcscd.enable = true;
        # services.yubikey-agent.enable = true;
        programs.gnupg.agent = {
            enable = true;
            enableSSHSupport = false; # Важно: SSH поддержку НЕ включаем, чтобы не было конфликта
            pinentryPackage = pkgs.pinentry-curses; # Для терминала (или pinentry-gnome / pinentry-qt для графики)
        };
	};
}
