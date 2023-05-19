'''
This is the entrancee file of Python-Implementation of muPlant Warehouse Manager.
Author: L.Schink
Date: 11.05.2023

'''
import sys
from pathlib import Path
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine
from PySide6.QtCore import Slot, QObject, QUrl
from Ressources.model import ProductListModel
from Ressources.model.InventoryModel import InventoryModel, createTableModel
from Ressources.model.ProductSummaryListModel import ProductSummaryListModel,  InventoryFilterProxyModel, createSummaryModel
from Ressources.controller.InventoryController import InventoryController
from Ressources.controller.EventlogController import EventlogController
from Ressources.controller import websocketController
from Ressources.cameraApplication import cameraProcessing

class helpFunctions(QObject):

    def __init__(self):
        super().__init__()

    @Slot()
    def startCamApp(self):
        # self.camApp = cameraProcessing.runApp()
        pass



if __name__ == "__main__":
    '''Create Basic Application Class and QMLEngine'''
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()

    '''Define pathes for saved data, load the data in QML-usable data models and set mata model as RootContext'''
    PRODUCTLIST = Path(__file__).resolve().parent / "Ressources" / "data" / "Produkte.db"
    STORAGEDATA = Path(__file__).resolve().parent / "Ressources" / "data" / "StorageData.db"
    CAMAPP_QML = "../cameraApplication/qml/CameraAppMain.qml"

    # simple Productlist
    productListModel = ProductListModel.ProductListModel(ProductListModel.getProducts(PRODUCTLIST))
    engine.rootContext().setContextProperty("productListModel", productListModel)

    # tableModel for storage-visualization
    inventoryModel = InventoryModel(createTableModel(STORAGEDATA, PRODUCTLIST))
    engine.rootContext().setContextProperty("inventoryModel", inventoryModel)

    # model combined from productlist and storage. Provides list with storage data and quantity
    productSummaryModel = ProductSummaryListModel(createSummaryModel(STORAGEDATA, PRODUCTLIST))
    engine.rootContext().setContextProperty("productSummaryModel", productSummaryModel)

    # model based on productSummaryModel but can be filtered dependding on quantity
    inventoryFilterModel = InventoryFilterProxyModel(model= productSummaryModel)
    engine.rootContext().setContextProperty("inventoryFilterModel", inventoryFilterModel)

    # create EventlogController instance
    eventlogController = EventlogController()
    engine.rootContext().setContextProperty("eventLogController", eventlogController)

    # create InventoryController instance
    inventoryController = InventoryController(model=inventoryModel, eventcontroller = eventlogController, productlist = productListModel)
    engine.rootContext().setContextProperty("inventoryController", inventoryController)

    # set inventoryModel as property of productSummaryModel
    productSummaryModel.setStorageModel(inventoryModel)

    # register controller to make them availlable in qml files.
    wsController = websocketController.WebsocketController(eventlogController)
    engine.rootContext().setContextProperty("wsController", wsController)

    # Connect idSwapped signal from inventoryModel to productSummaryModel
    inventoryController.idSwapped.connect(productSummaryModel.update)

    engine.rootContext().setContextProperty("camAppPath", CAMAPP_QML)
    # TODO: Connect signal of EditDialog emitted when Location is changed to inventoryModel to return appropriate cupID and ProductID
    # TODO: Connect signal of EditDialog emitted when slot is changed to inventoryModel to return appropriate cupID and ProductID

    # define load main.qml file to start application
    qml_file = Path(__file__).resolve().parent / "Ressources" / "qml" / "main.qml"
    engine.load(qml_file)

    if not engine.rootObjects():
        sys.exit(-1)

    sys.exit(app.exec())
