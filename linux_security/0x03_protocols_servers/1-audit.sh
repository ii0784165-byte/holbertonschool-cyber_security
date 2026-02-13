#!/bin/bash
for s in "KbdInteractiveAuthentication no" "UsePAM yes" "X11Forwarding yes" "PrintMotd no" "AcceptEnv LANG LC_*" "Subsystem sftp /usr/lib/openssh/sftp-server" "PasswordAuthentication yes" "PermitRootLogin yes" "AuthorizedKeysFile .ssh/authorized_keys" "TCPKeepAlive yes"; do grep -qE "^\s*${s}" /etc/ssh/sshd_config || echo "Non-standard $s"; done
