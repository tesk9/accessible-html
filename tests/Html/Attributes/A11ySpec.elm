module Html.Attributes.A11ySpec exposing (spec)

import Html exposing (..)
import Html.Attributes.A11y exposing (..)
import Test exposing (..)
import Test.Html.Query as Query
import Test.Html.Selector as Selector


spec : Test
spec =
    describe "Html.Attributes.A11ySpec"
        [ describe "role" [ addsRole "tablist" ] ]


addsRole : String -> Test
addsRole role_ =
    test ("sets the role attribute: " ++ role_) <|
        \() ->
            div [] [ div [ role role_ ] [] ]
                |> Query.fromHtml
                |> Query.has [ Selector.attribute "role" role_ ]
