import typing

import PySide6
from PySide6 import QtCore



class ProductSummaryListModel (QtCore.QAbstractListModel):

    def __init__(self, products, parent = None):
        super().__init__(parent)
        self.products = products

    def data(self, index, role):
        """Returns an appropriate value for the requested data.
           If the view requests an invalid index, an invalid variant is returned.
           Any valid index that corresponds to a string in the list causes that
          string to be returned."""

        row = index.row()
        if not index.isValid() or row >= len(self.products):
            return None
        product = self.products[row]
        if role == QtCore.Qt.UserRole + 1:
            return product.id
        elif role == QtCore.Qt.UserRole + 2:
            return product.name
        elif role == QtCore.Qt.UserRole + 2:
            return product.quantity
        return None

    def headerData(self, section, orientation, role=QtCore.Qt.DisplayRole):
        """Returns the appropriate header string depending on the orientation of
           the header and the section. If anything other than the display role is
           requested, we return an invalid variant."""
        if role != QtCore.Qt.DisplayRole:
            return None
        if orientation == QtCore.Qt.Horizontal:
            return f"Column {section}"
        return f"Row {section}"

    def rowCount(self, parent: typing.Union[PySide6.QtCore.QModelIndex, PySide6.QtCore.QPersistentModelIndex] = ...) -> int:
        # return length of productList
        return len(self.products)

    def roleNames(self):
            roles = {
                QtCore.Qt.UserRole + 1: b'id',
                QtCore.Qt.UserRole + 2: b'name',
            }
            return roles

class Product:
   def __init__(self, id:int, name:str, quantity: int = 0):
       self.id = id
       self.name = name
       self.quantity = quantity

# Data class for Inventory:
class Inventory():
    row : int
    col : int
    isPallet : bool
    a_CupID : int
    a_ProductID : int
    a_Name : str
    b_CupID : int
    b_ProductID : int
    b_Name : str


def createTableModel(FILE, PRODUCTLIST= None):
    # URL of StorageData.db
    if not FILE:
        FILE = "Ressources/data/StorageData.db"
        FILE = "../data/StorageData.db" #for debug purpose

    # get actual List of possible Products top get names and id correllation
    if not PRODUCTLIST:
        PRODUCTLIST = "../data/Produkte.db"
    productList = []
    try:
        # Open product file and read lines to list.
        # Avoid u\ufeff prefix in data by set encoding to utf8-8-sig (source: stackoverflow)
        with open(FILE, 'r', encoding='utf-8-sig') as file:
            list = file.readlines()

        for line in list:
            # Split the line by ';' to get the id and name
            product_data = line.strip().split(';')
            product_id = int(product_data[0])
            product_name = str(product_data[1])
            productList.append(Product(id=product_id, name=product_name))
        # Print the list of Product objects
        for product in productList:
            print(f"{product.id}: {product.name}")
    except FileNotFoundError:
            print("Error: could't find product list file 'Produkte.db'")
    except FileExistsError:
            print("Error: file 'Produkte.db' doesn't exist")

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
            storageData.append(Inventory(row=row, col=col, isPallet=isPallet, a_CupID = a_CupID, a_ProductID=a_ProductID, b_CupID=b_CupID, b_ProductID=b_ProductID, a_Name= a_Name, b_Name = b_Name))
            # print(f"Row: {row}\t Col: {col}\t isPallet: {isPallet}\t Cup_A: {a_CupID}\t ProductA: {a_ProductID}, {a_Name}\t Cup_B: {b_CupID}\t ProductB: {b_ProductID}, {b_Name} ")
    except FileNotFoundError:
        print("Error: could't find product list file 'StorageData.db'")
    except FileExistsError:
        print("Error: file 'StorageData.db' doesn't exist")
    finally:
        file.close()

    for stock in storageData:
        for product in productList:
            if stock.a_ProductID == product.id:
                product.quantity += 1
            if stock.b_ProductID == product.id:
                product.quantity += 1

    return productList
