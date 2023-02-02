module Accessibility.Role exposing
    ( article, comboBox, definition, directory, document, img, link, math, note, code, time
    , mark, suggestion, comment, insertion, deletion
    , emphasis, strong
    , subscript, superscript
    , alertDialog, dialog
    , columnHeader, grid, gridCell, row, rowGroup, rowHeader
    , group, radioGroup
    , heading
    , button, checkBox, option, radio, switch, textBox
    , list, listBox, listItem
    , alert, log, marquee, timer, status
    , menu, menuBar, menuItem, menuItemCheckBox, menuItemRadio
    , meter, progressBar, scrollBar, separator, slider, spinButton
    , tab, tabList, tabPanel
    , toolBar, toolTip
    , tree, treeGrid, treeItem
    , presentation, application
    )

{-|


### General

@docs article, comboBox, definition, directory, document, img, link, math, note, code, time


### Annotation

@docs mark, suggestion, comment, insertion, deletion
@docs emphasis, strong
@docs subscript, superscript


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

@docs meter, progressBar, scrollBar, separator, slider, spinButton


### Tabs

@docs tab, tabList, tabPanel


### Tools

@docs toolBar, toolTip


### Trees

@docs tree, treeGrid, treeItem


## Other

@docs presentation, application

-}

import Accessibility.Utils exposing (role)
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
    role "alert"


