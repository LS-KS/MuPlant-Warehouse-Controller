# This Python file uses the following encoding: utf-8
from PySide6 import QtCore
from PySide6.QtCore import Signal, Slot, QObject
from datetime import datetime

def createMessage(source, message):
    time = datetime.now()
    return f"[{time}] [{source}]: {message}"



class EventlogController (QObject):

    newSignal= Signal(str)

    @Slot(str, str)
    def writeEvent(self, source, message):
        #print("Eventcontroller: "+message)
        self.newSignal.emit( createMessage(source, message) )


#L1 - 18 a= vorne /b = hinten
#Englisch / Deutsch DeepL PLugin?
