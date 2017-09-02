module AccessibilitySpec exposing (imageSpec, inputSpec)

import Accessibility exposing (..)
import Html exposing (text)
import Html.Attributes as Attribute
import Test exposing (..)
import Test.Html.Query as Query
import Test.Html.Selector as Selector


inputSpec : Test
inputSpec =
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


baseInputTests : { label : String, value : String, type_ : String } -> Html.Html msg -> Test
baseInputTests { label, value, type_ } view =
    let
        queryView =
            Html.div [] [ figure [] [ view ] ]
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
                    |> Query.has [ Selector.attribute <| Attribute.value value ]
        , test "is an input of the appropriate type" <|
            \() ->
                queryView
                    |> Query.find [ Selector.tag "input" ]
                    |> Query.has [ Selector.attribute <| Attribute.type_ type_ ]
        ]


imageSpec : Test
imageSpec =
    let
        queryView view =
            Html.div [] [ Accessibility.figure [] [ view ] ]
                |> Query.fromHtml
                |> Query.find [ Selector.tag "img" ]
    in
    describe "images"
        [ describe "img"
            [ test "has alt text" <|
                \() ->
                    queryView (Accessibility.img "Birthday cake" [])
                        |> Query.has [ Selector.attribute <| Attribute.alt "Birthday cake" ]
            ]
        , describe "decorativeImg"
            [ test "has empty alt text" <|
                \() ->
                    queryView (decorativeImg [])
                        |> Query.has [ Selector.attribute <| Attribute.alt "" ]
            ]
        ]
