# This Python file uses the following encoding: utf-8

import sys

from pathlib import Path

from PySide6.QtGui import QGuiApplication

from PySide6.QtQml import QQmlApplicationEngine

from Ressources.model.produktListModel import ProductList


if __name__ == "__main__":

    app = QGuiApplication(sys.argv)

    engine = QQmlApplicationEngine()

    # Creating an instance of ProductList and passing it to the QML engine context as a context property
    product_list_model = ProductList("Ressources/data/Produkte.db")
    engine.rootContext().setContextProperty("productListModel", product_list_model)

    qml_file = Path(__file__).resolve().parent / "Ressources" / "qml" / "main.qml"

    engine.load(qml_file)

    if not engine.rootObjects():
        sys.exit(-1)

    sys.exit(app.exec())
