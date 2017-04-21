module Attributes.Aria
    exposing
        ( controls
        , labelledBy
        , selected
        , longDescription
        , indeterminate
        )

{-|
@docs controls, labelledBy, selected, longDescription, indeterminate
-}

import Html
import Html.Attributes exposing (..)
import Json.Encode


controls : String -> Html.Attribute msg
controls =
    attribute "aria-controls"


labelledBy : String -> Html.Attribute msg
labelledBy =
    attribute "aria-labelledby"


selected : Bool -> Html.Attribute msg
selected =
    attribute "aria-selected" << String.toLower << toString


longDescription : String -> Html.Attribute msg
longDescription =
    attribute "longDesc"


indeterminate : Html.Attribute msg
indeterminate =
    property "indeterminate" (Json.Encode.bool True)


level : Int -> Html.Attribute msg
level =
    attribute "aria-level" << toString
