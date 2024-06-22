{ lib, stdenv, fetchFromGitHub, meson, vala, pkg-config, glib, gtk3, cmake, gobject-introspection, libpeas, gom, libcanberra, gst_all_1, json-glib, sqlite, desktop-file-utils, ninja, appstream, appstream-glib, gtk4, ...}:

stdenv.mkDerivation rec {
  pname = "gnome-shell-extension-pomodoro";
  version = "0.25.2";
 
  src = fetchFromGitHub {
    owner = "gnome-pomodoro";
    repo = "gnome-pomodoro";
    hash = "sha256-agRb5yzJ6McIhhbE092AZY4t8l81qOpwDhe/2Yj+bzw=";
    rev = "${version}";
  };

  passthru = {
    extensionUuid = "pomodoro@arun.codito.in";
    extensionPortalSlug = "pomodoro";
  };
  
  nativeBuildInputs = [ glib ];
  
  buildInputs = [ meson vala pkg-config gtk3 cmake gobject-introspection libpeas gom libcanberra gst_all_1.gstreamer json-glib sqlite desktop-file-utils ninja appstream appstream-glib gtk4 ];

  buildPhase = ''
    cd ../
    meson setup build
    cp data/org.gnome.pomodoro.gschema.xml build/data
    cp plugins/gnome/org.gnome.pomodoro.plugins.gnome.gschema.xml build/plugins/gnome/extension
    
    cd build
    meson compile    
    glib-compile-schemas data/
  '';

  installPhase = ''
    mkdir -p $out/share/gnome-shell/extensions/ $out/share/applications $out/share/appdata $out/share/glib-2.0/pomodoro/schemas $out/bin $out/lib  $out/etc/systemd/system

    chmod +x src/gnome-pomodoro
    
    cp src/gnome-pomodoro $out/bin
    cp src/libgnome-pomodoro.so.0 $out/lib
    cp data/org.gnome.pomodoro.gschema.xml $out/share/glib-2.0/pomodoro/schemas
    touch $out/share/glib-2.0/pomodoro/schemas/
    cp data/org.gnome.Pomodoro.desktop $out/share/applications
    cp data/org.gnome.Pomodoro.appdata.xml $out/share/appdata 
    cp -r plugins/gnome/extension $out/share/gnome-shell/extensions/pomodoro@arun.codito.i/
    cp data/org.gnome.Pomodoro.service $out/etc/systemd/system
  '';

  # cp data/org.gnome.Pomodoro.appdata.xml $out/share/glib-2.0/schemas  

  meta = with lib; {
    description = "A simple pomodoro timer";
    license = licenses.gpl3Only;
    homepage = "https://github.com/gnome-pomodoro/gnome-pomodoro";
  };
}