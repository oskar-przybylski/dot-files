#!/bin/bash
# /* ---- 💫 https://github.com/JaKooLit 💫 ---- */  ##
# Rofi menu for Quick Edit/View of Settings (SUPER E)

# Define preferred text editor and terminal
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
5)   Firefox
6)   Twitch
7)  󰍳 PrismLauncher
8)   NeoVim
9)   Vim
10)  Warp
11) 󰀂 WireShark
12) 󰦘 System Update
EOF
}

# Main function to handle menu selection
main() {
    choice=$(menu | rofi -i -dmenu | cut -d. -f1)
    
    # Map choices to corresponding files
    case $choice in
        1) $tty "$(code ~)" ;;
        1) file="$UserConfigs/ENVariables.conf" ;;
        2) file="$UserConfigs/WindowRules.conf" ;;
        3) file="$UserConfigs/Startup_Apps.conf" ;;
        4) file="$UserConfigs/UserKeybinds.conf" ;;
        5) file="$UserConfigs/Monitors.conf" ;;
        6) file="$UserConfigs/Laptops.conf" ;;
        7) file="$UserConfigs/UserSettings.conf" ;;
        8) file="$UserConfigs/UserDecorAnimations.conf" ;;
        9) file="$UserConfigs/WorkspaceRules.conf" ;;
        10) file="$configs/Settings.conf" ;;
        11) file="$configs/Keybinds.conf" ;;
        12) file="/home/oskar/.config/waybar/config" ;;
        13) file="/home/oskar/.zshrc" ;;
        14) $tty "/home/oskar/.config"  ;;
        15) $tty "$(firefox --new-window monkeytype.com)";;
        *) return ;;  # Do nothing for invalid choices
    esac
    if [ "$file" != "" ]; then
    # Open the selected file in the terminal with the text editor
      $tty -e $edit "$file"
    fi
}

main
