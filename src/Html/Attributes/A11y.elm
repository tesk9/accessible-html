module Html.Attributes.A11y
    exposing
        ( invisible
        , controls
        , labelledBy
        , selected
        , hidden
        , longDescription
        , indeterminate
        , banner
        , complementary
        , contentInfo
        , form
        , main_
        , navigation
        , search
        , application
        , region
        , group
        , radioGroup
        , heading
        , presentation
        , alert
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
        , progressBar
        , radio
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
## Hiding content
@docs invisible

For more information on hiding/semi-hiding elements, please see [the a11y project.](http://a11yproject.com/posts/how-to-hide-content/)

## Aria
@docs controls, labelledBy, longDescription, indeterminate

## Landmark
@docs banner, complementary, contentInfo, form, main_, navigation, search, application, region

[On page regions.](https://www.w3.org/TR/WCAG20-TECHS/ARIA11.html)

## Elements
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
@docs menu, menuBar, menuItem, menuItemCheckBox, menuItemRadio,

### Range-y widgets
@docs progressBar, scrollBar, separator, slider, spinButton

### Tabs
@docs tab, tabList, tabPanel

### Tools
@docs toolBar, toolTip,

### Trees
@docs tree, treeGrid, treeItem

## Other
@docs presentation

-}

import Attributes.Aria as Aria
import Attributes.Element as Element
import Attributes.Grouping as Grouping
import Attributes.Heading as Heading
import Attributes.Landmark as Landmark
import Attributes.Role exposing (..)
import Attributes.Widget as Widget
import Css
import Html
import Html.Attributes exposing (..)


{-| Makes content invisible without making it inaccessible.

    label [ invisible ] [ text "Screen readers can still read me!" ]
-}
invisible : Html.Attribute msg
invisible =
    style <|
        Css.asPairs
            [ Css.property "clip" "rect(1px, 1px, 1px, 1px)"
            , Css.position Css.absolute
            , Css.height (Css.px 1)
            , Css.width (Css.px 1)
            , Css.overflow Css.hidden
            , Css.margin (Css.px -1)
            , Css.padding Css.zero
            , Css.border Css.zero
            ]


{-| Creates aria controls attribute. Pass the unique string id of whatever is being controlled.
-}
controls : String -> Html.Attribute msg
controls =
    Aria.controls


{-| Creates aria labelledby attribute. Pass the unique string id of the labelling element.
-}
labelledBy : String -> Html.Attribute msg
labelledBy =
    Aria.labelledBy


{-| Creates aria selected attribute.
-}
selected : Bool -> Html.Attribute msg
selected =
    Widget.selected


{-| Creates aria hidden attribute.
-}
hidden : Bool -> Html.Attribute msg
hidden =
    Widget.hidden


{-| Creates the longDesc attribute with the given url, which should point to a text description of the content. This attribute is only supported on img tags.

    Html.A11y.img "Growth Chart in Some Sweet Unit (Quarter 4)" [ longDescription "/quarter_4_summary#Growth" ]
-}
longDescription : String -> Html.Attribute msg
longDescription =
    Aria.longDescription


{-| Sets the indeterminate value to be true.
-}
indeterminate : Html.Attribute msg
indeterminate =
    Aria.indeterminate


{-| This banner should have the page title in it.
-}
banner : Html.Attribute msg
banner =
    Landmark.banner


{-| "Complements" the main content.
-}
complementary : Html.Attribute msg
complementary =
    Landmark.complementary


{-| Copyrights, privacy statements, etc.
-}
contentInfo : Html.Attribute msg
contentInfo =
    Landmark.contentinfo


{-| A form container.
-}
form : Html.Attribute msg
form =
    Landmark.form


{-| Main content in a document. (There can only be one.)
-}
main_ : Html.Attribute msg
main_ =
    Landmark.main_


{-| Navigation.
-}
navigation : Html.Attribute msg
navigation =
    Landmark.navigation


{-| A search input.
-}
search : Html.Attribute msg
search =
    Landmark.search


{-| Declare a region as a web application.
Be careful with this one--see https://www.w3.org/TR/WCAG20-TECHS/ARIA11.html.
-}
application : Html.Attribute msg
application =
    Landmark.application


{-| Prefer the other Landmark options to `region`. Be sure to add a name when using this attribute!
-}
region : Html.Attribute msg
region =
    Landmark.region


{-| Define a set of controls. (for a group of radio inputs, see radioGroup).
-}
group : Html.Attribute msg
group =
    Grouping.group


{-| Define a set of radio-controls.
-}
radioGroup : Html.Attribute msg
radioGroup =
    Grouping.radiogroup


{-| Prefer using `h1`, `h2`, `h3`, `h4`, `h5`, and `h6`.
Really this attribute should only be necessary if you need an `h7`-type heading.

    div [ heading, level 7 ] []
-}
heading : Html.Attribute msg
heading =
    Heading.heading


{-| Add `role="alert"` to the attributes of an element.
-}
alert : Html.Attribute msg
alert =
    Element.alert


{-| Add `role="alertdialog"` to the attributes of an element.
-}
alertDialog : Html.Attribute msg
alertDialog =
    Element.alertdialog


{-| Add `role="article"` to the attributes of an element.
-}
article : Html.Attribute msg
article =
    Element.article


{-| Add `role="button"` to the attributes of an element.
-}
button : Html.Attribute msg
button =
    Element.button


{-| Add `role="checkbox"` to the attributes of an element.
-}
checkBox : Html.Attribute msg
checkBox =
    Element.checkbox


{-| Add `role="columnheader"` to the attributes of an element.
-}
columnHeader : Html.Attribute msg
columnHeader =
    Element.columnheader


{-| Add `role="combobox"` to the attributes of an element.
-}
comboBox : Html.Attribute msg
comboBox =
    Element.combobox


{-| Add `role="definition"` to the attributes of an element.
-}
definition : Html.Attribute msg
definition =
    Element.definition


{-| Add `role="dialog"` to the attributes of an element.
-}
dialog : Html.Attribute msg
dialog =
    Element.dialog


{-| Add `role="directory"` to the attributes of an element.
-}
directory : Html.Attribute msg
directory =
    Element.directory


{-| Add `role="document"` to the attributes of an element.
-}
document : Html.Attribute msg
document =
    Element.document


{-| Add `role="grid"` to the attributes of an element.
-}
grid : Html.Attribute msg
grid =
    Element.grid


{-| Add `role="gridcell"` to the attributes of an element.
-}
gridCell : Html.Attribute msg
gridCell =
    Element.gridcell


{-| Add `role="img"` to the attributes of an element.
-}
img : Html.Attribute msg
img =
    Element.img


{-| Add `role="link"` to the attributes of an element.
-}
link : Html.Attribute msg
link =
    Element.link


{-| Add `role="list"` to the attributes of an element.
-}
list : Html.Attribute msg
list =
    Element.list


{-| Add `role="listbox"` to the attributes of an element.
-}
listBox : Html.Attribute msg
listBox =
    Element.listbox


{-| Add `role="listitem"` to the attributes of an element.
-}
listItem : Html.Attribute msg
listItem =
    Element.listitem


{-| Add `role="log"` to the attributes of an element.
-}
log : Html.Attribute msg
log =
    Element.log


{-| Add `role="marquee"` to the attributes of an element.
-}
marquee : Html.Attribute msg
marquee =
    Element.marquee


{-| Add `role="math"` to the attributes of an element.
-}
math : Html.Attribute msg
math =
    Element.math


{-| Add `role="menu"` to the attributes of an element.
-}
menu : Html.Attribute msg
menu =
    Element.menu


{-| Add `role="menubar"` to the attributes of an element.
-}
menuBar : Html.Attribute msg
menuBar =
    Element.menubar


{-| Add `role="menuitem"` to the attributes of an element.
-}
menuItem : Html.Attribute msg
menuItem =
    Element.menuitem


{-| Add `role="menuitemcheckbox"` to the attributes of an element.
-}
menuItemCheckBox : Html.Attribute msg
menuItemCheckBox =
    Element.menuitemcheckbox


{-| Add `role="menuitemradio"` to the attributes of an element.
-}
menuItemRadio : Html.Attribute msg
menuItemRadio =
    Element.menuitemradio


{-| Add `role="note"` to the attributes of an element.
-}
note : Html.Attribute msg
note =
    Element.note


{-| Add `role="option"` to the attributes of an element.
-}
option : Html.Attribute msg
option =
    Element.option


{-| Add `role="progressbar"` to the attributes of an element.
-}
progressBar : Html.Attribute msg
progressBar =
    Element.progressbar


{-| Add `role="radio"` to the attributes of an element.
-}
radio : Html.Attribute msg
radio =
    Element.radio


{-| Add `role="row"` to the attributes of an element.
-}
row : Html.Attribute msg
row =
    Element.row


{-| Add `role="rowgroup"` to the attributes of an element.
-}
rowGroup : Html.Attribute msg
rowGroup =
    Element.rowgroup


{-| Add `role="rowheader"` to the attributes of an element.
-}
rowHeader : Html.Attribute msg
rowHeader =
    Element.rowheader


{-| Add `role="scrollbar"` to the attributes of an element.
-}
scrollBar : Html.Attribute msg
scrollBar =
    Element.scrollbar


{-| Add `role="separator"` to the attributes of an element.
-}
separator : Html.Attribute msg
separator =
    Element.separator


{-| Add `role="slider"` to the attributes of an element.
-}
slider : Html.Attribute msg
slider =
    Element.slider


{-| Add `role="spinbutton"` to the attributes of an element.
-}
spinButton : Html.Attribute msg
spinButton =
    Element.spinbutton


{-| Add `role="status"` to the attributes of an element.
-}
status : Html.Attribute msg
status =
    Element.status


{-| Add `role="tab"` to the attributes of an element.
-}
tab : Html.Attribute msg
tab =
    Element.tab


{-| Add `role="tablist"` to the attributes of an element.
-}
tabList : Html.Attribute msg
tabList =
    Element.tablist


{-| Add `role="tabpanel"` to the attributes of an element.
-}
tabPanel : Html.Attribute msg
tabPanel =
    Element.tabpanel


{-| Add `role="textbox"` to the attributes of an element.
-}
textBox : Html.Attribute msg
textBox =
    Element.textbox


{-| Add `role="timer"` to the attributes of an element.
-}
timer : Html.Attribute msg
timer =
    Element.timer


{-| Add `role="toolbar"` to the attributes of an element.
-}
toolBar : Html.Attribute msg
toolBar =
    Element.toolbar


{-| Add `role="tooltip"` to the attributes of an element.
-}
toolTip : Html.Attribute msg
toolTip =
    Element.tooltip


{-| Add `role="tree"` to the attributes of an element.
-}
tree : Html.Attribute msg
tree =
    Element.tree


{-| Add `role="treegrid"` to the attributes of an element.
-}
treeGrid : Html.Attribute msg
treeGrid =
    Element.treegrid


{-| Add `role="treeitem"` to the attributes of an element.
-}
treeItem : Html.Attribute msg
treeItem =
    Element.treeitem


{-| Sets role presentation.
-}
presentation : Html.Attribute msg
presentation =
    role Presentation
