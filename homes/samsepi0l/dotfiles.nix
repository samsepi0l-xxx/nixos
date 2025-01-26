{ config, impurity, inputs, pkgs, ... }: {
  xdg.configFile = let link = impurity.link; in {
    # "starship.toml".source = link ./.config/starship.toml;
  };
}
