# Text Management {#gimp-text-management}

Text

Editing text

Text is managed with the Text tool. This tool creates a new layer
containing the text, above the current layer in the Layers dialog, with
the size of the text box. Its name is the beginning of the text.

<figure>
<p><img src="images/using/text-example.png"
alt="Example of a text item, showing the boundary of the text layer. (Font: Utopia Bold)" /></p>
<p><img src="images/using/text-example-2.png"
alt="The Layers dialog, with the text layer above the layer which was current." /></p>
<figcaption>Example of a text item</figcaption>
</figure>

Text can be edited directly on canvas. A text tool box, which shows up
on top of the canvas above the text box, allows you to quickly change
some of the text characteristics.

::: note
The settings you change in this on canvas dialog only apply to the parts
of the text that are selected, or any new text you type after the
current cursor position.
:::

![As soon as you click on the canvas with the Text tool, you get a
closed text box and a semi-transparent tool box just
above.](images/using/text-toolbar.png)

Text tool options are described in [???](#gimp-tool-text).

## Text Area

Text

Text Area

You can start typing text at once. The text box will enlarge gradually.
Press Enter to add a new line.

You can also **enlarge the text box** by click-and-dragging, as you do
with selections. The box size appears then in the [status
bar](#gimp-image-window-status-bar) at the bottom of the image:

![](images/toolbox/text-area-size.png)

To **edit text**, you must, first, select the part you want to edit by
click-and-drag, or [Shift+arrow keys]{.keycombo} and then use the
options of the [Text Toolbox](#gimp-text-toolbox).

Instead of using the on-canvas text editing, you can use the text editor
dialog described in [???](#gimp-text-editor-dialog).

You can **move the text** on the image using the Move tool: you must
click on a character, not on the background.

You can get Unicode characters with [ +Ctrl+Shift+U+ ]{.keycombo} plus
hexadecimal Unicode code of the desired char, for example:

<figure>
<p><img src="images/using/enter-unicode-char1.png"
alt=" +Ctrl+ +Shift+ +U+ " /></p>
<p><img src="images/using/enter-unicode-char2.png" alt=" +4+7+ " /></p>
<p><img src="images/using/enter-unicode-char3.png" alt="Enter" /></p>
<figcaption>Entering Unicode characters</figcaption>
</figure>

Of course this feature is more useful for entering special (even exotic)
characters, provided that the required glyphs for these characters are
supplied by the selected font --- only few fonts support Klingon. ;-)

![Unicode 0x47 ("G"), 0x2665, 0x0271,
0x03C0](images/using/enter-unicode-char4.png)

You can **edit the text later**, if the text layer still exists and has
not been modified by another tool (see below): make the text layer
active in the[Layer dialog](#gimp-layer-dialog), select the Text tool
and click on the text in the image window.

## Managing Text Layer

Text

Managing Text Layer

You can operate on a text layer in the same ways as any other layer, but
doing so often means giving up the ability to edit the text without
losing the results of your work.

To understand some of the idiosyncrasies of text handling, it may help
for you to realize that a text layer contains more information than the
pixel data that you see: it also contains a representation of the text
in a text-editor format. You can see this in the text-editor window that
pops up while you are using the Text tool. Every time you alter the
text, the image layer is redrawn to reflect your changes.

Now suppose you create a text layer, and then operate on it in some way
that does not involve the Text tool: rotate it, for example. Suppose you
then come back and try to edit it using the Text tool. As soon as you
edit the text, the Text tool will redraw the layer, wiping out the
results of the operations you performed in the meantime.

Because this danger is not obvious, the Text tool tries to protect you
from it. If you operate on a text layer, and then later try to edit the
text, a message pops up, warning you that your alterations will be
undone, and giving you three options:

-   edit the text anyway;

-   cancel;

-   create a new text layer with the same text as the existing layer,
    leaving the existing layer unchanged.

![Warning lose modifications](images/using/text-warning.png)

## Text Toolbox {#gimp-text-toolbox}

Text

Text Toolbox

![Text Toolbox](images/using/text-toolbar.png)

You get this box, which overlays canvas, as soon as you click on canvas
with the Text Tool. It allows you to edit text directly on canvas.

Apart from the usual text formatting features like font family, style
and size selectors you get numeric control over baseline offset and
kerning, as well as the ability to change text color for a selection.

-   **Change font of selected text**: as soon as you start editing the
    default font name, a drop-down list appears, allowing you to select
    a font.

-   **Change size of selected text**: self-explanatory.

-   **Bold, Italic, Underline, Strikethrough** : self-explanatory.

-   **Change baseline of selected text**: \"In European typography and
    penmanship, baseline is the line upon which most letters \"sit\" and
    below which descenders extend\" (Wikipedia). In HTML, there are
    several kinds of baselines (alphabetic, ideographic, bottom...).
    Here, consider that baseline is \"bottom\" and determines the place
    for descenders. The default baseline \"0\" gives place for
    descenders. You can use it to increase space between two lines only,
    while "Adjust line spacing" in tool options increases space between
    all lines.

    <figure>
    <img src="images/toolbox/text-default-baseline.png"
    alt="Default baseline marked with a red line." />
    <figcaption>Default Baseline</figcaption>
    </figure>

-   **Change kerning of selected text**: \"In typography, kerning... is
    the process of adjusting the spacing between characters in a
    proportional font.\" (Wikipedia). You will probably use this setting
    to adjust letter spacing of a selected part of text.

    Let us look at a selected text (zoomx800 to see pixels):

    <figure>
    <p><img src="images/toolbox/text-selected-example.png" /></p>
    <p><img src="images/toolbox/text-selected-dialog.png" /></p>
    <figcaption>Example of Selected Text</figcaption>
    </figure>

    We can see that the Sans font is a proportional font: letters widths
    are different, and "T" glyph comes over the "e". Letters widths are
    marked with thin vertical lines and left borders of letter width
    cover preceding letters by one pixel. Now we set "Change kerning of
    selected text" to 2 pixels:

    <figure>
    <p><img src="images/toolbox/text-kerning-example.png" /></p>
    <p><img src="images/toolbox/text-kerning-dialog.png" /></p>
    <figcaption>Example of Text Kerning</figcaption>
    </figure>

    Blank spaces, 2 pixels wide, are added between all selected
    characters and letter widths are preserved. If no text is selected,
    a blank space is added at the place of the mouse pointer between two
    characters.

    Here is a comparison with the Adjust letter spacing option of the
    [Text tool](#gimp-tool-text):

    <figure>
    <p><img src="images/toolbox/text-spacing-example.png" /></p>
    <p><img src="images/toolbox/text-selected-dialog.png" /></p>
    <figcaption>Example of Text Spacing</figcaption>
    </figure>

    The option applies to the whole text, not only to the selected text.
    Blank spaces are added inside letters widths and letter widths are
    not respected.

-   You can also use [Alt+arrow keys+ ]{.keycombo} to change baseline
    offset and kerning.

-   **Change color of selected text**: this command opens a color dialog
    where you choose a color for the selected text.

-   **Clear style of selected text**: using this command, you can get
    rid of all new settings you applied to the selected text.

## Text Context Menu

Text

Context Menu

The context menu can be brought up by right-clicking on text. It is
somewhat different from that of the Text Editor dialog.

The context menu offers the following options:

-   Cut, Copy, Paste, Delete: these commands work with selected text.
    Except for Paste, they are disabled as long as no text is selected.
    Paste is enabled when the clipboard contains text.

-   Open text file...: this command opens a file dialog where you can
    select a text file. The contents of this file will be opened in the
    current text layer.

-   Clear: this command deletes all the text, selected or not.

-   Text to Path: this command creates a path from the outlines of the
    current text. The result is not evident. You have to open the Paths
    dialog and make path visible. Then select the Path tool and click on
    the text. Every letter is now surrounded with a path component. So
    you can modify the shape of letters by moving path control points.

    This command is similar to [Layer \> Text to Path]{.menuchoice}.

    <figure>
    <img src="images/toolbox/text-to-path1.png" alt="Nothing appears." />
    <figcaption>Text to path applied</figcaption>
    </figure>

    <figure>
    <img src="images/toolbox/text-to-path2.png"
    alt="Path made visible in Path tab. Path appears as a red border around text." />
    <figcaption>Path made visible</figcaption>
    </figure>

    <figure>
    <img src="images/toolbox/text-to-path3.png"
    alt="Path tool activated; click on path." />
    <figcaption>Path tool activated</figcaption>
    </figure>

-   Text along path: []{.indexterm}

    This option is enabled only if a [path](#gimp-using-paths) exists.
    When your text is created, then create or import a path and make it
    active. If you create your path before the text, the path becomes
    invisible and you have to make it visible in the Paths dialog.

    The Text along path command is also available from the Layer menu in
    the main menu.

    The commands Discard Text Information, Text to Path, and Text along
    Path only appear in the Layer menu if a text layer is selected.

    Select the Text along Path option. The text is wrapped along the
    path. Letters are represented with their outline. Each of them is a
    component of the new path that appears in the [Paths
    dialog](#gimp-path-dialog).

    ::: note
    You can change the direction that the text is wrapped around the
    path by [reversing the stroke
    direction](#gimp-path-path-tool-reverse-stroke) when editing the
    path with the [Path Tool](#gimp-tool-path). In the same way you can
    change at which anchor [stroking
    starts](#gimp-path-path-tool-shift-start).
    :::

    <figure>
    <p><img src="images/toolbox/text-along-path.png" /></p>
    <p><img src="images/toolbox/text-path.png" /></p>
    <figcaption>“Text along Path” example</figcaption>
    </figure>

    By converting a text item to a selection or a path, you can fill it,
    stroke the outlines, transform it, or generally apply the whole
    panoply of GIMP tools to get interesting effects.

-   From left to right, From right to left, Vertical, right to left
    (mixed orientation), Vertical, right to left (upright orientation),
    Vertical, left to right (mixed orientation), Vertical, left to right
    (upright orientation): These commands let you adjust the writing
    direction of the text.
