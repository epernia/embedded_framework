# FreeRTOS v10.3.1

Each real time kernel port consists of three files that contain the core kernel components and are common to every port, and one or more files that are
specific to a particular microcontroller and or compiler.

* This contains the three files that are common to every port - list.c, queue.c and tasks.c.  The kernel is contained within these three files.  croutine.c implements the optional co-routine functionality - which is normally only used on very memory limited systems.

* The **portable** directory contains the files that are specific to a particular microcontroller and or compiler.

* The **include** directory contains the real time kernel header files.

* All **lib.mk** files are not from the original FreeRTOS v10.3.1 repository, but for compilation purposes for this framework.



See the readme file in the **portable** directory for more information.