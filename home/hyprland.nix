# This file is part of the NixOS configuration for Hyprland.
# It defines the home-manager configuration for the Hyprland desktop environment.

{ pkgs, lib, ... }:
{
    home.packages = with pkgs; [
        kitty
        waybar
        wofi
        dunst
        wl-clipboard
    ];

    programs.hyprland = {
        enable = true;
        package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
        portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
        configFile = pkgs.writeText "hyprland.conf" ''
            # Hyprland configuration goes here
            monitor=HDMI-A-1,1920x1080@60,0x0
            exec-once=waybar
            exec-once=dunst
        '';
    };
}