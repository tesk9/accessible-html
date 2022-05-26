module Accessibility.Role exposing
    ( article, comboBox, definition, directory, document, img, link, math, note
    , alertDialog, dialog
    , columnHeader, grid, gridCell, row, rowGroup, rowHeader
    , group, radioGroup
    , heading
    , button, checkBox, option, radio, switch, textBox
    , list, listBox, listItem
    , alert, log, marquee, timer, status
    , menu, menuBar, menuItem, menuItemCheckBox, menuItemRadio
    , progressBar, scrollBar, separator, slider, spinButton
    , tab, tabList, tabPanel
    , toolBar, toolTip
    , tree, treeGrid, treeItem
    , presentation, application
    )

{-|


### General

@docs article, comboBox, definition, directory, document, img, link, math, note


### Dialogs

@docs alertDialog, dialog


### Grids

@docs columnHeader, grid, gridCell, row, rowGroup, rowHeader


### Grouping

@docs group, radioGroup


### Heading

@docs heading


### Inputs

@docs button, checkBox, option, radio, switch, textBox


### Lists

@docs list, listBox, listItem


### Live Regions

@docs alert, log, marquee, timer, status


### Menus

@docs menu, menuBar, menuItem, menuItemCheckBox, menuItemRadio


### Range-y widgets

@docs progressBar, scrollBar, separator, slider, spinButton


### Tabs

@docs tab, tabList, tabPanel


### Tools

@docs toolBar, toolTip


### Trees

@docs tree, treeGrid, treeItem


## Other

@docs presentation, application

-}

import Accessibility.Utils exposing (Role(..), role)
import Html as Html
import Html.Attributes


{-| Set the role of a given element to be a given string.

    div [ custom "tablist" ] [ tab1, tab2 ]

-}
custom : String -> Html.Attribute msg
custom =
    Html.Attributes.attribute "role"


