{ pkgs, lib, ... }:
let
  workspace = "Personal";
  username = "daril";
in {
  home.username = username;
  home.homeDirectory = lib.mkDefault "/home/${username}/personal";
  home.sessionVariables = {
    WORKSPACE = workspace;
  };

  home.packages = with pkgs; [
    cowsay vim
  ];

  programs.home-manager.enable = true;
  
  programs.git = {
    enable = true;
    userName = "Daril Rodriguez";
    userEmail = "darilrodriguez.2@gmail.com";
    package = pkgs.git;
  };

  home.stateVersion = "24.05";
}
