#!/bin/bash

#---------------------------------------------------------------------------
# User Enumeration
#---------------------------------------------------------------------------

run_user_enum_module() {
    print_section "User Enumeration"

    # hostnamectl
    print_info "Hostname:"
    echo "$(hostnamectl)"
    echo "------------------------------------------"

    # whoami
    print_info "Actual User:"
    print_important "$(whoami)"
    echo "------------------------------------------"

    # useful info on actual user
    print_info "Actual User Info:"
    print_important "$(id)"
    echo "------------------------------------------"

    # history of the actual user
    print_info "Actual User History:"
    if [ -f "$HOME/.bash_history" ] && [ -r "$HOME/.bash_history" ]; then
        print_critical "$(cat $HOME/.bash_history)"
    else
        print_error "Could not read history file at $HOME/.bash_history"
    fi
    echo "------------------------------------------"

    # sudo commands you can execute
    print_info "Sudo Commands You Can Execute:"
    if sudo -n -l >/dev/null 2>&1; then
        print_critical "$(sudo -l)"
    else
        print_error "User may not run sudo commands or a password is required."
    fi
    echo "------------------------------------------"

    # list of users
    print_info "List of Users:"
    echo "$(cat /etc/passwd | cut -d: -f1)"
    echo "------------------------------------------"

    # list of groups
    print_info "List of Groups:"
    echo "$(cat /etc/group | cut -d: -f1)"
    echo "------------------------------------------"

    # list of user passwords
    print_info "List of User Passwords:"
    if [ -r "/etc/shadow" ]; then
        print_critical "$(cat /etc/shadow)"
    else
        print_error "Cannot read /etc/shadow. Permission denied."
    fi
    echo "------------------------------------------"
}
