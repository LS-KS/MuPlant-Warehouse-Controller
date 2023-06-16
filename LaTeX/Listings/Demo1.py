if __name__ == "__main__":
    '''Create Basic Application Class and QMLEngine'''
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()

    # Create simple Productlistodel from path to database file
    productListModel = ProductListModel(getProducts(PRODUCTLIST))
    engine.rootContext().setContextProperty("productListModel",
                                            productListModel)

    # create InventoryController instance
    productListController = ProductListController(productlist=
                                                  productListModel)
    engine.rootContext().setContextProperty("productListController",
                                            productListController)

    # define load main.qml file to start application
    qml_file = Path(__file__).resolve().parent / "src" / "qml" / "main.qml"
    engine.load(qml_file)

    if not engine.rootObjects():
        sys.exit(-1)

    sys.exit(app.exec())
