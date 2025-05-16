# Image Types {#gimp-concepts-image-types}

Images

Types

It is tempting to think of an *image* as something that corresponds with
a single display window, or to a single file such as a
[JPEG](#file-jpeg-load) file. In reality, however, a GIMP image is a
complicated structure, containing a stack of layers plus several other
types of objects: a selection mask, a set of channels, a set of paths,
an \"undo\" history, etc. In this section we take a detailed look at the
components of a GIMP image, and the things that you can do with them.

The most basic property of an image is its *mode*. There are three
possible modes: RGB, grayscale, and indexed. RGB stands for
Red-Green-Blue, and indicates that each point in the image is
represented by a "red" level, a "green" level, and a "blue" level;
representing a full-color image. Each color channel has 256 possible
intensity levels. More details in [ Color Models](#glossary-colormodel)

In a grayscale image, each point is represented by a brightness value,
ranging from 0 (black) to 255 (white), with intermediate values
representing different levels of gray.

<figure>
<p><img src="images/glossary/color-model-additive.png"
alt="In the RGB Color Model, mixing Red, Green and Blue gives White, which is what happens on your screen." /></p>
<p><img src="images/glossary/color-model-subtractive.png"
alt="In the CMY(K) color model, mixing Cyan, Magenta and Yellow gives Black, which is what happens when you print on a white paper. The printer will actually use the black cartridge for economical reasons and better color rendering." /></p>
<figcaption>Components of the RGB and CMY Color Model</figcaption>
</figure>

Conceptually, the difference between a grayscale image and an RGB image
is the number of "color channels": a grayscale image has one; an RGB
image has three. An RGB image can be thought of as three superimposed
grayscale images, one colored red, one green, and one blue.

Actually, both RGB and grayscale images have one additional color
channel called the *alpha* channel, which represents opacity. When the
alpha value at a given location in a given layer is zero, the layer is
completely transparent (you can see through it), and the color at that
location is determined by what lies underneath. When alpha is maximal
(255), the layer is opaque (you cannot see through it), and the color is
determined by the color of the layer. Intermediate alpha values
correspond to varying degrees of transparency / opacity: the color at
the location is a proportional mixture of color from the layer and color
from underneath.

<figure>
<p><img src="images/using/wilber-channel-rgb.png"
alt="An image in RGB mode, with the channels corresponding to Red, Green and Blue." /></p>
<p><img src="images/using/wilber-channel-gray.png"
alt="An image in Grayscale mode, with the channel corresponding to Luminosity." /></p>
<figcaption>Example of an image in RGB and Grayscale mode</figcaption>
</figure>

In GIMP, in every color channel, including the alpha channel, possible
values have a range depending on the image precision: 0 to 255 for a
color depth of 8 bits. GIMP can load 16 and 32 bits images, and this
range can be much larger.

<figure>
<p><img src="images/dialogs/wilber-channels-red.png"
alt="Red channel" /></p>
<p><img src="images/dialogs/wilber-channels-green.png"
alt="Green channel" /></p>
<p><img src="images/dialogs/wilber-channels-blue.png"
alt="Blue channel" /></p>
<p><img src="images/dialogs/wilber-channels-alpha.png"
alt="The Alpha channel shows the image area which is transparent." /></p>
<p><img src="images/dialogs/wilber-channels-combined.png"
alt="A color image in RGB mode with an Alpha channel." /></p>
<figcaption>Example of an image with alpha channel</figcaption>
</figure>

The third type, *indexed* images, is a bit more complicated to
understand. In an indexed image, only a limited set of discrete colors
are used, usually 256 or less (so, this indexed mode can be applied only
to images with 8 bits precision). These colors form the "colormap" of
the image, and each point in the image is assigned a color from the
colormap. Indexed images have the advantage that they can be represented
inside a computer in a way which consumes relatively little memory. As
time goes on, they are used less and less, but they are still important
enough to be worth supporting in GIMP. (Also, there are a few important
kinds of image manipulation that are easier to implement with indexed
images than with continuous-color RGB images.)

Some very commonly used types of files (including [GIF](#file-gif-load)
and [PNG](#file-png-load)) produce indexed images when they are opened
in GIMP. Many of GIMP\'s tools don\'t work very well on indexed
images--and many filters don\'t work at all--because of the limited
number of colors available. Because of this, it is usually best to
convert an image to RGB mode before working on it. If necessary, you can
convert it back to indexed mode when you are ready to save it.

GIMP makes it easy to convert from one image type to another, using the
[Mode](#gimp-image-mode) command in the Image menu. Some types of
conversions, of course (RGB to grayscale or indexed, for example) lose
information that cannot be regained by converting back in the other
direction.

::: note
If you are trying to use a filter on an image, and the filter is
disabled in the menu, usually the cause is that the image (or, more
specifically, the layer) you are working on is the wrong type. Many
filters can\'t be used on indexed images. Some can be used only on RGB
images, or only on grayscale images. Some also require the presence or
absence of an alpha channel. Usually the fix is to convert the image to
a different type, most commonly RGB.
:::
