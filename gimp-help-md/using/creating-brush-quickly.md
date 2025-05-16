## Creating a brush quickly {#gimp-creating-brush-quickly}

There are two methods to create a new brush:

1.  First, the quick temporary method. You have an image area from which
    you want to make a brush, to be used with a tool like pencil,
    airbrush, etc. [Select it with the rectangular (or elliptical)
    select tool](#gimp-tool-select), then Copy this selection.
    Immediately you can see this copy in the first position of the
    [Brush Dialog](#gimp-brush-dialog), and its name is "Clipboard". It
    is immediately usable.

    This brush is temporary: it disappears when you close GIMP. You can
    make it permanent by clicking on the Duplicate this brush at the
    bottom of the brush panel.

    ![Selection becomes a brush after
    copying](images/using/select-to-brush.png)

2.  The second method is more elaborate.

    Select [File \> New...]{.menuchoice} from the main menu.

    Set Width and Height for example to 30 pixels.

    In the Advanced Options, set for example the Color space to
    Grayscale and set Fill with to White.

    Zoom on this new image to enlarge it and draw on it with a black
    pencil.

    Select [File \> Export As...]{.menuchoice} from the main menu.

    Export the image with a `.gbr` extension in the `brushes` directory
    located inside [your personal GIMP configuration
    folder](#gimp-concepts-setup).

    In the [Brush Dialog](#gimp-brush-dialog), click on the button
    Refresh brushes ![](images/stock-icons/view-refresh.svg) .

    Your brush appears among the other brushes. You can use it
    immediately, without restarting GIMP.

    <figure>
    <p><img src="images/using/create-brush1.png"
    alt="Draw image, save as brush" /></p>
    <p><img src="images/using/create-brush2.png"
    alt="Refresh brushes" /></p>
    <p><img src="images/using/create-brush3.png" alt="Use the brush" /></p>
    <figcaption>Steps to create a brush</figcaption>
    </figure>
