# Layer Groups {#gimp-layer-groups}

Layer groups

Pass Through

Layer

On-canvas layer selection

"Layer Groups" enable you to group layers together in a hierarchical
structure. This will make it easier to manage your project if you have
many layers.

![](images/dialogs/layer-group.png)

Create a Layer Group

:   You can create a layer group by clicking the New Layer Group button
    at the bottom of the [Layers Dialog](#gimp-layer-dialog), by using
    the menu command [Layer \> New Layer Group]{.menuchoice}, or through
    the Layers dialog context menu.

    This new empty layer group appears just above the current layer. It
    is recommended to give it a descriptive name. To change the layer
    group name, double-click the name, press F2, or right-click the
    layer and select `Edit Layer Attributes` from the context menu. If
    you don\'t rename your layer groups, you can get confused when
    several groups have been created with names such as Layer Group #1,
    Layer Group #2, etc.

    You can create multiple layer groups and you can **embed** them,
    that is include a layer group in another one.

Adding Layers to a Layer Group

:   You can add *existing layers* to a layer group by click-and-dragging
    them.

    ::: note
    The hand representing the mouse pointer must turn smaller before
    releasing the mouse button.

    A thin horizontal line marks where the layer will be inserted.
    :::

    To add a *new layer* to the current layer group, click the New
    Layer... button at the bottom of the Layers dialog, use the New
    Layer... command in the main menu, or press
    [Shift+Ctrl+N]{.keycombo}.

    When a layer group is not empty, a small icon
    ![](images/stock-icons/pan-end-symbolic.svg) appears. By clicking
    it, you can fold or unfold the group.

    ![](images/dialogs/layer-group-fold-unfold.png)

    Layers that belong to a layer group are slightly indented to the
    right, allowing you to easily see which layers are part of the
    group.

Visibility

:   If a layer group is made invisible using the eye icon but still open
    (so that the layers inside the group are shown in the list), there
    is a struck out eye shown besides the layers that are inside the
    group to indicate that these layers are not displayed in the final
    projection of the image, but theoretically visible in the layer
    group.

    ![](images/dialogs/layer-group-visibility.png)

Raise and Lower Layer Groups

:   You can raise and lower layer groups in the Layers dialog as you do
    with normal layers: click-and-dragging, and by using up arrow and
    down arrow keys at the bottom of the Layers dialog.

Duplicate a Layer Group

:   To duplicate a layer group, click the Create a duplicate of the
    layer button or right-click and select the `Duplicate Layers`
    command in the pop up context menu.

Move Layer Groups

:   You can **move a layer group to another image** by
    click-and-dragging. You can also copy-paste it using
    [Ctrl+C]{.keycombo} and [Ctrl+V]{.keycombo}: then, you get a
    floating selection that you must anchor (
    ![](images/stock-icons/gimp-anchor.svg) anchor button at the bottom
    of the [Layers Dialog](#gimp-layer-dialog)).

    You can also **move a layer group to the canvas**: this duplicates
    the group *in* the group. Select the layer group, select the [Move
    tool](#gimp-tool-move), then, in the image, move the layer. That\'s
    one way to multiply multi-layer objects in an image.

Delete Layer Groups

:   To delete one or more layer groups, click the ![Delete
    Layers](images/stock-icons/edit-delete.svg) icon button on the
    bottom of the Layers dialog, or drag and drop the selected layer
    groups on top of that button, or use the [Delete
    Layers](#gimp-layer-delete) command from the main menu or from the
    Layers dialog context menu.

Embed Layer Groups

:   When a layer group is activated, you can add another group inside it
    with the "Add New Layer Group" command. There seems to be no limit,
    except memory, to the number of embedded layer groups.

Layer Modes and Groups

:   A layer mode applied to a layer group acts on layers that are in
    this group only. A layer mode above a layer group acts on all layers
    underneath, outside and inside the layer groups.

    ![Original image](images/dialogs/layer-group-original.png)

    <figure>
    <p><img src="images/dialogs/layer-group-merge-in.png"
    alt="We added a white layer in the layer group with HSL Color mode: only the square and triangle turned gray." /></p>
    <p><img src="images/dialogs/layer-group-merge-out.png"
    alt="We added a white layer outside and above the layer group with HSL Color mode: all layers underneath changed to gray, including the background layer." /></p>
    <figcaption>Layer Mode in or out Layer Group</figcaption>
    </figure>

    Layer groups have a special layer mode: the Pass Through mode. This
    mode exists only if a layer group is active.

    When this mode is used instead of any other one, layers inside the
    layer group will behave as if they were a part of the layer stack,
    not belonging to the group. Layers within the group blend with
    layers below, inside and outside the group.

    While with Normal mode, layers within a group are treated as if they
    were a single layer, which is then blended with other layers below
    in the stack; a modifier on a layer inside the group blends layers
    below in the group only.

    More details about Pass Through in [???](#glossary-pass-through).

Opacity

:   When a layer group is activated, opacity changes are applied to all
    the layers of the group.

Layer Mask

:   Masks are also available on layer groups. They work similarly to
    ordinary [layer masks](#gimp-layer-mask), with the following
    considerations.

    The layer group's mask size is the same as the combined size of all
    its children at all times. When the group's size changes, the mask
    is cropped to the new size --- areas of the mask that fall outside
    of the new bounds are discarded, and newly added areas are filled
    with black (and hence are transparent by default).

    ![We added a black (transparent) layer mask to the layer group,
    making the layers inside the group transparent
    (invisible).](images/dialogs/layer-group-mask.png)

    Of course, you still can add a layer mask to a layer in the group to
    mask a part of the layer.

Finding a layer

:   When working with a lot of layers, finding a particular layer in the
    list can be difficult. To find the layer to which an image element
    belongs, use the *on-canvas layer selection* function via
    [Alt+Middle click+ ]{.keycombo} on the image element. The available
    layers will be looped through to show the new active layer and the
    layer name will be temporarily displayed in the status bar.

Layer preview

:   There have been problems with slow preview rendering of layer groups
    in case of many layers in a large image. If you are experiencing
    this, you can disable rendering layer group previews in [Edit \>
    Preferences \> Interface]{.menuchoice}.
