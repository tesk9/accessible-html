module Main exposing (main)

{-|

@docs main

-}

import Accessibility exposing (..)
import Html exposing (beginnerProgram)
import Html.CssHelpers
import List.Zipper
import Styles exposing (..)
import Tabs.Model
import Tabs.Update
import Tabs.View
import Views.Images as Images
import Views.Inputs as Inputs


main : Program Never Model Msg
main =
    beginnerProgram
        { model = model
        , view = view
        , update = update
        }



{- MODEL -}


type alias Model =
    { tabsModel : Tabs.Model.Model }


model : Model
model =
    { tabsModel = tabsModel }


tabsModel : Tabs.Model.Model
tabsModel =
    { tabPanels =
        List.Zipper.Zipper []
            ( 0, sectionHeader "Inputs", Inputs.view )
            [ ( 1, sectionHeader "Images", Images.view ) ]
    , groupId = "examples-container"
    }



{- VIEW -}


view : Model -> Html Msg
view model =
    div
        [ class [ Container ] ]
        [ Html.CssHelpers.style css
        , h1 [] [ text "Accessible Html Examples" ]
        , Html.map TabsMsg <| Tabs.View.view model.tabsModel
        ]


sectionHeader : String -> Html msg
sectionHeader header =
    h2 [] [ text header ]



{- UPDATE -}


type Msg
    = NoOp
    | TabsMsg Tabs.Update.Msg


update : Msg -> Model -> Model
update msg model =
    case msg of
        NoOp ->
            model

        TabsMsg tabsMsg ->
            { model | tabsModel = Tabs.Update.update tabsMsg model.tabsModel }
