module Accessibility.Aria
    exposing
        ( activeDescendant
        , colCount
        , colIndex
        , colSpan
        , controls
        , currentDate
        , currentItem
        , currentLocation
        , currentPage
        , currentStep
        , currentTime
        , describedBy
        , details
        , errorMessage
        , flowTo
        , keyShortcuts
        , labeledBy
        , labelledBy
        , longDescription
        , placeholder
        , posInSet
        , roleDescription
        , rowCount
        , rowIndex
        , rowSpan
        , setSize
        )

{-|

@docs activeDescendant, controls


### Providing More Info

@docs longDescription, details, describedBy, labelledBy, labeledBy
@docs keyShortcuts, roleDescription


### Navigation and Flow

@docs flowTo


### Textbox Related

@docs placeholder


### Table Related

@docs colCount, colIndex, colSpan, rowCount, rowIndex, rowSpan


### Set-related

@docs setSize, posInSet


### Current

@docs currentItem, currentPage, currentStep, currentLocation, currentDate, currentTime

@docs errorMessage

-}

import Accessibility.Utils exposing (..)
import Html
import Html.Attributes exposing (..)


{-| Creates aria labelledby attribute. Pass the unique string id of the labelling element.
`labeledBy` and `labelledBy` are identical.
-}
labeledBy : String -> Html.Attribute Never
labeledBy =
    labelledBy


{-| Creates aria labelledby attribute. Pass the unique string id of the labelling element.
`labeledBy` and `labelledBy` are identical.
-}
labelledBy : String -> Html.Attribute Never
labelledBy =
    attribute "aria-labelledby"


{-| Creates the longDesc attribute with the given url, which should point to a text description of the content. This attribute is only supported on img tags.

    import Accessibility exposing (Html, img)
    import Accessibility.Aria exposing (longDescription)

    view : Html msg
    view =
        img
            "Growth Chart in Some Sweet Unit (Quarter 4)"
            [ longDescription "/quarter_4_summary#Growth" ]

-}
longDescription : String -> Html.Attribute Never
longDescription =
    attribute "longdesc"


{-| Supported in container-y roles: `application`, `composite`, `group`, `textbox`,
`comboBox`, `grid`, `listBox`, `menu`, `menuBar`, `radioGroup`, `row`, `searchBox`,
`select`, `spinButton`, `tabList`, `toolBar`, `tree`, and `treeGrid`.

Identifies the currently-active element.

-}
activeDescendant : String -> Html.Attribute Never
activeDescendant =
    aria "activedescendant"


{-| Supported by `table`, `grid`, `treegrid`.

Declares the number of columns in a grid in which not all of the columns are
displayed. (If all columns are present--skip using this.)

`-1` indicates total column number is unknown.

-}
colCount : Int -> Html.Attribute Never
colCount =
    aria "colcount" << toString


{-| Supported by `cell`, `row`, `columnHeader`, `gridCell`, and `rowHeader`.

Indexing begins from 1, NOT 0. Plus, the colIndex should not be greater than the `colCount`!
If a cell stretches across multiple columns, use the starting column index and `colSpan`.

The simplest rule is to put the `colIndex` on every child of a `row`.

-}
colIndex : Int -> Html.Attribute Never
colIndex =
    aria "colindex" << toString


{-| Supported by `cell`, `columnHeader`, `gridCell`, and `rowHeader`.

Indicate how many columns-wide a cell is.

-}
colSpan : Int -> Html.Attribute Never
colSpan =
    aria "colspan" << toString


{-| Supported by `table`, `grid`, `treegrid`.

Declares the number of rows in a grid in which not all of the rows are
displayed. (If all rows are present--skip using this.)

`-1` indicates total row number is unknown.

-}
rowCount : Int -> Html.Attribute Never
rowCount =
    aria "rowcount" << toString


{-| Supported by `cell`, `row`, `columnHeader`, `gridCell`, and `rowHeader`.

Analagous to `colIndex`.

-}
rowIndex : Int -> Html.Attribute Never
rowIndex =
    aria "rowindex" << toString


