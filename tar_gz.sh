#!/bin/bash

echo "Checking Task Q8 - Backup /var/tmp to /root/test.tar.gz..."

# Check if the archive exists
if [ -f /root/test.tar.gz ]; then
    echo "✅ Archive file /root/test.tar.gz exists"

    # List contents to verify it's a valid tar archive and contains /var/tmp content
    if tar -tzf /root/test.tar.gz | grep -q "var/tmp"; then
        echo "✅ Archive contains files from /var/tmp"
    else
        echo "❌ Archive does NOT contain /var/tmp content"
    fi
else
    echo "❌ Archive file /root/test.tar.gz does not exist"
fi
