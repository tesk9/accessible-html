module Accessibility.LandmarkSpec exposing (spec)

import Accessibility exposing (div)
import Accessibility.Landmark exposing (..)
import Html exposing (Attribute)
import Html.Attributes exposing (property)
import Json.Encode
import Test exposing (..)
import Test.Html.Query as Query
import Test.Html.Selector as Selector


spec : Test
spec =
    describe "Accessibility.Landmark" <|
        List.map (\( a, b ) -> addsRole a b)
            [ ( banner, "banner" )
            , ( complementary, "complementary" )
            , ( contentInfo, "contentinfo" )
            , ( form, "form" )
            , ( main_, "main" )
            , ( navigation, "navigation" )
            , ( region, "region" )
            , ( search, "search" )
            ]


addsRole : Attribute Never -> String -> Test
addsRole role_ expected =
    test ("sets the role attribute: " ++ expected) <|
        \() ->
            div [] [ div [ role_ ] [] ]
                |> Query.fromHtml
                |> Query.has
                    [ Selector.attribute <|
                        property "role" (Json.Encode.string expected)
                    ]
