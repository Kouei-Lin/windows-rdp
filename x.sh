#!/bin/bash

# Install required packages
sudo apt install vim xorg rdesktop -y && \

# Append script into ~/.bashrc
cat <<EOF >> ~/.bashrc

# Autostartx
if [[ -z \$DISPLAY ]] && [[ \$(tty) = /dev/tty1 ]]; then
    echo "Starting X... Ctrl C to quit"
    sleep 5
    exec startx
fi

EOF