{-| Add [`role="alert"`](https://www.w3.org/TR/wai-aria-1.1/#alert) to the attributes of an element.
-}
alert : Html.Attribute msg
alert =
    role Alert


{-| Add [`role="alertdialog"`](https://www.w3.org/TR/wai-aria-1.1/#alertdialog) to the attributes of an element.
-}
alertDialog : Html.Attribute msg
alertDialog =
    role Alertdialog


{-| Add [`role="article"`](https://www.w3.org/TR/wai-aria-1.1/#article) to the attributes of an element.
-}
article : Html.Attribute msg
article =
    role Article


{-| Add [`role="button"`](https://www.w3.org/TR/wai-aria-1.1/#button) to the attributes of an element.
-}
button : Html.Attribute msg
button =
    role Button


{-| Add [`role="checkbox"`](https://www.w3.org/TR/wai-aria-1.1/#checkbox) to the attributes of an element.
-}
checkBox : Html.Attribute msg
checkBox =
    role Checkbox


{-| Add [`role="columnheader"`](https://www.w3.org/TR/wai-aria-1.1/#columnheader) to the attributes of an element.
-}
columnHeader : Html.Attribute msg
columnHeader =
    role Columnheader


{-| Add [`role="combobox"`](https://www.w3.org/TR/wai-aria-1.1/#combobox) to the attributes of an element.
-}
comboBox : Html.Attribute msg
comboBox =
    role Combobox


{-| Add [`role="definition"`](https://www.w3.org/TR/wai-aria-1.1/#definition) to the attributes of an element.
-}
definition : Html.Attribute msg
definition =
    role Definition


{-| Add [`role="dialog"`](https://www.w3.org/TR/wai-aria-1.1/#dialog) to the attributes of an element.
-}
dialog : Html.Attribute msg
dialog =
    role Dialog


{-| Add [`role="directory"`](https://www.w3.org/TR/wai-aria-1.1/#directory) to the attributes of an element.
-}
directory : Html.Attribute msg
directory =
    role Directory


{-| Add [`role="document"`](https://www.w3.org/TR/wai-aria-1.1/#document) to the attributes of an element.
-}
document : Html.Attribute msg
document =
    role Document


{-| Add [`role="grid"`](https://www.w3.org/TR/wai-aria-1.1/#grid) to the attributes of an element.
-}
grid : Html.Attribute msg
grid =
    role Grid


{-| Add [`role="gridcell"`](https://www.w3.org/TR/wai-aria-1.1/#gridcell) to the attributes of an element.
-}
gridCell : Html.Attribute msg
gridCell =
    role Gridcell


{-| Define a set of controls. (for a group of radio inputs, see radioGroup).
-}
group : Html.Attribute msg
group =
    role Group


{-| Prefer using `h1`, `h2`, `h3`, `h4`, `h5`, and `h6`.
Really this attribute should only be necessary if you need an `h7`-type heading.

    div [ heading, level 7 ] []

-}
heading : Html.Attribute msg
heading =
    role Heading


{-| Add [`role="img"`](https://www.w3.org/TR/wai-aria-1.1/#img) to the attributes of an element.
-}
img : Html.Attribute msg
img =
    role Img


{-| Add [`role="link"`](https://www.w3.org/TR/wai-aria-1.1/#link) to the attributes of an element.
-}
link : Html.Attribute msg
link =
    role Link


{-| Add [`role="list"`](https://www.w3.org/TR/wai-aria-1.1/#list) to the attributes of an element.
-}
list : Html.Attribute msg
list =
    role List


{-| Add [`role="listbox"`](https://www.w3.org/TR/wai-aria-1.1/#listbox) to the attributes of an element.
-}
listBox : Html.Attribute msg
listBox =
    role Listbox


{-| Add [`role="listitem"`](https://www.w3.org/TR/wai-aria-1.1/#listitem) to the attributes of an element.
-}
listItem : Html.Attribute msg
listItem =
    role Listitem


{-| Add [`role="log"`](https://www.w3.org/TR/wai-aria-1.1/#log) to the attributes of an element.
-}
log : Html.Attribute msg
log =
    role Log


{-| Add [`role="marquee"`](https://www.w3.org/TR/wai-aria-1.1/#marquee) to the attributes of an element.
-}
marquee : Html.Attribute msg
marquee =
    role Marquee


{-| Add [`role="math"`](https://www.w3.org/TR/wai-aria-1.1/#math) to the attributes of an element.
-}
math : Html.Attribute msg
math =
    role Math


{-| Add [`role="menu"`](https://www.w3.org/TR/wai-aria-1.1/#menu) to the attributes of an element.
-}
menu : Html.Attribute msg
menu =
    role Menu


{-| Add [`role="menubar"`](https://www.w3.org/TR/wai-aria-1.1/#menubar) to the attributes of an element.
-}
menuBar : Html.Attribute msg
menuBar =
    role Menubar


{-| Add [`role="menuitem"`](https://www.w3.org/TR/wai-aria-1.1/#menuitem) to the attributes of an element.
-}
menuItem : Html.Attribute msg
menuItem =
    role Menuitem


{-| Add [`role="menuitemcheckbox"`](https://www.w3.org/TR/wai-aria-1.1/#menuitemcheckbox) to the attributes of an element.
-}
menuItemCheckBox : Html.Attribute msg
menuItemCheckBox =
    role Menuitemcheckbox


{-| Add [`role="menuitemradio"`](https://www.w3.org/TR/wai-aria-1.1/#menuitemradio) to the attributes of an element.
-}
menuItemRadio : Html.Attribute msg
menuItemRadio =
    role Menuitemradio


{-| Add [`role="note"`](https://www.w3.org/TR/wai-aria-1.1/#note) to the attributes of an element.
-}
note : Html.Attribute msg
note =
    role Note


{-| Add [`role="option"`](https://www.w3.org/TR/wai-aria-1.1/#option) to the attributes of an element.
-}
option : Html.Attribute msg
option =
    role Option


{-| Sets role presentation.
-}
presentation : Html.Attribute msg
presentation =
    role Presentation


{-| Add [`role="progressbar"`](https://www.w3.org/TR/wai-aria-1.1/#progressbar) to the attributes of an element.
-}
progressBar : Html.Attribute msg
progressBar =
    role Progressbar


{-| Add [`role="radio"`](https://www.w3.org/TR/wai-aria-1.1/#radio) to the attributes of an element.
-}
radio : Html.Attribute msg
radio =
    role Radio


{-| Define a set of radio-controls.
-}
radioGroup : Html.Attribute msg
radioGroup =
    role Radiogroup


{-| Add [`role="row"`](https://www.w3.org/TR/wai-aria-1.1/#row) to the attributes of an element.
-}
row : Html.Attribute msg
row =
    role Row


{-| Add [`role="rowgroup"`](https://www.w3.org/TR/wai-aria-1.1/#rowgroup) to the attributes of an element.
-}
rowGroup : Html.Attribute msg
rowGroup =
    role Rowgroup


{-| Add [`role="rowheader"`](https://www.w3.org/TR/wai-aria-1.1/#rowheader) to the attributes of an element.
-}
rowHeader : Html.Attribute msg
rowHeader =
    role Rowheader


{-| Add [`role="scrollbar"`](https://www.w3.org/TR/wai-aria-1.1/#scrollbar) to the attributes of an element.
-}
scrollBar : Html.Attribute msg
scrollBar =
    role Scrollbar


{-| Add [`role="separator"`](https://www.w3.org/TR/wai-aria-1.1/#separator) to the attributes of an element.
-}
separator : Html.Attribute msg
separator =
    role Separator


{-| Add [`role="slider"`](https://www.w3.org/TR/wai-aria-1.1/#slider) to the attributes of an element.
-}
slider : Html.Attribute msg
slider =
    role Slider


{-| Add [`role="spinbutton"`](https://www.w3.org/TR/wai-aria-1.1/#spinbutton) to the attributes of an element.
-}
spinButton : Html.Attribute msg
spinButton =
    role Spinbutton


{-| Add [`role="status"`](https://www.w3.org/TR/wai-aria-1.1/#status) to the attributes of an element.
-}
status : Html.Attribute msg
status =
    role Status

{-| Add [`role="switch"`](https://www.w3.org/TR/wai-aria-1.1/#switch) to the attributes of an element.
-}
switch : Html.Attribute msg
switch =
    role Switch    


{-| Add [`role="tab"`](https://www.w3.org/TR/wai-aria-1.1/#tab) to the attributes of an element.
-}
tab : Html.Attribute msg
tab =
    role Tab


{-| Add [`role="tablist"`](https://www.w3.org/TR/wai-aria-1.1/#tablist) to the attributes of an element.
-}
tabList : Html.Attribute msg
tabList =
    role Tablist


{-| Add [`role="tabpanel"`](https://www.w3.org/TR/wai-aria-1.1/#tabpanel) to the attributes of an element.
-}
tabPanel : Html.Attribute msg
tabPanel =
    role Tabpanel


{-| Add [`role="textbox"`](https://www.w3.org/TR/wai-aria-1.1/#textbox) to the attributes of an element.
-}
textBox : Html.Attribute msg
textBox =
    role Textbox


{-| Add [`role="timer"`](https://www.w3.org/TR/wai-aria-1.1/#timer) to the attributes of an element.
-}
timer : Html.Attribute msg
timer =
    role Timer


{-| Add [`role="toolbar"`](https://www.w3.org/TR/wai-aria-1.1/#toolbar) to the attributes of an element.
-}
toolBar : Html.Attribute msg
toolBar =
    role Toolbar


{-| Add [`role="tooltip"`](https://www.w3.org/TR/wai-aria-1.1/#tooltip) to the attributes of an element.
-}
toolTip : Html.Attribute msg
toolTip =
    role Tooltip


{-| Add [`role="tree"`](https://www.w3.org/TR/wai-aria-1.1/#tree) to the attributes of an element.
-}
tree : Html.Attribute msg
tree =
    role Tree


{-| Add [`role="treegrid"`](https://www.w3.org/TR/wai-aria-1.1/#treegrid) to the attributes of an element.
-}
treeGrid : Html.Attribute msg
treeGrid =
    role Treegrid


{-| Add [`role="treeitem"`](https://www.w3.org/TR/wai-aria-1.1/#treeitem) to the attributes of an element.
-}
treeItem : Html.Attribute msg
treeItem =
    role Treeitem


{-| Creates a [`role="application"`](https://www.w3.org/TR/wai-aria-1.1/#application) attribute.

**Be very careful with this attribute!** Be sure you fully understand what you're doing before you use it.

-}
application : Html.Attribute msg
application =
    role Application
