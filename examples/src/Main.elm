module Main exposing (main)

{-|

@docs main

-}

import Accessibility exposing (..)
import Browser exposing (sandbox)
import Html.Attributes exposing (style)
import List.Zipper
import Views.Images as Images
import Views.Inputs as Inputs
import Views.Tabs as Tabs


main : Program () Model Msg
main =
    sandbox
        { init =
            { tabsModel =
                { tabPanels =
                    List.Zipper.Zipper []
                        ( 0, sectionHeader "Inputs", Inputs.view )
                        [ ( 1, sectionHeader "Images", Images.view ) ]
                , groupId = "examples-container"
                }
            }
        , view = view
        , update = update
        }



{- MODEL -}


type alias Model =
    { tabsModel : Tabs.Model
    }


tabsModel : Tabs.Model
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
        [ style "margin" "0 20px" ]
        [ h1 [] [ text "Accessible Html Examples" ]
        , map TabsMsg <| Tabs.view model.tabsModel
        ]


sectionHeader : String -> Html msg
sectionHeader header =
    h2 [] [ text header ]



{- UPDATE -}


type Msg
    = NoOp
    | TabsMsg Tabs.Msg


update : Msg -> Model -> Model
update msg model =
    case msg of
        NoOp ->
            model

        TabsMsg tabsMsg ->
            { model | tabsModel = Tabs.update tabsMsg model.tabsModel }
