module Accessibility.KeySpec exposing (spec)

import Accessibility.Key exposing (..)
import Html exposing (..)
import Json.Decode exposing (Decoder)
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
    [ -- arrows
      expectEvent "left key" (withKey 37) Left
    , expectEvent "up key" (withKey 38) Up
    , expectEvent "right key" (withKey 39) Right
    , expectEvent "down key" (withKey 40) Down
    , -- arrows with shift
      expectEvent "left key+shift" (withShiftAndKey 37) ShiftLeft
    , expectEvent "up key+shift" (withShiftAndKey 38) ShiftUp
    , expectEvent "right key+shift" (withShiftAndKey 39) ShiftRight
    , expectEvent "down key+shift" (withShiftAndKey 40) ShiftDown
    , -- other
      expectEvent "enter key" (withKey 13) Enter
    , expectEvent "spacebar" (withKey 32) SpaceBar
    , expectEvent "tab key" (withKey 9) Tab
    , expectEvent "tab+shift" (withShiftAndKey 9) TabBack
    , expectEvent "escape key" (withKey 27) Escape
    ]


expectEvent : String -> Encode.Value -> Msg -> Test
expectEvent name keyState msg =
    describe (name ++ " produces " ++ msgToString msg)
        [ test "onKeyDown" <|
            \() ->
                view onKeyDown
                    |> Query.fromHtml
                    |> Event.simulate (keydown keyState)
                    |> Event.expect msg
        , test "onKeyDownPreventDefault" <|
            \() ->
                view onKeyDownPreventDefault
                    |> Query.fromHtml
                    |> Event.simulate (keydown keyState)
                    |> Event.expect msg
        , test "onKeyUp" <|
            \() ->
                view onKeyUp
                    |> Query.fromHtml
                    |> Event.simulate (keyup keyState)
                    |> Event.expect msg
        , test "onKeyUpPreventDefault" <|
            \() ->
                view onKeyUpPreventDefault
                    |> Query.fromHtml
                    |> Event.simulate (keyup keyState)
                    |> Event.expect msg
        ]


keydown : Encode.Value -> ( String, Encode.Value )
keydown =
    Event.custom "keydown"


keyup : Encode.Value -> ( String, Encode.Value )
keyup =
    Event.custom "keyup"


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


view : (List (Decoder Msg) -> Attribute Msg) -> Html Msg
view listener =
    div
        [ listener
            [ left Left
            , up Up
            , right Right
            , down Down
            , shiftLeft ShiftLeft
            , shiftUp ShiftUp
            , shiftRight ShiftRight
            , shiftDown ShiftDown
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
    | ShiftLeft
    | ShiftUp
    | ShiftRight
    | ShiftDown
    | Enter
    | Tab
    | TabBack
    | SpaceBar
    | Escape


msgToString : Msg -> String
msgToString msg =
    case msg of
        Left ->
            "Left"

        Up ->
            "Up"

        Right ->
            "Right"

        Down ->
            "Down"

        ShiftLeft ->
            "ShiftLeft"

        ShiftUp ->
            "ShiftUp"

        ShiftRight ->
            "ShiftRight"

        ShiftDown ->
            "ShiftDown"

        Enter ->
            "Enter"

        Tab ->
            "Tab"

        TabBack ->
            "TabBack"

        SpaceBar ->
            "SpaceBar"

        Escape ->
            "Escape"
