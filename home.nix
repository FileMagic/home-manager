# After awhile I found this: https://haseebmajid.dev/posts/2023-11-15-part-3-hyprland-as-part-of-your-development-workflow/
{config, pkgs, ... }: 
{
  xdg.mimeApps = {
    enable = true;
    associations.added = {
      "x-scheme-handler/http"=["firefox.desktop;"];
      "x-scheme-handler/https"=["firefox.desktop;"];
      "x-scheme-handler/chrome"=["firefox.desktop;"];
      "text/html"=["firefox.desktop;"];
      "application/x-extension-htm"=["firefox.desktop;"];
      "application/x-extension-html"=["firefox.desktop;"];
      "application/x-extension-shtml"=["firefox.desktop;"];
      "application/xhtml+xml"=["firefox.desktop;"];
      "application/x-extension-xhtml"=["firefox.desktop;"];
      "application/x-extension-xht"=["firefox.desktop;"];
    };
    defaultApplications = {
      "x-scheme-handler/http"=["firefox.desktop"];
      "x-scheme-handler/https"=["firefox.desktop"];
      "x-scheme-handler/chrome"=["firefox.desktop"];
      "text/html"=["firefox.desktop"];
      "application/x-extension-htm"=["firefox.desktop"];
      "application/x-extension-html"=["firefox.desktop"];
      "application/x-extension-shtml"=["firefox.desktop"];
      "application/xhtml+xml"=["firefox.desktop"];
      "application/x-extension-xhtml"=["firefox.desktop"];
      "application/x-extension-xht"=["firefox.desktop"];
    };
    associations.removed = {
      "application/pdf" = ["chromium-browser.desktop"];
      "image/png" = ["chromium-browser.desktop"];
    };
  };
  home = {
     
    pointerCursor = {
        gtk.enable = true;
        package = pkgs.vanilla-dmz;
        name = "Vanilla-DMZ";
    };
  
   stateVersion = "23.11";
   username = "file_magic";
   homeDirectory = "/home/file_magic";

   packages = with pkgs; [
      qbittorrent-qt5
      
      # General Applications
      bitwarden
      tor-browser-bundle-bin
      firefox
      spotify
      
      # Note Taking
      logseq

      # utils
      neovim
      kitty
      alacritty
      gnome.nautilus
      file

      #vscodium
      pandoc
      ripgrep
      audacity
      bat
      htop
      mucommander
      p7zip
    
      # Comms platforms
      signal-desktop
      discord
      slack

      # Services
      nextcloud-client
      syncthing
      
      # Things for taking photos
      gphoto2
      ffmpeg
      obs-studio
      vlc
      
      # Stuff for hyprland
      swaylock-effects
      swayidle
      fuzzel
      dracula-theme
      wl-clipboard
      slurp
      wdisplays
      waybar
      swww
      swaynotificationcenter

      ## Wayland Screencap
      xdg-desktop-portal-hyprland
      grimblast

      vscode 

      # Fonts
      fira-code
      fira-code-symbols
      font-awesome
      liberation_ttf
      mplus-outline-fonts.githubRelease
      nerdfonts
      noto-fonts
      noto-fonts-emoji
      proggyfonts
      hack-font

      # Gameing
      steam

      # lutris
      lutris
      wine

      # sound
      pavucontrol
      mupdf

      # network manager applet
      networkmanagerapplet
      
      # ansible
      ansible-lint

      # browsers
      chromium
    ];
  };
  programs = { 
      git = {
        enable = true;
        userName  = "FileMagic";
        userEmail = "FileMagic+nv71bgln@protonmail.com";
         aliases = {
          ci = "commit";
          co = "checkout";
          s = "status";
        };
        extraConfig = {
          init = { defaultBranch = "main"; };
        };
      };
      vscode = {
  	enable = true;
  	extensions = with pkgs.vscode-extensions; [
    		dracula-theme.theme-dracula
	    	arrterian.nix-env-selector
    		yzhang.markdown-all-in-one
  	];
      };
  };
  wayland.windowManager = {
    hyprland = {
      # Whether to enable Hyprland wayland compositor
      enable = true;
      # The hyprland package to use
      package = pkgs.hyprland;
      # Whether to enable XWayland
      xwayland.enable = true;
      settings = {
        "$mod" = "SUPER";
        "$lock" = "swaylock --clock --indicator --screenshots --effect-scale 0.4 --effect-vignette 0.2:0.5 --effect-blur 4x2 --datestr \"%a %e.%m.%Y\" --timestr \"%k:%M\"";
        "$timeout" = "60*3";
        # based on this: https://github.com/quantumfate/hypr/blob/main/hypr.conf
        exec-once = [
          "swww init"
          "waybar"
          "swaync"
          #"blueman-applet"
          #"nextcloud"
          #"discord"
        ];
        exec = [
          "swww img ~/.wallpaper"
          "exec swayidle -w timeout $timeout $lock timeout $timeout 'swaymsg \"output * dpms off\"' resume 'swaymsg \"output * dpms on\" before-sleep $lock"
        ];
        env = [
          "WLR_DRM_DEVICES,/dev/dri/card0:/dev/dri/card1"
        ];
        bind = [
      	  "$mod,Return,exec,alacritty"
          "$mod SHIFT,Q,killactive,"
          "$mod,F,fullscreen,"
          "$mod,E,exec,pkill Hypr"
          "$mod,L,exec,$lock"
          "$mod,D,exec,fuzzel"
          "$mod,1,workspace,1"
          "$mod,2,workspace,2"
          "$mod,3,workspace,3"
          "$mod,4,workspace,4"
          "$mod,5,workspace,5"
          "$mod,6,workspace,6"
          "$mod,7,workspace,7"
          "$mod,8,workspace,8"
          "$mod,9,workspace,9"
          "$mod SHIFT,1,movetoworkspacesilent,1"
          "$mod SHIFT,2,movetoworkspacesilent,2"
          "$mod SHIFT,3,movetoworkspacesilent,3"
          "$mod SHIFT,4,movetoworkspacesilent,4"
          "$mod SHIFT,5,movetoworkspacesilent,5"
          "$mod SHIFT,6,movetoworkspacesilent,6"
          "$mod SHIFT,7,movetoworkspacesilent,7"
          "$mod SHIFT,8,movetoworkspacesilent,8"
          "$mod SHIFT,9,movetoworkspacesilent,9"
          "$mod SHIFT,0,movetoworkspacesilent,10"
	      ];
        bindl= [
          #",switch:[switch name],exec,waylock"
        ];
        monitor=[
          #"DP-6,1920x1080@144,0x0,1,transform,3"
        ];
      };
    };
  };
}
