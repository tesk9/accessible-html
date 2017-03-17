module Html.A11y exposing (Input, leftLabeledInput, rightLabeledInput)

{-|
@docs Input, leftLabeledInput, rightLabeledInput
-}

import Html exposing (..)
import Html.Attributes exposing (..)


{-| Input msg
    { label : Html msg
    , type_ : String
    , value : String
    , attributes : List (Html.Attribute msg)
    }
-}
type alias Input msg =
    { label : Html msg
    , type_ : String
    , value : String
    , attributes : List (Html.Attribute msg)
    }


baseInput : Input msg -> Html msg
baseInput inputModel =
    input (type_ inputModel.type_ :: value inputModel.value :: inputModel.attributes) []


{-| leftLabeledInput
Produces a labeled input of a given label type. The label appears on the left side on the input.
-}
leftLabeledInput : Input msg -> Html msg
leftLabeledInput inputModel =
    label
        []
        [ inputModel.label
        , baseInput inputModel
        ]


{-| rightLabeledInput
Produces a labeled input of a given label type. The label appears on the right side on the input.
-}
rightLabeledInput : Input msg -> Html msg
rightLabeledInput inputModel =
    label
        []
        [ baseInput inputModel
        , inputModel.label
        ]
