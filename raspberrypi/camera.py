from picamera import PiCamera
from time import sleep
from shutil import copy2
import os
import datetime

date = datetime.datetime.today().strftime('%Y-%m%d%H%M')

camera = PiCamera()

#camera.rotation = 180
camera.start_preview()
#camera.contrast = 60
camera.awb_mode = 'fluorescent'
sleep(3)
camera.capture('/var/www/html/image.jpg')
camera.stop_preview()

# check for archive directory and create if not present
if not os.path.exists('/var/www/html/archive'):
    os.mkdir('/var/www/html/archive')
copy2('/var/www/html/image.jpg', '/var/www/html/archive/image-' + date + '.jpg')

#test
