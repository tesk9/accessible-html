module Html.A11y
    exposing
        ( Input
        , textInput
        , leftLabeledInput
        , rightLabeledInput
        )

{-|
@docs Input, textInput, InputTypeAndValue, leftLabeledInput, rightLabeledInput
-}

import Html exposing (..)
import Html.Attributes exposing (..)


{-| Input msg
    { label : Html msg
    , typeAndValue : InputTypeAndValue
    , attributes : List (Html.Attribute msg)
    }
-}
type alias Input msg =
    { label : Html msg
    , typeAndValue : InputTypeAndValue
    , attributes : List (Html.Attribute msg)
    }


{-| InputTypeAndValue
Use helpers like `textInput` to create InputTypeAndValue items.
-}
type InputTypeAndValue
    = Text String


{-| textInput
This will construct a text input with the value passed in.
    textInput "This appears in the text input."
-}
textInput : String -> InputTypeAndValue
textInput =
    Text


typeAndValueAttibutes : InputTypeAndValue -> List (Html.Attribute msg)
typeAndValueAttibutes typeAndValue =
    case typeAndValue of
        Text value_ ->
            [ type_ "text", value value_ ]


baseInput : Input msg -> Html msg
baseInput inputModel =
    input (typeAndValueAttibutes inputModel.typeAndValue ++ inputModel.attributes) []


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
