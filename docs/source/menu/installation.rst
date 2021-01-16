Installation
============

Download the **"menu_system.yymps"** file from here. !!!
Open up your GameMaker project, and in the menubar click on **“Tools">”Import Local Package”**.

 .. image:: /images/menubar.png
    :scale: 60 %

Then select the **“menu_system.yymps”** file, and click **“Open”**.

 .. image:: /images/menu/open_yymps.png

Then this window pops up. Click on **“Add All”**, then **“Import"**.

 .. image:: /images/menu/import.png



:red:`Important!!!`

This system requires three other packages to work!

It requires:
 * Input System - For navigating menu and controls
 * Essentials - Useful scripts made by me
 * Json - For saving and loading

Do the same thing as above for for all of them.

And you will also have to put the :code:`oMenu` object into the fist room. Otherwise the system won't work!

And also make sure that :code:`oInputManager` is in the room and it gets created before the menu. 
You can change this in the **Instance Creation Order** menu found in **Properties** at the left of the **Room Editor**.