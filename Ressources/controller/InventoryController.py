from PySide6.QtCore import QObject, Signal, Slot
from Ressources.model.InventoryModel import InventoryModel
'''
This Controller handles functionality in following qml files: 
-Inventory.qml
-SmallProductSlot

How it works: 
InventoryController is registered in qmlRegister when Application is started als ionventoryController 1.0
So following line will work despite import warning in IDE: 

import inventorycontroller 1.0

an Instance invController is created in main.qml which can be used in any qml file. 

When qml item signal calls selectRow function the onRowClicked signal is emitted. Every qml item which potentially 
stores a product is meant to change color depending on the productID is identically or not.
'''
class InventoryController(QObject):

    def __init__(self, model: InventoryModel=None, parent=None):
        super().__init__(parent)
        self.model = model


    # Signal can be captured in qml file with Connections - syntax and handling on signal called 'onRowClicked'
    rowClicked = Signal(str)

    # Slot can be accessed from qml file with oo-syntax: invController.selectRow(model.id)
    @Slot(str)
    def selectRow(self, message):
        #print(message)
        self.rowClicked.emit(message)

    @Slot(str)
    def loadStorage(string):
        number = int(string[1:])
        row = (number - 1) // 6 + 1
        col = (number - 1) % 6 + 1
        return row, col


