# How to fix problems exporting images {#gimp-using-getting-unstuck-export}

## I am exporting to a jpeg image and my transparent area turned white or black {#gimp-stuck-export-jpeg-no-transparency}

When exporting images, you need to be aware that most image formats have
limitations. A limitation of jpeg images is, that it does not support
transparency. When exporting to jpeg, GIMP fills the transparent areas
with the background color, which by default is white.

To fix this, you will have to choose a different image format that does
support transparency, such as png or tiff.

## I am exporting to a gif image and the colors changed {#gimp-stuck-export-gif-colors-changed}

When exporting images, you need to be aware that most image formats have
limitations. A limitation of gif images is, that it supports a maximum
of 256 colors. For animated gif, this is 256 colors per frame; however,
GIMP does not support exporting each frame with a different set of 256
colors. When exporting to gif, GIMP reduces the number of colors in your
image to 256 by combining more or less similar colors together. This can
cause noticeable changes in your image.

To fix this, you will have to choose a different image format that does
support more colors; or convert your image to [Indexed
Mode](#gimp-image-convert-indexed) and manually adjust any colors before
exporting to gif.
