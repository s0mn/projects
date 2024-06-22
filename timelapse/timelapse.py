from picamera2 import Picamera2, Preview
import time
camera = Picamera2()

camera.capture('/opt/share/image.jpg')
