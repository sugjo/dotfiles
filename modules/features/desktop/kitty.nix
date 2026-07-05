{
    flake.modules.nixos.kitty = { lib, pkgs, ... }: {
        desktop.terminal = {
          bin = lib.mkDefault "${pkgs.kitty}/bin/kitty";
          run = lib.mkDefault "${pkgs.kitty}/bin/kitty -e";
        };

        hm = [{
            programs.kitty = {
                enable = true;
                font = {
                    size = lib.mkForce 16.0;
                };

                settings = {
    cursor_trail = 30;                 # Увеличиваем длину для плавности (по умолчанию 0, макс 64)
    cursor_trail_start_threshold = 0;   # Шлейф появляется сразу при малейшем сдвиге
    cursor_trail_decay = "0.05 0.2";    # Мягкое появление и быстрое исчезновение хвоста

    cursor_shape = "block";
    cursor_blink = true;

                    confirm_os_window_close = 0;
                };
            };
        }];
    };
}
