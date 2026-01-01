#!/bin/bash

set -e

# utility functions for the script

#---------------------------------------------------------------------------
# function to print a section
#---------------------------------------------------------------------------
print_section() {
    echo -e "\n${BOLD}[+] $1"
    echo "─────────────────────────────────────────────────────────"
}

#---------------------------------------------------------------------------
# messages function
#---------------------------------------------------------------------------

# print an error message
print_error() {
    echo -e "${BRED}[✗] $1${NC}"
}

# print an important finding
print_finding() {
    echo -e "${YELLOW}[!] $1${NC}"
}

# print critical findings
print_critical() {
    echo -e "${RED}[!!!] ${BOLD}$1${NC}"
}

# print success messages
print_success() {
    echo -e "${GREEN}[✓] $1${NC}"
}

# print informations
print_info() {
    echo -e "${BLUE}[i] $1${NC}"
}

#---------------------------------------------------------------------------
# Banner and footer
#---------------------------------------------------------------------------

# Banner
show_banner() {
    echo -e "${BOLD}${BLUE}"
    cat << "EOF"
 _     _       _____                       
| |   (_)     |  ___|                      
| |    _ _ __ | |__ _ __  _   _ _ __ ___  
| |   | | '_ \|  __| '_ \| | | | '_ ` _ \ 
| |___| | | | | |__| | | | |_| | | | | | |
\_____/_|_| |_\____/_| |_|\__,_|_| |_| |_|  
                                   
EOF
    echo -e "${NC}"
    echo -e "${BOLD}Linux Privilege Escalation Enumeration tool${NC}"
    echo -e "${DIM}Version 1.0.0${NC}"
    echo -e ""
    echo -e "${YELLOW}⚠  Use only on authorized systems${NC}"
    echo -e ""
}

# Footer
show_footer() {
    echo -e "\n${GREEN}═════════════════════════════════════════${NC}"
    echo -e "${GREEN}[✓] Enumeration finished ${NC}"
    echo -e "${GREEN}═════════════════════════════════════════${NC}\n"
}

# check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# EXPORTS
export -f print_section
export -f print_finding
export -f print_critical
export -f print_success
export -f print_error
export -f print_info
export -f show_banner
export -f show_footer
export -f command_exists

