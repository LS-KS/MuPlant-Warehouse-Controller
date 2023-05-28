from PySide6.QtCore import QObject, Signal, Slot
from PySide6.QtCore import Qt
from src.controller.EventlogController import EventlogController
from src.model import ProductListModel
from src.model.InventoryModel import InventoryModel
from src.model.ProductListModel import ProductListModel
from src.constants import constants
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

    def __init__(self, model: InventoryModel = None, parent=None, eventcontroller: EventlogController = None, productlist:ProductListModel = None):
        super().__init__(parent)
        self.model = model
        self.eventcontroller = eventcontroller if eventcontroller else None
        self.productlist = productlist if productlist else None

    # Signal can be captured in qml file with Connections - syntax and handling on signal called 'onRowClicked'
    rowClicked = Signal(str)
    idSwapped = Signal(int, int)
    transmitData = Signal(str, int, int)

    # Slot can be accessed from qml file with oo-syntax: invController.selectRow(model.id)
    @Slot(str)
    def selectRow(self, message):
        # print(message)
        self.rowClicked.emit(message)

    @Slot(str, str)
    def loadStorage(self, storage:str, slot:str):
        '''Takes Data from Override Storage Dialog from Storage.qml
           Decodes Storage ID 'L1' to L'18' in row / col and checks for ValueErrors.
           returns productslot, cup ID and productListindex.
        '''
        if storage != "":
            number = int(storage[1:])
            row = (number - 1) // 6
            col = (number - 1) % 6
            if not 0 <= row <= 2:
                raise ValueError("Error could not decode storage(row)")
            if not 0 <= col <= 5:
                raise ValueError("Error could not decode storage(col)")
            if slot == "a":
                cupRole = Qt.UserRole +2
                prodRole = Qt.UserRole +3
            elif slot == "b":
                cupRole = Qt.UserRole +5
                prodRole = Qt.UserRole +6
            else:
                raise ValueError("Slot Value error. Slot must be 'a' or 'b'")
            index = self.model.createIndex(row, col)

            product = self.model.data(index, prodRole)
            productlistIndex = self.productlist.indexOf(product)
            cup = self.model.data(index, cupRole)
            self.transmitData.emit(slot, cup, product)

    def dumpStorage(self):
        if self.model == None:
            raise ValueError(" Model not set. cannot dump data to file")
        else:
            FILE = None
            try:
                with open(constants.STORAGEDATA, 'w', encoding='utf-8-sig') as FILE:
                    FILE.write("# Row,Col:IsPalletPresent:CupID_a,ProductID_a|CupID_b,ProductID_b\n\n")
                    rows = self.model.rowCount()
                    for row in range(rows):
                        r = row
                        for col in range (6):
                            storage = self.model.inventory[row][col]
                            c = col
                            p = storage[0]
                            cA = storage[1]
                            pA = storage[2]
                            cB = storage[4]
                            pB = storage[5]
                            FILE.write(f"{r},{c}:{int(p)}:{cA},{pA}|{cB},{pB}\n")
                        FILE.write("\n")
            except FileNotFoundError("Storagefile not found"):
                return None
            finally:
                if FILE != None:
                    FILE.close()
            self.eventcontroller.writeEvent("USER", f"\n Manual Storage Override saved to local File \n")

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
        product = self.model.setData(index, productID, role=roleProduct)
        name = self.model.setData(index, self.findProductName(productID), role=roleName)
        self.model.dataChanged.emit(index, index, [roleCup, roleProduct, roleName])
        self.idSwapped.emit(product, productID)
        self.eventcontroller.writeEvent("USER", f"\n*** ATTENTION ***\n\n!!! INVENTORY OVERRIDE !!!\n\nLocation: {storage} - {slot}\nCup: {cup} --> {cupID}\nProduct: {product} --> {productID}\n\n*** DANGER ***\n\nThe storage information provided might be incorrect. As a result, the robotic arm will move recklessly, posing a severe risk to human life. There is a high possibility of crashes and flying parts that can cause serious injuries or fatalities.\n\n*** THIS IS A LIFE-THREATENING SITUATION ***\n\n>>>>> CHANGES ARE PERMANENT <<<<<\n\n_____\n")
        self.dumpStorage()

    def findProductName(self, id: int):
        for index, product in enumerate(self.productlist.products):
            if product.id == id:
                return product.name
        return None

