{ pkgs, ... }:

{
  home.username = "daril";
  home.homeDirectory = "/home/daril";

  home.packages = with pkgs; [
    cowsay
  ]; 

  home.stateVersion = "24.05";
}
