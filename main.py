# This Python file uses the following encoding: utf-8

import sys

from pathlib import Path

from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine, qmlRegisterType
from Ressources.model import ProductListModel
from Ressources.model.InventoryModel import InventoryModel, createTableModel
from Ressources.model.ProductSummaryListModel import ProductSummaryListModel,  InventoryFilterProxyModel, createSummaryModel
from Ressources.controller.InventoryController import InventoryController
from Ressources.controller.EventlogController import EventlogController


if __name__ == "__main__":

    app = QGuiApplication(sys.argv)

    engine = QQmlApplicationEngine()

    PRODUCTLIST = Path(__file__).resolve().parent / "Ressources" / "data" / "Produkte.db"
    STORAGEDATA = Path(__file__).resolve().parent / "Ressources" / "data" / "StorageData.db"

    productListModel = ProductListModel.ProductListModel(ProductListModel.getProducts(PRODUCTLIST))
    engine.rootContext().setContextProperty("productListModel", productListModel)

    inventoryModel = InventoryModel(createTableModel(STORAGEDATA, PRODUCTLIST))
    engine.rootContext().setContextProperty("inventoryModel", inventoryModel)

    productSummaryModel = ProductSummaryListModel(createSummaryModel(STORAGEDATA, PRODUCTLIST))
    engine.rootContext().setContextProperty("productSummaryModel", productSummaryModel)

    inventoryFilterModel = InventoryFilterProxyModel(model= productSummaryModel)
    engine.rootContext().setContextProperty("inventoryFilterModel", inventoryFilterModel)

    qmlRegisterType(InventoryController, 'inventorycontroller',1,0, 'InvController')
    qmlRegisterType(EventlogController, 'eventlogcontroller', 1,0, 'EventController')

    qml_file = Path(__file__).resolve().parent / "Ressources" / "qml" / "main.qml"

    engine.load(qml_file)

    if not engine.rootObjects():
        sys.exit(-1)

    sys.exit(app.exec())
