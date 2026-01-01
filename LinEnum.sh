#!/bin/bash
# test_libs.sh

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Carica le librerie
echo -e "\033[1m\033[1;34m[i] Loading libraries...\033[0m"

if [ -f "${SCRIPT_DIR}/lib/utils.sh" ]; then
	source "${SCRIPT_DIR}/lib/colors.sh"
else
	echo -e "${BOLD}${BRED}[!] utils.sh not found! ${NC}"
	exit 1
fi

if [ -f "${SCRIPT_DIR}/lib/utils.sh" ]; then
	source "${SCRIPT_DIR}/lib/utils.sh"
else
	echo -e "${BOLD}${BRED}[!] utils.sh not found! ${NC}"
	exit 1
fi

sleep 2

print_success "Libraries loaded successfully!"
echo ""

# Banner show up
show_banner

#---------------------------------------------------------------------------
# Load and Run Modules
#---------------------------------------------------------------------------
print_info "Loading modules..."

# Source and run system_info module
if [ -f "${SCRIPT_DIR}/modules/system_info.sh" ]; then
    source "${SCRIPT_DIR}/modules/system_info.sh"
    run_system_info_module
else
    print_error "system_info.sh module not found!"
fi


# show footer
show_footer
