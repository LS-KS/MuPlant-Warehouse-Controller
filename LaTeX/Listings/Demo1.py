'''Create Basic Application Class and QMLEngine'''
app = QGuiApplication(sys.argv)
engine = QQmlApplicationEngine()

# Create simple Productlistodel from path to database file
listModel = ProductListModel(getProducts(PRODUCTLIST))
engine.rootContext().setContextProperty("listModel",listModel)

# create InventoryController instance
listController = ProductListController(listModel)
engine.rootContext().setContextProperty("listCon",listController)

# define load main.qml file to start application
qml_file = "../src/qml/main.qml"
engine.load(qml_file)

if not engine.rootObjects():
    sys.exit(-1)

sys.exit(app.exec())
