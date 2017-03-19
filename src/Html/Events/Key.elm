module Html.Events.Key exposing (onEnter, onRight, onLeft)

{-|
@docs onEnter, onRight, onLeft
-}

import Html exposing (Attribute)
import Html.Events exposing (on, keyCode)
import Json.Decode


onKeyDown : Json.Decode.Decoder msg -> Attribute msg
onKeyDown =
    on "keydown"


succeedForKeyCode : Int -> msg -> Json.Decode.Decoder msg
succeedForKeyCode key msg =
    (Json.Decode.andThen
        (\keyCode ->
            if keyCode == key then
                Json.Decode.succeed msg
            else
                Json.Decode.fail (toString keyCode)
        )
        keyCode
    )


{-| Listener for enter keydown.
-}
onEnter : msg -> Attribute msg
onEnter msg =
    onKeyDown (succeedForKeyCode 13 msg)


{-| Listener for left arrow keydown.
-}
onLeft : msg -> Attribute msg
onLeft msg =
    onKeyDown (succeedForKeyCode 37 msg)


{-| Listener for right arrow keydown.
-}
onRight : msg -> Attribute msg
onRight msg =
    onKeyDown (succeedForKeyCode 39 msg)
