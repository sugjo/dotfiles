{
    flake.modules.homeManager.noctalia-shell = { ... }: {
        programs.noctalia-shell.settings.appLauncher = {
            autoPasteClipboard = false;
            clipboardWatchImageCommand = "wl-paste --type image --watch cliphist store";
            clipboardWatchTextCommand = "wl-paste --type text --watch cliphist store";
            clipboardWrapText = true;
            customLaunchPrefix = "";
            customLaunchPrefixEnabled = false;
            density = "compact";
            enableClipPreview = true;
            enableClipboardChips = true;
            enableClipboardHistory = true;
            enableClipboardSmartIcons = true;
            enableSessionSearch = true;
            enableSettingsSearch = true;
            enableWindowsSearch = true;
            iconMode = "tabler";
            ignoreMouseInput = true;
            overviewLayer = true;
            pinnedApps = [ ];
            position = "center";
            screenshotAnnotationTool = "";
            showCategories = false;
            showIconBackground = false;
            sortByMostUsed = true;
            terminalCommand = "kitty -e";
            viewMode = "list";
        };
    };
}
