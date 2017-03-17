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
        mockInputModel =
            { label = text "Name"
            , type_ = "text"
            , value = "Tessa"
            , attributes = []
            }

        queryView =
            div [] [ toView mockInputModel ]
                |> Query.fromHtml
    in
        [ test "has label with the given label text" <|
            \() ->
                queryView
                    |> Query.find [ Selector.tag "label" ]
                    |> Query.has [ Selector.text "Name" ]
        , test "has input with the appropriate value" <|
            \() ->
                queryView
                    |> Query.find [ Selector.tag "input" ]
                    |> Query.has [ Selector.attribute "value" "Tessa" ]
        ]
