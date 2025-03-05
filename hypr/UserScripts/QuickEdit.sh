#!/bin/bash
edit=${EDITOR:-nano}
tty=kitty

# Paths to configuration directories
configs="$HOME/.config/hypr/configs"
UserConfigs="$HOME/.config/hypr/UserConfigs"

# Function to display the menu options
menu() {
    cat <<EOF
1)  󰨞 Visual Studio Code  
2)   IntelliJ Idea
3)   Github
4)   Azure
5)   Twitch
6)   Firefox
7)  󰍳 PrismLauncher
8)   NeoVim
9)   Vim
10)  Warp
11) 󰀂 WireShark
12) 󱨑 Firewall
13) 󰌌 Monkeytype
14)  cd ~/.config
15) 󰦘 System Update
16) Edit Env-variables
17) Edit Window-Rules
18) Edit Startup_Apps
19) Edit User-Keybinds
20) Edit Monitors
21) Edit Laptop-Keybinds
22) Edit User-Settings
23) Edit Decorations & Animations
24) Edit Workspace-Rules
25) Edit Default-Settings
26) Edit Default-Keybinds
27) Edit Waybar
28) Edit Zsh
EOF
}

# Main function to handle menu selection
main() {
    choice=$(menu | rofi -i -dmenu | cut -d")" -f1 | xargs)
    
    # Map choices to corresponding files
    case $choice in
        1) $tty -e code ;;
        2) /opt/idea-IU-242.23726.103/bin/idea ;;
        3) firefox --new-window github.com & ;;
        4) firefox --new-window azure.com & ;;
        5) firefox --new-window twitch.tv & ;;
        6) firefox & ;;
        7) prismlauncher & ;;
        8) $tty -e nvim ;;
        9) $tty -e vim ;;
        10) warp-terminal & ;;
        11) wireshark & ;;
        12) firewall-config ;;
        13) firefox --new-window monkeytype.com & ;;
        14) $tty /home/oskar/.config ;;
        15) $tty -e sudo dnf update ;;
        
        16) file="$UserConfigs/ENVariables.conf" ;;
        17) file="$UserConfigs/WindowRules.conf" ;;
        18) file="$UserConfigs/Startup_Apps.conf" ;;
        19) file="$UserConfigs/UserKeybinds.conf" ;;
        20) file="$UserConfigs/Monitors.conf" ;;
        21) file="$UserConfigs/Laptops.conf" ;;
        22) file="$UserConfigs/UserSettings.conf" ;;
        23) file="$UserConfigs/UserDecorAnimations.conf" ;;
        24) file="$UserConfigs/WorkspaceRules.conf" ;;
        25) file="$configs/Settings.conf" ;;
        26) file="$configs/Keybinds.conf" ;;
        27) file="$HOME/.config/waybar/config" ;;
        28) file="$HOME/.zshrc" ;;
        *) return ;;  # Do nothing for invalid choices
    esac
    
    if [[ -n "$file" ]]; then
        # Open the selected file in the terminal with the text editor
        $tty -e $edit "$file"
    fi
}

main
