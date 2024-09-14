{}: {
  system = {
    locale = "en_US.UTF-8";
  };
  
  users.desktop.environment = {
      /** 
        Which desktop environment/tiling window manager will be used.
        The value must match the names of files ( without extension ) inside /modules/de/.
      */
      de = "i3wm";

      compositor = {
        enable = true;
        package = "picom";
      };
      
      /** neofetch */
      neofetch = {
        enable = false;
      };

      /** 
        The user shell 
      */
      shell = "fish";
      
      /** 
        Which terminal will be used by default on shortcuts
        The value must match the names of files ( without extension ) inside /modules/terminal/.
      */
      terminal = "kitty";

      /** 
        Text editors that will be installed.
        The values must match the names of files ( without extension ) inside /modules/editors/.
      */
      editors = [ "vscode" "neovim" "android-studio" "emacs29" "intellij-idea" ];

      /**  
        Programming languages to be installed on the system
      */
      SDKs = [ "jdk_21" "nodejs" "python" "rust" "go" "flutter" ];

      /** Whether add bluetooth related apps or not */
      bluetooth.enable = true;
      
      /** Whether add crypto wallets, trading view, etc. or not */
      trading.enable = true;

      gnome = {
        theme = "colloid";
      };

      twm = {
        /**
          This is the launcher that will be used when your dekstop environment doesn't have 
          an app launcher by default like most of tilling window managers.
        */
        appLauncher = "rofi";

        /**
          This is the desktop bar that will be used when your dekstop environment doesn't have 
          an desktop bar by default like most of tilling window managers.
        */
        desktopBar = "polybar";
      };

      /**
        Whether games launchers like rofi and steam should be included or not 
      */
      gamesLaunchers = true;
  };
}
