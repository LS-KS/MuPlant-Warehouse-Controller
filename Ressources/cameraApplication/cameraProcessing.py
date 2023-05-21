import sys
import cv2
from PySide6.QtGui import QImage, QPixmap
from PySide6.QtCore import Signal, Slot, Qt, QThread, QUrl, QObject
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine, QQmlContext
from PySide6.QtQuick import QQuickImageProvider

class VideoThread(QThread):
    frameChanged = Signal(QImage)

    def __init__(self, parent = None):
        QThread.__init__(self, parent)
        self.capture = cv2.VideoCapture(0)
        self.running = True

    def run(self):
        while self.running:
            #print("getframe...")
            ret, frame = self.capture.read()
            if ret:
                rgbImage =  cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)
                h, w, _ = rgbImage.shape
                qImage = QImage(rgbImage.data, w, h, QImage.Format_RGB888)
                self.frameChanged.emit(qImage)
                #print("...emitted frame")

    def quit(self):
        print("try closing")
        self.running = False
        self.capture.release()
        super().quit()
    
    def start(self):
        self.running = True
        super().start()




class VideoPlayer(QQuickImageProvider):
    imageChanged = Signal(QImage)

    def __init__(self, parent = None):
        super(). __init__(QQuickImageProvider.Image)
        self.videoThread = None
        self.image = None

    def requestImage(self, id, size, requestedSize):
        if self.image:
            img = self.image
        else:
            img = QImage(1280, 720, QImage.Format_RGBA8888)
            img.fill(Qt.black)
        return img


    @Slot(QImage)
    def updateImage(self, frame):
        self.image = frame
        self.imageChanged.emit(frame)


    @Slot()
    def start(self):
        print("Starting Video feed...")
        if not self.videoThread:
            self.videoThread = VideoThread()
        self.videoThread.running = True
        self.videoThread.start()

    @Slot()
    def stop(self):
        print("Finishing Video feed.")
        if self.videoThread:
            self.videoThread.running = False
            self.videoThread.capture.release()
            self.videoThread.quit()
            cv2.destroyAllWindows()

