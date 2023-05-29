Modules and Scripts
===================

This list contains all created Modules and scripts created for this software.

Main python file
----------------

    This file is the entrance file of the Application.
    it has no own classes but creates all necessary instances and starts GUI Application

.. literalinclude:: main.py
    :language: python

Constants
---------

    To make them accessible in every controller file. constants like file paths are saved in specific python file which can be included everywhere.

.. literalinclude:: src/constants/constants.py
    :language: python

Image Processing Application
----------------------------

    This is an embedded application which performs an automated inventory scan

.. automodule:: src.cameraApplication.cameraProcessing
    :members:

Controllers
-----------

    Controllers are part of implement MVC design pattern they pass modeldata to qml engine.

.. automodule:: src.controller.EventlogController
    :members:

.. automodule:: src.controller.InventoryController
    :members:

.. automodule:: src.controller.websocketController
    :members:

.. automodule:: src.controller.WorkbenchController
    :members:

.. automodule:: src.controller.MobileRobotController
    :members:

DataModels
----------

    These Datamodels stores data in proper format which can be passed to qml engine by controller class.

.. automodule:: src.model.InventoryModel
    :members:

.. automodule:: src.model.ProductListModel
    :members:

.. automodule:: src.model.ProductSummaryListModel
    :members:

.. automodule:: src.model.Workbench
    :members:

.. automodule:: src.model.MobileRobot
    :members:

OPC UA Client
-------------

    This file implements communication service between application and OPC UA server.

.. automodule:: src.opcua.opcuaClient
    :members:

Websocket Client
----------------

    This file implements communication service between application and TCP/IP

.. automodule:: src.websocket.websocketClient
    :members:

QML Files
=========

    QML Files are shown here as literal include. Sphinx doesnt handle qml language by default.
    Pleas note, that

qml.main.qml
------------

    The main QML-file creates the main application window and stores other QML files as childs.

.. literalinclude:: src/qml/main.qml
 :language: qml

qml.ABBRobot.qml
----------------
.. literalinclude:: src/qml/ABBRobot.qml
    :language: qml

qml.ABBRobotArmConfig.qml
-------------------------
.. literalinclude:: src/qml/ABBRobotArmConfig.qml
    :language: qml

qml.ABBRobotConfig.qml
----------------------
.. literalinclude:: src/qml/ABBRobotConfig.qml
    :language: qml

qml.EditDialog.qml
------------------
.. literalinclude:: src/qml/EditDialog.qml
    :language: qml

qml.Eventlogger.qml
-------------------
.. literalinclude:: src/qml/Eventlogger.qml
    :language: qml

qml.HeaderLine.qml
------------------
.. literalinclude:: src/qml/HeaderLine.qml
    :language: qml

qml.Inventory.qml
-----------------
.. literalinclude:: src/qml/Inventory.qml
    :language: qml

qml.ManualController.qml
------------------------
.. literalinclude:: src/qml/ManualController.qml
    :language: qml

qml.ManualEventLog.qml
----------------------
.. literalinclude:: src/qml/ManualEventLog.qml
    :language: qml

qml.ManualOrder.qml
-------------------
.. literalinclude:: src/qml/ManualOrder.qml
    :language: qml

qml.ManualRFIDServer.qml
------------------------
.. literalinclude:: src/qml/ManualRFIDServer.qml
    :language: qml

qml.ModBusConfig.qml
--------------------
.. literalinclude:: src/qml/ModBusConfig.qml
    :language: qml

qml.ProductSlot.qml
-------------------
.. literalinclude:: src/qml/ProductSlot.qml
    :language: qml

qml.SmallProductSlot.qml
------------------------
.. literalinclude:: src/qml/SmallProductSlot.qml
    :language: qml

qml.Storage.qml
---------------
.. literalinclude:: src/qml/Storage.qml
    :language: qml

qml.WorkbenchDialog.qml
-----------------------
.. literalinclude:: src/qml/WorkbenchDialog.qml
    :language: qml

src.cameraApplication.qml.CameraMain.qml
----------------------------------------
.. literalinclude:: src/cameraApplication/qml/CameraAppMain.qml
    :language: qml