{-| Supported by `cell`, `columnHeader`, `gridCell`, and `rowHeader`.

Indicate how many rows-wide a cell is.

-}
rowSpan : Int -> Html.Attribute Never
rowSpan =
    aria "rowspan" << toString


{-| Supported by list-y elements: `article`, `listItem`, `menuItem`, `option`,
`radio`, `tab`, `menuitemcheckbox`, `menuitemradio`, and `treeItem`.

Only necessary when not all of the items in the set are in the DOM. Use with `setSize`.

-}
posInSet : Int -> Html.Attribute Never
posInSet =
    aria "posinset" << toString


{-| Supported by list-y elements: `article`, `listItem`, `menuItem`, `option`,
`radio`, `tab`, `menuitemcheckbox`, `menuitemradio`, and `treeItem`.

`setSize` indicates the total number of items in a set where not all the items are
currently present in the DOM.

-}
setSize : Int -> Html.Attribute Never
setSize =
    aria "setsize" << toString


{-| Creates aria controls attribute. Pass the unique string id of whatever is being controlled.
-}
controls : String -> Html.Attribute Never
controls =
    aria "controls"


{-| Supported by all elements.

Indicate that a link in a nav or list is the current location.

-}
currentPage : Html.Attribute Never
currentPage =
    aria "current" "page"


{-| Supported by all elements.

Indicate which step in a step-based flow is the current one.

-}
currentStep : Html.Attribute Never
currentStep =
    aria "current" "step"


{-| Supported by all elements.
-}
currentLocation : Html.Attribute Never
currentLocation =
    aria "current" "location"


{-| Supported by all elements.

As in a calendar widget.

-}
currentDate : Html.Attribute Never
currentDate =
    aria "current" "date"


{-| Supported by all elements.

As in a timepicker widget.

-}
currentTime : Html.Attribute Never
currentTime =
    aria "current" "time"


{-| Supported by all elements.
-}
currentItem : Bool -> Html.Attribute Never
currentItem =
    aria "current" << toBoolString


{-| Supported by all elements.

Kind of a more-verbose version of `labelledBy`. Pass it a list of ids
of elements that describe the given element.

-}
describedBy : List String -> Html.Attribute Never
describedBy =
    aria "describedby" << toListString


{-| Supported by all elements.

Refer to a single extended description section--maybe a couple of paragraphs
and a chart. Pass in the section's id.

-}
details : String -> Html.Attribute Never
details =
    aria "details"


{-| Supported by all elements.

Reference the element that has error details. e.g., if you've got an input field
that's invalid, add `errorMessage` to the input with the id of whatever element
is telling the user in what way their submission is wrong.

    input [ invalid True, errorMessage "error-message-id" ] []

-}
errorMessage : String -> Html.Attribute Never
errorMessage =
    aria "errormessage"


{-| Supported by all elements.

Provide an alternative document reading order and offer navigation to the
elements referenced in the passed-in list of ids.

-}
flowTo : List String -> Html.Attribute Never
flowTo =
    aria "flowto" << toListString


{-| Supported by all elements.

Keyboard shortcuts!!! Pass in a list of keyboard shortcuts. See [recommendations](https://www.w3.org/TR/wai-aria-practices-1.1/#kbd_shortcuts)
on how to make good shortcuts.

    keyShortcuts [ "Alt+Shift+P", "Control+F" ]

-}
keyShortcuts : List String -> Html.Attribute Never
keyShortcuts =
    aria "keyshortcuts" << toListString


{-| Supported by `textbox` and `searchbox`.

Provide a hint about an expected value.

-}
placeholder : String -> Html.Attribute Never
placeholder =
    aria "placeholder"


{-| Supported by all elements.

Provide human-readable description of the role of an element. Should be used
alongside an actual role--this is supplementary information.

-}
roleDescription : String -> Html.Attribute Never
roleDescription =
    aria "roledescription"
