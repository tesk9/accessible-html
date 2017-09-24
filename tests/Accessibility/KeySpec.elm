module Accessibility.KeySpec exposing (spec)

import Accessibility.Key exposing (..)
import Html exposing (..)
import Json.Encode as Encode
import Test exposing (..)
import Test.Html.Event as Event
import Test.Html.Query as Query


spec : Test
spec =
    describe "Accessibility.Key"
        [ test "left key produces expected Msg" <|
            \() ->
                view
                    |> Query.fromHtml
                    |> Event.simulate (keydown <| withKey 37)
                    |> Event.expect Left
        , test "right key produces expected Msg" <|
            \() ->
                view
                    |> Query.fromHtml
                    |> Event.simulate (keydown <| withKey 39)
                    |> Event.expect Right
        , test "enter key produces expected Msg" <|
            \() ->
                view
                    |> Query.fromHtml
                    |> Event.simulate (keydown <| withKey 13)
                    |> Event.expect Enter
        , test "spacebar produces expected Msg" <|
            \() ->
                view
                    |> Query.fromHtml
                    |> Event.simulate (keydown <| withKey 32)
                    |> Event.expect SpaceBar
        , test "tab key produces expected Msg" <|
            \() ->
                view
                    |> Query.fromHtml
                    |> Event.simulate (keydown <| withKey 9)
                    |> Event.expect Tab
        , test "tab+shift produces expected Msg" <|
            \() ->
                view
                    |> Query.fromHtml
                    |> Event.simulate (keydown <| withShiftAndKey 9)
                    |> Event.expect TabBack
        ]


expectEvent : String -> Encode.Value -> Msg -> Test
expectEvent name keyState msg =
    test name <|
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
            , right Right
            , enter Enter
            , tab Tab
            , tabBack TabBack
            , space SpaceBar
            ]
        ]
        []


type Msg
    = Left
    | Right
    | Enter
    | Tab
    | TabBack
    | SpaceBar
