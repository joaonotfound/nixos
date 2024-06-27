{ pkgs, system, ... }: {
  nix.package = pkgs.nixFlakes;
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';
    
  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
  ];

  networking.hostName = "joaonotfound";

  networking.networkmanager.enable = true;
  networking.firewall.enable = false;

  # Set your time zone.
  time.timeZone = "America/Sao_Paulo";

  # Select internationalisation properties.

  i18n = {
    defaultLocale = system.locale;
    supportedLocales = [ "all" ];
  };

  i18n.inputMethod = { 
    enabled = "ibus";
    ibus.engines = with pkgs.ibus-engines; [ libpinyin ]; 
  };

  services.gnome.gnome-browser-connector.enable = true;

  environment.variables = {
    GDK_DPI_SCALE = "1.1";
  };

  services.xserver = {    
    xkb = {
      layout = "br";
      variant = "";
    };
    displayManager = { 
      setupCommands = ''
        ${pkgs.xorg.xrandr}/bin/xrandr --output HDMI-0 --primary
      '';
      sessionCommands = ''
        ibus-daemon --xim -d -r
      '';
    };
  };

  systemd = {
    user.services.polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
          Type = "simple";
          ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
          Restart = "on-failure";
          RestartSec = 1;
          TimeoutStopSec = 10;
        };
    };
  };

  # Configure console keymap
  console.keyMap = "br-abnt2";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.sudo.extraConfig = "Defaults passprompt=\"🔐Password:\"";
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  programs.adb.enable = true;

  environment.systemPackages = with pkgs; [  
    zsh
    flatpak
    prisma-engines
    ibus
    ibus-engines.libpinyin
    libpinyin
    fcitx5
    polkit_gnome
    zlib
    steam
	
    pkgs.wireguard-tools
    openssh
  ];
  
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  /** Required to make generic linux binaries like the Intellij Idea's builtin java to work. */
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      zlib
    ];
  };
  
  # Note for myself: If you edit this you must restart the system
  environment.sessionVariables = {
    PATH = [ "$HOME/go/bin" ];
    LD_LIBRARY_PATH = "${pkgs.zlib}/lib";
    PRISMA_SCHEMA_ENGINE_BINARY = "${pkgs.prisma-engines}/bin/schema-engine";
    PRISMA_QUERY_ENGINE_BINARY = "${pkgs.prisma-engines}/bin/query-engine";
    PRISMA_QUERY_ENGINE_LIBRARY = "${pkgs.prisma-engines}/lib/libquery_engine.node";
    PRISMA_INTROSPECTION_ENGINE_BINARY = "${pkgs.prisma-engines}/bin/introspection-engine";
    PRISMA_FMT_BINARY = "${pkgs.prisma-engines}/bin/prisma-fmt";
  };

  services.flatpak.enable = true;

  system.stateVersion = "23.05";
}
