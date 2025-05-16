# Drawing Simple Objects {#gimp-using-simpleobjects}

Line

Drawing a straight line

Tutorials

Drawing a straight line

Rectangle

Drawing a rectangle

Tutorials

Drawing a rectangle

In this section, you will learn how to create simple objects in GIMP.

## Drawing a Straight Line {#gimp-using-line}

Let\'s begin by painting a straight line. The easiest way to create a
straight line is by using your favorite [brush tool](#gimp-tools-brush),
the mouse and the keyboard.

-   <figure id="gimp-using-straightline1">
    <img src="images/using/straightline1.png"
    alt="The dialog shows a new image, filled with a white background." />
    <figcaption>A new image</figcaption>
    </figure>

    Create a [new image](#gimp-file-new).

-   Select a [brush tool](#gimp-tools-brush) from the
    [Toolbox](#gimp-concepts-toolbox), for example the
    ![](images/stock-icons/gimp-tool-pencil.svg)
    [Pencil](#gimp-tool-pencil) tool or the
    ![](images/stock-icons/gimp-tool-paintbrush.svg)
    [Paintbrush](#gimp-tool-paintbrush) tool.

-   Select a [foreground color](#gimp-toolbox-color-area), but be sure
    that the foreground and background colors are different.

-   <figure id="gimp-using-straightline2">
    <img src="images/using/straightline2.png"
    alt="The dialog shows a new image, with the first dot which indicates the start of the straight line. The dot has a black foreground color. The size of this dot represents the current brush size, which you can change in the Brush Dialog." />
    <figcaption>The start of the straight line</figcaption>
    </figure>

    Create a starting point by clicking on the [image
    display](#imagewindow-display) area with the left mouse button. Your
    canvas should look similar to [A new
    image](#gimp-using-straightline1).

-   <figure id="gimp-using-straightline3">
    <img src="images/using/straightline3.png"
    alt="The screenshot shows the helpline, which indicates how the finished line will look." />
    <figcaption>The helpline</figcaption>
    </figure>

    Now, hold down the
    ![](images/stock-icons/keyboard-shift-symbolic.svg) Shift key on
    your keyboard and move the mouse away from the starting point you
    created. You\'ll see a thin line indicating how the line will look.

-   <figure id="gimp-using-straightline4">
    <img src="images/using/straightline4.png"
    alt="The line created appears in the image window after drawing the second point (or end point), while the Shift key is still pressed." />
    <figcaption>The line after the second click</figcaption>
    </figure>

    If you\'re satisfied with the direction and length of the line,
    click the left mouse button again to finish the line. The last step
    is to let go of the Shift key. GIMP displays a straight line now.

### Examples {#gimp-tutorial-straight-lines-examples}

<figure>
<p><img src="images/tutorials/straight-lines-example1.png"
alt="Set Dynamics to “Color From Gradient” and set Color Options to “Incandescent”. Under Fade Options, set Repeat to “Truncate”. Depending on the size of your underlying image, you might want to change the Fade length as well." /></p>
<p><img src="images/tutorials/straight-lines-example3.png"
alt="Select the Clone tool and set the source to “Maple Leaves” pattern." /></p>
<figcaption>Examples I</figcaption>
</figure>

<figure>
<p><img src="images/tutorials/straight-lines-example2.png"
alt="Use Filters &gt; Render &gt; Pattern &gt; Grid to create a grid. Use the Smudge Tool to draw a line with a slightly larger brush." /></p>
<p><img src="images/tutorials/straight-lines-example4.png"
alt="Use Filters &gt; Render &gt; Noise &gt; Plasma to create the cool plasma cloud. Use the Erase Tool with a square brush to draw a line." /></p>
<figcaption>Examples II</figcaption>
</figure>

<figure>
<img src="images/tutorials/straight-lines-example5.png"
alt="Use the rectangle select tool to select a rectangle, and then fill the selection with a light blue color. Select the Dodge/Burn tool. Set the type to Dodge and paint along the top and left side using an appropriately sized brush. Set the type to Burn and paint along the right and bottom." />
<figcaption>Example III</figcaption>
</figure>

## Creating a Basic Shape {#gimp-using-rectangular}

-   GIMP is not designed to be used for drawing.[^1] However, you may
    create shapes by either painting them using the technique described
    in [Drawing a Straight Line](#gimp-using-line) or by using the
    selection tools. Of course, there are various other ways to paint a
    shape, but we\'ll stick to the easiest ones here. So, create a [new
    image](#gimp-file-new) and check that the [foreground and background
    colors](#gimp-toolbox-color-area) are different.

-   <figure id="gimp-using-basicshape1">
    <img src="images/using/basicshape1.png"
    alt="The screenshot shows how a rectangular selection is created. Press and hold the left mouse button while you move the mouse in the direction of the red arrow." />
    <figcaption>Creating a rectangular selection</figcaption>
    </figure>

    Basic shapes like rectangles or ellipses, can be created using the
    [selection tools](#gimp-tools-selection). This tutorial uses a
    rectangular selection as an example. So, choose the [rectangular
    selection tool](#gimp-tool-rect-select) and create a new selection:
    press and hold the left mouse button while you move the mouse to
    another position in the image (illustrated in [Creating a
    rectangular selection](#gimp-using-basicshape1)). The selection is
    created when you release the mouse button. For more information
    about key modifiers see [selection tools](#gimp-tools-selection).

-   <figure id="gimp-using-basicshape2">
    <img src="images/using/basicshape2.png"
    alt="The screenshot shows a rectangular selection filled with the foreground color." />
    <figcaption>Rectangular selection filled with foreground
    color</figcaption>
    </figure>

    After creating the selection, you can either create a filled or an
    outlined shape with the foreground color of your choice. If you go
    for the first option, choose a [foreground
    color](#gimp-toolbox-color-area) and fill the selection with the
    [Bucket Fill](#gimp-tool-bucket-fill) tool. If you choose the latter
    option, create an outline by using the [Stroke
    Selection](#gimp-selection-stroke) menu item from the Edit menu. If
    you\'re satisfied with the result, [remove the
    selection](#gimp-selection-none).

[^1]: Try out e.g. [???](#bibliography-online-inkscape) for this
    purpose.
