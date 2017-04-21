module Attributes.Widget
    exposing
        ( autoCompleteInline
        , autoCompleteList
        , autoCompleteBoth
        , checked
        , disabled
        , expanded
        , hasPopUp
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

{-| Learn more about widget states and properties on the [w3 website](https://www.w3.org/TR/wai-aria/states_and_properties#attrs_widgets_header).

# Auto Complete

@docs autoCompleteInline , autoCompleteList , autoCompleteBoth
-}

import Html
import Html.Attributes exposing (..)
import Json.Encode


aria : String -> String -> Html.Attribute msg
aria =
    attribute << (++) "aria-"


asBool : Bool -> Json.Encode.Value
asBool =
    Json.Encode.bool


{-| Add this attriute to any `combobox` or `textbox` when there's a suggestion
for completing the field that shows up in the line that the user is completing.

Be sure to indicate that the auto-completed text is selected.

See [the autocomplete spec](https://www.w3.org/TR/wai-aria/states_and_properties#aria-autocomplete).
-}
autoCompleteInline : Html.Attribute msg
autoCompleteInline =
    aria "autocomplete" "inline"


{-| Add this attriute to any `combobox` or `textbox` when there's a suggestion
for completing the field that shows up as a list of options from which the user can pick.

Be sure to indicate that the auto-completed text is selected.

See [the autocomplete spec](https://www.w3.org/TR/wai-aria/states_and_properties#aria-autocomplete).
-}
autoCompleteList : Html.Attribute msg
autoCompleteList =
    aria "autocomplete" "list"


{-| Add this attriute to any `combobox` or `textbox` when there's a suggestion
for completing the field when there's both inline autocomplete and list autocomplete occurring at once.

Be sure to indicate that the auto-completed text is selected.

See [the autocomplete spec](https://www.w3.org/TR/wai-aria/states_and_properties#aria-autocomplete).
-}
autoCompleteBoth : Html.Attribute msg
autoCompleteBoth =
    aria "autocomplete" "both"


checked : String -> Html.Attribute msg
checked =
    aria "checked"


disabled : String -> Html.Attribute msg
disabled =
    aria "disabled"


expanded : String -> Html.Attribute msg
expanded =
    aria "expanded"


hasPopUp : String -> Html.Attribute msg
hasPopUp =
    aria "haspopup"


hidden : String -> Html.Attribute msg
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
