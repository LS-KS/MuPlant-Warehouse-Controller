from typing import Dict

from PySide6.QtCore import QAbstractListModel
from PySide6 import QtCore
from src.constants import constants


class Workbench(QAbstractListModel):

    def __init__(self, data, parent=None):
        super().__init__(parent)
        self.commissData = data

    def rowCount(self ) -> int:
        return 2

    def columnCount(self) -> int:
        return 6

    def roleNames(self) -> Dict[int, QtCore.QByteArray]:
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
        if not index.isValid() or row >= self.rowCount() or col >= self.columnCount():
            return None
        data = self.commissData[row][col]
        if role == QtCore.Qt.UserRole + 1:
            return data[0]
        if role == QtCore.Qt.UserRole + 2:
            return data[1]
        if role == QtCore.Qt.UserRole + 3:
            return data[2]
        if role == QtCore.Qt.UserRole + 4:
            return data[3]
        if role == QtCore.Qt.UserRole + 5:
            return data[4]
        if role == QtCore.Qt.UserRole + 6:
            return data[5]
        if role == QtCore.Qt.UserRole + 7:
            return data[6]
        if role == QtCore.Qt.UserRole + 8:
            return data[7]
        if role == QtCore.Qt.UserRole + 9:
            return data[8]
        return None

    def setData(self, index, value, role) -> bool:
        row = index.row()
        col = index.column()
        if not index.isValid() or row >= self.rowCount() or col >= self.columnCount():
            return False
        if role == QtCore.Qt.UserRole + 2:  # a_CupID
            oldValue = self.commissData[row][col][1]
            self.commissData[row][col][1] = value
            return oldValue
        if role == QtCore.Qt.UserRole + 5:  # b_CupID
            oldValue = self.commissData[row][col][4]
            self.commissData[row][col][4] = value
            return oldValue
        if role == QtCore.Qt.UserRole + 3:  # a_productID
            oldValue = self.commissData[row][col][2]
            self.commissData[row][col][2] = value
            return oldValue
        if role == QtCore.Qt.UserRole + 6:  # b_productID
            oldValue = self.commissData[row][col][5]
            self.commissData[row][col][5] = value
            return oldValue
        if role == QtCore.Qt.UserRole + 4:  # a_Name
            oldValue = self.commissData[row][col][3]
            self.commissData[row][col][3] = value
            return oldValue
        if role == QtCore.Qt.UserRole + 7:  # b_Name
            oldValue = self.commissData[row][col][6]
            self.commissData[row][col][6] = value
            return oldValue
        return False



class BenchData:
    def __init__(self, row, col, isPallet, cupA, productA, cupB, productB):
        self.row = row
        self.col = col
        self.isPallet = isPallet
        self.cupA = cupA
        self.productA = productA
        self.cupB = cupB
        self.productB = productB


def extractComissData(comissDataPath=None):
    if comissDataPath == None:
        comissDataPath = constants.COMMISSDATA
    try:
        with open(comissDataPath) as FILE:
            list = FILE.readlines()
            #: extract Data from File. File has header and one empty row
            firstBench = list[2]
            firstBench = firstBench.strip().split(',')
            row = firstBench[0]
            productB = firstBench[-1]
            col = firstBench[1].strip().split(':')[0]
            isPallet = firstBench[1].strip().split(':')[1]
            cupA = firstBench[1].strip().split(':')[2]
            productA = firstBench[2].strip().split('|')[0]
            cupB = firstBench[2].strip().split('|')[1]
            firstData = BenchData(row, col, isPallet, cupA, productA, cupB, productB)
            secondBench = list[3]
            secondBench=secondBench.strip().split(",")
            row = secondBench[0]
            productB = secondBench[-1]
            col = secondBench[1].strip().split(':')[0]
            isPallet = secondBench[1].strip().split(":")[1]
            cupA = secondBench[1].strip().split(":")[2]
            productA = secondBench[2].strip().split("|")[0]
            cupB = secondBench[2].strip().split("|")[1]
            secondData = BenchData(row, col, isPallet, cupA, productA, cupB, productB)
            return [firstData, secondData]
    except FileExistsError:
        print(f"CommissData file {comissDataPath}doesn't exist")
        return None
    finally:
        FILE.close()


if __name__ == "__main__":

    workbench = Workbench(extractComissData())