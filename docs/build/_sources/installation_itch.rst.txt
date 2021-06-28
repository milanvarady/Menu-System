Itch io
=======

Open up your GameMaker project, and in the menubar click on **“Tools">”Import Local Package”**.

 .. image:: /images/menubar.png
    :scale: 60 %

Then select the **“menu_and_input_system.yymps”** file, and click **“Open”**.

 .. image:: /images/open_yymps.png

Then this window pops up. Click on **“Add All”**, then **“Import"**.

 .. image:: /images/import.png

And you will also have to put the :code:`oMenu` and the :code:`oInputManager` object into the first room. Otherwise the system won't work!

And also make sure that :code:`oInputManager` is in the room and it gets created before the menu. 
You can change this in the **Instance Creation Order** menu found in **Properties** at the left of the **Room Editor**.

.. image:: /images/creation_order.png
   :scale: 40 %