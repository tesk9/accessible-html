module Html.Attributes.A11y
    exposing
        ( invisible
        , controls
        , labelledBy
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
        , autoCompleteInline
        , autoCompleteList
        , autoCompleteBoth
        , checked
        , disabled
        , expanded
        , hasMenuPopUp
        , hasListBoxPopUp
        , hasTreePopUp
        , hasGridPopUp
        , hasDialogPopUp
        , hidden
        , invalid
        , invalidGrammar
        , invalidSpelling
        , label
        , level
        , multiLine
        , multiSelectable
        , orientationHorizontal
        , orientationVertical
        , pressed
        , readOnly
        , required
        , selected
        , sortAscending
        , sortDescending
        , sortCustom
        , sortNone
        , valueMax
        , valueMin
        , valueNow
        , valueText
        )

{-|
## Hiding content
@docs invisible

For more information on hiding/semi-hiding elements, please see [the a11y project.](http://a11yproject.com/posts/how-to-hide-content/)

## Aria
@docs controls, label, labelledBy, longDescription

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

## Widget States and Properties
(Some of these are also globally available:: `busy`, `disabled`, `grabbed`, `hidden`, `invalid`)

### Page Hierarchy
@docs level

### State

#### Inputs
@docs required

##### Button
@docs pressed

##### TextBox
@docs multiLine

##### Auto-complete behavior
@docs autoCompleteInline, autoCompleteList, autoCompleteBoth

See [the autocomplete spec](https://www.w3.org/TR/wai-aria-1.1/#aria-autocomplete).

##### Selection
@docs checked, selected, indeterminate

#### Validity
@docs invalid, invalidGrammar, invalidSpelling

### Interactability
@docs expanded, hidden, readOnly, disabled

### Pop-Ups
@docs hasMenuPopUp, hasListBoxPopUp, hasTreePopUp, hasGridPopUp, hasDialogPopUp

Pop-ups are supported for all elements (but not meant for use on tooltips).

The pop-up itself needs to have a containing element with one of these roles:
`menu`, `listbox`, `tree`, `grid`, or `dialog`, and the pop-up value must match.
That is, use `hasMenuPopUp` if the pop-up container has a role of `menu`.

See [the spec](https://www.w3.org/TR/wai-aria-1.1/#aria-haspopup).

### Orientation and Range Widgets
@docs orientationHorizontal, orientationVertical, valueMin, valueMax, valueNow, valueText

### Table Sort-by-column
@docs sortAscending, sortDescending, sortCustom, sortNone

### Misc
@docs multiSelectable

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



{- *** WIDGET ATTRIBUTES *** -}


{-| Available on `comboBox` or `textbox`.
Use when there's a suggestion for completing the field that shows up
in the line that the user is completing.

Be sure to indicate that the auto-completed text is selected.

-}
autoCompleteInline : Html.Attribute msg
autoCompleteInline =
    Widget.autoCompleteInline


{-| Available on `comboBox` or `textbox`.
Use when there's a suggestion for completing the field that shows up as a list
of options from which the user can pick.

Be sure to indicate that the auto-completed text is selected.

See [the autocomplete spec](https://www.w3.org/TR/wai-aria-1.1/#aria-autocomplete).
-}
autoCompleteList : Html.Attribute msg
autoCompleteList =
    Widget.autoCompleteList


{-| Available on `comboBox` or `textbox`.
Use when there's a suggestion for completing the field when there's both
inline autocomplete and list autocomplete occurring at once.

Be sure to indicate that the auto-completed text is selected.

See [the autocomplete spec](https://www.w3.org/TR/wai-aria-1.1/#aria-autocomplete).
-}
autoCompleteBoth : Html.Attribute msg
autoCompleteBoth =
    Widget.autoCompleteBoth


{-| Available on `checkbox`, `option`, `radio`, `switch`

Check boxes can be checked (`Just True`), unchecked (`Just False`), or indeterminate (`Nothing`).
Other elements won't support tri-state checkedness.

See [the checked spec](https://www.w3.org/TR/wai-aria-1.1/#aria-checked).
-}
checked : Maybe Bool -> Html.Attribute msg
checked =
    Widget.checked


{-| Supported for all elements. Elements are not disabled (are enabled) by default.
-}
disabled : Bool -> Html.Attribute msg
disabled =
    Widget.disabled


{-| Available on `button`, `comboBox`, `document`, `link`, `section`, `sectionHead`, and `window`.

Trickily, this attribute can be applied to either an element that is itself
expanded/collapsed, OR to an elment it controls that is either expanded/collapsed.
In the latter case, throw on a `controls` attribute as well to clarify the relationship.
-}
expanded : Bool -> Html.Attribute msg
expanded =
    Widget.expanded


{-| Indicate that interaction with this element can trigger a `menu` pop-up.

Be careful while managing focus and triggering.
-}
hasMenuPopUp : Html.Attribute msg
hasMenuPopUp =
    Widget.hasMenuPopUp


{-| Indicate that interaction with this element can trigger a `listBox` pop-up.

Be careful while managing focus and triggering.
-}
hasListBoxPopUp : Html.Attribute msg
hasListBoxPopUp =
    Widget.hasListBoxPopUp


{-| Indicate that interaction with this element can trigger a `tree` pop-up.

Be careful while managing focus and triggering.
-}
hasTreePopUp : Html.Attribute msg
hasTreePopUp =
    Widget.hasTreePopUp


{-| Indicate that interaction with this element can trigger a `grid` pop-up.

Be careful while managing focus and triggering.
-}
hasGridPopUp : Html.Attribute msg
hasGridPopUp =
    Widget.hasGridPopUp


{-| Indicate that interaction with this element can trigger a `dialog` pop-up.

Be careful while managing focus and triggering.
-}
hasDialogPopUp : Html.Attribute msg
hasDialogPopUp =
    Widget.hasDialogPopUp


{-|
-}
hidden : Bool -> Html.Attribute msg
hidden =
    Widget.hidden


{-| Supported for all elements.

For invalid grammar or spelling, please see `invalidGrammar` and `invalidSpelling` respectively.
-}
invalid : Bool -> Html.Attribute msg
invalid =
    Widget.invalid


{-| Supported for all elements.
-}
invalidGrammar : Html.Attribute msg
invalidGrammar =
    Widget.invalidGrammar


{-| Supported for all elements.
-}
invalidSpelling : Html.Attribute msg
invalidSpelling =
    Widget.invalidSpelling


{-| Supported for all elements.
-}
label : String -> Html.Attribute msg
label =
    Widget.label


{-| Supported for `grid`, `heading`, `listItem`, `row`, and `tabList`.

This attribute is about hierarchy--how many "levels" deep is an element?

    h7 attributes =
        div (heading :: level 7 :: attributes)

Please refer to the [documentation](https://www.w3.org/TR/wai-aria-1.1/#aria-level) to get a better sense of when to use.
-}
level : Int -> Html.Attribute msg
level =
    Widget.level


{-| Supported for `textbox` only.

Indicate whether the `textbox` is for multi-line inputs or single-line inputs.

TODO: should the role just be `textBoxSingleLine` and `textBoxMultiLine` instead?

Careful of Enter behavior on this one.
-}
multiLine : Bool -> Html.Attribute msg
multiLine =
    Widget.multiLine


{-| Supported on `grid`, `listBox`, `tabList`, `tree`. (However, what would it mean
for a `tabList`, say, to have multiple selectable descendants?)

When true, users are not restricted to selecting only one selectable descendant at a time.
-}
multiSelectable : Bool -> Html.Attribute msg
multiSelectable =
    Widget.multiSelectable


{-| Supported on roles with some sense of inherent orientation:
`progressBar`, `scrollbar`, `select`, `separator`, `slider`, `tabList`, `toolBar`

Careful: default behavior is inconsistent across those roles.

TODO: should the non-default behavior be explicit from the role perspective?
-}
orientationHorizontal : Html.Attribute msg
orientationHorizontal =
    Widget.orientationHorizontal


{-| Supported on roles with some sense of inherent orientation:
`progressBar`, `scrollbar`, `select`, `separator`, `slider`, `tabList`, `toolBar`

Careful: default behavior is inconsistent across those roles.

TODO: should the non-default behavior be explicit from the role perspective?
-}
orientationVertical : Html.Attribute msg
orientationVertical =
    Widget.orientationVertical


{-| Supported on `button`.

If you're confused about different button options, please check out these
[examples](https://www.w3.org/TR/2016/WD-wai-aria-practices-1.1-20160317/examples/button/button.html.

TODO: Move to be a button role option?
-}
pressed : Maybe Bool -> Html.Attribute msg
pressed =
    Widget.pressed


{-| Supported on `checkBox`, `comboBox`, `grid`, `gridCell`, `listBox`,
`radioGroup`, `slider`, `spinButton`, and `textBox`.

Indicates read-only status of a widget, although normal navigation rules and
copying behavior should apply. (Read: `readOnly` elements are navigable but
unchangeable, and `disabled` elements are neither navigable nor unchangebale).
-}
readOnly : Bool -> Html.Attribute msg
readOnly =
    Widget.readOnly


{-| Supported by `comboBox`, `gridCell`, `listBox`, `radioGroup`, `spinButton`, `textBox`, `tree`

Indicate whether user input is or is not required on a field for valid form submission.
-}
required : Bool -> Html.Attribute msg
required =
    Widget.required


{-| Supported by `gridCell`, `option`, `row`, `tab`.

Indicate whether an element (in a single- or multi-selectable widget) is or is not selected.
-}
selected : Bool -> Html.Attribute msg
selected =
    Widget.selected


{-| Supported by `columnHeader` and `rowHeader`, but only where those roles are
used on table or grid headers.

This should only be applied to one header at a time.

Table is sorted by this column's values in ascending order.
-}
sortAscending : Html.Attribute msg
sortAscending =
    Widget.sortAscending


{-| Supported by `columnHeader` and `rowHeader`, but only where those roles are
used on table or grid headers.

Only one column in a table should be sorting the values in table.

Table is sorted by this column's values in descending order.
-}
sortDescending : Html.Attribute msg
sortDescending =
    Widget.sortDescending


{-| Supported by `columnHeader` and `rowHeader`, but only where those roles are
used on table or grid headers.

Only one column in a table should be sorting the values in table.

Table is sorted by this column's values, but the algorithm for that sorting
is custom (not ascending or descending).
-}
sortCustom : Html.Attribute msg
sortCustom =
    Widget.sortCustom


{-| Supported by `columnHeader` and `rowHeader`, but only where those roles are
used on table or grid headers.

Table is not sorted by this column's values.
-}
sortNone : Html.Attribute msg
sortNone =
    Widget.sortNone


{-| Supported by `progressBar`, `scrollbar`, `separator`, `slider`, and `spinButton`.

Set the max allowed value for a range widget.
-}
valueMax : number -> Html.Attribute msg
valueMax =
    Widget.valueMax


{-| Supported by `progressBar`, `scrollbar`, `separator`, `slider`, and `spinButton`.

Set the min allowed value for a range widget.
-}
valueMin : number -> Html.Attribute msg
valueMin =
    Widget.valueMin


{-| Supported by `progressBar`, `scrollbar`, `separator`, `slider`, and `spinButton`.

Set the current value for a range widget. Don't use this property for indeterminate states.
-}
valueNow : number -> Html.Attribute msg
valueNow =
    Widget.valueNow


{-| Supported by `progressBar`, `scrollbar`, `separator`, `slider`, and `spinButton`.

This property takes precedence over `valueNow`, and should show a human-readable
version of the current value. However, `valueNow` should always be used.
-}
valueText : String -> Html.Attribute msg
valueText =
    Widget.valueText
