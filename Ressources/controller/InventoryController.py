

from PySide6.QtCore import QObject, Signal, Slot

class InventoryController(QObject):

    rowClicked = Signal(str)

    @Slot(str)
    def clickMe(self, message):
        print(message)
        self.rowClicked.emit(message)
