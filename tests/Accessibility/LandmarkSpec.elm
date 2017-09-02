module Accessibility.LandmarkSpec exposing (spec)

import Accessibility.Landmark exposing (..)
import Html
import Html.Attributes
import Json.Encode
import Test exposing (..)
import Test.Html.Query as Query
import Test.Html.Selector as Selector


spec : Test
spec =
    describe "Accessibility.Landmark" <|
        List.map (uncurry addsRole)
            [ ( application, "application" )
            , ( banner, "banner" )
            , ( complementary, "complementary" )
            , ( contentInfo, "contentinfo" )
            , ( form, "form" )
            , ( main_, "main" )
            , ( navigation, "navigation" )
            , ( region, "region" )
            , ( search, "search" )
            ]


addsRole : Html.Attribute msg -> String -> Test
addsRole role_ expected =
    test ("sets the role attribute: " ++ toString role_) <|
        \() ->
            Html.div [] [ Html.div [ role_ ] [] ]
                |> Query.fromHtml
                |> Query.has
                    [ Selector.attribute <|
                        Html.Attributes.property "role" (Json.Encode.string expected)
                    ]
