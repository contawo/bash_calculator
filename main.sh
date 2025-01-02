#!/bin/bash

# Constants
add="+"
subtract="-"
divide="/"
multiply="x"
equal="="
decimal_scale=2

# Colours
function red_color() {
    echo -e "\e[31m$1\e[0m"
}

function green_color() {
    echo -e "\e[32m$1\e[0m"
}

function cyan_color() {
    echo -e "\e[36m$1\e[0m"
}

function yellow_color() {
    echo -e "\e[33m$1\e[0m"
}

# Helpers
function is_number() {
    [[ "$1" =~ ^[0-9]*\.?[0-9]+$ ]]
}

function is_operator() {
    [[ "$1" == "$add" || "$1" == "$subtract" || "$1" == "/" || "$1" == "$multiply" || "$1" == "=" ]]
}

function boolean_ternary() {
    if [ "$1" = "true" ]; then
        echo "false"
    else
        echo "true"
    fi
}

function clickable_link() {
    cyan_color "$(echo -e "\e]8;;$1\a$2\e]8;;\a")"
}

function bold_text() {
    echo -e "\e[1m$1\e[0m"
}

# Messaging
function welcome_message() {
    green_color "$(bold_text "Bash Simple Calculator")"
    echo "-----------------------------------------------------"
    local author="Awonke Mnotoza"
    local author_link="https://www.contawo.com/"
    echo -e "This is a simple calculator application made accessible on the terminal."
    echo -e "Created by $(clickable_link "$author_link" "$author")."

    echo
    echo "-----------------------------------------------------"
    bold_text "| RULES:                                            |"
    echo "| > When prompted with '>', enter a number.         |"
    echo "| ~ When prompted with '~', enter an operator.      |"
    echo "|                                                   |"
    echo "| Allowed operators:                                |"
    echo "|   - Addition: $add                                   |"
    echo "|   - Subtraction: $subtract                                |"
    echo "|   - Division: $divide                                   |"
    echo "|   - Multiplication: $multiply                             |"
    echo "| To terminate calculator:                          |"
    echo "|   - Equal: $equal                                      |"
    echo "|                                                   |"
    bold_text "| OPTIONS:                                          |"
    echo "| -d            : Disable the welcome message.      |"
    echo "| -s [number]   : Set the number of decimal points. |"
    echo "|   Examples:                                       |"
    echo "|     -s 3 => 0.000                                 |"
    echo "|     -s 2 => 0.00                                  |"
    echo "|     -s 5 => 0.00000                               |"
    echo "|   Default value: 2                                |"
    echo "-----------------------------------------------------"

    echo
    local complaints="Log everything here."
    local complaints_link="https://github.com/contawo/bash_calculator/issues"
    echo -e "Have suggestions or experiencing a problem? $(clickable_link "$complaints_link" "$complaints")."
    echo 
}

# Mathematical Operations
function addition() {
    echo "scale=$decimal_scale; $1 + $2" | bc
}

function subtraction() {
    echo "scale=$decimal_scale; $1 - $2" | bc
}

function multiplication() {
    echo "scale=$decimal_scale; $1 * $2" | bc
}

function division() {
    echo "scale=$decimal_scale; $1 / $2" | bc
}

# Main
function main() {
    local disable_welcome="1"

    while getopts "s::d" option; do
        case "$option" in 
            "d")
                disable_welcome="0"
                ;;
            "s")
                if [[ "$OPTARG" =~ ^[0-9]+$ ]]; then
                    decimal_scale="$OPTARG"
                else
                    red_color "Error: Expected a natural number after -s flag but got [$OPTARG]."
                    exit 0
                fi
                ;;
        esac
    done

    if [ "$disable_welcome" == "1" ]; then
        welcome_message
    fi

    local answer=0
    local expecting_number="true"

    local logging=()

    local current_number=0
    local current_operator=""

    while true; do
        if [ "$expecting_number" = "true" ]; then
            local output_number=0
            while true; do
                read -p "$(cyan_color ">") " number
                if is_number "$number"; then
                    output_number=$number
                    if [[ "$current_operator" == "$divide" && "$number" == "0" ]]; then
                        red_color "Error: Division by zero not allowed. Please try again."
                    else
                        break
                    fi
                else
                    red_color "Error: Expected a number but got [$number]. Please try again."
                fi
            done

            if [[ "$current_operator" != "" && "$current_operator" != "$equal" ]]; then
                case "$current_operator" in
                    "$add")
                        local sum=$(addition $current_number $output_number)
                        answer=$sum
                        ;;
                    "$subtract")
                        local difference=$(subtraction $current_number $output_number)
                        answer=$difference
                        ;;
                    "$multiply")
                        local product=$(multiplication $current_number $output_number)
                        answer=$product
                        ;;
                    "$divide")
                        local quotient=$(division $current_number $output_number)
                        answer=$quotient
                        ;;
                esac
                current_number=$answer
                logging+=("$output_number")
                
            else
                current_number=$output_number
                logging+=("$current_number")
            fi
        else 
            local output_operator
            while true; do
                read -p "$(yellow_color "~") " operator
                if is_operator "$operator"; then
                    output_operator="$operator"
                    break
                fi
                red_color "Error: Expected an operator ($add, $subtract, $divide, $multiply, $equal) but got [$operator]. Please try again."
            done
            current_operator=$output_operator
            logging+=("$output_operator")
        fi

        if [ "$current_operator" = "$equal" ]; then
            green_color "Answer: $answer"
            echo "Logging: $(IFS=" "; echo "${logging[*]}") $answer"
            break
        fi

        expecting_number=$(boolean_ternary "$expecting_number")
    done
}

main "$@"