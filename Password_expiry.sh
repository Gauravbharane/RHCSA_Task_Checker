#!/bin/bash

echo "Checking Task Q11 - Password expiry set to 20 days for new users..."

# Read default password expiry from login.defs
default_expire=$(grep -E '^PASS_MAX_DAYS' /etc/login.defs | awk '{print $2}')

if [ "$default_expire" -eq 20 ]; then
    echo "✅ PASS_MAX_DAYS is correctly set to 20 in /etc/login.defs"
else
    echo "❌ PASS_MAX_DAYS is set to $default_expire (should be 20)"
fi
