# Basic Concepts {#gimp-concepts-basic}

Concepts

<figure>
<img src="images/using/wilber.png"
alt="The Wilber Construction Kit ( src/images/Wilber_Construction_Kit_original.xcf) allows you to give GIMP&#39;s mascot named Wilber a different appearance. It is the work of Tuomas Kuosmanen (tigert)." />
<figcaption>Wilber, the GIMP mascot</figcaption>
</figure>

This section provides a brief introduction to the basic concepts and
terminology used in GIMP. The concepts presented here are explained in
much greater depth elsewhere. With a few exceptions, we have avoided
cluttering this section with a lot of links and cross-references:
everything mentioned here is so high-level that you can easily locate it
in the index.

Images

:   Images are the basic entities used by GIMP. Roughly speaking, an
    "image" corresponds to a single file, such as a TIFF or JPEG file.
    You can also think of an image as corresponding to a single display
    window (although in truth it is possible to have multiple windows
    all displaying the same image). It is not possible to have a single
    window display more than one image, though, or for an image to have
    no window displaying it.

    A GIMP image may be quite a complicated thing. Instead of thinking
    of it as a sheet of paper with a picture on it, think of it as more
    like a stack of sheets, called "layers". In addition to a stack of
    layers, a GIMP image may contain a selection mask, a set of
    channels, and a set of paths. In fact, GIMP provides a mechanism for
    attaching arbitrary pieces of data, called "parasites", to an image.

    In GIMP, it is possible to have many images open at the same time.
    Although large images may use many megabytes of memory, GIMP uses a
    sophisticated tile-based memory management system that allows GIMP
    to handle very large images gracefully. There are limits, however,
    and having more memory available may improve system performance.

Layers

