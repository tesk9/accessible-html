module Tags.Inputs
    exposing
        ( Input
        , InputTypeAndValue
        , textInput
        , radioInput
        , checkboxInput
        , leftLabeledInput
        , rightLabeledInput
        , invisibleLabeledInput
        )

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Attributes.A11y as A11y
import Maybe.Extra


type alias Input msg =
    { label : Html msg
    , typeAndValue : InputTypeAndValue
    , attributes : List (Html.Attribute msg)
    }


type InputTypeAndValue
    = Text String
    | Radio String String Bool
    | Checkbox String (Maybe Bool)


textInput : String -> InputTypeAndValue
textInput =
    Text


radioInput : String -> String -> Bool -> InputTypeAndValue
radioInput =
    Radio


checkboxInput : String -> Maybe Bool -> InputTypeAndValue
checkboxInput =
    Checkbox


typeAndValueAttibutes : InputTypeAndValue -> List (Html.Attribute msg)
typeAndValueAttibutes typeAndValue =
    case typeAndValue of
        Text value_ ->
            [ type_ "text", value value_ ]

        Radio name_ value_ checked_ ->
            [ type_ "radio", name name_, value value_, checked checked_ ]

        Checkbox value_ maybe_checked ->
            [ type_ "checkbox", value value_, Maybe.Extra.unwrap A11y.indeterminate checked maybe_checked ]


baseInput : Input msg -> Html msg
baseInput inputModel =
    input (typeAndValueAttibutes inputModel.typeAndValue ++ inputModel.attributes) []


leftLabeledInput : Input msg -> Html msg
leftLabeledInput inputModel =
    label
        []
        [ inputModel.label
        , baseInput inputModel
        ]


rightLabeledInput : Input msg -> Html msg
rightLabeledInput inputModel =
    label
        []
        [ baseInput inputModel
        , inputModel.label
        ]


invisibleLabeledInput : Input msg -> String -> Html msg
invisibleLabeledInput inputModel id_ =
    span
        []
        [ label [ A11y.invisible, for id_ ] [ inputModel.label ]
        , input
            (typeAndValueAttibutes inputModel.typeAndValue
                ++ id id_
                :: inputModel.attributes
            )
            []
        ]
