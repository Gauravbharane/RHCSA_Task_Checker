#!/bin/bash

echo "Checking Task - Sudoers, Passwordless sudo for group 'admin'..."

# Check if group 'admin' exists
if getent group admin &>/dev/null; then
    echo "✅ Group 'admin' exists"
else
    echo "❌ Group 'admin' does not exist"
fi

# Search for either (ALL) or (ALL:ALL) passwordless sudo for admin group
if grep -Eq '^%admin\s+ALL=\(ALL(:ALL)?\)\s+NOPASSWD:\s+ALL' /etc/sudoers /etc/sudoers.d/* 2>/dev/null; then
    echo "✅ 'admin' group has passwordless sudo access (valid syntax found)"
else
    echo "❌ 'admin' group does NOT have valid passwordless sudo access"
fi
