module Html.A11y exposing (leftLabeledInput, rightLabeledInput)

{-|
@docs leftLabeledInput, rightLabeledInput
-}

import Html exposing (..)
import Html.Attributes exposing (..)


{-| leftLabeledInput
Produces a labeled input of a given label type. The label appears on the left side on the input.
-}
leftLabeledInput : Html msg -> String -> String -> List (Html.Attribute msg) -> Html msg
leftLabeledInput labelContent inputType inputValue inputAttributes =
    label
        []
        [ labelContent
        , input (type_ inputType :: inputAttributes) [ text inputValue ]
        ]


{-| rightLabeledInput
Produces a labeled input of a given label type. The label appears on the right side on the input.
-}
rightLabeledInput : Html msg -> String -> String -> List (Html.Attribute msg) -> Html msg
rightLabeledInput labelContent inputType inputValue inputAttributes =
    label
        []
        [ input (type_ inputType :: inputAttributes) [ text inputValue ]
        , labelContent
        ]
