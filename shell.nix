let
#   moz_overlay = import (builtins.fetchTarball https://github.com/mozilla/nixpkgs-mozilla/archive/master.tar.gz)
# # ; nixpkgs = import <nixpkgs> { overlays = [ moz_overlay ]; }

  nixpkgs = import <nixpkgs> {}

; android-studio-deps = with nixpkgs;
  [
    coreutils
    findutils
    file
    git
    glxinfo
    gn
    gnused
    gnutar
    gtk3
    gnome3.gvfs
    glib
    gnome3.gconf
    gzip
    fontconfig
    freetype
    libpulseaudio
    libGL
    xorg.libX11
    xorg.libXext
    xorg.libXi
    xorg.libXrandr
    xorg.libXrender
    xorg.libXtst
    xorg.setxkbmap
    pciutils
    unzip
    which
    xkeyboard_config
    zlib
    ncurses5
  ]

; in

with nixpkgs;

(buildFHSUserEnv {
  name = "wownerojo-env"
; targetPkgs = pkgs: (with pkgs;
  [
    bash
    git
    curl
    unzip
    libGLU
    which

    zsh
    jdk
    cmake
    python
    wget
    perl
    gnumake
    gcc
    doxygen
    graphviz
    pkgconfig
  ]
  ++ android-studio-deps
  )

; multiPkgs = pkgs: (with pkgs;
  [
  ])

; profile = ''
    export ANDROID_NDK_ROOT=~/Android/Sdk/ndk-bundle

    PATH=~/sdk/android/android-studio/bin/:$PATH
    PATH=$ANDROID_NDK_ROOT/build/tools/:$PATH
    export PATH

    export _JAVA_AWT_WM_NONREPARENTING=1

    mkdir -p opt/android
    ln -s `pwd`/opt /opt

    exec zsh
  ''

; }).env
