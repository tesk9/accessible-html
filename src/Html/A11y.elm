module Html.A11y
    exposing
        ( Input
        , textInput
        , radioInput
        , leftLabeledInput
        , rightLabeledInput
        )

{-|
@docs Input, textInput, radioInput, leftLabeledInput, rightLabeledInput
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
Use helpers like `textInput` and `radioInput` to create InputTypeAndValue items.
-}
type InputTypeAndValue
    = Text String
    | Radio String String Bool


{-| textInput
This will construct a text input with the value passed in.
    textInput "This appears in the text input."
-}
textInput : String -> InputTypeAndValue
textInput =
    Text


{-| radioInput
This will construct a radio input. The first argument is the radio group name
in common across radio items. THe second argument is the value of the radio.
The third is whether the radio is checked or not.
    radioInput "radio_name" "This is the actual value of the radio." True
-}
radioInput : String -> String -> Bool -> InputTypeAndValue
radioInput =
    Radio


typeAndValueAttibutes : InputTypeAndValue -> List (Html.Attribute msg)
typeAndValueAttibutes typeAndValue =
    case typeAndValue of
        Text value_ ->
            [ type_ "text", value value_ ]

        Radio name_ value_ checked_ ->
            [ type_ "radio", name name_, value value_, checked checked_ ]


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
