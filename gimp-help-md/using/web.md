# Preparing your Images for the Web {#gimp-using-web}

Web

Images for the web

One of the most common uses for GIMP, is to prepare images for web
sites. This means that images should look as nice as possible while
keeping the file size as small as possible. This step-by-step guide
demonstrates how to create small files with minimal loss of image
quality.

## Images with an Optimal Size/Quality Ratio {#gimp-using-web-size-vs-quality}

An optimal image for the web depends upon the image type and the file
format. Use [JPEG](#file-jpeg-export) for Photographs because they
usually have many colors and great detail. An image with fewer colors,
such as a button, icon, or screenshot, is better suited to the
[PNG](#file-png-load) format.

-   First, open the image as usual.

    ![Image of Wilber (the GIMP mascot) opened in RGBA
    mode](images/using/preparing_for_web1.png)

-   The image is now in RGB mode, with an additional [Alpha
    channel](#glossary-alpha) (RGBA). There is usually no need to have
    an alpha channel for your web image. You can remove the alpha
    channel by [flattening the image](#gimp-image-flatten).

    A photograph rarely has an alpha channel, so the image will open in
    RGB mode rather than RGBA mode; and you won\'t have to remove the
    alpha channel.

    ::: note
    If the image has a soft transition into the transparent areas, you
    should not remove the alpha channel, since the information used for
    the transition will not be saved in the file. To export an image
    with transparent areas that do not have a soft transition, (similar
    to [GIF](#file-gif-export)), remove the alpha channel.
    :::

-   After you have flattened the image, [export the
    image](#gimp-file-export) in the [PNG
    format](#file-png-export-defaults) for your web site.

    ::: note
    You can export your image in the PNG format with the default
    settings. Always using maximum compression when creating the image.
    Maximum compression has no effect on image quality or the time
    required to display the image, but it does take longer to export. A
    [JPEG](#file-jpeg-export) image, however, loses quality as the
    compression is increased. If your image is a photograph with lots of
    colors, you should use jpeg. The main thing is to find the best
    tradeoff between quality and compression. You can find more
    information about this topic in [???](#file-jpeg-export).
    :::

## Reducing the File Size Even More {#gimp-using-web-reducing-file-size}

If you want to reduce the size of your image a bit more, you could
convert your image to Indexed mode. That means that all of the colors
will be reduced to only 256 values. Do not convert images with smooth
color transitions or gradients to indexed mode, because the original
smooth gradients are typically converted into a series of bands. Indexed
mode is not recommended for photographs because after the conversion,
they typically look coarse and grainy.

<figure>
<img src="images/using/preparing_for_web2.png"
alt="An indexed image can look a bit grainy. The left image is Wilber in its original size, the right image is zoomed in by 300 percent." />
<figcaption>The indexed image</figcaption>
</figure>

-   Use the command described in [???](#gimp-image-mode) to convert an
    RGB image to indexed mode.

-   After you convert an image to indexed mode, you are once again able
    to [export](#gimp-file-export) the image in [PNG
    format](#file-png-export-defaults).

## Saving Images with Transparency {#gimp-using-web-transparency}

Transparency

Exporting images with transparency

There are two different approaches used by graphic file formats for
supporting transparent image areas: simple binary transparency and alpha
transparency. Simple binary transparency is supported in the
[GIF](#file-gif-export) format; one color from the indexed color palette
is marked as the transparent color. Alpha transparency is supported in
the [PNG](#file-png-export-defaults) format; the transparency
information is stored in a separate channel, the [Alpha
channel](#glossary-alpha).

::: note
The GIF format is rarely used because PNG supports all the features of
GIF with additional features (e.g., alpha transparency). Nevertheless,
GIF is still used for animations.
:::

-   First of all, we will use the same image as in the previous
    tutorials, Wilber the GIMP mascot.

    ![The Wilber image opened in RGBA
    mode](images/using/preparing_for_web1.png)

-   To export an image with alpha transparency, you must have an alpha
    channel. To check if the image has an alpha channel, go to the
    [Channels Dialog](#gimp-channel-dialog) and verify that an entry for
    "Alpha" exists, besides Red, Green and Blue. If this is not the
    case, [add a new alpha channel](#gimp-layer-alpha-add) from the
    layers menu; [Layer \> Transparency \> Add Alpha
    Channel]{.menuchoice}.

-   The original XCF file contains background layers that you can
    remove. GIMP comes with standard filters that supports creating
    gradients; look under [Filters \> Light and Shadow]{.menuchoice}.
    You are only limited by your imagination. To demonstrate the
    capabilities of alpha transparency, a soft glow in the background
    around Wilber is shown.

-   After you\'re done with your image, you can
    [export](#gimp-file-export) it in [PNG
    format](#file-png-export-defaults).

<figure>
<img src="images/using/preparing_for_web-alphatransparency.png"
alt="Mid-Tone Checks in the background layer represent the transparent region of the exported image while you are working on it in GIMP." />
<figcaption>The Wilber image with transparency</figcaption>
</figure>
