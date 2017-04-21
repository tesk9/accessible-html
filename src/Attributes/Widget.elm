module Attributes.Widget
    exposing
        ( autoCompleteInline
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
        , label
        , level
        , multiLine
        , multiSelectable
        , orientation
        , pressed
        , readOnly
        , required
        , selected
        , sort
        , valueMax
        , valueMin
        , valueNow
        , valueText
        )

{-|
# Auto Complete

@docs autoCompleteInline, autoCompleteList, autoCompleteBoth

See [the autocomplete spec](https://www.w3.org/TR/wai-aria-1.1/#aria-autocomplete).

# Pop-Ups

Pop-ups are supported for all elements (but not meant for use on tooltips).

The pop-up itself needs to have a containing element with one of these roles:
`menu`, `listbox`, `tree`, `grid`, or `dialog`, and the pop-up value must match.
That is, use `hasMenuPopUp` if the pop-up container has a role of `menu`.

See [the spec](https://www.w3.org/TR/wai-aria-1.1/#aria-haspopup).

@docs hasMenuPopUp, hasListBoxPopUp, hasTreePopUp, hasGridPopUp, hasDialogPopUp
-}

import Html
import Html.Attributes exposing (..)
import Maybe.Extra


aria : String -> String -> Html.Attribute msg
aria =
    attribute << (++) "aria-"


toBoolString : Bool -> String
toBoolString =
    String.toLower << toString


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
    aria "checked" << Maybe.Extra.unwrap "mixed" toBoolString


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


{-|
-}
hidden : Bool -> Html.Attribute msg
hidden =
    aria "hidden"


invalid : String -> Html.Attribute msg
invalid =
    aria "invalid"


label : String -> Html.Attribute msg
label =
    aria "label"


level : String -> Html.Attribute msg
level =
    aria "level"


multiLine : String -> Html.Attribute msg
multiLine =
    aria "multiline"


multiSelectable : String -> Html.Attribute msg
multiSelectable =
    aria "multiselectable"


orientation : String -> Html.Attribute msg
orientation =
    aria "orientation"


pressed : String -> Html.Attribute msg
pressed =
    aria "pressed"


readOnly : String -> Html.Attribute msg
readOnly =
    aria "readonly"


required : String -> Html.Attribute msg
required =
    aria "required"


selected : String -> Html.Attribute msg
selected =
    aria "selected"


sort : String -> Html.Attribute msg
sort =
    aria "sort"


valueMax : String -> Html.Attribute msg
valueMax =
    aria "valuemax"


valueMin : String -> Html.Attribute msg
valueMin =
    aria "valuemin"


valueNow : String -> Html.Attribute msg
valueNow =
    aria "valuenow"


valueText : String -> Html.Attribute msg
valueText =
    aria "valuetext"
