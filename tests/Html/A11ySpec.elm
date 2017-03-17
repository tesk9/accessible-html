module Html.A11ySpec exposing (spec)

import Expect
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
        [ describe "textInput"
            [ test "has label with the given label text" <|
                \() ->
                    queryView (textInput "Tessa")
                        |> Query.find [ Selector.tag "label" ]
                        |> Query.has [ Selector.text "Name" ]
            , test "has input with the appropriate value" <|
                \() ->
                    queryView (textInput "Tessa")
                        |> Query.find [ Selector.tag "input" ]
                        |> Query.has [ Selector.attribute "value" "Tessa" ]
            , test "is an input of the appropriate type" <|
                \() ->
                    queryView (textInput "")
                        |> Query.find [ Selector.tag "input" ]
                        |> Query.has [ Selector.attribute "type" "text" ]
            ]
        ]
