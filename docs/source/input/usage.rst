Usage
=====

 .. _inputcheck:

InputCheck()
------------

The core of this system is the :code:`inputCheck()` function. 
How this works is you can give it an input of any type (keyboard, gamepad, mouse), 
or an array of inputs, and if that one input or any of the inputs in the array are pressed it will return :code:`true`.

Read more about defining inputs :ref:`here <defining_inputs>`.

You can also supply the gamepad device to check. 
`Here is the manual for gamepads <https://docs2.yoyogames.com/source/_build/3_scripting/4_gml_reference/controls/gamepad%20input/index.html>`__.

So the syntax is:

 .. raw:: html

    <pre><code class="language-gml">
        inputCheck(input/array, pressed, gamepad_device);
    </code></pre>

The pressed parameter determins how the input is checked, 
if :code:`false` it is checked as down if :code:`true` it is checked as pressed. 
Read more about checking methods :ref:`here <checking_methods>`

So in most cases you only have to give one parameter to the function.


.. _InputSystem:

InputSystem()
-------------

The :code:`InputSystem()` allows you to organise your inputs into categories and check them all in one line.

To use it you will have to create one first. Most likely in a create event. The syntax is like this.

 .. raw:: html

    <pre><code class="language-gml">
        in_sys = new InputSystem({
            category_1: [input1, input2, input3...],
            category_2: [input1, input2, input3...],
            category_3: [input1, input2, input3...]
        });
    </code></pre>

And here is and example:

 .. raw:: html

    <pre><code class="language-gml">
        in_sys = new InputSystem({
            right:  [vk_right,  "d", gp_padr, gp_axislr],
            left:   [vk_left,   "a", gp_padl, gp_axisll],
            jump:   [vk_up,     "w", gp_a],
            shoot:  [vk_space,  gp_shoulderrb, gp_x]
        });
    </code></pre>

Read more about defining inputs :ref:`here <defining_inputs>`.

And then to check them do the following. Most likely in a step event.

 .. raw:: html

    <pre><code class="language-gml">
        in = in_sys.check();
    </code></pre>

Now the variable :code:`in` holds the result of the check. To get the input do :code:`in.category.checking_method`.
The **category** is one of the names you defined when you created the system (e.g. right).
The **checking method** can be either :code:`.down` or :code:`.pressed`. You can read more about the checking methods :ref:`here <checking_methods>`.

 .. _defining_inputs:

Defining inputs
---------------

This sytem uses different ways to define inputs than the default. Here is the list what you can use and what you cannot:

Keyboard
########

For letters through A-Z and for numbers 0-9:
 * :green:`Accepted`: string with the letter or the number, the case doesn't matters (e.g. "a", "1")
 * :red:`Not accepted`: :code:`ord(chr)` function

For other keys use the :code:`vk_` constants. `Here is a list of them <https://docs2.yoyogames.com/source/_build/3_scripting/4_gml_reference/controls/keyboard%20input/index.html>`__. 

Also the system has a few bounus **vk_** constants. :ref:`See the full list here <vk_constants>`.

Gamepad
#######

For gamepad buttons use the existing :code:`gp_` constants. `Here is a list of them <https://docs2.yoyogames.com/source/_build/3_scripting/4_gml_reference/controls/gamepad%20input/index.html>`__.
Also this system adds four new constants the :code:`gp_a`, :code:`gp_b`, :code:`gp_x` and :code:`gp_y`. You use these instead of the :code:`gp_face` constants.

For gamepad analog sticks the system adds eight new constants:
 * :code:`gp_axislr` - Left stick right
 * :code:`gp_axisll` - Left stick left
 * :code:`gp_axislu` - Left stick up
 * :code:`gp_axisld` - Left stick down
 * :code:`gp_axisrr` - Right stick right
 * :code:`gp_axisrl` - Right stick left
 * :code:`gp_axisru` - Right stick up
 * :code:`gp_axisrd` - Right stick down

:red:`You cannot use the`: :code:`gp_axislh`, :code:`gp_axislv`, :code:`gp_axisrh` and :code:`gp_axisrv` constants.

Mouse
#####

For mouse buttons simply use the existing :code:`mb_` constants. `Here is a list of them <https://docs2.yoyogames.com/source/_build/3_scripting/4_gml_reference/controls/mouse%20input/index.html>`__.

.. _checking_methods:

Checking methods
----------------

You can check inputs in two ways:
 * down - Returns :code:`true` continuously if the input is currently held down
 * pressed - Returns :code:`true` only at the moment when the input is pressed but not continuously

 .. _vk_constants:

Gamepads connected array
------------------------

This system has a :code:`global.gamepads_connected` array. Which makes handling gamepad connections/disconnections much easier.

What it does is if a gamepad connects it adds it to the first empty index in the array. And if one disconnects it removes it.

This is good because gamemaker indexes all connected gamepads with a number from :code:`0` to how many gamepads are connected.
But if you disconnect controller index :code:`0`, because you want to swap it for an other one, 
gamemaker will reindex all that comes after it so the index :code:`1` controller will be index :code:`0`, index :code:`2` will be :code:`1` etc.

So essentially now everyone controls a different player in the game.

So when you supply the **gamepad device nuber** to a function, and you don't want the controllers to change index when one disconnects,
use the :code:`global.gamepads_connected[0]` instead of just :code:`0`.

Bonus vk constants
------------------

Here is the list of the **vk** constants this systems adds:
 * :code:`vk_left_cmd` - Left command key (macOS only)
 * :code:`vk_right_cmd` - Right command key (macOS olny)
 * :code:`vk_semicolon` - Semicolon
 * :code:`vk_comma` - Comma
 * :code:`vk_dot` - Dot
 * :code:`vk_equal` - Equal sign
 * :code:`vk_slash` - Slash
 * :code:`vk_backslash` - Backslash
 * :code:`vk_singlequote` - Singlequote
 * :code:`vk_pilcrow` - Pilcrow
 * :code:`vk_backtick` - Backtick
 * :code:`vk_opening_square_bracket` - Opening square bracket
 * :code:`vk_closing_square_breacket` - Closing square bracket