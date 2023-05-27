.. muPlantPython documentation master file, created by
   sphinx-quickstart on Tue May 23 16:05:49 2023.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

Welcome to muPlant Warehouse Manager's documentation!
=====================================================

This Software is part of muPlant Project of University of Kassel.
It implements basic functions for WareHouse Management.

Communication Standards
=======================

- TCP/IP for communication with ABB Robot
- OPC UA with other muPlant stations
- RFID to communicate with turtle bots
- uEye Camera with openCV and arUco markers for automated storage detection

Learnings from earlier studies
========================================
Sebastian Hübler has published hie practical studies in 2019. He evaluated methods to detect cups
in muPlant storage by using two different cameras.
Regarding the detection with arUco markers he made some helpful analysis:

- low resolution leads to better detection results
- minimal/ maximal distance uEye tp marker: 17mm/ 745mm
- ambient light has significant influence
- auto focus maybe a big issue
- detection best works while robotic arm is without movement

Further thoughts:
-----------------
- if ambient light and other surcumstances are not good:

- reduce image size to criticl area only
- calibrate location of camera to maximize image size reduction
- better detection with custom filter which smoothes and increases contrast?
- other camera which has no autofocus


Getting started
---------------
This project uses a requirements.txt which can be used to set up the project running.

.. code-block:: bash

   pip install -r requirements.txt

Once the program is running the requirements.txt can be updated with following command

.. code-block:: bash

   pip freeze > requirements.txt



.. toctree::
   :maxdepth: 2
   :caption: Table of Contents

   readme
   modules
   search
   genindex


Contributions
-------------
* Qt Project