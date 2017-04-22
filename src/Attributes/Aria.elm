module Attributes.Aria
    exposing
        ( controls
        , labelledBy
        , longDescription
        , indeterminate
        )

{-|
@docs controls, labelledBy, longDescription, indeterminate
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


longDescription : String -> Html.Attribute msg
longDescription =
    attribute "longDesc"


indeterminate : Html.Attribute msg
indeterminate =
    property "indeterminate" (Json.Encode.bool True)
