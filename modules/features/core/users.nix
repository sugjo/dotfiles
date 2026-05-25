{
  flake.modules.nixos.users =
    { primaryUser, ... }:
    {
      users = {
        mutableUsers = false;

        users = {
          root = {
            isSystemUser = true;

            hashedPassword = "$6$hA.AhhMKLpMiYQXc$7PKNI5C1FOJ.HeMX95FgmVRXAqxLi8wQzvtHUi7nRYWcmT3y5DTzCjLSt4vJiEJtuURnFEGHBfHvLZvZcJS0L1";
          };

          ${primaryUser} = {
              isNormalUser = true;
              uid = 1000;

              group = primaryUser;

              extraGroups = [
                "wheel"
                "networkmanager"
              ];

              hashedPassword = "$6$yv0tQYuwEqsTr5LU$d2fIm1MU4LtJIqeFy.3w5Jdw8J9Lw9hDDQUqGycg6rrMISO.BLN9fmJ6/6pWUuf8uOCVpwBWtlpAeuadymxxU.";
          };
        };

        groups = {
          ${primaryUser}.gid = 1000;
        };
      };
    };
}
