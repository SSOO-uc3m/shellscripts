#!/bin/bash
# example /etc/group sys:x:3:root,bin,daemon
grep -e ":*:$1:" /etc/group | cut -d : -f4 | tr , \\n

