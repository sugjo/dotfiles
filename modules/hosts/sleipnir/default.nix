{ self, inputs, ... }: {
  flake.nixosConfigurations.sleipnir = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.sleipnirConfiguration
    ];
  };
}
