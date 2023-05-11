# This Python file uses the following encoding: utf-8
from PySide6 import QtCore
from PySide6.QtCore import Signal, Slot, QObject


class EventlogController (QObject):

    newSignal= Signal(str)

    @Slot(str)
    def writeEvent(self, message):
        #print("Eventcontroller: "+message)
        self.newSignal.emit(message)


#L1 - 18 a= vorne /b = hinten
#Englisch / Deutsch Deep ML PLugin?
