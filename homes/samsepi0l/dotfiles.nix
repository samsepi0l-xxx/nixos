{ config, impurity, inputs, pkgs, ... }: {
  xdg.configFile = let link = impurity.link; in {
    "termite".source = link ./.config/termite;
    "nvim".source = link ./.config/nvim;
    "i3".source = link ./.config/i3;
    "i3lock".source = link ./.config/i3lock;
    "i3status".source = link ./.config/i3status;
    "neofetch".source = link ./.config/neofetch;
    "rofi".source = link ./.config/rofi;
    "fish".source = link ./.config/fish;
    # "ags".source = link ./.
    # "thorium-flags.conf".source = link ./.config/thorium-flags.co
    # "starship.toml".source = link ./.config/starship.toml;
  };
}
