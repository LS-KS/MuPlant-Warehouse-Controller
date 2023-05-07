# This Python file uses the following encoding: utf-8

import sys

from pathlib import Path

from PySide6.QtGui import QGuiApplication

from PySide6.QtQml import QQmlApplicationEngine

from Ressources.model import produktListModel, InventoryModel


if __name__ == "__main__":

    app = QGuiApplication(sys.argv)

    engine = QQmlApplicationEngine()
    PRODUCTLIST = Path(__file__).resolve().parent / "Ressources" / "data" / "Produkte.db"
    STORAGEDATA = Path(__file__).resolve().parent / "Ressources" / "data" / "StorageData.db"

    productListModel = produktListModel.ProductListModel(produktListModel.getProducts(PRODUCTLIST))
    engine.rootContext().setContextProperty("productListModel", productListModel)

    inventoryModel = InventoryModel.InventoryModel(InventoryModel.createTableModel(STORAGEDATA, PRODUCTLIST))
    engine.rootContext().setContextProperty("inventoryModel", inventoryModel)

    qml_file = Path(__file__).resolve().parent / "Ressources" / "qml" / "main.qml"

    engine.load(qml_file)

    if not engine.rootObjects():
        sys.exit(-1)

    sys.exit(app.exec())
