{ pkgs, ... }: {
  home.packages = with pkgs; [
    polybar    
  ];

  home.file = {
    ".config/polybar".source = ../../resources/dotfiles/polybar;
  };
}