module Html.A11ySpec exposing (spec)

import Html exposing (..)
import Html.A11y exposing (..)
import Test.Html.Query as Query
import Test.Html.Selector as Selector
import Test exposing (..)


spec : Test
spec =
    describe "Html.Attributes.A11ySpec"
        [ describe "inputs" <|
            [ describe "leftLabeledInput" (inputTests leftLabeledInput)
            , describe "rightLabeledInput" (inputTests rightLabeledInput)
            , describe "invisibleLabeledInput" (inputTests ((flip invisibleLabeledInput) "input-id"))
            ]
        , describe "tabs" []
        , imagesTests
        ]


inputTests : (Input msg -> Html msg) -> List Test
inputTests toView =
    let
        queryView model =
            div [] [ toView model ]
                |> Query.fromHtml
    in
        [ describe "textInput" <|
            let
                mockInputModel =
                    { label = text "Name"
                    , typeAndValue = textInput "Tessa"
                    , attributes = []
                    }
            in
                [ baseInputTests (queryView mockInputModel)
                    { label = "Name", value = "Tessa", type_ = "text" }
                ]
        , describe "radioInput" <|
            let
                mockInputModel =
                    { label = text "Radio input"
                    , typeAndValue = radioInput "radio-group-name" "8" True
                    , attributes = []
                    }
            in
                [ baseInputTests (queryView mockInputModel)
                    { label = "Radio input", value = "8", type_ = "radio" }
                , test "is checked" <|
                    \() ->
                        queryView mockInputModel
                            |> Query.find [ Selector.tag "input" ]
                            |> Query.has [ Selector.boolAttribute "checked" True ]
                ]
        , describe "checkboxInput" <|
            let
                mockInputModel maybeSelected =
                    { label = text "To check or not to check?"
                    , typeAndValue = checkboxInput "some sick value" maybeSelected
                    , attributes = []
                    }
            in
                [ baseInputTests (queryView <| mockInputModel (Just True))
                    { label = "To check or not to check?", value = "some sick value", type_ = "checkbox" }
                , test "is checked" <|
                    \() ->
                        queryView (mockInputModel (Just True))
                            |> Query.find [ Selector.tag "input" ]
                            |> Query.has [ Selector.boolAttribute "checked" True ]
                , test "is not checked" <|
                    \() ->
                        queryView (mockInputModel (Just False))
                            |> Query.find [ Selector.tag "input" ]
                            |> Query.has [ Selector.boolAttribute "checked" False ]
                , test "is indeterminate" <|
                    \() ->
                        queryView (mockInputModel Nothing)
                            |> Query.find [ Selector.tag "input" ]
                            |> Query.has [ Selector.boolAttribute "indeterminate" True ]
                ]
        ]


baseInputTests : Query.Single -> { label : String, value : String, type_ : String } -> Test
baseInputTests queryView { label, value, type_ } =
    describe "Basic input tests"
        [ test "has label with the given label text" <|
            \() ->
                queryView
                    |> Query.find [ Selector.tag "label" ]
                    |> Query.has [ Selector.text label ]
        , test "has input with the appropriate value" <|
            \() ->
                queryView
                    |> Query.find [ Selector.tag "input" ]
                    |> Query.has [ Selector.attribute "value" value ]
        , test "is an input of the appropriate type" <|
            \() ->
                queryView
                    |> Query.find [ Selector.tag "input" ]
                    |> Query.has [ Selector.attribute "type" type_ ]
        ]


imagesTests : Test
imagesTests =
    let
        queryView view =
            div [] [ Html.A11y.figure [] [ view ] ]
                |> Query.fromHtml
                |> Query.find [ Selector.tag "img" ]
    in
        describe "images"
            [ describe "img"
                [ test "has alt text" <|
                    \() ->
                        queryView (Html.A11y.img "Birthday cake" [])
                            |> Query.has [ Selector.attribute "alt" "Birthday cake" ]
                ]
            , describe "decorativeImg"
                [ test "has empty alt text" <|
                    \() ->
                        queryView (decorativeImg [])
                            |> Query.has [ Selector.attribute "alt" "" ]
                ]
            ]
