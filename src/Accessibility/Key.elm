module Accessibility.Key exposing (enter, left, onKeyDown, right)

{-|


## Keyboard event listener

@docs onKeyDown


## Decoders

@docs enter, right, left

-}

import Html exposing (Attribute)
import Html.Events exposing (keyCode, on)
import Json.Decode


{-| Pass a list of decoders.

    onKeyDown [ enter TheyHitEnterDoSomething, left DoSomeOtherThing ]

-}
onKeyDown : List (Json.Decode.Decoder msg) -> Attribute msg
onKeyDown decoders =
    on "keydown" (Json.Decode.oneOf decoders)


{-| Use with `onKeyDown` to succeed when user hits the Enter key.

    onKeyDown [ enter TheyHitEnterDoSomething ]

-}
enter : msg -> Json.Decode.Decoder msg
enter msg =
    succeedForKeyCode 13 msg


{-| Use with `onKeyDown` to succeed when user hits the left arrow key.

    onKeyDown [ left Left ]

-}
left : msg -> Json.Decode.Decoder msg
left msg =
    succeedForKeyCode 37 msg


{-| Use with `onKeyDown` to succeed when user hits the right arrow key.

    onKeyDown [ right Right ]

-}
right : msg -> Json.Decode.Decoder msg
right msg =
    succeedForKeyCode 39 msg


succeedForKeyCode : Int -> msg -> Json.Decode.Decoder msg
succeedForKeyCode key msg =
    Json.Decode.andThen
        (\keyCode ->
            if keyCode == key then
                Json.Decode.succeed msg
            else
                Json.Decode.fail (toString keyCode)
        )
        keyCode
