module Tabs
    exposing
        ( tabList
        , tab
        , tabPanel
        )

import Html exposing (..)
import Html.Attributes exposing (..)
import Role exposing (Role(..), role)


-- TODO these belong in A11y


tabList : List (Html.Attribute msg) -> List (Html msg) -> Html msg
tabList attributes children =
    div (role Tablist :: attributes) children


tab : List (Html.Attribute msg) -> List (Html msg) -> Html msg
tab attributes children =
    div (role Tab :: tabindex 0 :: attributes) children


tabPanel : List (Html.Attribute msg) -> List (Html msg) -> Html msg
tabPanel attributes children =
    div (role Tabpanel :: attributes) children
