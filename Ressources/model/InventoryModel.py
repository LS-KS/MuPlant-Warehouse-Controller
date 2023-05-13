# This Python file uses the following encoding: utf-8

from PySide6 import QtCore
from PySide6.QtCore import QModelIndex
from PySide6.QtCore import Qt

import Ressources.model.ProductListModel as produktListModel


class InventoryModel(QtCore.QAbstractTableModel):
    def __init__(self, storageData, parent=None):
        super().__init__(parent)
        self.inventory = storageData

    def rowCount(self, parent=QModelIndex()):
        return len(self.inventory)

    def columnCount(self, parent=QModelIndex()):
        return 6

    def roleNames(self):
        roles = {
            QtCore.Qt.UserRole + 1: b'isPallet',
            QtCore.Qt.UserRole + 2: b'a_CupID',
            QtCore.Qt.UserRole + 3: b'a_ProductID',
            QtCore.Qt.UserRole + 4: b'a_Name',
            QtCore.Qt.UserRole + 5: b'b_CupID',
            QtCore.Qt.UserRole + 6: b'b_ProductID',
            QtCore.Qt.UserRole + 7: b'b_Name',
            QtCore.Qt.UserRole + 8: b'row',
            QtCore.Qt.UserRole + 9: b'col',

        }
        return roles

    def data(self, index, role):
        row = index.row()
        col = index.column()
        if not index.isValid() or row >= len(self.inventory) or col >= 6:
            return None
        inventory = self.inventory[row][col]
        if role == QtCore.Qt.UserRole + 1:
            return inventory[0]
        if role == QtCore.Qt.UserRole + 2:
            return inventory[1]
        if role == QtCore.Qt.UserRole + 3:
            return inventory[2]
        if role == QtCore.Qt.UserRole + 4:
            return inventory[3]
        if role == QtCore.Qt.UserRole + 5:
            return inventory[4]
        if role == QtCore.Qt.UserRole + 6:
            return inventory[5]
        if role == QtCore.Qt.UserRole + 7:
            return inventory[6]
        if role == QtCore.Qt.UserRole + 8:
            return inventory[7]
        if role == QtCore.Qt.UserRole + 9:
            return inventory[8]
        return None

    def setData(self, index, value, role):
        row = index.row()
        col = index.column()
        if not index.isValid() or row >= len(self.inventory) or col >= 6:
            return False
        if role == Qt.UserRole + 2:  # a_CupID
            self.inventory[row][col][1] = value
            return True
        if role == Qt.UserRole + 5:  # b_CupID
            self.inventory[row][col][4] = value
            return True
        if role == Qt.UserRole + 3:  # a_productID
            oldValue = self.inventory[row][col][2]
            self.inventory[row][col][2] = value
            return oldValue
        if role == Qt.UserRole + 6:  # b_productID
            oldValue = self.inventory[row][col][5]
            self.inventory[row][col][5] = value
            return oldValue
        if role == Qt.UserRole + 4:  # a_Name
            self.inventory[row][col][3]= value
            return True
        if role == Qt.UserRole + 7:  # b_Name
            self.inventory[row][col][6]= value
            return True
        return False


# Data class for Inventory:
class Inventory():
    row: int
    col: int
    isPallet: bool
    a_CupID: int
    a_ProductID: int
    a_Name: str
    b_CupID: int
    b_ProductID: int
    b_Name: str

    def __init__(self, row, col, isPallet, a_CupID, a_ProductID, a_Name, b_CupID, b_ProductID, b_Name):
        self.row = row
        self.col = col
        self.isPallet = isPallet
        self.a_CupID = a_CupID
        self.a_ProductID = a_ProductID
        self.a_Name = a_Name
        self.b_CupID = b_CupID
        self.b_ProductID = b_ProductID
        self.b_Name = b_Name


def createTableModel(FILE, PRODUCTLIST=None):
    # URL of StorageData.db
    if not FILE:
        FILE = "Ressources/data/StorageData.db"
        FILE = "../data/StorageData.db"  # for debug purpose

    # get actual List of possible Products top get names and id correllation
    if not PRODUCTLIST:
        PRODUCTLIST = "../data/Produkte.db"
    productList = produktListModel.getProducts(PRODUCTLIST)

    # load Inventory from StorageData.db
    storageData = []
    try:
        # Open StorageData file and read in lines to list
        # Avoid u\efeff prefix in data by set encodeing to utf8-8-sig (source: stackoverflow)
        with open(FILE, 'r', encoding='utf-8-sig') as file:
            list = file.readlines()

        # remove empty lines
        list = [line for line in list if line != '\n']
        # remove first line
        list = list[1:]

        for line in list:
            # strip and split to get raw data
            splitData = line.strip().split(',')
            splitData[1] = splitData[1].strip().split(':')
            splitData[2] = splitData[2].strip().split('|')
            # map the split data to Inevntory Data
            row = int(splitData[0])
            col = int(splitData[1][0])
            isPallet = True if splitData[1][1] == '1' else False
            a_CupID = int(splitData[1][2])
            a_ProductID = int(splitData[2][0])
            a_Name = ""
            b_CupID = int(splitData[2][1])
            b_ProductID = int(splitData[3])
            b_Name = ""
            # find matching product strings from actual product list
            for product in productList:
                if product.id == a_ProductID:
                    a_Name = product.name
                if product.id == b_ProductID:
                    b_Name = product.name
                if a_Name != "" and b_Name != "":
                    break
            # append data to storageData for QAbstractTableModel
            storageData.append(Inventory(row=row, col=col, isPallet=isPallet, a_CupID=a_CupID, a_ProductID=a_ProductID,
                                         b_CupID=b_CupID, b_ProductID=b_ProductID, a_Name=a_Name, b_Name=b_Name))
            # print(f"Row: {row}\t Col: {col}\t isPallet: {isPallet}\t Cup_A: {a_CupID}\t ProductA: {a_ProductID}, {a_Name}\t Cup_B: {b_CupID}\t ProductB: {b_ProductID}, {b_Name} ")
    except FileNotFoundError:
        print("Error: could't find product list file 'StorageData.db'")
    except FileExistsError:
        print("Error: file 'StorageData.db' doesn't exist")
    finally:
        file.close()

    # storageData is now a abject oriented data.
    # to use a TableModel the data must be set in row/col - values
    cols = 6
    rows = 3
    tableData = [[None for col in range(cols)] for row in range(rows)]
    for col in range(cols):
        for row in range(rows):
            for element in storageData:
                if col == element.col and row == element.row:
                    tableData[row][col] = [element.isPallet, element.a_CupID, element.a_ProductID, element.a_Name,
                                           element.b_CupID, element.b_ProductID, element.b_Name, element.row,
                                           element.col]
    # print(tableData)

    return tableData


if __name__ == "__main__":
    blubb = createTableModel("../data/StorageData.db")
