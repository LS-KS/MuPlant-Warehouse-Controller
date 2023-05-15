import sys
from PySide6.QtCore import QObject, QUrl
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine
from PySide6.QtQuick import QQuickView

class CamWindow(QQuickView):
    def __init__(self, parent=None):
        super().__init__(parent)
        self.setSource(QUrl.fromLocalFile('Ressources/cameraApplication/qml/CameraAppMain.qml'))
