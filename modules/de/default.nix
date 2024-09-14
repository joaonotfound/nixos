{ pkgs, environment, ... }: let 
  /** Maybe implement a better way to implement whether it's a twm or not? */
  isTwm = environment.de != "gnome"; 
in {
  imports = [    
    (if (isTwm) then ../launchers/${environment.twm.appLauncher}.nix else {} )

    /** Desktop bars */
    (if (isTwm) then ../bar/${environment.twm.desktopBar}.nix else {} )

    (if (isTwm) then ../nitrogen.nix else {} )
  ];

  home.packages = with pkgs; [] ++ (if (isTwm) then [
      /** Some programs that will be useful for tiling window managers. */
      flameshot
      lxappearance
      nitrogen
      pavucontrol
  ] else []) ;
}
