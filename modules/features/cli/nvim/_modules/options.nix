{
    programs.nixvim = {
        opts = {
            # Номера строк
            number = true;
            relativenumber = true;

            # Индентация и табы
            tabstop = 4;
            softtabstop = 4;
            shiftwidth = 4;
            expandtab = true;
            autoindent = true;
            smartindent = true;
            wrap = false;

            # Файлы резервных копий и история
            swapfile = false;
            backup = false;
            undofile = true;
            clipboard = "unnamedplus";

            # Интерфейс
            showmode = false;
            termguicolors = true;
            background = "dark";
            scrolloff = 8;
            signcolumn = "yes";
            winborder = "rounded";
            timeoutlen = 1500;
            splitright = true;
            splitbelow = true;

            # Поиск
            incsearch = true;
            inccommand = "split";
            ignorecase = true;
            smartcase = true;

            # Поведение Backspace
            backspace = [ "start" "eol" "indent" ];
        };
    };
}
