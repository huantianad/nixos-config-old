# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      (import "${builtins.fetchTarball https://github.com/rycee/home-manager/archive/master.tar.gz}/nixos")
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot";
  boot.loader.grub = { enable = true;
    efiSupport = true;
    version = 2;
    device = "nodev";
    useOSProber = true;
  };

  networking.hostName = "huantian-nixos"; # Define your hostname.
  networking.networkmanager.enable = true;
  networking.useDHCP = false;
  networking.interfaces.enp5s0.useDHCP = true;
  networking.interfaces.wlp4s0.useDHCP = true;

  # Set your time zone.
  time.timeZone = "America/Phoenix";

  # Mount my home parition
  fileSystems."/home" = {
    device = "/dev/disk/by-uuid/f1ae7673-e7f4-43c8-a328-4f6244aab172";
    fsType = "ext4";
  };

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
  #   font = "Lat2-Terminus16";
    keyMap = "us";
  };

  # Disable mouse acceleration
  services.xserver.libinput.enable = true;
  services.xserver.libinput.mouse.accelProfile = "flat";
  services.xserver.libinput.mouse.accelSpeed = "0";

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable proprietary NVIDIA drivers
  services.xserver.videoDrivers = [ "nvidia" ];

  # Enable the Plasma 5 Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;
  services.xserver.windowManager.qtile.enable = true;
  
  # Configure keymap in X11
  services.xserver.layout = "us";
  services.xserver.xkbOptions = "pc86";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    media-session.enable = true;
  };

  nixpkgs.config = {
    allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
      "vscode" "discord" "nvidia-x11" "nvidia-settings"
      "steam" "steam-original" "steam-runtime"
    ];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    (firefox.override { extraNativeMessagingHosts = [ passff-host ]; })
    discord
    notepadqq
    pass
    passff-host
    vim_configurable (import ./vim.nix)
    vscode
    xbindkeys
    xdotool
    zsh-powerlevel10k
  ] ++ [  # Command-line tools
    bat
    bpytop
    curl
    file
    git
    htop
    killall
    ripgrep
    unzip
    wget
  ] ++ [  # Steam game deps
    libssh
    brotli
  ];

  # Install steam
  programs.steam.enable = true;

  # Install fonts
  fonts.fonts = with pkgs; [
    meslo-lgs-nf
  ];

  # Define my user here
  users.mutableUsers = false;
  users.users.huantian = {
    isNormalUser = true;
    home = "/home/huantian";
    extraGroups = [ "wheel" "networkmanager" "audio" ];
    shell = pkgs.zsh;
    passwordFile = "/etc/nixos/password-file";
  };

  # Set vim as default editor
  programs.vim.defaultEditor = true;

  # ZSH shell settings
  programs.zsh = {
    enable = true;
    shellAliases = {
      vim = "my-vim";
      e = "exit";
      cat = "bat --style=plain";
      shutdown = "sudo shutdown now";
      reboot = "sudo reboot";
    };

    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    ohMyZsh = {
      enable = true;
      plugins = [ "git" "python" "man" "sudo" "history-substring-search" ];
      customPkgs = [ pkgs.zsh-history-substring-search ];
    };
  };

  # Home Manager neat
  home-manager.users.huantian.nixpkgs.config.allowUnfreePredicate = 
    pkg: builtins.elem (lib.getName pkg) [ "vscode" ];

  home-manager.users.huantian.programs = {
    git = {
      enable = true;
      userName  = "huantian";
      userEmail = "davidtianli@gmail.com";
      signing.key = "731A7A05AD8B3AE5956AC2274A0318E04E555DE5";
      signing.signByDefault = true;
    };

    zsh.enable = true;
    zsh.initExtraFirst= ''
      if [[ -r "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh" ]]; then
        source "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh"
      fi
    '';
    zsh.initExtraBeforeCompInit = ''
      source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
      [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

      bindkey '^[[A' history-substring-search-up
      bindkey '^[[B' history-substring-search-down
    '';
    zsh.plugins = [
      {
        name = "zsh-nix-shell";
        file = "nix-shell.plugin.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "chisui";
          repo = "zsh-nix-shell";
          rev = "v0.2.0";
          sha256 = "1gfyrgn23zpwv1vj37gf28hf5z0ka0w5qm6286a7qixwv7ijnrx9";
        };
      }
    ];

    vscode.enable = true;
    vscode.extensions = import ./vscode/extensions.nix;
    vscode.userSettings = import ./vscode/settings.nix;

    ssh.enable = true; 
    ssh.matchBlocks = {
      huantian-server = {
        hostname = "192.168.0.102";
        user = "huantian";
      };
      spookelton-na = {
        hostname = "na.spookelton.net";
        user = "hotpink";
      };
      spookelton-nz = {
        host = "nz.spookelton.net";
        user = "hotpink";
        port = 38131;
      };
      "aur.archlinux.org" = {
        identityFile = "~/.ssh/aur";
        user = "aur";
      };
    };
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
  #   enableSSHSupport = true;
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.05"; # Did you read the comment?
}
