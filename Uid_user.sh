#!/bin/bash

echo "Checking Task Q7 - User 'alies' with UID 1326..."

# Check if user 'alies' exists
if id "alies" &>/dev/null; then
    echo "✅ User 'alies' exists"

    # Get UID of 'alies'
    user_uid=$(id -u alies)
    if [ "$user_uid" -eq 1326 ]; then
        echo "✅ User 'alies' has correct UID: 1326"
    else
        echo "❌ User 'alies' exists but has incorrect UID: $user_uid"
    fi
else
    echo "❌ User 'alies' does not exist"
fi
