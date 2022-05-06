module Views.Tabs exposing (Model, view, update, Msg(..))

{-|

@docs Model, view, update, Msg

-}

import Accessibility as Html exposing (..)
import Accessibility.Aria exposing (controls, labelledBy)
import Accessibility.Key exposing (enter, left, onKeyDown, right)
import Html.Attributes exposing (class, classList, id, style)
import Html.Events exposing (onClick)
import List.Zipper as Zipper exposing (Zipper)


{-| Create a tab interface. Pass in a unique id and a zipper of (tab header content, panel content) pairs.
-}
view : Model -> Html Msg
view { groupId, tabPanels } =
    let
        ( tabs, panels ) =
            tabPanels
                |> Zipper.map tabAndPanel
                |> Zipper.mapBefore (List.map (setSection "previous-"))
                |> Zipper.mapCurrent (setSelected >> setSection "current-")
                |> Zipper.mapAfter (List.map (setSection "upcoming-"))
                |> Zipper.map (\item -> ( viewTab groupId item, viewPanel groupId item ))
                |> Zipper.toList
                |> List.unzip
    in
    div
        [ style "width" "768px"
        , style "margin" "20px auto"
        ]
        [ div []
            (tabList
                [ id groupId
                , style "display" "flex"
                , style "justify-content" "space-between"
                ]
                tabs
                :: panels
            )
        ]


tabId : String -> String -> Int -> String
tabId groupId section identifier =
    groupId ++ "-tab-" ++ section ++ String.fromInt identifier


panelId : String -> String -> Int -> String
panelId groupId section identifier =
    groupId ++ "-tabPanel-" ++ section ++ String.fromInt identifier


viewTab : String -> TabAndPanel -> Html Msg
viewTab groupId { tabContent, isSelected, section, identifier } =
    let
        tabStyles =
            [ style "border" "1px solid black"
            , style "border-top-left-radius" "8px"
            , style "border-top-right-radius" "8px"
            , style "min-width" "150px"
            , style "text-align" "center"
            , style "z-index" "1"
            ]
                ++ (if isSelected then
                        [ style "border-bottom-color" "white"
                        , style "background-color" "white"
                        ]

                    else
                        [ style "background-color" "light-gray" ]
                   )
    in
    tab
        ([ id (tabId groupId section identifier)
         , onClick (SelectCurrentTab identifier)
         , onKeyDown
            [ enter (SelectCurrentTab identifier)
            , left SelectPreviousTab
            , right SelectNextTab
            ]
         , controls [panelId groupId section identifier]
         ]
            ++ tabStyles
        )
        [ Html.map never tabContent ]


viewPanel : String -> TabAndPanel -> Html Msg
viewPanel groupId { panelContent, isSelected, section, identifier } =
    let
        panelStyles =
            [ style "border" "1px solid black"
            , style "border-bottom-radius" "8px"
            , style "position" "relative"
            , style "top" "-1px"
            , style "padding" "30px"
            ]
    in
    tabPanel
        ([ id (panelId groupId section identifier)
         , labelledBy (tabId groupId section identifier)
         , Html.Attributes.hidden (not isSelected)
         ]
            ++ panelStyles
        )
        [ Html.map never panelContent ]


{-| The model contains tabpanels and the groupid for the tab collection.
-}
type alias Model =
    { tabPanels : TabPanels
    , groupId : String
    }


{-| Zipper tabs are represented as a Zipper with an id, tab html, and tab panel html.
-}
type alias TabPanels =
    Zipper ( Int, Html Never, Html Never )


{-| Internal represenation of a tab/panel pair.
-}
type alias TabAndPanel =
    { identifier : Int
    , tabContent : Html Never
    , panelContent : Html Never
    , section : String
    , isSelected : Bool
    }


{-| Initialize a pre-selection and pre-section tab/panel pair.
-}
tabAndPanel : ( Int, Html Never, Html Never ) -> TabAndPanel
tabAndPanel ( id, tabContent, panelContent ) =
    { identifier = id
    , tabContent = tabContent
    , panelContent = panelContent
    , section = ""
    , isSelected = False
    }


{-| Set a TabAndPanel section to be the given string.
-}
setSection : String -> TabAndPanel -> TabAndPanel
setSection section record =
    { record | section = section }



--{-| Set a TabAndPanel to be selected.
---}


setSelected : TabAndPanel -> TabAndPanel
setSelected record =
    { record | isSelected = True }


{-| Msg for tabs.
-}
type Msg
    = NoOp
    | SelectPreviousTab
    | SelectCurrentTab Int
    | SelectNextTab


{-| Map over this to select a tab.
-}
update : Msg -> Model -> Model
update msg model =
    case msg of
        NoOp ->
            model

        SelectPreviousTab ->
            model.tabPanels
                |> Zipper.previous
                |> Maybe.withDefault (Zipper.last model.tabPanels)
                |> updateTabPanels model

        SelectCurrentTab identifier ->
            model.tabPanels
                |> Zipper.first
                |> Zipper.find (\( id, _, _ ) -> id == identifier)
                |> Maybe.withDefault model.tabPanels
                |> updateTabPanels model

        SelectNextTab ->
            model.tabPanels
                |> Zipper.next
                |> Maybe.withDefault (Zipper.first model.tabPanels)
                |> updateTabPanels model


updateTabPanels : Model -> TabPanels -> Model
updateTabPanels model newTabPanels =
    { model | tabPanels = newTabPanels }
