{ pkgs, lib, ... }:
let
  username = "daril";
in {
  imports = [
    ./common.nix
  ];

  home.stateVersion = "24.05";
  home.username = username;
  home.homeDirectory = "/home/${username}";
  home.sessionVariables = {
    HOMENAME = homename;
  };

  home.packages = with pkgs; [
    home-manager
    vim
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