{-| Add [`role="alertdialog"`](https://www.w3.org/TR/wai-aria-1.1/#alertdialog) to the attributes of an element.
-}
alertDialog : Html.Attribute msg
alertDialog =
    role "alertdialog"


{-| Add [`role="article"`](https://www.w3.org/TR/wai-aria-1.1/#article) to the attributes of an element.
-}
article : Html.Attribute msg
article =
    role "article"


{-| Add [`role="button"`](https://www.w3.org/TR/wai-aria-1.1/#button) to the attributes of an element.
-}
button : Html.Attribute msg
button =
    role "button"


{-| Add [`role="checkbox"`](https://www.w3.org/TR/wai-aria-1.1/#checkbox) to the attributes of an element.
-}
checkBox : Html.Attribute msg
checkBox =
    role "checkbox"


{-| Add [`role="columnheader"`](https://www.w3.org/TR/wai-aria-1.1/#columnheader) to the attributes of an element.
-}
columnHeader : Html.Attribute msg
columnHeader =
    role "columnheader"


{-| Add [`role="combobox"`](https://www.w3.org/TR/wai-aria-1.1/#combobox) to the attributes of an element.
-}
comboBox : Html.Attribute msg
comboBox =
    role "combobox"


{-| Add [`role="definition"`](https://www.w3.org/TR/wai-aria-1.1/#definition) to the attributes of an element.
-}
definition : Html.Attribute msg
definition =
    role "definition"


{-| Add [`role="dialog"`](https://www.w3.org/TR/wai-aria-1.1/#dialog) to the attributes of an element.
-}
dialog : Html.Attribute msg
dialog =
    role "dialog"


{-| In ARIA 1.1, [`role="directory"`](https://www.w3.org/TR/wai-aria-1.1/#directory) described a list of references like a static table of contents.

ARIA 1.2 (which is still a Candidate Draft and not the official version) deprecates this role, and [recommends using a semantic list instead](https://www.w3.org/TR/wai-aria-1.2/#directory).

-}
directory : Html.Attribute msg
directory =
    role "directory"


{-| Add [`role="document"`](https://www.w3.org/TR/wai-aria-1.1/#document) to the attributes of an element.
-}
document : Html.Attribute msg
document =
    role "document"


{-| Add [`role="grid"`](https://www.w3.org/TR/wai-aria-1.1/#grid) to the attributes of an element.
-}
grid : Html.Attribute msg
grid =
    role "grid"


{-| Add [`role="gridcell"`](https://www.w3.org/TR/wai-aria-1.1/#gridcell) to the attributes of an element.
-}
gridCell : Html.Attribute msg
gridCell =
    role "gridcell"


{-| Define a set of controls. (for a group of radio inputs, see radioGroup).
-}
group : Html.Attribute msg
group =
    role "group"


{-| Prefer using `h1`, `h2`, `h3`, `h4`, `h5`, and `h6`.
Really this attribute should only be necessary if you need an `h7`-type heading.

    div [ heading, level 7 ] []

-}
heading : Html.Attribute msg
heading =
    role "heading"


{-| Add [`role="img"`](https://www.w3.org/TR/wai-aria-1.1/#img) to the attributes of an element.
-}
img : Html.Attribute msg
img =
    role "img"


{-| Add [`role="link"`](https://www.w3.org/TR/wai-aria-1.1/#link) to the attributes of an element.
-}
link : Html.Attribute msg
link =
    role "link"


{-| Add [`role="list"`](https://www.w3.org/TR/wai-aria-1.1/#list) to the attributes of an element.
-}
list : Html.Attribute msg
list =
    role "list"


{-| Add [`role="listbox"`](https://www.w3.org/TR/wai-aria-1.1/#listbox) to the attributes of an element.
-}
listBox : Html.Attribute msg
listBox =
    role "listbox"


{-| Add [`role="listitem"`](https://www.w3.org/TR/wai-aria-1.1/#listitem) to the attributes of an element.
-}
listItem : Html.Attribute msg
listItem =
    role "listitem"


{-| Add [`role="log"`](https://www.w3.org/TR/wai-aria-1.1/#log) to the attributes of an element.
-}
log : Html.Attribute msg
log =
    role "log"


{-| Add [`role="marquee"`](https://www.w3.org/TR/wai-aria-1.1/#marquee) to the attributes of an element.
-}
marquee : Html.Attribute msg
marquee =
    role "marquee"


{-| Add [`role="math"`](https://www.w3.org/TR/wai-aria-1.1/#math) to the attributes of an element.
-}
math : Html.Attribute msg
math =
    role "math"


{-| Add [`role="code"`](https://www.w3.org/TR/wai-aria-1.2/#code) to the attributes of an element.

Prefer using the semantic HTML element `code` instead of this role when possible.

Please note that this ARIA property is part of the Candidate Recommendation Draft for ARIA 1.2 -- it's not an official part of a published spec yet.

-}
code : Html.Attribute msg
code =
    role "code"


{-| Add [`role="time"`](https://www.w3.org/TR/wai-aria-1.2/#time) to the attributes of an element.

Prefer using the semantic HTML element `time` instead of this role when possible.

Please note that this ARIA property is part of the Candidate Recommendation Draft for ARIA 1.2 -- it's not an official part of a published spec yet.

-}
time : Html.Attribute msg
time =
    role "time"


{-| Add [`role="menu"`](https://www.w3.org/TR/wai-aria-1.1/#menu) to the attributes of an element.
-}
menu : Html.Attribute msg
menu =
    role "menu"


{-| Add [`role="menubar"`](https://www.w3.org/TR/wai-aria-1.1/#menubar) to the attributes of an element.
-}
menuBar : Html.Attribute msg
menuBar =
    role "menubar"


{-| Add [`role="menuitem"`](https://www.w3.org/TR/wai-aria-1.1/#menuitem) to the attributes of an element.
-}
menuItem : Html.Attribute msg
menuItem =
    role "menuitem"


{-| Add [`role="menuitemcheckbox"`](https://www.w3.org/TR/wai-aria-1.1/#menuitemcheckbox) to the attributes of an element.
-}
menuItemCheckBox : Html.Attribute msg
menuItemCheckBox =
    role "menuitemcheckbox"


{-| Add [`role="menuitemradio"`](https://www.w3.org/TR/wai-aria-1.1/#menuitemradio) to the attributes of an element.
-}
menuItemRadio : Html.Attribute msg
menuItemRadio =
    role "menuitemradio"


{-| Add [`role="note"`](https://www.w3.org/TR/wai-aria-1.1/#note) to the attributes of an element.
-}
note : Html.Attribute msg
note =
    role "note"


{-| Add [`role="mark"`](https://w3c.github.io/aria/#mark) to the attributes of an element.

Please note that `mark` is part of the Editor's Draft for ARIA 1.3 -- it's not an official part of a published spec yet.

Also, please be aware of the `mark` HTML element. Prefer using the HTML element whenever possible.

-}
mark : Html.Attribute msg
mark =
    role "mark"


{-| Add [`role="suggestion"`](https://w3c.github.io/aria/#suggestion) to the attributes of an element.

Please note that `suggestion` is part of the Editor's Draft for ARIA 1.3 -- it's not an official part of a published spec yet.

-}
suggestion : Html.Attribute msg
suggestion =
    role "suggestion"


{-| Add [`role="comment"`](https://w3c.github.io/aria/#comment) to the attributes of an element.

Please note that `comment` is part of the Editor's Draft for ARIA 1.3 -- it's not an official part of a published spec yet.

-}
comment : Html.Attribute msg
comment =
    role "comment"


{-| Add [`role="insertion"`](https://www.w3.org/TR/wai-aria-1.2/#insertion) to the attributes of an element.

Use this role on content that is being suggested for addition or for marking differences between versions of content.

Prefer using the semantic HTML element `ins` instead of this role when possible.

Please note that this ARIA property is part of the Candidate Recommendation Draft for ARIA 1.2 -- it's not an official part of a published spec yet.

-}
insertion : Html.Attribute msg
insertion =
    role "insertion"


{-| Add [`role="deletion"`](https://www.w3.org/TR/wai-aria-1.2/#deletion) to the attributes of an element.

Use this role on content that is being suggested for addition or for marking differences between versions of content.

Prefer using the semantic HTML element `del` instead of this role when possible.

Please note that this ARIA property is part of the Candidate Recommendation Draft for ARIA 1.2 -- it's not an official part of a published spec yet.

-}
deletion : Html.Attribute msg
deletion =
    role "deletion"


{-| Add [`role="subscript"`](https://www.w3.org/TR/wai-aria-1.2/#subscript) to the attributes of an element.

Prefer using the semantic HTML element `sub` instead of this role when possible.

Please note that this ARIA property is part of the Candidate Recommendation Draft for ARIA 1.2 -- it's not an official part of a published spec yet.

-}
subscript : Html.Attribute msg
subscript =
    role "subscript"


{-| Add [`role="superscript"`](https://www.w3.org/TR/wai-aria-1.2/#superscript) to the attributes of an element.

Prefer using the semantic HTML element `sub` instead of this role when possible.

Please note that this ARIA property is part of the Candidate Recommendation Draft for ARIA 1.2 -- it's not an official part of a published spec yet.

-}
superscript : Html.Attribute msg
superscript =
    role "superscript"


{-| Add [`role="strong"`](https://www.w3.org/TR/wai-aria-1.2/#strong) to the attributes of an element.

Prefer using the semantic HTML element `strong` instead of this role when possible.

Please note that this ARIA property is part of the Candidate Recommendation Draft for ARIA 1.2 -- it's not an official part of a published spec yet.

-}
strong : Html.Attribute msg
strong =
    role "strong"


{-| Add [`role="emphasis"`](https://www.w3.org/TR/wai-aria-1.2/#emphasis) to the attributes of an element.

Prefer using the semantic HTML element `em` instead of this role when possible.

Please note that this ARIA property is part of the Candidate Recommendation Draft for ARIA 1.2 -- it's not an official part of a published spec yet.

-}
emphasis : Html.Attribute msg
emphasis =
    role "emphasis"


{-| Add [`role="option"`](https://www.w3.org/TR/wai-aria-1.1/#option) to the attributes of an element.
-}
option : Html.Attribute msg
option =
    role "option"


{-| Sets role presentation.
-}
presentation : Html.Attribute msg
presentation =
    role "presentation"


{-| Add [`role="progressbar"`](https://www.w3.org/TR/wai-aria-1.1/#progressbar) to the attributes of an element.
-}
progressBar : Html.Attribute msg
progressBar =
    role "progressbar"


{-| Add [`role="meter"`](https://www.w3.org/TR/wai-aria-1.2/#meter) to the attributes of an element.

Please note that this ARIA property is part of the Candidate Recommendation Draft for ARIA 1.2 -- it's not an official part of a published spec yet.

-}
meter : Html.Attribute msg
meter =
    role "meter"


{-| Add [`role="radio"`](https://www.w3.org/TR/wai-aria-1.1/#radio) to the attributes of an element.
-}
radio : Html.Attribute msg
radio =
    role "radio"


{-| Define a set of radio-controls.
-}
radioGroup : Html.Attribute msg
radioGroup =
    role "radiogroup"


{-| Add [`role="row"`](https://www.w3.org/TR/wai-aria-1.1/#row) to the attributes of an element.
-}
row : Html.Attribute msg
row =
    role "row"


{-| Add [`role="rowgroup"`](https://www.w3.org/TR/wai-aria-1.1/#rowgroup) to the attributes of an element.
-}
rowGroup : Html.Attribute msg
rowGroup =
    role "rowgroup"


{-| Add [`role="rowheader"`](https://www.w3.org/TR/wai-aria-1.1/#rowheader) to the attributes of an element.
-}
rowHeader : Html.Attribute msg
rowHeader =
    role "rowheader"


{-| Add [`role="scrollbar"`](https://www.w3.org/TR/wai-aria-1.1/#scrollbar) to the attributes of an element.
-}
scrollBar : Html.Attribute msg
scrollBar =
    role "scrollbar"


{-| Add [`role="separator"`](https://www.w3.org/TR/wai-aria-1.1/#separator) to the attributes of an element.
-}
separator : Html.Attribute msg
separator =
    role "separator"


{-| Add [`role="slider"`](https://www.w3.org/TR/wai-aria-1.1/#slider) to the attributes of an element.
-}
slider : Html.Attribute msg
slider =
    role "slider"


{-| Add [`role="spinbutton"`](https://www.w3.org/TR/wai-aria-1.1/#spinbutton) to the attributes of an element.
-}
spinButton : Html.Attribute msg
spinButton =
    role "spinbutton"


{-| Add [`role="status"`](https://www.w3.org/TR/wai-aria-1.1/#status) to the attributes of an element.
-}
status : Html.Attribute msg
status =
    role "status"


{-| Add [`role="switch"`](https://www.w3.org/TR/wai-aria-1.1/#switch) to the attributes of an element.
-}
switch : Html.Attribute msg
switch =
    role "switch"


{-| Add [`role="tab"`](https://www.w3.org/TR/wai-aria-1.1/#tab) to the attributes of an element.
-}
tab : Html.Attribute msg
tab =
    role "tab"


{-| Add [`role="tablist"`](https://www.w3.org/TR/wai-aria-1.1/#tablist) to the attributes of an element.
-}
tabList : Html.Attribute msg
tabList =
    role "tablist"


{-| Add [`role="tabpanel"`](https://www.w3.org/TR/wai-aria-1.1/#tabpanel) to the attributes of an element.
-}
tabPanel : Html.Attribute msg
tabPanel =
    role "tabpanel"


{-| Add [`role="textbox"`](https://www.w3.org/TR/wai-aria-1.1/#textbox) to the attributes of an element.
-}
textBox : Html.Attribute msg
textBox =
    role "textbox"


{-| Add [`role="timer"`](https://www.w3.org/TR/wai-aria-1.1/#timer) to the attributes of an element.
-}
timer : Html.Attribute msg
timer =
    role "timer"


{-| Add [`role="toolbar"`](https://www.w3.org/TR/wai-aria-1.1/#toolbar) to the attributes of an element.
-}
toolBar : Html.Attribute msg
toolBar =
    role "toolbar"


{-| Add [`role="tooltip"`](https://www.w3.org/TR/wai-aria-1.1/#tooltip) to the attributes of an element.
-}
toolTip : Html.Attribute msg
toolTip =
    role "tooltip"


{-| Add [`role="tree"`](https://www.w3.org/TR/wai-aria-1.1/#tree) to the attributes of an element.
-}
tree : Html.Attribute msg
tree =
    role "tree"


{-| Add [`role="treegrid"`](https://www.w3.org/TR/wai-aria-1.1/#treegrid) to the attributes of an element.
-}
treeGrid : Html.Attribute msg
treeGrid =
    role "treegrid"


{-| Add [`role="treeitem"`](https://www.w3.org/TR/wai-aria-1.1/#treeitem) to the attributes of an element.
-}
treeItem : Html.Attribute msg
treeItem =
    role "treeitem"


{-| Creates a [`role="application"`](https://www.w3.org/TR/wai-aria-1.1/#application) attribute.

**Be very careful with this attribute!** Be sure you fully understand what you're doing before you use it.

-}
application : Html.Attribute msg
application =
    role "application"
