Usage
=====

Setup guide
-----------

This will guide you through the important steps to set up a fully functional menu.

Regions
#######

Open :code:`oMenu`'s create event, here is everything for configuring the menu. 

Here you'll see a lot of regions. All of them are marked either with a **(system)** or a **(user)** tag.
You only want to change the **(user)** tagged regions.

Every region is a settings for something.

Here is a list of the regions and what they do:
 * Audio settings       - Menu sound effects settings
 * Credits text         - Text for credits (if you have one)
 * Look settings        - The menu's look, visual settings
 * Animation settings   - Button animation settings
 * Scrolling settings   - Settings for scrolling (if you have a big menu page)
 * Pause settings       - Pause menu settings
 * Menu array           - The menu's structure (buttons and what they do)
 * Input setup          - Menu navigation settings  

Creating the menu array
#######################

First, you should create the menu array. Which defines how your menu is structured, what buttons are on which page and what do they do.

Go to the menu's **Menu array** region, here will be an empty array. This is where your buttons go.

That empty array is a page array which means that it stores buttons. Buttons are also arrays they consist of two elements:
 * Button name
 * Button function

Here is the list of button functions:
 * :code:`ScriptRunner` - Runs a script or a method
 * :code:`Slider`       - Changes a value in a range (usually used for volume settings)
 * :code:`Shift`        - Changes a value between a set of options (good for graphics, difficulty settings, etc.)
 * :code:`Toggle`       - Toggles a value on or off.
 * :code:`Controls`     - Creates a controls menu from an :ref:`InputSystem <InputSystem>`
 * :code:`Credits`      - Displays a scrolling credits screen

These are constructors so they should be created with the :code:`new` keyword in front of them.

Or if you want your button to switch to another menu page, the second element in the array should be another array that will also have buttons in it.

Here is a basic example:

 .. raw:: html

    <pre><code class="language-gml">
        menu = [
            ["Start",   new ScriptRunner(function() { room = rGame })],

            ["Settings", [
                ["Audio", [
                    ["Master",	new Slider([0, 1], 0.3,		"audio_master")],
                    ["Sounds",	new Slider([0, 1], 1,		"audio_sounds")],
                    ["Music",	new Slider([0, 1], 1,		"audio_music")]
                ]],
            
                ["Graphics", [
                    ["Quality",	    new Shift(["Low", "Medium", "High", "Ultra"], 2, "quality")],
                    ["Window Mode",	new Shift(["Windowed", "Fullscreen"], 1, "window_mode")],
                    ["Vsync",		new Toggle(0,		"vsync")]
                ]],

                ["Controls", new Controls(global.input_sys, "input_save.json", ["right", "left", "up", "down"])]
            ]],

            ["Credits", new Credits(credits_string)],

            ["Quit",    new ScriptRunner(game_end)]
        ];
    </code></pre>

Okay, this may look a bit confusing here is what it does:

The first button is the :code:`"Start"`, it runs a function which simply goes to another room.

After that comes :code:`"Settings"` which holds another menu page.
Inside the :code:`"Settings"` there are also two menu pages :code:`"Audio"` and :code:`"Graphics"`. These have a mix of **sliders**, **toggles**, and **shifts** in them.

Then comes the :code:`"Credits"` which displays the credits text defined in the **Credits text** region.

And at last :code:`"Quit"` which runs the built in function :code:`game_end()`.

Here are some tips:
 * The :code:`ScriptRunner` can call built-in functions as well.
 * When creating a :code:`Controls` menu it's good to make the input system :code:`global`, so the menu can access it easily.
 * :code:`Controls` generates a new menu page for it's self so you don't have to put it in an additional menu page.

 .. _menu_presets:

Creating menu presets
#####################

If you have a title menu you most likely want to have a pause menu as well. 
But obviously a pause menu should have different buttons in it than a title menu, for instance instead of a **start** button you might want a **resume** button.
Basically you can create alternatives of buttons for different situations.
So for that this system has **menu presets** which allows you to change what buttos do when the game is running.

To create a new preset for a button you simply add another name and button function to it.

You can have as many presets as you want.

