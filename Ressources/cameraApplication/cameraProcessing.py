import sys
import cv2
from PySide6.QtGui import QImage, QPixmap
from PySide6.QtCore import Signal, Slot, Qt, QThread, QUrl, QObject
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine, QQmlContext

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


class VideoPlayer(QObject):
    def __init__(self,engine, parent = None):
        QObject.__init__(self, parent)
        self.engine = engine
        self.videoThread = None


    @Slot(QImage)
    def updateFrame(self, frame):
        pixmap = QPixmap.fromImage(frame)
        self.engine.rootContext().setContextProperty("cameraFrame", pixmap)

    @Slot()
    def start(self):
        if not self.videoThread:
            self.videoThread = VideoThread()
            self.videoThread.frameChanged.connect(self.updateFrame)
        self.videoThread.start()

    @Slot()
    def stop(self):
        if self.videoThread:
            self.videoThread.running = False
            self.videoThread.capture.release()
            self.videoThread.quit()

