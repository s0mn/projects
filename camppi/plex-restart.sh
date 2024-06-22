#!/bin/bash
sudo mount /dev/sda2 /mnt/bigdisk
sudo systemctl restart plexmediaserver
sudo systemctl status plexmediaserver
