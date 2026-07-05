{
    programs.noctalia.settings.bar = { config, ...}: {
      barType = "framed";
      widgetSpacing = 4;
      background_opacity = config.lib.stylix.opacity.terminal;
      # marginHorizontal = 4;
      # marginVertical = 4;
      showCapsule = false;

      widgets = {
        center = [
          {
            id = "Clock";
          }
        ];
        left = [
          {
            # characterCount = 2;
            # colorizeIcons = false;
            # emptyColor = "secondary";
            # enableScrollWheel = true;
            # focusedColor = "primary";
            # followFocusedScreen = false;
            # fontWeight = "bold";
            # groupedBorderOpacity = 1;
            # hideUnoccupied = false;
            # iconScale = 0.8;
            id = "Workspace";
            labelMode = "none";
            # occupiedColor = "secondary";
            # pillSize = 0.6;
            # showApplications = false;
            # showApplicationsHover = false;
            # showBadge = true;
            # showLabelsOnlyWhenOccupied = true;
            # unfocusedIconsOpacity = 1;
          }
          {
            # compactMode = false;
            # hideMode = "hidden";
            # hideWhenIdle = false;
            id = "MediaMini";
            # maxWidth = 145;
            # panelShowAlbumArt = true;
            # scrollingMode = "hover";
            # showAlbumArt = true;
            # showArtistFirst = true;
            # showProgressRing = true;
            # showVisualizer = false;
            # textColor = "none";
            # useFixedWidth = false;
            # visualizerType = "linear";
          }
        ];
        right = [
          {
            id = "Tray";
          }
          {
            displayMode = "forceOpen";
            # iconColor = "none";
            id = "KeyboardLayout";
            showIcon = false;
            # textColor = "none";
          }
          {
            # displayMode = "onhover";
            # iconColor = "none";
            id = "Volume";
            # middleClickCommand = "pwvucontrol || pavucontrol";
            # textColor = "none";
          }
          {
            # hideWhenZero = false;
            # hideWhenZeroUnread = false;
            # iconColor = "none";
            id = "NotificationHistory";
            # showUnreadBadge = true;
            # unreadBadgeColor = "primary";
          }
          # {
          #   colorizeDistroLogo = false;
          #   colorizeSystemIcon = "none";
          #   colorizeSystemText = "none";
          #   customIconPath = "";
          #   enableColorization = false;
          #   icon = "noctalia";
          #   id = "ControlCenter";
          #   useDistroLogo = false;
          # }
        ];
      };
    };
}
