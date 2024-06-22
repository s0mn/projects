from picamera2 import PiCamera2
from time import sleep

camera = PiCamera()

camera.capture('/opt/share/image.jpg')
