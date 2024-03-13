#!/bin/bash

# Install required packages
sudo apt install vim xorg rdesktop -y && \

# Append script into ~/.bashrc
cat <<EOF >> ~/.bashrc && \

# Autostartx
if [[ -z \$DISPLAY ]] && [[ \$(tty) = /dev/tty1 ]]; then
    echo "Starting X..."
    sleep 5
    exec startx
fi

EOF

# Ask user for input IP address
echo "Please Enter Server IP:Port" && \
read IP && \

# Append command into .xinitrc
echo "rdesktop -f $IP" >> ~/.xinitrc && \

# Start X
startx && \

# Sleep
sleep 5 && \

# rdesktop
rdesktop -f $IP
