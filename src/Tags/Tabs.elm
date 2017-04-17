module Tags.Tabs
    exposing
        ( tabList
        , tab
        , tabPanel
        )

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Attributes.A11y as A11y


-- TODO these belong in A11y


tabList : List (Html.Attribute msg) -> List (Html msg) -> Html msg
tabList attributes children =
    div (A11y.tabList :: attributes) children


tab : List (Html.Attribute msg) -> List (Html msg) -> Html msg
tab attributes children =
    div (A11y.tab :: tabindex 0 :: attributes) children


tabPanel : List (Html.Attribute msg) -> List (Html msg) -> Html msg
tabPanel attributes children =
    div (A11y.tabPanel :: attributes) children
