module Accessibility.KeySpec exposing (spec)

import Accessibility.Key exposing (..)
import Html exposing (..)
import Json.Encode as Encode
import SpecHelpers exposing (expectAttribute)
import Test exposing (..)
import Test.Html.Event as Event
import Test.Html.Query as Query


spec : Test
spec =
    describe "Accessibility.Key"
        [ describe "tabbable" tabbableSpec
        , describe "keys" keys
        ]


tabbableSpec : List Test
tabbableSpec =
    [ test "tabbable True" <|
        expectAttribute ( tabbable, True ) ( "tabIndex", "0" )
    , test "tabbable False" <|
        expectAttribute ( tabbable, False ) ( "tabIndex", "-1" )
    ]


keys : List Test
keys =
    [ expectEvent "left key" (withKey 37) Left
    , expectEvent "up key" (withKey 38) Up
    , expectEvent "right key" (withKey 39) Right
    , expectEvent "down key" (withKey 40) Down
    , expectEvent "enter key" (withKey 13) Enter
    , expectEvent "spacebar" (withKey 32) SpaceBar
    , expectEvent "tab key" (withKey 9) Tab
    , expectEvent "tab+shift" (withShiftAndKey 9) TabBack
    , expectEvent "escape key" (withKey 27) Escape
    ]


expectEvent : String -> Encode.Value -> Msg -> Test
expectEvent name keyState msg =
    test (name ++ " produces " ++ Debug.toString msg) <|
        \() ->
            view
                |> Query.fromHtml
                |> Event.simulate (keydown keyState)
                |> Event.expect msg


keydown : Encode.Value -> ( String, Encode.Value )
keydown =
    Event.custom "keydown"


withKey : Int -> Encode.Value
withKey keycode =
    Encode.object [ keyCode keycode, shiftKey False ]


withShiftAndKey : Int -> Encode.Value
withShiftAndKey keycode =
    Encode.object [ keyCode keycode, shiftKey True ]


keyCode : Int -> ( String, Encode.Value )
keyCode keycode =
    ( "keyCode", Encode.int keycode )


shiftKey : Bool -> ( String, Encode.Value )
shiftKey pressed =
    ( "shiftKey", Encode.bool pressed )


view : Html Msg
view =
    div
        [ onKeyDown
            [ left Left
            , up Up
            , right Right
            , down Down
            , enter Enter
            , tab Tab
            , tabBack TabBack
            , space SpaceBar
            , escape Escape
            ]
        ]
        []


type Msg
    = Left
    | Up
    | Right
    | Down
    | Enter
    | Tab
    | TabBack
    | SpaceBar
    | Escape