So the start button before:

 .. raw:: html

    <pre><code class="language-gml">
        ["Start",   new ScriptRunner(function() { room = rGame }]
    </code></pre>

And the start button with an additional **Resume** preset:

 .. raw:: html

    <pre><code class="language-gml">
        ["Start",   new ScriptRunner(function() { room = rGame },
        "Resume",   new ScriptRunner(resumeGame)]
    </code></pre>

 .. warning::
    The second button is added to the end of an existing button array and it isn't in a separate array!


To change presets use the :code:`menuSetPreset()` function. Give it the preset number from :code:`0` to the :code:`number of presets - 1`.

I recommend using an enumerator for this purpose. There is one by default at the bottom of the **Menu array** region. Feel free to add your presets to it.

Here is an example for a **Title** and **Pause menu** preset:

 .. raw:: html

    <pre><code class="language-gml">
        enum e_menu_presets {
            title_screen,
            pause_menu
	    }
    </code></pre>

So then later you can call :code:`menuSetPreset()` like this:

 .. raw:: html

    <pre><code class="language-gml">
        menuSetPreset(e_menu_presets.pause_menu);
    </code></pre>

See more about pausing :ref:`here <pausing>`.

Changing the look
#################

To change the way your menu looks go into the **Look settings** region. 

Here you will see two structs:
 * :code:`look` - The look settings of the entire menu
 * :code:`item_look` - The look of individual items (e.g. sliders, toggles, shifts, etc.)

There are a bazillion options so I won't go through all of them but here are the imporant ones.

Start with the :code:`look` struct.

Here are are the three main settings.
 * :code:`txt` - Text font, size, outline etc.
 * :code:`col` - Color settings
 * :code:`pos` - Position of the menu and elements

In the text settings there is a **normal** and **small** text type. **Normal** is used most of the time, **small** is for input icons and disclaimer text at the bottom.

Set your own fonts for both if you don't like the default one.

 .. note::
    There are options marked with an **(A)** tag. These can be set to :code:`auto` (automatic). If so the system will predict an appropriate size for the item.
    If the systems prediction is wrong just try until you find a good-looking value for it.

Then go onto the :code:`col` struct. Here are two types **selected** and **unselected**. You have to set two colors each, one used most of the time and a more intense/dark color.
Set them to your liking.

Then in the :code:`pos` struct, you most likely want to change the :code:`menu_pos.y` because the menu is in the middle by default so it may cover the title of your game or something.

But in case someting isn't working how you want it. Here are the other things I didn't talk about:
 * If a specific menu element looks wrong find it in **Look settings** > :code:`item_look` struct
 * To change the menu's sounds go to **Audio settings**
 * To change the button animation or turn it off go to **Animation settings**
 * To change scrolling behaviour go to **Scrolling settings**
 * To change things about pausing go to **Pause settings**
 * To change buttons used to navigate the menu go to **Input setup**

And here are some tips if your font looks odd.

If you are using a pixelated font turn of anti-aliasing on it. And if it still doesn't look right try changing the size of the asset until it looks good, 
the nuber should be around the height of the font in pixels.

On the other hand you are using a non-pixelated font scaling will mess it up, so go into **look** > **txt** and set scale to :code:`1`. 
Now you will have to change the font assets size until it is properly sized, it takes some time but it's worth it.

 .. _pausing:

Pausing
#######

If have a game with a title menu you usally want to have a pause menu as well. 
For that the system offers a built in pause system wich will basically take a "photo" of the screen, deactivate every object, and than draw the "photo" on the screen.
This way it looks that the game is paused.

You can do this two ways:
 * Manually - by calling the :code:`pauseGame()` and :code:`resumeGame()` functions
 * Automatically - by calling the :code:`menuPauseEnable()`, and from then the menu will handle pausing

You also have to disable the menu when you enable pausing, because it would cover half of your game. But you want to reenable it when you go back to the title screen.

For this purpose I made two useful scripts.
 * :code:`menuModeTitle()` enables the menu and disables pausing, because you don't want the player to pause the game when it isn't started yet.
 * :code:`menuModePause()` disables the menu so that you can see the game, and enables pausing so that you can use the pause menu.

And also when you enable pausing you most likely want the menu to look a bit differently, for instance replacing a start button **start** with **resume**. 
If you haven't made any **menu presets** read about them :ref:`here <menu_presets>`.

Ok, so when you want to switch to pause mode call the :code:`menuModePause()` function and set your preset by calling :code:`menuSetPreset()`.
And when you want to set it back to title screen mode call :code:`menuModeTitle()` and set you preset back with :code:`menuSetPreset()`.

Here is an example of a **Start** button with a **Resume** preset.

 .. raw:: html

    <pre><code class="language-gml">
        ["Start", new ScriptRunner(function() { 
            menuModePause();
            menuSetPreset(e_menu_presets.pause_menu);
            room_goto(rGame);
        }),
        
        "Resume", new ScriptRunner(resumeGame)]
    </code></pre>

And here is an example of a **Quit** button with a **Back to title** preset.

 .. raw:: html

    <pre><code class="language-gml">
        ["Quit",		new ScriptRunner(game_end),

		"Title Screen", new ScriptRunner(function() { 
			menuModeTitle(); 
			menuSetPreset(e_menu_presets.title_screen);
			room = rTitle;
		})]
    </code></pre>

To change how the menu looks when the game is paused go to the **Pause settings** region in the create event.

The settings struct (getting values)
------------------------------------

After you have created your menu you want to get the values of settings somehow.

The values are stored in a struct called :code:`global.settings`. 
To get the value of an item write :code:`global.settings.save_key` where the :code:`save_key` is the string what you defined in the menu array when you created the item.

Here is how the different elements save their values:
 * :code:`Slider` - (type: real) The value will be in the range you defined when you created it
 * :code:`Shift` - (type: real) The value will range from :code:`0` to the :code:`number of options - 1`
 * :code:`Toggle` - (type: bool) Either :code:`true` or :code:`false`
 * :code:`Controls` - The controls changes the given input system directly it does not return anything

You can do anyting with these values in any object but there is a **Change actual values** region in the menu's step event for it.
Here you can change the window size, volume etc.

Here is a basic example:

 .. raw:: html

    <pre><code class="language-gml">
        audio_master_gain(global.settings.audio_master);
        if (global.settings.window_mode != window_get_fullscreen()) window_set_fullscreen(global.settings.window_mode);
    </code></pre>

Enabling/disabling the menu
---------------------------

To enable/disable the menu simply call the :code:`menuEnable()` function, with a :code:`true` or :code:`false` argument.