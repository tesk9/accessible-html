module Html.Attributes.A11ySpec exposing (spec)

import Html exposing (..)
import Html.Attributes.A11y exposing (..)
import Test exposing (..)
import Test.Html.Query as Query
import Test.Html.Selector as Selector


spec : Test
spec =
    describe "Html.Attributes.A11ySpec"
        [ describe "role" [ addsRole Tablist "tablist" ] ]


addsRole : Role -> String -> Test
addsRole role_ expected =
    test ("sets the role attribute: " ++ toString role_) <|
        \() ->
            div [] [ div [ role role_ ] [] ]
                |> Query.fromHtml
                |> Query.has [ Selector.attribute "role" expected ]
