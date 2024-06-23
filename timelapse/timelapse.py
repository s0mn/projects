from picamera2 import Picamera2, Preview
import time

timestamp = (time.strftime('%Y%m%d_%H-%M-%S'))

picam2 = Picamera2()
sensor_modes = picam2.sensor_modes
picam2.resolution = (1280, 720)
picam2.brightness = 0
picam2.start_and_capture_file('/opt/share/image-' + timestamp + '.jpg', preview_mode=None, delay=0, brightness=0)
