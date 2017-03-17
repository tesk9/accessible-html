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
            ]
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
                [ test "has label with the given label text" <|
                    \() ->
                        queryView mockInputModel
                            |> Query.find [ Selector.tag "label" ]
                            |> Query.has [ Selector.text "Name" ]
                , test "has input with the appropriate value" <|
                    \() ->
                        queryView mockInputModel
                            |> Query.find [ Selector.tag "input" ]
                            |> Query.has [ Selector.attribute "value" "Tessa" ]
                , test "is an input of the appropriate type" <|
                    \() ->
                        queryView mockInputModel
                            |> Query.find [ Selector.tag "input" ]
                            |> Query.has [ Selector.attribute "type" "text" ]
                ]
        , describe "radioInput" <|
            let
                mockInputModel =
                    { label = text "Name"
                    , typeAndValue = radioInput "radio-group-name" "8" True
                    , attributes = []
                    }
            in
                [ test "has label with the given label text" <|
                    \() ->
                        queryView mockInputModel
                            |> Query.find [ Selector.tag "label" ]
                            |> Query.has [ Selector.text "Name" ]
                , test "has input with the appropriate value" <|
                    \() ->
                        queryView mockInputModel
                            |> Query.find [ Selector.tag "input" ]
                            |> Query.has [ Selector.attribute "value" "8" ]
                , test "is an input of the appropriate type" <|
                    \() ->
                        queryView mockInputModel
                            |> Query.find [ Selector.tag "input" ]
                            |> Query.has [ Selector.attribute "type" "radio" ]
                , test "is checked" <|
                    \() ->
                        queryView mockInputModel
                            |> Query.find [ Selector.tag "input" ]
                            |> Query.has [ Selector.boolAttribute "checked" True ]
                ]
        ]
