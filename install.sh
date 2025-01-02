#!/bin/bash

# Colors for output
function green_color() {
    echo -e "\e[32m$1\e[0m"
}

function cyan_color() {
    echo -e "\e[36m$1\e[0m"
}

# Introductory message
function intro_message() {
    echo "-----------------------------------------------------"
    echo "You can start using the calculator with the $(cyan_color "calc") command."
    echo
}

# Function to locate the binary installation path
function locate_bin_path() {
    local bin_paths=("/usr/bin" "/usr/local/bin" "manually")
    local selected_option=$(printf "%s\n" "${bin_paths[@]}" | fzf --header="Locate your bin path." --height=6)

    if [ -z "$selected_option" ]; then
        echo "No selection made. Exiting."
        exit 1
    fi

    if [ "$selected_option" = "manually" ]; then
        read -p "Enter the path: " entered
        if [ -z "$entered" ]; then
            echo "Error: No path provided. Exiting."
            exit 1
        fi
        echo "$entered"
    else
        echo "$selected_option"
    fi
}

function main() {
    echo "Locating binary installation path..."
    local bin_path=$(locate_bin_path)

    if [ ! -d "$bin_path" ]; then
        echo "Error: Path $bin_path does not exist. Exiting."
        exit 1
    fi

    if [ ! -w "$bin_path" ] && [ "$(id -u)" -ne 0 ]; then
        echo "Error: Insufficient permissions to write to $bin_path. Please run as root."
        exit 1
    fi

    echo "Installing the calculator..."
    
    if [ ! -f "./main.sh" ]; then
        echo "Error: 'main.sh' not found in the current directory. Exiting."
        exit 1
    fi

    cp -p -v ./main.sh ./install_main.sh
    mv -v ./install_main.sh calc
    sudo mv calc "$bin_path"
    green_color "Installation completed successfully."
    echo
    intro_message
}

main