{
    programs.nixvim = {
        autoGroups = {
            highlight_yank = {
                clear = true;
            };
            no_auto_comment = {
                clear = true; # По умолчанию очищаем группу при перезагрузке
            };
        };
        autoCmd = [
            {
              event = [ "TextYankPost" ];
              group = "highlight_yank";
              pattern = [ "*" ];
              desc = "highlight selection on yank";
              callback.__raw = ''
                  function()
                      vim.highlight.on_yank({ timeout = 200, visual = true })
                  end
              '';
            }
            {
                event = [ "FileType" ];
                group = "no_auto_comment";
                callback.__raw = ''
                    function()
                        vim.opt_local.formatoptions:remove({ "c", "r", "o" })
                    end
                '';
            }
        ];
    };
}
