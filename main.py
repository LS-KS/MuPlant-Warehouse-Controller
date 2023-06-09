'''
This is the entrancee file of Python-Implementation of muPlant Warehouse Manager.
Author: L.Schink
Date: 11.05.2023

'''
import sys
from pathlib import Path

from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine

from src.cameraApplication import cameraProcessing
from src.constants import constants
from src.controller import websocketController
from src.controller.EventlogController import EventlogController
from src.controller.InventoryController import InventoryController
from src.model import ProductListModel, Workbench, MobileRobot
from src.model.InventoryModel import InventoryModel, createTableModel
from src.model.ProductSummaryListModel import ProductSummaryListModel, InventoryFilterProxyModel, createSummaryModel

if __name__ == "__main__":
    '''Create Basic Application Class and QMLEngine'''
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()

    # simple Productlist
    productListModel = ProductListModel.ProductListModel(ProductListModel.getProducts(constants.PRODUCTLIST))
    engine.rootContext().setContextProperty("productListModel", productListModel)

    # tableModel for storage-visualization
    inventoryModel = InventoryModel(createTableModel(constants.STORAGEDATA, constants.PRODUCTLIST))
    engine.rootContext().setContextProperty("inventoryModel", inventoryModel)

    # model combined from productlist and storage. Provides list with storage data and quantity
    productSummaryModel = ProductSummaryListModel(createSummaryModel(constants.STORAGEDATA, constants.PRODUCTLIST))
    engine.rootContext().setContextProperty("productSummaryModel", productSummaryModel)

    # model based on productSummaryModel but can be filtered dependding on quantity
    inventoryFilterModel = InventoryFilterProxyModel(model=productSummaryModel)
    engine.rootContext().setContextProperty("inventoryFilterModel", inventoryFilterModel)

    # create workbenchmodel
    workbenchModel = Workbench.Workbench(Workbench.extractComissData())
    engine.rootContext().setContextProperty("workbenchModel", workbenchModel)

    # create mobileRobotModel
    mobileRobotModel = MobileRobot.MobileRobot()
    engine.rootContext().setContextProperty("mobileRobotModel", mobileRobotModel)

    # create EventlogController instance
    eventlogController = EventlogController()
    engine.rootContext().setContextProperty("eventLogController", eventlogController)

    # create InventoryController instance
    inventoryController = InventoryController(model=inventoryModel, eventcontroller=eventlogController,
                                              productlist=productListModel)
    engine.rootContext().setContextProperty("inventoryController", inventoryController)

    # set inventoryModel as property of productSummaryModel
    productSummaryModel.setStorageModel(inventoryModel)

    # register controller to make them availlable in qml files.
    wsController = websocketController.WebsocketController(eventlogController)
    engine.rootContext().setContextProperty("wsController", wsController)

    # add camApp to engine
    camApp = cameraProcessing.VideoPlayer()
    engine.rootContext().setContextProperty("camApp", camApp)
    engine.addImageProvider("camApp", camApp)

    # Connect idSwapped signal from inventoryModel to productSummaryModel
    inventoryController.idSwapped.connect(productSummaryModel.update)

    # set main qml of camera App as rootContext
    engine.rootContext().setContextProperty("camAppPath", constants.CAMAPP_QML)

    # define load main.qml file to start application
    qml_file = Path(__file__).resolve().parent / "src" / "qml" / "main.qml"
    engine.load(qml_file)

    if not engine.rootObjects():
        sys.exit(-1)

    sys.exit(app.exec())
