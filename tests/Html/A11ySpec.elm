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
        mockInputModel inputTypeAndValue =
            { label = text "Name"
            , typeAndValue = inputTypeAndValue
            , attributes = []
            }

        queryView inputTypeAndValue =
            div [] [ toView (mockInputModel inputTypeAndValue) ]
                |> Query.fromHtml
    in
        [ describe "textInput" <|
            let
                view =
                    queryView (textInput "Tessa")
            in
                [ test "has label with the given label text" <|
                    \() ->
                        view
                            |> Query.find [ Selector.tag "label" ]
                            |> Query.has [ Selector.text "Name" ]
                , test "has input with the appropriate value" <|
                    \() ->
                        view
                            |> Query.find [ Selector.tag "input" ]
                            |> Query.has [ Selector.attribute "value" "Tessa" ]
                , test "is an input of the appropriate type" <|
                    \() ->
                        view
                            |> Query.find [ Selector.tag "input" ]
                            |> Query.has [ Selector.attribute "type" "text" ]
                ]
        , describe "radioInput" <|
            let
                view =
                    queryView (radioInput "radio-group-name" "8")
            in
                [ test "has label with the given label text" <|
                    \() ->
                        view
                            |> Query.find [ Selector.tag "label" ]
                            |> Query.has [ Selector.text "Name" ]
                , test "has input with the appropriate value" <|
                    \() ->
                        view
                            |> Query.find [ Selector.tag "input" ]
                            |> Query.has [ Selector.attribute "value" "8" ]
                , test "is an input of the appropriate type" <|
                    \() ->
                        view
                            |> Query.find [ Selector.tag "input" ]
                            |> Query.has [ Selector.attribute "type" "radio" ]
                ]
        ]
