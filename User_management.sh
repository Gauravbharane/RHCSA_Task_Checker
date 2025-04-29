#!/bin/bash

echo "Checking Task Q4 - Users, Groups, and Passwords..."

# (a) Check if group 'admin' exists
if getent group admin > /dev/null; then
    echo "✅ Group 'admin' exists"
else
    echo "❌ Group 'admin' does not exist"
fi

# (b) Check user 'harry' and if 'admin' is a secondary group
if id "harry" &>/dev/null; then
    echo "✅ User 'harry' exists"
    groups harry | grep -qw admin && echo "✅ 'harry' is in group 'admin'" || echo "❌ 'harry' is NOT in group 'admin'"
else
    echo "❌ User 'harry' does not exist"
fi

# (c) Check user 'natasha' and if 'admin' is a secondary group
if id "natasha" &>/dev/null; then
    echo "✅ User 'natasha' exists"
    groups natasha | grep -qw admin && echo "✅ 'natasha' is in group 'admin'" || echo "❌ 'natasha' is NOT in group 'admin'"
else
    echo "❌ User 'natasha' does not exist"
fi

# (d) Check user 'sarah', no shell, not in 'admin'
if id "sarah" &>/dev/null; then
    echo "✅ User 'sarah' exists"
    shell=$(getent passwd sarah | cut -d: -f7)
    if [[ "$shell" == "/sbin/nologin" || "$shell" == "/usr/sbin/nologin" ]]; then
        echo "✅ 'sarah' has no interactive shell"
    else
        echo "❌ 'sarah' has an interactive shell ($shell)"
    fi

    groups sarah | grep -qw admin && echo "❌ 'sarah' is in group 'admin'" || echo "✅ 'sarah' is NOT in group 'admin'"
else
    echo "❌ User 'sarah' does not exist"
fi

# (e) Check if passwords are set to 'redhat' for all three users
for user in harry natasha sarah; do
    echo "🔐 Checking password for $user (requires root)..."
    if echo "redhat" | su -c "su - $user -c 'exit'" $user &>/dev/null; then
        echo "✅ Password for $user is set to 'redhat'"
    else
        echo "❌ Password for $user is NOT 'redhat' or test failed"
    fi
done
