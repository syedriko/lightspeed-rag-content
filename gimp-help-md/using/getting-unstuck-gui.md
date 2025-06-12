# How to fix missing windows and dialogs {#gimp-using-getting-unstuck-gui}

## All tool windows are missing {#gimp-stuck-missing-tool-windows}

<figure>
<img src="images/using/empty-image-window.png"
alt="GIMP&#39;s main window with hidden tool dialogs using TAB." />
<figcaption>Tool dialogs are gone (use TAB)</figcaption>
</figure>

When you only see the image window and none of the tool windows, you
most likely hit TAB by accident. This is the default shortcut to show or
hide all docks.

To fix this just press TAB again. Alternatively you can use [Windows \>
Hide Docks]{.menuchoice} to toggle between show and hide.

::: note
Sometimes using TAB to hide the tool dialogs doesn\'t work. This happens
when the focus is inside the tool dialogs instead of in the image. To
remedy this, put the focus on the image, or use the menu command
mentioned above.
:::

## Tool options dialog is missing {#gimp-stuck-missing-tool-options}

<figure>
<img src="images/using/missing-tool-options.png"
alt="Restore missing tool options dialog using the Add Tab menu item." />
<figcaption>Restore missing tool options dialog</figcaption>
</figure>

The [Tool Options Dialog](#gimp-tool-options-dialog) can get closed by
accident. To get it back click on the [tab menu button](#tab-menus)
![](images/stock-icons/gimp-menu-left.svg) to open the menu.

From that menu choose Add Tab and then Tool Options.

You can also use [Windows \> Dockable Dialogs \> Tool
Options]{.menuchoice}. In this case, the dialog may turn up in a
different dock than the one you want. If that happens, grab the tab that
says Tool Options and drag it to where you need it.

::: note
To make sure that this or any other dialog doesn\'t get moved or closed
by accident, you can lock it to the dock it is in. To enable this, click
on the [tab menu button](#tab-menus)
![](images/stock-icons/gimp-menu-left.svg) on the top right of the dock.
This open a menu where you should choose Lock Tab to Dock (unless it is
already checked).
:::

## Some of the tool icons are missing {#gimp-stuck-missing-tool-icons}

Tools with a similar function are grouped together by default. To see
the other icons in a group move your mouse over an icon. Depending on a
preferences setting (see below) you can see the other icons in a group
by just hovering, or after clicking on the icon. The little triangle in
the bottom right corner of tool icons tells us that there are more icons
in this group.

The [Toolbox preferences](#gimp-prefs-toolbox) has an option to disable
grouping, but also to change the groups or make new ones.

## The area showing the opened images at the top is missing {#gimp-stuck-missing-image-toolbar}

*How to tell:* You are using [single-window mode](#single-window-mode)
and the tab bar at the top, that shows which images you have opened, is
missing.

*How to fix:* Go to menu [Windows \> Show Tabs]{.menuchoice} and make
sure that Show Tabs is checked.
