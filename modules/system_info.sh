#!/bin/bash

#---------------------------------------------------------------------------
# System Information Enumeration
#---------------------------------------------------------------------------

run_system_info_module() {
    print_section "System Information"

    # extract kernel version with uname -r
    print_info "Kernel Version:"
    print_critical "$(uname -r)"
    echo "------------------------------------------"
    

    # extract architecture with uname -m
    print_info "Architecture:"
    print_critical "$(uname -m)"
    echo "------------------------------------------"

    # extract kernel version with cat /proc/version
    print_info "Kernel Informations:"
    print_important "$(cat /proc/version)"
    echo "------------------------------------------"

    # extract distribution name and version with cat /etc/os-release
    print_info "Distribution Name and Version:"
    echo "$(cat /etc/os-release)"
    echo "------------------------------------------"
}
