#!/bin/bash
sudo mount -o ro /dev/sda2 /mnt/bigdisk
sudo systemctl restart plexmediaserver
sudo systemctl status plexmediaserver
