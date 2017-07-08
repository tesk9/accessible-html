module Html.A11ySpec exposing (spec)

import Html exposing (..)
import Html.A11y exposing (..)
import Test exposing (..)
import Test.Html.Query as Query
import Test.Html.Selector as Selector


spec : Test
spec =
    describe "Html.Attributes.A11ySpec"
        [ inputsTests
        , describe "tabs" []
        , imagesTests
        ]


inputsTests : Test
inputsTests =
    describe "inputs" <|
        [ describe "text inputs" <|
            let
                expected =
                    { label = "the label"
                    , value = "the value"
                    , type_ = "text"
                    }
            in
            [ describe "textLeftLabeled"
                [ baseInputTests expected <|
                    textLeftLabeled "the value" [] (text "the label")
                ]
            , describe "textRightLabeled"
                [ baseInputTests expected <|
                    textRightLabeled "the value" [] (text "the label")
                ]
            , describe "textInvisibleLabel"
                [ baseInputTests expected <|
                    textInvisibleLabel "id" "the value" [] (text "the label")
                ]
            ]
        , describe "radio inputs" <|
            let
                expected =
                    { label = "the label"
                    , value = "the value"
                    , type_ = "radio"
                    }
            in
            [ describe "radioLeftLabeled"
                [ baseInputTests expected <|
                    radioLeftLabeled "group_name" "the value" True [] (text "the label")
                ]
            , describe "radioRightLabeled"
                [ baseInputTests expected <|
                    radioRightLabeled "group_name" "the value" True [] (text "the label")
                ]
            , describe "radioInvisibleLabel"
                [ baseInputTests expected <|
                    radioInvisibleLabel "group_name" "id" "the value" True [] (text "the label")
                ]
            ]
        , describe "checkbox inputs" <|
            let
                expected =
                    { label = "the label"
                    , value = "the value"
                    , type_ = "checkbox"
                    }
            in
            [ describe "checkBoxLeftLabeled"
                [ baseInputTests expected <|
                    checkBoxLeftLabeled "the value" (Just True) [] (text "the label")
                ]
            , describe "checkBoxRightLabeled"
                [ baseInputTests expected <|
                    checkBoxRightLabeled "the value" (Just True) [] (text "the label")
                ]
            , describe "checkBoxInvisibleLabel"
                [ baseInputTests expected <|
                    checkBoxInvisibleLabel "id" "the value" (Just True) [] (text "the label")
                ]
            ]
        ]


baseInputTests : { label : String, value : String, type_ : String } -> Html msg -> Test
baseInputTests { label, value, type_ } view =
    let
        queryView =
            div [] [ Html.A11y.figure [] [ view ] ]
                |> Query.fromHtml
    in
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
