from PySide6.QtCore import QObject, Signal, Slot
from PySide6.QtCore import Qt
from Ressources.controller.EventlogController import EventlogController
from Ressources.model import ProductListModel
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

    def __init__(self, model: InventoryModel = None, parent=None, eventcontroller: EventlogController = None):
        super().__init__(parent)
        self.model = model
        self.eventcontroller = eventcontroller if eventcontroller else None

    # Signal can be captured in qml file with Connections - syntax and handling on signal called 'onRowClicked'
    rowClicked = Signal(str)

    # Slot can be accessed from qml file with oo-syntax: invController.selectRow(model.id)
    @Slot(str)
    def selectRow(self, message):
        # print(message)
        self.rowClicked.emit(message)

    @Slot(str, str)
    def loadStorage(self, storage, slot):
        '''Takes Data from Override Storage Dialog from Storage.qml
            Decodes Storage ID 'L1' to L'18' in row / col and checks for ValueErrors.
            changes InventoryModel Data depending on entries.
        '''
        number = int(storage[1:])
        row = (number - 1) // 6
        col = (number - 1) % 6
        if not 0 <= row <= 2:
            raise ValueError("Error could not decode storage(row)")
        if not 0 <= col <= 5:
            raise ValueError("Error could not decode storage(col)")
        if slot == "a":
            pass
        elif slot == "b":
            pass
        else:
            raise ValueError("Slot Value error. Slot must be 'a' or 'b'")
        return row, col

    @Slot(str, str, int, int)
    def changeStorage(self, storage, slot, cupID, productID):
        '''Takes Data from Override Storage Dialog from Storage.qml
            Decodes Storage ID 'L1' to L'18' in row / col and checks for ValueErrors.
            changes InventoryModel Data depending on entries.
        '''
        number = int(storage[1:])
        row = (number - 1) // 6
        col = (number - 1) % 6
        if not 0 <= row <= 2:
            raise ValueError("Error could not decode storage(row)")
        if not 0 <= col <= 5:
            raise ValueError("Error could not decode storage(col)")
        if slot == "a":
            print(f"to set storage: row: {row}, col: {col}, cup: {cupID}, slot: {slot}, product: {productID}")
            roleCup = Qt.UserRole + 2
            roleProduct = Qt.UserRole + 3
            roleName = Qt.UserRole + 4
        elif slot == "b":
            print(f"to set storage: row: {row}, col: {col}, cup: {cupID}, slot: {slot}, product: {productID}")
            roleCup = Qt.UserRole + 5
            roleProduct = Qt.UserRole + 6
            roleName = Qt.UserRole + 7
        else:
            raise ValueError("Slot Value error. Slot must be 'a' or 'b'")

        index = self.model.createIndex(row, col)

        cup = self.model.setData(index, cupID, role=roleCup)
        id = self.model.setData(index, productID, role=roleProduct)
        name = self.model.setData(index, self.findProductName(productID), role=roleName)
        self.model.dataChanged.emit(index, index, [roleCup, roleProduct, roleName])

    def findProductName(self, id: int):
        productList = ProductListModel.getProducts("Ressources/data/Produkte.db")
        for product in productList:
            if product.id == id:
                return product.name
        return None
