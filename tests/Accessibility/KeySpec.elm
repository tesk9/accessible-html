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
                    |> Event.simulate (keydown 37)
                    |> Event.expect Left
        , test "right key produces expected Msg" <|
            \() ->
                view
                    |> Query.fromHtml
                    |> Event.simulate (keydown 39)
                    |> Event.expect Right
        , test "enter key produces expected Msg" <|
            \() ->
                view
                    |> Query.fromHtml
                    |> Event.simulate (keydown 13)
                    |> Event.expect Enter
        ]


keydown : Int -> ( String, Encode.Value )
keydown keycode =
    Event.custom "keydown" (Encode.object [ ( "keyCode", Encode.int keycode ) ])


view : Html Msg
view =
    div
        [ onKeyDown
            [ left Left
            , right Right
            , enter Enter
            ]
        ]
        []


type Msg
    = Left
    | Right
    | Enter
