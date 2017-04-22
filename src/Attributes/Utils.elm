module Attributes.Utils exposing (..)

import Html
import Html.Attributes exposing (..)
import Maybe.Extra


aria : String -> String -> Html.Attribute msg
aria =
    attribute << (++) "aria-"


toBoolString : Bool -> String
toBoolString =
    String.toLower << toString


toTriStateString : Maybe Bool -> String
toTriStateString =
    Maybe.Extra.unwrap "mixed" toBoolString


toListString : List String -> String
toListString =
    String.join " "
