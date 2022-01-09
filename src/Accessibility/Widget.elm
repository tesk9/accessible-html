module Accessibility.Widget exposing
    ( required, label
    , invalid, invalidGrammar, invalidSpelling
    , pressed
    , multiLine
    , checked, selected, indeterminate
    , autoCompleteInline, autoCompleteList, autoCompleteBoth
    , expanded, hidden, readOnly, disabled
    , modal
    , hasMenuPopUp, hasListBoxPopUp, hasTreePopUp, hasGridPopUp, hasDialogPopUp
    , orientationHorizontal, orientationVertical, valueMin, valueMax, valueNow, valueText
    , sortAscending, sortDescending, sortCustom, sortNone
    , multiSelectable
    , level
    )

{-|


## Widget States and Properties

Some of these are also globally available, including: `busy`, `disabled`, `grabbed`, `hidden`, `invalid`.


### Inputs and Validation

  - Learn more about making forms and inputs understandable in [Understanding Guideline 3.3: Input Assistance](https://www.w3.org/WAI/WCAG21/Understanding/input-assistance)

@docs required, label
@docs invalid, invalidGrammar, invalidSpelling
@docs pressed
@docs multiLine
@docs checked, selected, indeterminate


#### Auto-complete behavior:

See [the autocomplete spec](https://www.w3.org/TR/wai-aria-1.1/#aria-autocomplete).

@docs autoCompleteInline, autoCompleteList, autoCompleteBoth


### Interactability

@docs expanded, hidden, readOnly, disabled


### Pop-Ups

@docs modal

Pop-ups are supported for all elements (but not meant for use on tooltips).

The pop-up itself needs to have a containing element with one of these roles: `menu`, `listbox`, `tree`, `grid`, or `dialog`, and the pop-up value must match. That is, use `hasMenuPopUp` if the pop-up container has a role of `menu`.

See [the spec](https://www.w3.org/TR/wai-aria-1.1/#aria-haspopup).

@docs hasMenuPopUp, hasListBoxPopUp, hasTreePopUp, hasGridPopUp, hasDialogPopUp


### Orientation and Range Widgets

@docs orientationHorizontal, orientationVertical, valueMin, valueMax, valueNow, valueText


### Table Sort-by-column

@docs sortAscending, sortDescending, sortCustom, sortNone


### Misc

@docs multiSelectable


### Page Hierarchy

@docs level

-}

import Accessibility.Utils exposing (aria, toBoolString, toTriStateString)
import Html
import Html.Attributes exposing (property)
import Json.Encode


{-| Creates an [`aria-autocomplete="inline"`](https://www.w3.org/TR/wai-aria-1.1/#aria-autocomplete) attribute.

Use when there's a suggestion for completing the field that shows up in the line that the user is completing. Be sure to indicate that the auto-completed text is selected.

Available on `comboBox` or `textbox`.

-}
autoCompleteInline : Html.Attribute msg
autoCompleteInline =
    aria "autocomplete" "inline"


{-| Creates an [`aria-autocomplete="list"`](https://www.w3.org/TR/wai-aria-1.1/#aria-autocomplete) attribute.

Use when there's a suggestion for completing the field that shows up as a list of options from which the user can pick.

Be sure to indicate that the auto-completed text is selected.

Available on `comboBox` or `textbox`.

-}
autoCompleteList : Html.Attribute msg
autoCompleteList =
    aria "autocomplete" "list"


{-| Creates an [`aria-autocomplete="both"`](https://www.w3.org/TR/wai-aria-1.1/#aria-autocomplete) attribute.

Use when there's a suggestion for completing the field when there's both inline autocomplete and list autocomplete occurring at once.

Be sure to indicate that the auto-completed text is selected.

Available on `comboBox` or `textbox`.

-}
autoCompleteBoth : Html.Attribute msg
autoCompleteBoth =
    aria "autocomplete" "both"


{-| Creates an [`aria-checked`](https://www.w3.org/TR/wai-aria-1.1/#aria-checked) attribute.

Check boxes can be checked (`Just True`), unchecked (`Just False`), or indeterminate (`Nothing`).

Available on `checkbox`, `option`, `radio`, `switch`

-}
checked : Maybe Bool -> Html.Attribute msg
checked =
    aria "checked" << toTriStateString


{-| Creates an [`aria-indeterminate`](https://www.w3.org/TR/wai-aria-1.1/#aria-indeterminate) attribute.

Sets the indeterminate value to be true.

-}
indeterminate : Html.Attribute msg
indeterminate =
    property "indeterminate" (Json.Encode.bool True)


{-| Creates an [`aria-disabled`](https://www.w3.org/TR/wai-aria-1.1/#aria-disabled) attribute.

In deciding whether to use `Accessibility.Widget.disabled` or `Html.Attributes.disabled`, it may be helpful to read through the [Focusablity of disabled controls](https://www.w3.org/TR/wai-aria-practices-1.1/#kbd_disabled_controls) section of the WAI-ARIA Practices recommendations.

In essence, you may want to use `Accessibility.Widget.disabled` instead of `Html.Attributes.disabled` if you want users to be aware of disabled elements, and you don't mind that users will need to navigate through these disabled elements.

Supported for all elements. Elements are not disabled (they are enabled) by default.

-}
disabled : Bool -> Html.Attribute msg
disabled =
    aria "disabled" << toBoolString


{-| Creates an [`aria-expanded`](https://www.w3.org/TR/wai-aria-1.1/#aria-expanded) attribute.

This attribute can be applied to either an element that is itself expanded/collapsed, OR to an elment it controls that is either expanded/collapsed. In the latter case, use a `controls` attribute as well to clarify the relationship.

Available on `button`, `comboBox`, `document`, `link`, `section`, `sectionHead`, and `window`.

-}
expanded : Bool -> Html.Attribute msg
expanded =
    aria "expanded" << toBoolString


{-| Creates an [`aria-haspopup="menu"`](https://www.w3.org/TR/wai-aria-1.1/#aria-haspopup) attribute.

Indicate that interaction with this element can trigger a `menu` pop-up.

Be careful while managing focus and triggering.

-}
hasMenuPopUp : Html.Attribute msg
hasMenuPopUp =
    aria "haspopup" "menu"


{-| Creates an [`aria-haspopup="listbox"`](https://www.w3.org/TR/wai-aria-1.1/#aria-haspopup) attribute.

Indicate that interaction with this element can trigger a `listBox` pop-up.

Be careful while managing focus and triggering.

-}
hasListBoxPopUp : Html.Attribute msg
hasListBoxPopUp =
    aria "haspopup" "listbox"


{-| Creates an [`aria-haspopup="tree"`](https://www.w3.org/TR/wai-aria-1.1/#aria-haspopup) attribute.

Indicate that interaction with this element can trigger a `tree` pop-up.

Be careful while managing focus and triggering.

-}
hasTreePopUp : Html.Attribute msg
hasTreePopUp =
    aria "haspopup" "tree"


{-| Creates an [`aria-haspopup="grid"`](https://www.w3.org/TR/wai-aria-1.1/#aria-haspopup) attribute.

Indicate that interaction with this element can trigger a `grid` pop-up.

Be careful while managing focus and triggering.

-}
hasGridPopUp : Html.Attribute msg
hasGridPopUp =
    aria "haspopup" "grid"


{-| Creates an [`aria-haspopup="dialog"`](https://www.w3.org/TR/wai-aria-1.1/#aria-haspopup) attribute.

Indicate that interaction with this element can trigger a `dialog` pop-up.

Be careful while managing focus and triggering.

-}
hasDialogPopUp : Html.Attribute msg
hasDialogPopUp =
    aria "haspopup" "dialog"


{-| Creates an [`aria-hidden`](https://www.w3.org/TR/wai-aria-1.1/#aria-hidden) attribute.
-}
hidden : Bool -> Html.Attribute msg
hidden =
    aria "hidden" << toBoolString


{-| Creates an [`aria-invalid`](https://www.w3.org/TR/wai-aria-1.1/#aria-invalid) attribute.

Learn more about [Using Aria-Invalid to Indicate an Error Field](https://www.w3.org/WAI/WCAG21/Techniques/aria/ARIA21).

You may want to use `Accessibility.Aria.errorMessage` or `Accessibility.Aria.describedBy` to indicate what's invalid about the user's submission.

For invalid grammar or spelling specifically, use `invalidGrammar` and `invalidSpelling` respectively.

Supported for all elements.

-}
invalid : Bool -> Html.Attribute msg
invalid =
    aria "invalid" << toBoolString


{-| Creates an [`aria-invalid="grammar"`](https://www.w3.org/TR/wai-aria-1.1/#aria-invalid) attribute.

Supported for all elements.

-}
invalidGrammar : Html.Attribute msg
invalidGrammar =
    aria "invalid" "grammar"


{-| Creates an [`aria-invalid="spelling"`](https://www.w3.org/TR/wai-aria-1.1/#aria-invalid) attribute.

Supported for all elements.

-}
invalidSpelling : Html.Attribute msg
invalidSpelling =
    aria "invalid" "spelling"


{-| Creates an [`aria-label`](https://www.w3.org/TR/wai-aria-1.1/#aria-label) attribute.

Supported for all elements.

-}
label : String -> Html.Attribute msg
label =
    aria "label"


{-| Creates an [`aria-level`](https://www.w3.org/TR/wai-aria-1.1/#aria-level) attribute.

This attribute is about hierarchy--how many "levels" deep is an element?

    h7 attributes =
        div (heading :: level 7 :: attributes)

Supported for `grid`, `heading`, `listItem`, `row`, and `tabList`.

-}
level : Int -> Html.Attribute msg
level =
    aria "level" << String.fromInt


{-| Creates an [`aria-modal`](https://www.w3.org/TR/wai-aria-1.1/#aria-modal) attribute.

Indicate that a modal is showing and the rest of the page contents are not interactable.

    import Accessibility exposing (div, h2, p, text)
    import Accessibility.Aria exposing (labelledBy)
    import Accessibility.Role exposing (dialog)
    import Accessibility.Widget exposing (modal)
    import Html.Attributes exposing (id)

    modal : Html msg
    modal =
        div [ dialog, modal, labelledBy "header-id" ]
            [ h2 [ id "header-id" ] [ text "Modal Header" ]
            , p [] [ text "Wow, such modal contents!" ]
            ]

-}
modal : Bool -> Html.Attribute msg
modal =
    aria "modal" << toBoolString


{-| Creates an [`aria-multiline`](https://www.w3.org/TR/wai-aria-1.1/#aria-multiline) attribute.

Indicate whether the `textbox` is for multi-line inputs or single-line inputs.

Be careful of default keyboard behavior when coupling this property with text inputs, which by default submit their form group on enter.

Supported for `textbox` only.

-}
multiLine : Bool -> Html.Attribute msg
multiLine =
    aria "multiline" << toBoolString


{-| Creates an [`aria-multiselectable`](https://www.w3.org/TR/wai-aria-1.1/#aria-multiselectable) attribute.

When true, users are not restricted to selecting only one selectable descendant at a time.

Supported on `grid`, `listBox`, `tabList`, `tree`.

-}
multiSelectable : Bool -> Html.Attribute msg
multiSelectable =
    aria "multiselectable" << toBoolString


{-| Creates an [`aria-orientation="horizontal`](https://www.w3.org/TR/wai-aria-1.1/#aria-orientation) attribute.

Supported on roles with some sense of inherent orientation: `progressBar`, `scrollbar`, `select`, `separator`, `slider`, `tabList`, `toolBar`

Careful: default behavior is inconsistent across those roles.

-}
orientationHorizontal : Html.Attribute msg
orientationHorizontal =
    --TODO: should the non-default behavior be explicit from the role perspective?
    aria "orientation" "horizontal"


{-| Creates an [`aria-orientation="vertical"`](https://www.w3.org/TR/wai-aria-1.1/#aria-orientation="vertical") attribute.

Supported on roles with some sense of inherent orientation: `progressBar`, `scrollbar`, `select`, `separator`, `slider`, `tabList`, `toolBar`

Careful: default behavior is inconsistent across those roles.

-}
orientationVertical : Html.Attribute msg
orientationVertical =
    --TODO: should the non-default behavior be explicit from the role perspective?
    aria "orientation" "vertical"


{-| Creates an [`aria-pressed`](https://www.w3.org/TR/wai-aria-1.1/#aria-pressed) attribute.

Use `pressed` when describing a toggle button--a button that can be "toggled" between an on state and an off state (or an on state, an indeterminate state, and an off state).

Please check out these [examples](https://www.w3.org/TR/2016/WD-wai-aria-practices-1.1-20160317/examples/button/button.html) as well.

    button
        [ pressed <| Just True ]
        [ text "This button should be styled for site viewers such that it's clear it's pressed!" ]

Supported on `button`.

-}
pressed : Maybe Bool -> Html.Attribute msg
pressed =
    --TODO: Move to be a button role option?
    aria "pressed" << toTriStateString


{-| Creates an [`aria-readonly`](https://www.w3.org/TR/wai-aria-1.1/#aria-readonly) attribute.

Indicates read-only status of a widget, although normal navigation rules and copying behavior should apply. (Read: `readOnly` elements are navigable but unchangeable, and `disabled` elements are neither navigable nor unchangebale).

Supported on `checkBox`, `comboBox`, `grid`, `gridCell`, `listBox`, `radioGroup`, `slider`, `spinButton`, and `textBox`.

-}
readOnly : Bool -> Html.Attribute msg
readOnly =
    aria "readonly" << toBoolString


{-| Creates an [`aria-required`](https://www.w3.org/TR/wai-aria-1.1/#aria-required) attribute.

Indicate whether user input is or is not required on a field for valid form submission.

Supported by `comboBox`, `gridCell`, `listBox`, `radioGroup`, `spinButton`, `textBox`, `tree`

-}
required : Bool -> Html.Attribute msg
required =
    aria "required" << toBoolString


{-| Creates an [`aria-selected`](https://www.w3.org/TR/wai-aria-1.1/#aria-selected) attribute.

Indicate whether an element (in a single- or multi-selectable widget) is or is not selected.

Supported by `gridCell`, `option`, `row`, `tab`.

-}
selected : Bool -> Html.Attribute msg
selected =
    aria "selected" << toBoolString


{-| Creates an [`aria-sort="ascending"`](https://www.w3.org/TR/wai-aria-1.1/#aria-sort) attribute.

Table is sorted by this column's values in ascending order. Only one column in a table should be sorting the values in table.

Supported by `columnHeader` and `rowHeader`, but only where those roles are used on table or grid headers.

-}
sortAscending : Html.Attribute msg
sortAscending =
    aria "sort" "ascending"


{-| Creates an [`aria-sort="descending"`](https://www.w3.org/TR/wai-aria-1.1/#aria-sort) attribute.

Table is sorted by this column's values in descending order. Only one column in a table should be sorting the values in table.

Supported by `columnHeader` and `rowHeader`, but only where those roles are used on table or grid headers.

-}
sortDescending : Html.Attribute msg
sortDescending =
    aria "sort" "descending"


{-| Creates an [`aria-sort="other"`](https://www.w3.org/TR/wai-aria-1.1/#aria-sort) attribute.

Table is sorted by this column's values, but the algorithm for that sorting is custom (not ascending or descending). Only one column in a table should be sorting the values in table.

Supported by `columnHeader` and `rowHeader`, but only where those roles are used on table or grid headers.

-}
sortCustom : Html.Attribute msg
sortCustom =
    aria "sort" "other"


{-| Creates an [`aria-sort="none"`](https://www.w3.org/TR/wai-aria-1.1/#aria-sort) attribute.

Table is not sorted by this column's values.

Supported by `columnHeader` and `rowHeader`, but only where those roles are used on table or grid headers.

-}
sortNone : Html.Attribute msg
sortNone =
    aria "sort" "none"


{-| Creates an [`aria-valuemax`](https://www.w3.org/TR/wai-aria-1.1/#aria-valuemax) attribute.

Set the max allowed value for a range widget.

Supported by `progressBar`, `scrollbar`, `separator`, `slider`, and `spinButton`.

-}
valueMax : Float -> Html.Attribute msg
valueMax =
    aria "valuemax" << String.fromFloat


{-| Creates an [`aria-valuemin`](https://www.w3.org/TR/wai-aria-1.1/#aria-valuemin) attribute.

Set the min allowed value for a range widget.

Supported by `progressBar`, `scrollbar`, `separator`, `slider`, and `spinButton`.

-}
valueMin : Float -> Html.Attribute msg
valueMin =
    aria "valuemin" << String.fromFloat


{-| Creates an [`aria-valuenow`](https://www.w3.org/TR/wai-aria-1.1/#aria-valuenow) attribute.

Set the current value for a range widget. Don't use this property for indeterminate states.

Supported by `progressBar`, `scrollbar`, `separator`, `slider`, and `spinButton`.

-}
valueNow : Float -> Html.Attribute msg
valueNow =
    aria "valuenow" << String.fromFloat


{-| Creates an [`aria-valuetext`](https://www.w3.org/TR/wai-aria-1.1/#aria-valuetext) attribute.

This property takes precedence over `valueNow`, and should show a human-readable version of the current value. However, `valueNow` should always be used.

Supported by `progressBar`, `scrollbar`, `separator`, `slider`, and `spinButton`.

-}
valueText : String -> Html.Attribute msg
valueText =
    aria "valuetext"
