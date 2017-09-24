module Accessibility.Role
    exposing
        ( alert
        , alertDialog
        , article
        , button
        , checkBox
        , columnHeader
        , comboBox
        , definition
        , dialog
        , directory
        , document
        , grid
        , gridCell
        , group
        , heading
        , img
        , link
        , list
        , listBox
        , listItem
        , log
        , marquee
        , math
        , menu
        , menuBar
        , menuItem
        , menuItemCheckBox
        , menuItemRadio
        , note
        , option
        , presentation
        , progressBar
        , radio
        , radioGroup
        , row
        , rowGroup
        , rowHeader
        , scrollBar
        , separator
        , slider
        , spinButton
        , status
        , tab
        , tabList
        , tabPanel
        , textBox
        , timer
        , toolBar
        , toolTip
        , tree
        , treeGrid
        , treeItem
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

@docs button, checkBox, option, radio, textBox


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

@docs presentation

-}

import Accessibility.Utils exposing (Role(..), role)
import Html
import Html.Attributes


{-| Set the role of a given element to be a given string.

    div [ custom "tablist" ] [ tab1, tab2 ]

-}
custom : String -> Html.Attribute Never
custom =
    Html.Attributes.attribute "role"


{-| Add `role="alert"` to the attributes of an element.
-}
alert : Html.Attribute Never
alert =
    role Alert


{-| Add `role="alertdialog"` to the attributes of an element.
-}
alertDialog : Html.Attribute Never
alertDialog =
    role Alertdialog


{-| Add `role="article"` to the attributes of an element.
-}
article : Html.Attribute Never
article =
    role Article


{-| Add `role="button"` to the attributes of an element.
-}
button : Html.Attribute Never
button =
    role Button


{-| Add `role="checkbox"` to the attributes of an element.
-}
checkBox : Html.Attribute Never
checkBox =
    role Checkbox


{-| Add `role="columnheader"` to the attributes of an element.
-}
columnHeader : Html.Attribute Never
columnHeader =
    role Columnheader


{-| Add `role="combobox"` to the attributes of an element.
-}
comboBox : Html.Attribute Never
comboBox =
    role Combobox


{-| Add `role="definition"` to the attributes of an element.
-}
definition : Html.Attribute Never
definition =
    role Definition


{-| Add `role="dialog"` to the attributes of an element.
-}
dialog : Html.Attribute Never
dialog =
    role Dialog


{-| Add `role="directory"` to the attributes of an element.
-}
directory : Html.Attribute Never
directory =
    role Directory


{-| Add `role="document"` to the attributes of an element.
-}
document : Html.Attribute Never
document =
    role Document


{-| Add `role="grid"` to the attributes of an element.
-}
grid : Html.Attribute Never
grid =
    role Grid


{-| Add `role="gridcell"` to the attributes of an element.
-}
gridCell : Html.Attribute Never
gridCell =
    role Gridcell


{-| Define a set of controls. (for a group of radio inputs, see radioGroup).
-}
group : Html.Attribute Never
group =
    role Group


{-| Prefer using `h1`, `h2`, `h3`, `h4`, `h5`, and `h6`.
Really this attribute should only be necessary if you need an `h7`-type heading.

    div [ heading, level 7 ] []

-}
heading : Html.Attribute Never
heading =
    role Heading


{-| Add `role="img"` to the attributes of an element.
-}
img : Html.Attribute Never
img =
    role Img


{-| Add `role="link"` to the attributes of an element.
-}
link : Html.Attribute Never
link =
    role Link


{-| Add `role="list"` to the attributes of an element.
-}
list : Html.Attribute Never
list =
    role List


{-| Add `role="listbox"` to the attributes of an element.
-}
listBox : Html.Attribute Never
listBox =
    role Listbox


{-| Add `role="listitem"` to the attributes of an element.
-}
listItem : Html.Attribute Never
listItem =
    role Listitem


{-| Add `role="log"` to the attributes of an element.
-}
log : Html.Attribute Never
log =
    role Log


