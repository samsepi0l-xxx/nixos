{ config, impurity, inputs, pkgs, ... }: {
  xdg.configFile = let link = impurity.link; in {
    "nvim".source = link ./.config/nvim;
    # "ags".source = link ./.
    # "thorium-flags.conf".source = link ./.config/thorium-flags.co
    # "starship.toml".source = link ./.config/starship.toml;
  };
}
