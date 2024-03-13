#!/bin/bash

# Install required packages
sudo apt install vim xorg rdesktop -y && \

# Append script into ~/.bashrc
cat <<EOF >> ~/.bashrc && \

if [[ -z \$DISPLAY ]] && [[ \$(tty) = /dev/tty1 ]]; then
    read -t 5 -n 1 -p "Press 'Q' to quit X" key
    if [[ "\$key" == "Q" ]]; then
        echo "Quitting X"
        exit
    else
        exec startx
    fi
fi

EOF

# Ask user for input IP address
echo "Windows Server IP" && \
read IP && \

# Append command into .xinitrc
echo "rdesktop -f $IP" >> ~/.xinitrc && \

# .bashrc refresh
source ~/.bashrc