{-| Add `role="marquee"` to the attributes of an element.
-}
marquee : Html.Attribute Never
marquee =
    role Marquee


{-| Add `role="math"` to the attributes of an element.
-}
math : Html.Attribute Never
math =
    role Math


{-| Add `role="menu"` to the attributes of an element.
-}
menu : Html.Attribute Never
menu =
    role Menu


{-| Add `role="menubar"` to the attributes of an element.
-}
menuBar : Html.Attribute Never
menuBar =
    role Menubar


{-| Add `role="menuitem"` to the attributes of an element.
-}
menuItem : Html.Attribute Never
menuItem =
    role Menuitem


{-| Add `role="menuitemcheckbox"` to the attributes of an element.
-}
menuItemCheckBox : Html.Attribute Never
menuItemCheckBox =
    role Menuitemcheckbox


{-| Add `role="menuitemradio"` to the attributes of an element.
-}
menuItemRadio : Html.Attribute Never
menuItemRadio =
    role Menuitemradio


{-| Add `role="note"` to the attributes of an element.
-}
note : Html.Attribute Never
note =
    role Note


{-| Add `role="option"` to the attributes of an element.
-}
option : Html.Attribute Never
option =
    role Option


{-| Sets role presentation.
-}
presentation : Html.Attribute Never
presentation =
    role Presentation


{-| Add `role="progressbar"` to the attributes of an element.
-}
progressBar : Html.Attribute Never
progressBar =
    role Progressbar


{-| Add `role="radio"` to the attributes of an element.
-}
radio : Html.Attribute Never
radio =
    role Radio


{-| Define a set of radio-controls.
-}
radioGroup : Html.Attribute Never
radioGroup =
    role Radiogroup


{-| Add `role="row"` to the attributes of an element.
-}
row : Html.Attribute Never
row =
    role Row


{-| Add `role="rowgroup"` to the attributes of an element.
-}
rowGroup : Html.Attribute Never
rowGroup =
    role Rowgroup


{-| Add `role="rowheader"` to the attributes of an element.
-}
rowHeader : Html.Attribute Never
rowHeader =
    role Rowheader


{-| Add `role="scrollbar"` to the attributes of an element.
-}
scrollBar : Html.Attribute Never
scrollBar =
    role Scrollbar


{-| Add `role="separator"` to the attributes of an element.
-}
separator : Html.Attribute Never
separator =
    role Separator


{-| Add `role="slider"` to the attributes of an element.
-}
slider : Html.Attribute Never
slider =
    role Slider


{-| Add `role="spinbutton"` to the attributes of an element.
-}
spinButton : Html.Attribute Never
spinButton =
    role Spinbutton


{-| Add `role="status"` to the attributes of an element.
-}
status : Html.Attribute Never
status =
    role Status


{-| Add `role="tab"` to the attributes of an element.
-}
tab : Html.Attribute Never
tab =
    role Tab


{-| Add `role="tablist"` to the attributes of an element.
-}
tabList : Html.Attribute Never
tabList =
    role Tablist


{-| Add `role="tabpanel"` to the attributes of an element.
-}
tabPanel : Html.Attribute Never
tabPanel =
    role Tabpanel


{-| Add `role="textbox"` to the attributes of an element.
-}
textBox : Html.Attribute Never
textBox =
    role Textbox


{-| Add `role="timer"` to the attributes of an element.
-}
timer : Html.Attribute Never
timer =
    role Timer


{-| Add `role="toolbar"` to the attributes of an element.
-}
toolBar : Html.Attribute Never
toolBar =
    role Toolbar


{-| Add `role="tooltip"` to the attributes of an element.
-}
toolTip : Html.Attribute Never
toolTip =
    role Tooltip


{-| Add `role="tree"` to the attributes of an element.
-}
tree : Html.Attribute Never
tree =
    role Tree


{-| Add `role="treegrid"` to the attributes of an element.
-}
treeGrid : Html.Attribute Never
treeGrid =
    role Treegrid


{-| Add `role="treeitem"` to the attributes of an element.
-}
treeItem : Html.Attribute Never
treeItem =
    role Treeitem