:   If a simple image can be compared to a single sheet of paper, an
    image with layers is likened to a sheaf of transparent papers
    stacked one on top of the other. You can draw on each paper, but
    still see the content of the other sheets through the transparent
    areas. You can also move one sheet in relation to the others.
    Sophisticated GIMP users often deal with images containing many
    layers, even dozens of them. Layers need not be opaque, and they
    need not cover the entire extent of an image, so when you look at an
    image\'s display, you may see more than just the top layer: you may
    see elements of many layers. For more info see [Introduction to
    Layers](#gimp-concepts-layers).

Resolution []{.indexterm}

:   Digital images consist of a grid of square pixels. Each image has a
    size measured in two dimensions, such as 900 pixels wide by 600
    pixels high. But pixels don\'t have a set size in physical space. To
    set up an image for printing, we use a value called resolution,
    defined as the ratio between an image\'s size in pixels and its
    physical size (usually in inches) when it is printed on paper. Most
    file formats (but not all) can save this value, which is expressed
    as ppi---pixels per inch.

    When printing a file, the resolution determines the size the image
    will have on paper, and as a result, the physical size of the
    pixels. The same 900×600 pixel image may be printed as a small 3×2\"
    card with barely noticeable pixels---or as a large poster with
    large, chunky pixels.

    Images imported from cameras and mobile devices tend to have a
    resolution attached to the file. The resolution is usually 72 or 96
    ppi. It is important to realize that this resolution is arbitrary
    and was chosen for historic reasons. You can always change the
    resolution with GIMP---this has no effect on the actual image
    pixels. Furthermore, for uses such as displaying images online, on
    mobile devices, television or video games---in short, any use that
    is not print---the resolution value is meaningless and is ignored.
    Instead, the image is usually displayed so that each image pixel
    conforms to one screen pixel.

Channels []{.indexterm}

:   A Channel is a single component of a pixel\'s color. For a colored
    pixel in GIMP, these components are usually Red, Green, Blue and
    sometimes transparency (Alpha). For a
    [Grayscale](#glossary-graylevel) image, they are Gray and Alpha and
    for an [Indexed](#glossary-indexedcolors) color image, they are
    Indexed and Alpha.

    The entire rectangular array of any one of the color components for
    all of the pixels in an image is also referred to as a Channel. You
    can see these color channels with the [Channels
    Dialog](#gimp-channel-dialog).

    When the image is displayed, GIMP puts these components together to
    form the pixel colors for the screen, printer, or other output
    device. Some output devices may use different channels from Red,
    Green and Blue. If they do, GIMP\'s channels are converted into the
    appropriate ones for the device when the image is displayed.

    Channels can be useful when you are working on an image which needs
    adjustment in one particular color. For example, if you want to
    remove "red eye" from a photograph, you might work on the Red
    channel.

    You can look at channels as masks which allow or restrict the output
    of the color that the channel represents. By using Filters on the
    channel information, you can create many varied and subtle effects
    on an image. A simple example of using a Filter on the color
    channels is the [Channel Mixer](#gimp-filter-channel-mixer) filter.

    In addition to these channels, GIMP also allows you to create other
    channels (or more correctly, Channel Masks), which are displayed in
    the lower part of the Channels dialog. You can create a [New
    Channel](#gimp-channel-new) or save a [selection to a channel
    (mask)](#gimp-selection-to-channel). See the glossary entry on
    [Masks](#glossary-masks) for more information about Channel Masks.

Selections

:   Often when modifying an image, you only want a part of the image to
    be affected. The "selection" mechanism makes this possible. Each
    image has its own selection, which you normally see as a moving
    dashed line separating the selected parts from the unselected parts
    (the so-called ["marching ants"](#glossary-marching-ants)). Actually
    this is a bit misleading: selection in GIMP is graded, not
    all-or-nothing, and really the selection is represented by a
    full-fledged grayscale channel. The dashed line that you normally
    see is simply a contour line at the 50%-selected level. At any time,
    though, you can visualize the selection channel in all its glorious
    detail by toggling the [Quick
    Mask](#gimp-image-window-quick-mask-button) button.

    A large component of learning how to use GIMP effectively is
    acquiring the art of making good selections---selections that
    contain exactly what you need and nothing more. Because
    selection-handling is so centrally important, GIMP provides many
    tools for doing it: an assortment of selection-making tools, a menu
    of selection operations, and the ability to switch to Quick Mask
    mode, in which you can treat the selection channel as though it were
    a color channel, thereby "painting the selection". For more
    information, see also [The Selection](#gimp-concepts-selection).

Undoing

:   When you make mistakes, you can undo them. Nearly everything you can
    do to an image is undoable. In fact, you can usually undo a
    substantial number of the most recent things you did, if you decide
    that they were misguided. GIMP makes this possible by keeping a
    history of your actions. This history consumes memory, though, so
    undoability is not infinite. Some actions use very little undo
    memory, so that you can do dozens of them before the earliest ones
    are deleted from this history; other types of actions require
    massive amounts of undo memory.

    You can configure the amount of memory GIMP allows for the undo
    history of each image, but in any situation, you should always be
    able to undo at least your 2-3 most recent actions. The most
    important action that is not undoable is closing an image. For this
    reason, GIMP asks you to confirm that you really want to close the
    image if you have made any changes to it. For more information, see
    also [Undoing](#gimp-concepts-undo).

Plug-ins

:   A lot of the things that you do to an image in GIMP are done by GIMP
    itself. However, GIMP also makes extensive use of "plug-ins", which
    are external programs that interact very closely with GIMP, and are
    capable of manipulating images and other GIMP objects in very
    sophisticated ways. Many important plug-ins are bundled with GIMP,
    but there are also many available by other means. In fact, writing
    plug-ins (and scripts) is the easiest way for people not on the GIMP
    development team to add new capabilities to GIMP.

    All of the commands in the Filters menu, and a substantial number of
    commands in other menus, are actually implemented as plug-ins.

Scripts

:   In addition to plug-ins, GIMP can also make use of scripts. Scripts
    are written in a language called Script-Fu, which is unique to GIMP
    (for those who care, it is a dialect of the Lisp-like language
    called Scheme). In the past there was a clear distinction between
    scripts and plug-ins, but that is disappearing. Depending on which
    Script-Fu interpreter you use, Scheme scripts can also be installed
    as plug-ins.
