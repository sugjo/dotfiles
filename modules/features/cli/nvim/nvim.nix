{ inputs, ... }:
{
    flake.modules.nixos.nvim = { ... }: {
        hm = [
            ({ ... }: {
                imports = [
                    inputs.nixvim.homeModules.nixvim
                    ./_modules/options.nix
                    ./_modules/plugins.nix
                    ./_modules/keymaps.nix
                    ./_modules/auto.nix
                    ./_modules/lsp.nix
                ];

                programs.nixvim = {
                    enable = true;
                    viAlias = true;
                    vimAlias = true;
                    globals.mapleader = " ";
                };
            })
        ];
    };
}
