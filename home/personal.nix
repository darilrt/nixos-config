{ pkgs, lib, ... }:
let
  username = "daril";
in {
  imports = [
    ./common.nix
    ./hyprland.nix
  ];
  
  home.username = username;
  home.homeDirectory = "/home/${username}";

  home.packages = with pkgs; [
  ];

  programs.zsh = {
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    sessionVariables = {
    };
    initContent = ''
      echo "Workspace $HOMENAME"
    '';
  };

  programs.git = {
    enable = true;
    userName = "Daril Rodriguez";
    userEmail = "darilrodriguez.2@gmail.com";
    package = pkgs.git;
  };
}
