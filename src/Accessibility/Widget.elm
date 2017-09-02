module Accessibility.Widget
    exposing
        ( autoCompleteBoth
        , autoCompleteInline
        , autoCompleteList
        , checked
        , disabled
        , expanded
        , hasDialogPopUp
        , hasGridPopUp
        , hasListBoxPopUp
        , hasMenuPopUp
        , hasTreePopUp
        , hidden
        , indeterminate
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
        , sortCustom
        , sortDescending
        , sortNone
        , valueMax
        , valueMin
        , valueNow
        , valueText
        )

{-|


## Widget States and Properties

Some of these are also globally available, including: `busy`, `disabled`, `grabbed`, `hidden`, `invalid`


### Page Hierarchy

@docs level


### State


#### Inputs

@docs required, label


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

import Accessibility.Utils exposing (aria, toBoolString, toTriStateString)
import Html
import Html.Attributes exposing (property)
import Json.Encode


{-| Available on `comboBox` or `textbox`.
Use when there's a suggestion for completing the field that shows up
in the line that the user is completing.

Be sure to indicate that the auto-completed text is selected.

-}
autoCompleteInline : Html.Attribute msg
autoCompleteInline =
    aria "autocomplete" "inline"


{-| Available on `comboBox` or `textbox`.
Use when there's a suggestion for completing the field that shows up as a list
of options from which the user can pick.

Be sure to indicate that the auto-completed text is selected.

See [the autocomplete spec](https://www.w3.org/TR/wai-aria-1.1/#aria-autocomplete).

-}
autoCompleteList : Html.Attribute msg
autoCompleteList =
    aria "autocomplete" "list"


{-| Available on `comboBox` or `textbox`.
Use when there's a suggestion for completing the field when there's both
inline autocomplete and list autocomplete occurring at once.

Be sure to indicate that the auto-completed text is selected.

See [the autocomplete spec](https://www.w3.org/TR/wai-aria-1.1/#aria-autocomplete).

-}
autoCompleteBoth : Html.Attribute msg
autoCompleteBoth =
    aria "autocomplete" "both"


{-| Available on `checkbox`, `option`, `radio`, `switch`

Check boxes can be checked (`Just True`), unchecked (`Just False`), or indeterminate (`Nothing`).
Other elements won't support tri-state checkedness.

See [the checked spec](https://www.w3.org/TR/wai-aria-1.1/#aria-checked).

-}
checked : Maybe Bool -> Html.Attribute msg
checked =
    aria "checked" << toTriStateString


{-| Sets the indeterminate value to be true.
-}
indeterminate : Html.Attribute msg
indeterminate =
    property "indeterminate" (Json.Encode.bool True)


{-| Supported for all elements. Elements are not disabled (are enabled) by default.
-}
disabled : Bool -> Html.Attribute msg
disabled =
    aria "disabled" << toBoolString


{-| Available on `button`, `comboBox`, `document`, `link`, `section`, `sectionHead`, and `window`.

Trickily, this attribute can be applied to either an element that is itself
expanded/collapsed, OR to an elment it controls that is either expanded/collapsed.
In the latter case, throw on a `controls` attribute as well to clarify the relationship.

-}
expanded : Bool -> Html.Attribute msg
expanded =
    aria "expanded" << toBoolString


{-| Indicate that interaction with this element can trigger a `menu` pop-up.

Be careful while managing focus and triggering.

-}
hasMenuPopUp : Html.Attribute msg
hasMenuPopUp =
    aria "haspopup" "menu"


{-| Indicate that interaction with this element can trigger a `listBox` pop-up.

Be careful while managing focus and triggering.

-}
hasListBoxPopUp : Html.Attribute msg
hasListBoxPopUp =
    aria "haspopup" "listbox"


{-| Indicate that interaction with this element can trigger a `tree` pop-up.

Be careful while managing focus and triggering.

-}
hasTreePopUp : Html.Attribute msg
hasTreePopUp =
    aria "haspopup" "tree"


{-| Indicate that interaction with this element can trigger a `grid` pop-up.

Be careful while managing focus and triggering.

-}
hasGridPopUp : Html.Attribute msg
hasGridPopUp =
    aria "haspopup" "grid"


{-| Indicate that interaction with this element can trigger a `dialog` pop-up.

Be careful while managing focus and triggering.

-}
hasDialogPopUp : Html.Attribute msg
hasDialogPopUp =
    aria "haspopup" "dialog"


{-| -}
hidden : Bool -> Html.Attribute msg
hidden =
    aria "hidden" << toBoolString


{-| Supported for all elements.

For invalid grammar or spelling, please see `invalidGrammar` and `invalidSpelling` respectively.

-}
invalid : Bool -> Html.Attribute msg
invalid =
    aria "invalid" << toBoolString


{-| Supported for all elements.
-}
invalidGrammar : Html.Attribute msg
invalidGrammar =
    aria "invalid" "grammar"


{-| Supported for all elements.
-}
invalidSpelling : Html.Attribute msg
invalidSpelling =
    aria "invalid" "spelling"


{-| Supported for all elements.
-}
label : String -> Html.Attribute msg
label =
    aria "label"


{-| Supported for `grid`, `heading`, `listItem`, `row`, and `tabList`.

This attribute is about hierarchy--how many "levels" deep is an element? Please
refer to the [documentation](https://www.w3.org/TR/wai-aria-1.1/#aria-level) to get a better sense of when to use.

    h7 attributes =
        div (heading :: level 7 :: attributes)

-}
level : Int -> Html.Attribute msg
level =
    aria "level" << toString


{-| Supported for `textbox` only.

Indicate whether the `textbox` is for multi-line inputs or single-line inputs.

Careful of default keyboard behavior when coupling this property with text inputs,
which by default submit their form group on enter.

-}
multiLine : Bool -> Html.Attribute msg
multiLine =
    aria "multiline" << toBoolString


{-| Supported on `grid`, `listBox`, `tabList`, `tree`. (However, what would it mean
for a `tabList`, say, to have multiple selectable descendants?)

When true, users are not restricted to selecting only one selectable descendant at a time.

-}
multiSelectable : Bool -> Html.Attribute msg
multiSelectable =
    aria "multiselectable" << toBoolString


{-| Supported on roles with some sense of inherent orientation:
`progressBar`, `scrollbar`, `select`, `separator`, `slider`, `tabList`, `toolBar`

Careful: default behavior is inconsistent across those roles.

-}
orientationHorizontal : Html.Attribute msg
orientationHorizontal =
    --TODO: should the non-default behavior be explicit from the role perspective?
    aria "orientation" "horizontal"


{-| Supported on roles with some sense of inherent orientation:
`progressBar`, `scrollbar`, `select`, `separator`, `slider`, `tabList`, `toolBar`

Careful: default behavior is inconsistent across those roles.

-}
orientationVertical : Html.Attribute msg
orientationVertical =
    --TODO: should the non-default behavior be explicit from the role perspective?
    aria "orientation" "vertical"


{-| Supported on `button`.

Use `pressed` when describing a toggle button--a button that can be "toggled" between
an on state and an off state (or an on state, an indeterminate state, and an off state).

Please check out these [examples](https://www.w3.org/TR/2016/WD-wai-aria-practices-1.1-20160317/examples/button/button.html)
as well.

    button
        [ pressed <| Just True ]
        [ text "This button should be styled for site viewers such that it's clear it's pressed!" ]

-}
pressed : Maybe Bool -> Html.Attribute msg
pressed =
    --TODO: Move to be a button role option?
    aria "pressed" << toTriStateString


{-| Supported on `checkBox`, `comboBox`, `grid`, `gridCell`, `listBox`,
`radioGroup`, `slider`, `spinButton`, and `textBox`.

Indicates read-only status of a widget, although normal navigation rules and
copying behavior should apply. (Read: `readOnly` elements are navigable but
unchangeable, and `disabled` elements are neither navigable nor unchangebale).

-}
readOnly : Bool -> Html.Attribute msg
readOnly =
    aria "readonly" << toBoolString


{-| Supported by `comboBox`, `gridCell`, `listBox`, `radioGroup`, `spinButton`, `textBox`, `tree`

Indicate whether user input is or is not required on a field for valid form submission.

-}
required : Bool -> Html.Attribute msg
required =
    aria "required" << toBoolString


{-| Supported by `gridCell`, `option`, `row`, `tab`.

Indicate whether an element (in a single- or multi-selectable widget) is or is not selected.

-}
selected : Bool -> Html.Attribute msg
selected =
    aria "selected" << toBoolString


{-| Supported by `columnHeader` and `rowHeader`, but only where those roles are
used on table or grid headers.

This should only be applied to one header at a time.

Table is sorted by this column's values in ascending order.

-}
sortAscending : Html.Attribute msg
sortAscending =
    aria "sort" "ascending"


{-| Supported by `columnHeader` and `rowHeader`, but only where those roles are
used on table or grid headers.

Only one column in a table should be sorting the values in table.

Table is sorted by this column's values in descending order.

-}
sortDescending : Html.Attribute msg
sortDescending =
    aria "sort" "descending"


{-| Supported by `columnHeader` and `rowHeader`, but only where those roles are
used on table or grid headers.

Only one column in a table should be sorting the values in table.

Table is sorted by this column's values, but the algorithm for that sorting
is custom (not ascending or descending).

-}
sortCustom : Html.Attribute msg
sortCustom =
    aria "sort" "other"


{-| Supported by `columnHeader` and `rowHeader`, but only where those roles are
used on table or grid headers.

Table is not sorted by this column's values.

-}
sortNone : Html.Attribute msg
sortNone =
    aria "sort" "none"


{-| Supported by `progressBar`, `scrollbar`, `separator`, `slider`, and `spinButton`.

Set the max allowed value for a range widget.

-}
valueMax : number -> Html.Attribute msg
valueMax =
    aria "valuemax" << toString


{-| Supported by `progressBar`, `scrollbar`, `separator`, `slider`, and `spinButton`.

Set the min allowed value for a range widget.

-}
valueMin : number -> Html.Attribute msg
valueMin =
    aria "valuemin" << toString


{-| Supported by `progressBar`, `scrollbar`, `separator`, `slider`, and `spinButton`.

Set the current value for a range widget. Don't use this property for indeterminate states.

-}
valueNow : number -> Html.Attribute msg
valueNow =
    aria "valuenow" << toString


{-| Supported by `progressBar`, `scrollbar`, `separator`, `slider`, and `spinButton`.

This property takes precedence over `valueNow`, and should show a human-readable
version of the current value. However, `valueNow` should always be used.

-}
valueText : String -> Html.Attribute msg
valueText =
    aria "valuetext"
