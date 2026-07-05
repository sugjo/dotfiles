{ primaryUser, pkgs, ... }: {
    programs.nixvim = {
        lsp = {
            servers = {
                nixd = {
                    enable = true;
                    config = {
                        nixpkgs = {
                            # Динамически вычисляет корень текущего флейка на диске
                            expr = "import (builtins.getFlake \"\${builtins.toString ./.}\").inputs.nixpkgs { }";
                        };
                        options = {
                            # Подтягивает опции flake-parts без захардкоженных путей
                            flake-parts = {
                                expr = "builtins.getFlake (toString ./. )";
                            };
                            nixos = {
                                # expr = "(builtins.getFlake (toString ./. )).nixosConfigurations.${config.networking.hostName}";
                            };
                            home_manager = {
                                expr = "(builtins.getFlake (toString ./. )).homeConfigurations.\"${primaryUser}\".options";
                            };
                        };
                    };
                };
                gopls.enable = true;
                clangd.enable = true;
                lua_ls = {
                    enable = true;
                    config = {
                        workspace = {
                            library = [
                                "${pkgs.hyprland}/share/hypr/stubs"
                            ];
                            checkThirdParty = false;
                        };
                        diagnostics = {
                            globals = [ "hl" "hyprland" "vim" ];
                        };
                    };
                };
            };
        };
    };
}
