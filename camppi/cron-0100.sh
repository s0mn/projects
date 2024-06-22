#!/bin/bash
touch ~/$(date +%Y-%m%d-%H-%M-%S).crontest
touch ~/gittest
crontab -l > ~/camppi-sync/crontab-pi
/home/pi/.local/bin/aws s3 sync ~/camppi-sync/ s3://camppi-s3-bucket/camppi-sync >> ~/camppi-sync/s3-sync-log.out 2>&1
