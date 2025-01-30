{ config, impurity, inputs, pkgs, ... }: {
  xdg.configFile = let link = impurity.link; in {
    "termite".source = link ./.config/termite;
    "nvim".source = link ./.config/nvim;
    "i3".source = link ./.config/i3;
    "i3lock".source = link ./.config/i3lock;
    "i3status".source = link ./.config/i3status;
    "polybar".source = link ./.config/polybar;
    "neofetch".source = link ./.config/neofetch;
    # "ags".source = link ./.
    # "thorium-flags.conf".source = link ./.config/thorium-flags.co
    # "starship.toml".source = link ./.config/starship.toml;
  };
}
