{
    flake.modules.homeManager.noctalia-shell = { ... }: {
        programs.noctalia-shell.settings.bar = {
          autoHideDelay = 500;
          autoShowDelay = 150;
          backgroundOpacity = 0.93;
          barType = "framed";
          capsuleColorKey = "none";
          capsuleOpacity = 0.38;
          contentPadding = 2;
          density = "default";
          displayMode = "always_visible";
          enableExclusionZoneInset = true;
          fontScale = 1;
          frameRadius = 12;
          frameThickness = 8;
          hideOnOverview = false;
          marginHorizontal = 4;
          marginVertical = 4;
          middleClickAction = "none";
          middleClickCommand = "";
          middleClickFollowMouse = false;
          monitors = [ ];
          mouseWheelAction = "none";
          mouseWheelWrap = true;
          outerCorners = true;
          position = "top";
          reverseScroll = false;
          rightClickAction = "controlCenter";
          rightClickCommand = "";
          rightClickFollowMouse = true;
          screenOverrides = [ ];
          showCapsule = false;
          showOnWorkspaceSwitch = true;
          showOutline = false;
          useSeparateOpacity = false;
          widgetSpacing = 6;
          
          widgets = {
            center = [
              {
                clockColor = "none";
                customFont = "";
                formatHorizontal = "HH:mm ddd, MMM dd";
                formatVertical = "HH mm - dd MM";
                id = "Clock";
                tooltipFormat = "HH:mm ddd, MMM dd";
                useCustomFont = false;
              }
            ];
            left = [
              {
                characterCount = 2;
                colorizeIcons = false;
                emptyColor = "secondary";
                enableScrollWheel = true;
                focusedColor = "primary";
                followFocusedScreen = false;
                fontWeight = "bold";
                groupedBorderOpacity = 1;
                hideUnoccupied = false;
                iconScale = 0.8;
                id = "Workspace";
                labelMode = "none";
                occupiedColor = "secondary";
                pillSize = 0.6;
                showApplications = false;
                showApplicationsHover = false;
                showBadge = true;
                showLabelsOnlyWhenOccupied = true;
                unfocusedIconsOpacity = 1;
              }
              {
                compactMode = false;
                hideMode = "hidden";
                hideWhenIdle = false;
                id = "MediaMini";
                maxWidth = 145;
                panelShowAlbumArt = true;
                scrollingMode = "hover";
                showAlbumArt = true;
                showArtistFirst = true;
                showProgressRing = true;
                showVisualizer = false;
                textColor = "none";
                useFixedWidth = false;
                visualizerType = "linear";
              }
            ];
            right = [
              {
                displayMode = "forceOpen";
                iconColor = "none";
                id = "KeyboardLayout";
                showIcon = false;
                textColor = "none";
              }
              {
                hideWhenZero = false;
                hideWhenZeroUnread = false;
                iconColor = "none";
                id = "NotificationHistory";
                showUnreadBadge = true;
                unreadBadgeColor = "primary";
              }
              {
                displayMode = "onhover";
                iconColor = "none";
                id = "Volume";
                middleClickCommand = "pwvucontrol || pavucontrol";
                textColor = "none";
              }
              {
                colorizeDistroLogo = false;
                colorizeSystemIcon = "none";
                colorizeSystemText = "none";
                customIconPath = "";
                enableColorization = false;
                icon = "noctalia";
                id = "ControlCenter";
                useDistroLogo = false;
              }
            ];
          };
        };
    };
}
