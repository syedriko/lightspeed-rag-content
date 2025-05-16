# Legacy Layer Modes {#gimp-concepts-layer-modes-legacy}

Layer

Modes

Legacy

Modes of layers

Legacy

Since GIMP 2.10 layer modes have changed. The old perceptual layer modes
are still available for backwards compatibility. They are called "legacy
layer modes". These legacy layer modes will be used when loading images
made before the introduction of the new, mostly linear, layer modes.

For more information on layer modes in general, see the default [Layer
Modes](#gimp-concepts-layer-modes).

<figure>
<img src="images/dialogs/layer-dialog.png"
alt="The Layers Dialog showing the  drop-down." />
<figcaption>Selecting legacy layer mode</figcaption>
</figure>

If you need to stay compatible with older GIMP versions or you need to
use the legacy layer modes for other reasons, select the
![](images/stock-icons/gimp-reset.svg) icon next to the Mode drop-down
and change the setting from Default to
![](images/stock-icons/gimp-wilber-eek.svg) Legacy mode. The Mode
drop-down will now only show legacy layer modes. All modes will have
(legacy) behind their name (the selected mode will use the short version
(l)).

<figure>
<p><img src="images/using/legacy-layer-mode-mask1.jpg"
alt="Mask 1" /></p>
<p><img src="images/using/legacy-layer-mode-mask2.jpg"
alt="Mask 2 (note: this image is not the actual mask used, but a screenshot of the mask with the checkerboard pattern showing the transparent parts in GIMP)" /></p>
<figcaption>Images (masks) used for the layer mode examples</figcaption>
</figure>

<figure>
<p><img src="images/using/keyfob_orig.png" alt="Key fob" /></p>
<p><img src="images/using/duck_orig.png" alt="Ducks" /></p>
<figcaption>Images (backgrounds) used for the layer mode
examples</figcaption>
</figure>

In the descriptions of the layer modes below, the equations are also
shown. This is for those who are curious about the mathematics of the
layer modes. You do not need to understand the equations in order to use
the layer modes.

The equations are in a shorthand notation. For example, the equation

means, "For each pixel in the upper (*M*ask) and lower (*I*mage) layer,
add each of the corresponding color components together to form the *E*
resulting pixel\'s color." Pixel color components must always be between
0 and 255.

::: note
Unless the description below says otherwise, a negative color component
is set to 0 and a color component larger than 255 is set to 255.
:::

The examples below show the effects of each of the legacy modes. Note
that for simplicity we will omit "(legacy)" when mentioning the layer
modes here.

Since the results of each mode vary greatly depending upon the colors on
the layers, these images can only give you a general idea of how the
modes work. You are encouraged to try them out yourself. You might start
with two similar layers, where one is a copy of the other, but slightly
modified (by being blurred, moved, rotated, scaled, color-inverted,
etc.) and seeing what happens with the layer modes.

Normal
:   Layer Modes
    Normal
    In this group, only "Normal" is normal.

    <figure>
    <p><img src="images/using/legacy-layer-mode-normal-50.jpg"
    alt="Both images are blended into each other with the same intensity." /></p>
    <p><img src="images/using/legacy-layer-mode-normal-100.jpg"
    alt="With 100% opacity only the upper layer is shown when blending with “Normal”." /></p>
    <figcaption>Example for layer mode “Normal”</figcaption>
    </figure>

    Normal mode is the default layer mode. The layer on top covers the
    layers below it. If you want to see anything below the top layer
    when you use this mode, the layer must have some transparent areas.

    The equation is:

Dissolve
:   Layer Modes
    Dissolve
    Dissolve
    <figure>
    <p><img src="images/using/legacy-layer-mode-dissolve-50.jpg"
    alt="Both images are blended into each other with the same intensity." /></p>
    <p><img src="images/using/legacy-layer-mode-dissolve-100.jpg"
    alt="With 100% opacity only the upper layer is shown when blending with “dissolve”." /></p>
    <figcaption>Example for layer mode “Dissolve”</figcaption>
    </figure>

    Dissolve mode dissolves the upper layer into the layer beneath it by
    drawing a random pattern of pixels in areas of partial transparency.
    It is useful as a layer mode, but it is also often useful as a
    painting mode.

    This is especially visible along the edges within an image. It is
    easiest to see in an enlarged screenshot. The image on the left
    illustrates "Normal" layer mode (enlarged) and the image on the
    right shows the same two layers in "Dissolve" mode, where it can be
    clearly seen how the pixels are dispersed.

    <figure>
    <p><img src="images/using/legacy-layer-mode-dissolve-nbig.jpg"
    alt="Normal mode." /></p>
    <p><img src="images/using/legacy-layer-mode-dissolve-dbig.jpg"
    alt="Dissolve mode." /></p>
    <figcaption>Enlarged screenshots</figcaption>
    </figure>

```{=html}
<!-- -->
```

Lighten only
:   Layer Modes
    Lighten only
    Lighten only
    <figure>
    <p><img src="images/using/legacy-layer-mode-lighten-only-mask1.jpg"
    alt="Mask 1 is used as upper layer with 100% opacity." /></p>
    <p><img src="images/using/legacy-layer-mode-lighten-only-mask2.jpg"
    alt="Mask 2 is used as upper layer with 100% opacity." /></p>
    <figcaption>Example for layer mode “Lighten only”</figcaption>
    </figure>

    Lighten only mode compares each component of each pixel in the upper
    layer with the corresponding one in the lower layer and uses the
    larger value in the resulting image. Completely black layers have no
    effect on the final image and completely white layers result in a
    white image.

    The equation is:

    The mode is commutative; the order of the two layers doesn\'t
    matter.

Screen
:   Layer Modes
    Screen
    Screen
    <figure>
    <p><img src="images/using/legacy-layer-mode-screen-mask1.jpg"
    alt="Mask 1 is used as upper layer with 100% opacity." /></p>
    <p><img src="images/using/legacy-layer-mode-screen-mask2.jpg"
    alt="Mask 2 is used as upper layer with 100% opacity." /></p>
    <figcaption>Example for layer mode “Screen”</figcaption>
    </figure>

    Screen mode inverts the values of each of the visible pixels in the
    two layers of the image. (That is, it subtracts each of them from
    255.) Then it multiplies them together, divides by 255 and inverts
    this value again. The resulting image is usually brighter, and
    sometimes "washed out" in appearance. The exceptions to this are a
    black layer, which does not change the other layer, and a white
    layer, which results in a white image. Darker colors in the image
    appear to be more transparent.

    The equation is:

    The mode is commutative; the order of the two layers doesn\'t
    matter.

Dodge
:   Layer Modes
    Dodge
    Dodge
    <figure>
    <p><img src="images/using/legacy-layer-mode-dodge-mask1.jpg"
    alt="Mask 1 is used as upper layer with 100% opacity." /></p>
    <p><img src="images/using/legacy-layer-mode-dodge-mask2.jpg"
    alt="Mask 2 is used as upper layer with 100% opacity." /></p>
    <figcaption>Example for layer mode “Dodge”</figcaption>
    </figure>

    Dodge mode multiplies the pixel value of the lower layer by 256,
    then divides that by the inverse of the pixel value of the top
    layer. The resulting image is usually lighter, but some colors may
    be inverted.

    In photography, dodging is a technique used in a darkroom to
    decrease the exposure in particular areas of the image. This brings
    out details in the shadows. When used for this purpose, dodge may
    work best on Grayscale images and with a painting tool, rather than
    as a layer mode.

    The equation is:

Addition
:   Layer Modes
    Addition
    Addition
    <figure>
    <p><img src="images/using/legacy-layer-mode-addition-mask1.jpg"
    alt="Mask 1 is used as upper layer with 100% opacity." /></p>
    <p><img src="images/using/legacy-layer-mode-addition-mask2.jpg"
    alt="Mask 2 is used as upper layer with 100% opacity." /></p>
    <figcaption>Example for layer mode “Addition”</figcaption>
    </figure>

    Addition mode is very simple. The pixel values of the upper and
    lower layers are added to each other. The resulting image is usually
    lighter. The equation can result in color values greater than 255,
    so some of the light colors may be set to the maximum value of 255.

    The equation is:

    The mode is commutative; the order of the two layers doesn\'t
    matter.

```{=html}
<!-- -->
```

Darken only
:   Layer Modes
    Darken only
    Darken only
    <figure>
    <p><img src="images/using/legacy-layer-mode-darken-only-mask1.jpg"
    alt="Mask 1 is used as upper layer with 100% opacity." /></p>
    <p><img src="images/using/legacy-layer-mode-darken-only-mask2.jpg"
    alt="Mask 2 is used as upper layer with 100% opacity." /></p>
    <figcaption>Example for layer mode “Darken only”</figcaption>
    </figure>

    Darken only mode compares each component of each pixel in the upper
    layer with the corresponding one in the lower layer and uses the
    smaller value in the resulting image. Completely white layers have
    no effect on the final image and completely black layers result in a
    black image.

    The equation is:

    The mode is commutative; the order of the two layers doesn\'t
    matter.

Multiply
:   Layer Modes
    Multiply
    Multiply
    <figure>
    <p><img src="images/using/legacy-layer-mode-multiply-mask1.jpg"
    alt="Mask 1 is used as upper layer with 100% opacity." /></p>
    <p><img src="images/using/legacy-layer-mode-multiply-mask2.jpg"
    alt="Mask 2 is used as upper layer with 100% opacity." /></p>
    <figcaption>Example for layer mode “Multiply”</figcaption>
    </figure>

    Multiply mode multiplies the pixel values of the upper layer with
    those of the layer below it and then divides the result by 255. The
    result is usually a darker image. If either layer is white, the
    resulting image is the same as the other layer (1 \* I = I). If
    either layer is black, the resulting image is completely black (0 \*
    I = 0).

    The equation is:

    The mode is commutative; the order of the two layers doesn\'t
    matter.

Burn
:   Layer Modes
    Burn
    Burn
    <figure>
    <p><img src="images/using/legacy-layer-mode-burn-mask1.jpg"
    alt="Mask 1 is used as upper layer with 100% opacity." /></p>
    <p><img src="images/using/legacy-layer-mode-burn-mask2.jpg"
    alt="Mask 2 is used as upper layer with 100% opacity." /></p>
    <figcaption>Example for layer mode “Burn”</figcaption>
    </figure>

    Burn mode inverts the pixel value of the lower layer, multiplies it
    by 256, divides that by one plus the pixel value of the upper layer,
    then inverts the result. It tends to make the image darker, somewhat
    similar to "Multiply" mode.

    In photography, burning is a technique used in a darkroom to
    increase the exposure in particular areas of the image. This brings
    out details in the highlights. When used for this purpose, burn may
    work best on Grayscale images and with a painting tool, rather than
    as a layer mode.

    The equation is:

```{=html}
<!-- -->
```

Overlay
:   Layer Modes
    Overlay
    Overlay
    <figure>
    <p><img src="images/using/legacy-layer-mode-overlay-mask1.jpg"
    alt="Mask 1 is used as upper layer with 100% opacity." /></p>
    <p><img src="images/using/legacy-layer-mode-overlay-mask2.jpg"
    alt="Mask 2 is used as upper layer with 100% opacity." /></p>
    <figcaption>Example for layer mode “Overlay”</figcaption>
    </figure>

    Overlay mode in theory inverts the pixel value of the lower layer,
    multiplies it by two times the pixel value of the upper layer, adds
    that to the original pixel value of the lower layer, divides by 255,
    and then multiplies by the pixel value of the original lower layer
    and divides by 255 again.

    Due to a bug [^1] the actual equation is equivalent to Soft light.
    This will not be fixed for the legacy layer mode. However, even if
    you explicitly use legacy layer mode, GIMP will still set the
    default Overlay layer mode. Images that have the legacy Overlay mode
    set for a layer, will have that changed to legacy Soft light, since
    that\'s what it effectively is.

Soft light
:   Layer Modes
    Soft light
    Soft light
    <figure>
    <p><img src="images/using/legacy-layer-mode-soft-light-mask1.jpg"
    alt="Mask 1 is used as upper layer with 100% opacity." /></p>
    <p><img src="images/using/legacy-layer-mode-soft-light-mask2.jpg"
    alt="Mask 2 is used as upper layer with 100% opacity." /></p>
    <figcaption>Example for layer mode “Soft light”</figcaption>
    </figure>

    Soft light is not related to "Hard light" in anything but the name,
    but it does tend to make the edges softer and the colors not so
    bright. It is similar to "Overlay" mode. In some versions of GIMP,
    "Overlay" mode and "Soft light" mode are identical.

    The equation is complicated. It needs Rs, the result of Screen mode:

Hard light
:   Layer Modes
    Hard light
    Hard light
    <figure>
    <p><img src="images/using/legacy-layer-mode-hard-light-mask1.jpg"
    alt="Mask 1 is used as upper layer with 100% opacity." /></p>
    <p><img src="images/using/legacy-layer-mode-hard-light-mask2.jpg"
    alt="Mask 2 is used as upper layer with 100% opacity." /></p>
    <figcaption>Example for layer mode “Hard light”</figcaption>
    </figure>

    Hard light mode is rather complicated because the equation consists
    of two parts, one for darker colors and one for brighter colors. If
    the pixel color of the upper layer is greater than 128, the layers
    are combined according to the first formula shown below. Otherwise,
    the pixel values of the upper and lower layers are multiplied
    together and multiplied by two, then divided by 256. You might use
    this mode to combine two photographs and obtain bright colors and
    sharp edges.

    The equation is complex and different according to the value \>128
    or \< 128:

```{=html}
<!-- -->
```

Difference
:   Layer Modes
    Difference
    Difference
    <figure>
    <p><img src="images/using/legacy-layer-mode-difference-mask1.jpg"
    alt="Mask 1 is used as upper layer with 100% opacity." /></p>
    <p><img src="images/using/legacy-layer-mode-difference-mask2.jpg"
    alt="Mask 2 is used as upper layer with 100% opacity." /></p>
    <figcaption>Example for layer mode “Difference”</figcaption>
    </figure>

    Difference mode subtracts the pixel value of the upper layer from
    that of the lower layer and then takes the absolute value of the
    result. No matter what the original two layers look like, the result
    looks rather odd. You can use it to invert elements of an image.

    The equation is:

    The mode is commutative; the order of the two layers doesn\'t
    matter.

Subtract
:   Layer Modes
    Subtract
    Subtract
    <figure>
    <p><img src="images/using/legacy-layer-mode-subtract-mask1.jpg"
    alt="Mask 1 is used as upper layer with 100% opacity." /></p>
    <p><img src="images/using/legacy-layer-mode-subtract-mask2.jpg"
    alt="Mask 2 is used as upper layer with 100% opacity." /></p>
    <figcaption>Example for layer mode “Subtract”</figcaption>
    </figure>

    Subtract mode subtracts the pixel values of the upper layer from the
    pixel values of the lower layer. The resulting image is normally
    darker. You might get a lot of black or near-black in the resulting
    image. The equation can result in negative color values, so some of
    the dark colors may be set to the minimum value of 0.

    The equation is:

Grain extract
:   Layer Modes
    Grain extract
    Grain extract
    <figure>
    <p><img src="images/using/legacy-layer-mode-grain-extract-mask1.jpg"
    alt="Mask 1 is used as upper layer with 100% opacity." /></p>
    <p><img src="images/using/legacy-layer-mode-grain-extract-mask2.jpg"
    alt="Mask 2 is used as upper layer with 100% opacity." /></p>
    <figcaption>Example for layer mode “Grain extract”</figcaption>
    </figure>

    Grain extract mode is supposed to extract the "film grain" from a
    layer to produce a new layer that is pure grain, but it can also be
    useful for giving images an embossed appearance. It subtracts the
    pixel value of the upper layer from that of the lower layer and adds
    128.

    The equation is:

Grain merge
:   Layer Modes
    Grain merge
    Grain merge
    <figure>
    <p><img src="images/using/legacy-layer-mode-grain-merge-mask1.jpg"
    alt="Mask 1 is used as upper layer with 100% opacity." /></p>
    <p><img src="images/using/legacy-layer-mode-grain-merge-mask2.jpg"
    alt="Mask 2 is used as upper layer with 100% opacity." /></p>
    <figcaption>Example for layer mode “Grain merge”</figcaption>
    </figure>

    Grain merge mode merges a grain layer (possibly one created from the
    "Grain extract" mode) into the current layer, leaving a grainy
    version of the original layer. It does just the opposite of "Grain
    extract". It adds the pixel values of the upper and lower layers
    together and subtracts 128.

    The equation is:

Divide
:   Layer Modes
    Divide
    Divide
    <figure>
    <p><img src="images/using/legacy-layer-mode-divide-mask1.jpg"
    alt="Mask 1 is used as upper layer with 100% opacity." /></p>
    <p><img src="images/using/legacy-layer-mode-divide-mask2.jpg"
    alt="Mask 2 is used as upper layer with 100% opacity." /></p>
    <figcaption>Example for layer mode “Divide”</figcaption>
    </figure>

    Divide mode multiplies each pixel value in the lower layer by 256
    and then divides that by the corresponding pixel value of the upper
    layer plus one. (Adding one to the denominator avoids dividing by
    zero.) The resulting image is often lighter, and sometimes looks
    "burned out".

    The equation is:

```{=html}
<!-- -->
```

HSV Hue
:   Layer Modes
    HSV Hue
    HSV Hue
    <figure>
    <p><img src="images/using/legacy-layer-mode-hue-mask1.jpg"
    alt="Mask 1 is used as upper layer with 100% opacity." /></p>
    <p><img src="images/using/legacy-layer-mode-hue-mask2.jpg"
    alt="Mask 2 is used as upper layer with 100% opacity." /></p>
    <figcaption>Example for layer mode “HSV Hue”</figcaption>
    </figure>

    HSV Hue mode uses the Hue of the upper layer and the Saturation and
    Value of the lower layer to form the resulting image. However, if
    the Saturation of the upper layer is zero, the Hue is taken from the
    lower layer, too.

HSV Saturation
:   Layer Modes
    HSV Saturation
    HSV Saturation
    <figure>
    <p><img src="images/using/legacy-layer-mode-saturation-mask1.jpg"
    alt="Mask 1 is used as upper layer with 100% opacity." /></p>
    <p><img src="images/using/legacy-layer-mode-saturation-mask2.jpg"
    alt="Mask 2 is used as upper layer with 100% opacity." /></p>
    <figcaption>Example for layer mode “HSV Saturation”</figcaption>
    </figure>

    HSV Saturation mode uses the Saturation of the upper layer and the
    Hue and Value of the lower layer to form the resulting image.

HSL Color
:   Layer Modes
    HSL Color
    HSL Color
    <figure>
    <p><img src="images/using/legacy-layer-mode-color-mask1.jpg"
    alt="Mask 1 is used as upper layer with 100% opacity." /></p>
    <p><img src="images/using/legacy-layer-mode-color-mask2.jpg"
    alt="Mask 2 is used as upper layer with 100% opacity." /></p>
    <figcaption>Example for layer mode “HSL Color”</figcaption>
    </figure>

    HSL Color mode uses the Hue and Saturation of the upper layer and
    the Lightness of the lower layer to form the resulting image.

HSV Value
:   Layer Modes
    HSV Value
    HSV Value
    <figure>
    <p><img src="images/using/legacy-layer-mode-value-mask1.jpg"
    alt="Mask 1 is used as upper layer with 100% opacity." /></p>
    <p><img src="images/using/legacy-layer-mode-value-mask2.jpg"
    alt="Mask 2 is used as upper layer with 100% opacity." /></p>
    <figcaption>Example for layer mode “HSV Value”</figcaption>
    </figure>

    HSV Value mode uses the Value of the upper layer and the Saturation
    and Hue of the lower layer to form the resulting image. You can use
    this mode to reveal details in dark and light areas of an image
    without changing the Saturation.

[^1]: See the old Bugzilla issue tracker: [issue
    #162395](https://bugzilla.gnome.org/show_bug.cgi?id=162395).
