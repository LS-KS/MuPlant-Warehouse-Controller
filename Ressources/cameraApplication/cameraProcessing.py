import sys
import cv2
from PySide6.QtGui import QImage
from PySide6.QtCore import Signal, Slot, Qt, QThread
from PySide6.QtQuick import QQuickImageProvider
from PySide6.QtQml import QQmlImageProviderBase


class VideoThread(QThread):
    frameChanged = Signal(QImage)

    def __init__(self, parent=None):
        QThread.__init__(self, parent)
        self.capture = cv2.VideoCapture(0)
        self.running = True
        print("VideoThread initialization finished")

    def run(self):
        while self.running:
            print("getframe...")
            ret, frame = self.capture.read()
            if ret:
                rgbImage = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)
                h, w, _ = rgbImage.shape
                qImage = QImage(rgbImage.data, w, h, QImage.Format_RGB888)
                self.frameChanged.emit(qImage)
                print("...emitted frame")

    def quit(self):
        print("try closing")
        self.running = False
        self.capture.release()
        super().quit()
        print("try closed")


    def start(self):
        print("VideoThread: start")
        self.running = True
        super().start()
        print("VideoThread: started")


class VideoPlayer(QQuickImageProvider):
    imageChanged = Signal(QImage)

    def __init__(self):
        super().__init__(QQmlImageProviderBase.Image, QQmlImageProviderBase.ForceAsynchronousImageLoading)
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
        print("new image in updateImage")
        self.image = frame
        self.imageChanged.emit(frame)

    @Slot()
    def start(self):
        print("Starting Video feed...")
        if not self.videoThread:
            self.videoThread = VideoThread()
            self.videoThread.frameChanged.connect(self.updateImage)
        self.videoThread.running = True
        self.videoThread.start()

    @Slot()
    def stop(self):
        print("Finishing Video feed.")
        if self.videoThread:
            self.videoThread.running = False
            self.videoThread.capture.release()
            self.videoThread.quit()
            print("Finished Video feed.")