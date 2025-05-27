{ pkgs, lib, ... }:
let
  homename = "Personal";
  username = "daril";
in {
  home.stateVersion = "24.05";
  home.username = username;
  home.homeDirectory = "/home/${username}";
  home.sessionVariables = {
    HOMENAME = homename;
  };

  home.packages = with pkgs; [
    home-manager
    vim
    cowsay
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    initExtra = ''
      echo "Workspace $HOMENAME"
    '';
  };

  home.shell = pkgs.zsh;

  programs.git = {
    enable = true;
    userName = "Daril Rodriguez";
    userEmail = "darilrodriguez.2@gmail.com";
    package = pkgs.git;
  };
}
