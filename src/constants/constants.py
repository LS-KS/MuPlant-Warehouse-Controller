

'''
This file provides file URLS etc. to other python files

'''
from pathlib import Path

PRODUCTLIST = Path(__file__).resolve().parent.parent.parent / "src" / "data" / "Produkte.db"
STORAGEDATA = Path(__file__).resolve().parent.parent.parent / "src" / "data" / "StorageData.db"
STORAGEDATAWRITE = Path(__file__).resolve().parent.parent.parent / "src" / "data" / "StorageDataWrite.db"
CAMAPP_QML = "../cameraApplication/qml/CameraAppMain.qml"
