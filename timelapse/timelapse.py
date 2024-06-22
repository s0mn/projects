from picamera2 import Picamera2, Preview
import time

timestamp = (time.strftime('%Y%m%d_%H-%M-%S'))

picam2 = Picamera2()

# picam2.start_and_capture_file('/opt/share/image' + 'timestamp' + '.jpg', preview_mode=None, delay=0)
picam2.start_and_capture_file('/opt/share/image.jpg', preview_mode=None, delay=0)
