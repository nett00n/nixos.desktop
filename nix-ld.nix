{ pkgs, ... }: {
  # Nix-ld
  programs.nix-ld.enable = true;

  # Dependencies for standalone binaries
  programs.nix-ld.libraries = with pkgs; [
    # Get basic list from https://gitlab.com/unaboomer/nixos-dotfiles/-/blob/main/nixos/modules/sys/nix/nix-ld.nix?ref_type=heads
    # And then add other things, you need
    alsa-lib
    appimage-run
    at-spi2-atk
    at-spi2-core   # CrossCode
    atk
    atkmm
    bzip2
    cairo
    cups
    curlWithGnuTls
    dbus
    dbus-glib
    expat
    ffmpeg
    file # called by steam's setup.sh
    flac
    fontconfig
    freeglut
    freetype
    fuse
    fuse3
    gdk-pixbuf
    giflib
    glew110
    glib
    glibc
    gnome2.GConf
    gsettings-desktop-schemas
    gst_all_1.gst-plugins-base
    gst_all_1.gst-plugins-ugly
    gst_all_1.gstreamer
    gtk2
    gtk3
    harfbuzz
    icu
    imlib2
    json-glib
    libappindicator-gtk2
    libappindicator-gtk3
    libbsd
    libcaca
    libcanberra
    libcap
    libdbusmenu-gtk2
    libdrm
    libelf
    libexif
    libgcrypt
    libGL
    libGLU
    libglvnd
    libidn
    libidn2
    libindicator-gtk2
    libjpeg
    libmikmod
    libnotify
    libogg
    libpng
    libpng12
    libpsl
    libpulseaudio
    librsvg
    libsamplerate
    libssh
    libthai
    libtheora
    libtiff
    libudev0-shim
    libunwind
    libusb
    libusb1
    libuuid
    libva
    libvdpau
    libvorbis
    libvpx
    libwebp
    libxcrypt
    libxkbcommon
    libxml2
    lsof
    mesa
    mesa.llvmPackages.llvm.lib
    mono
    ncurses
    nghttp2.lib
    nspr
    nss
    openssl
    pango
    pipewire
    pixman
    rtmpdump
    SDL
    SDL_image
    SDL_mixer
    SDL_ttf
    SDL2
    SDL2_image
    SDL2_mixer
    SDL2_ttf
    speex
    sqlite
    stdenv.cc.cc
    stdenv.cc.cc.lib
    systemd
    tbb
    udev
    util-linux
    vulkan-loader
    wayland
    xorg_sys_opengl
    xorg.libICE
    xorg.libpciaccess
    xorg.libSM
    xorg.libX11
    xorg.libxcb
    xorg.libXcomposite
    xorg.libXcursor
    xorg.libXdamage
    xorg.libXext
    xorg.libXfixes
    xorg.libXft
    xorg.libXi
    xorg.libXinerama
    xorg.libxkbfile
    xorg.libXmu
    xorg.libXrandr
    xorg.libXrandr.out
    xorg.libXrender
    xorg.libXScrnSaver
    xorg.libxshmfence
    xorg.libXt
    xorg.libXtst
    xorg.libXxf86vm
    xorg.xkeyboardconfig
    zlib
  ];

}