 .. _is_features:

Features
========

Okay so why do you need an input system? 
If you ever wanted your player to move right with multiple inputs you did something like this:

 .. raw:: html

    <pre><code class="language-gml">
        var right = keyboard_check(vk_right) or keyboard_check(ord("D")) 
            or gamepad_button_check(0, gp_padr) or gamepad_axis_value(0, gp_axislh) > 0;
    </code></pre>

Thats pretty long isn’t it! Well with this input system you could do this:

 .. raw:: html

    <pre><code class="language-gml">
        var right = inputCheck([vk_right, "d", gp_padr, gp_axislr]);
    </code></pre>

Read more about the :code:`inputCheck()` function :ref:`here <inputcheck>`.

But we can go a step further with this system. Imagine that you want your player to do the following: 
move right and left, jump and shoot.
For that you could create a new InputSystem wich stores inputs in categories and checks them automatically for you.
Here is an example:

 .. raw:: html

    <pre><code class="language-gml">
        // Create event
        in_sys = new InputSystem({
            right:  [vk_right,  "d", gp_padr, gp_axislr],
            left:   [vk_left,   "a", gp_padl, gp_axisll],
            jump:   [vk_up,     "w", gp_a],
            shoot:  [vk_space,  gp_shoulderrb, gp_x]
        });

        // Step event
        var input = in_sys.check();

        if (input.right.down) x += 4;
        if (input.left.down) x -= 4;

        if (input.jump.pressed) y -= 10;

        if (input.shoot.down) shoot();
    </code></pre>

As you can see first you create a new InputSystem with the categories and inputs. 
Then you can call the InputSystem's check method which will check if any of the inputs are pressed.
After that you can get the inputs in two ways:
 * .down - Returns :code:`true` continuously if any of the inputs are currently held down
 * .pressed - Returns :code:`true` only at the moment when any of the inputs are pressed

Read more about the :code:`InputSystem()` :ref:`here <inputsystem>`.

The system contains a lot more useful stuff. Here is a list of what else it can do:
 * Getting the last gamepad input pressed similar to :code:`keyboard_key`
 * Getting the last input pressed from any type
 * Getting the type of any input
 * Turning an input into a string (good for drawing and debugging)
 * Drawing inputs with nice looking icons
 * Replacing :code:`ord(“X”)` with :code:`“x”`
 * Replacing :code:`gamepad_axis_value()` with new constants like :code:`gp_axislr`
 * Checking gamepad axis inputs as pressed
 * Saving and loading Input Systems in one line
 * More **vk** constants