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

    def run(self):
        while True:
            print("getframe...")
            ret, frame = self.capture.read()
            if ret:
                rgbImage =  cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)
                h, w, _ = rgbImage.shape
                qImage = QImage(rgbImage.data, w, h, QImage.Format_RGB888)
                self.frameChanged.emit(qImage)
                print("...emitted frame")
class VideoPlayer(QObject):
    def __init__(self, parent = None):
        QObject.__init__(self, parent)
        self.videoThread = VideoThread()
        self.videoThread.frameChanged.connect(self.updateFrame)

    @Slot(QImage)
    def updateFrame(self, frame):
        pixmap = QPixmap.fromImage(frame)
        self.engine.rootContext().setContextProperty("cameraFrame", pixmap)

    def start(self):
        self.videoThread.start()

def runApp():
    camApp = QGuiApplication.instance()
    if camApp is None:
        camApp = QGuiApplication(sys.argv)

    #videoPlayer = VideoPlayer()

    engine = QQmlApplicationEngine()
    context = engine.rootContext()
    #context.setContextProperty("videoPlayer", videoPlayer)
    engine.load(QUrl.fromLocalFile("qml/CameraAppMain.qml"))
    # engine.load(QUrl.fromLocalFile("Ressources/cameraApplication/qml/CameraAppMain.qml"))

    if not engine.rootObjects():
        sys.exit(-1)

    #videoPlayer.engine = engine
    #videoPlayer.start()

    sys.exit(camApp.exec())

if __name__ == "__main__":
    runApp()
