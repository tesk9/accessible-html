module Tags.Images
    exposing
        ( decorativeImg
        , figure
        , img
        )

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Attributes.A11y as A11y exposing (..)


img : String -> List (Html.Attribute msg) -> Html msg
img alt_ attributes =
    Html.img (alt alt_ :: attributes) []


decorativeImg : List (Html.Attribute msg) -> Html msg
decorativeImg attributes =
    Html.img (alt "" :: presentation :: attributes) []


figure : List (Html.Attribute msg) -> List (Html msg) -> Html msg
figure attributes =
    Html.figure (group :: attributes)
