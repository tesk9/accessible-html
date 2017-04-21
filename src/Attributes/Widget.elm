module Attributes.Widget
    exposing
        ( autocomplete
        , checked
        , disabled
        , expanded
        , haspopup
        , hidden
        , invalid
        , label
        , level
        , multiline
        , multiselectable
        , orientation
        , pressed
        , readonly
        , required
        , selected
        , sort
        , valuemax
        , valuemin
        , valuenow
        , valuetext
        )

{-| Learn more about widget states and properties on the [w3 website](https://www.w3.org/TR/wai-aria/states_and_properties#attrs_widgets_header).

@docs
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


autocomplete : String -> Html.Attribute msg
autocomplete =
    aria "autocomplete"


checked : String -> Html.Attribute msg
checked =
    aria "checked"


disabled : String -> Html.Attribute msg
disabled =
    aria "disabled"


expanded : String -> Html.Attribute msg
expanded =
    aria "expanded"


haspopup : String -> Html.Attribute msg
haspopup =
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


multiline : String -> Html.Attribute msg
multiline =
    aria "multiline"


multiselectable : String -> Html.Attribute msg
multiselectable =
    aria "multiselectable"


orientation : String -> Html.Attribute msg
orientation =
    aria "orientation"


pressed : String -> Html.Attribute msg
pressed =
    aria "pressed"


readonly : String -> Html.Attribute msg
readonly =
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


valuemax : String -> Html.Attribute msg
valuemax =
    aria "valuemax"


valuemin : String -> Html.Attribute msg
valuemin =
    aria "valuemin"


valuenow : String -> Html.Attribute msg
valuenow =
    aria "valuenow"


valuetext : String -> Html.Attribute msg
valuetext =
    aria "valuetext"
