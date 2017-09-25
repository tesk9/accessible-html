module Accessibility.Key
    exposing
        ( down
        , enter
        , escape
        , left
        , onKeyDown
        , right
        , space
        , tab
        , tabBack
        , tabbable
        , up
        )

{-|


## Managing focus

@docs tabbable


## Keyboard event listener

@docs onKeyDown


## Decoders


### Navigation

@docs tab, tabBack

@docs up, right, down, left


### Activation

@docs enter, space


### Deactivation

@docs escape

-}

import Html exposing (Attribute)
import Html.Attributes
import Html.Events exposing (keyCode, on)
import Json.Decode as Json


{-| Add or remove an element from the normal flow of tabbable/focusable elements.

`tabbable True` will set the tabindex to 0, and `tabbable False` will set the
tabindex to -1.

You may use Html.Attributes.tabindex if you need to control the tab order more
explicitly, but you may want to restructure your HTML to match how you want
users to interact with it instead.

-}
tabbable : Bool -> Attribute msg
tabbable isTabbable =
    if isTabbable then
        Html.Attributes.tabindex 0
    else
        Html.Attributes.tabindex -1


{-| Pass a list of decoders.

    onKeyDown [ enter TheyHitEnterDoSomething, left DoSomeOtherThing ]

-}
onKeyDown : List (Json.Decoder msg) -> Attribute msg
onKeyDown decoders =
    on "keydown" (Json.oneOf decoders)



-- ACTIVATION


{-| Use with `onKeyDown` to succeed when user hits the Enter key.

    onKeyDown [ enter TheyHitEnterDoSomething ]

-}
enter : msg -> Json.Decoder msg
enter msg =
    succeedForKeyCode 13 msg


{-| Use with `onKeyDown` to succeed when user hits the spacebar.

    onKeyDown [ space SpaceBar ]

-}
space : msg -> Json.Decoder msg
space msg =
    succeedForKeyCode 32 msg



-- DEACTIVATION


{-| Use with `onKeyDown` to succeed when user hits `esc`.

    onKeyDown [ escape CloseModal ]

-}
escape : msg -> Json.Decoder msg
escape msg =
    succeedForKeyCode 27 msg



-- ARROW KEYS


{-| Use with `onKeyDown` to succeed when user hits the left arrow key.

    onKeyDown [ left Left ]

-}
left : msg -> Json.Decoder msg
left msg =
    succeedForKeyCode 37 msg


{-| Use with `onKeyDown` to succeed when user hits the up arrow key.

    onKeyDown [ up Up ]

-}
up : msg -> Json.Decoder msg
up msg =
    succeedForKeyCode 38 msg


{-| Use with `onKeyDown` to succeed when user hits the right arrow key.

    onKeyDown [ right Right ]

-}
right : msg -> Json.Decoder msg
right msg =
    succeedForKeyCode 39 msg


{-| Use with `onKeyDown` to succeed when user hits the down arrow key.

    onKeyDown [ down Down ]

-}
down : msg -> Json.Decoder msg
down msg =
    succeedForKeyCode 40 msg



-- TABS


{-| Use with `onKeyDown` to succeed when user hits the tab key.

    onKeyDown [ tab Tab ]

-}
tab : msg -> Json.Decoder msg
tab msg =
    succeedForKeyCodeWithoutModifier 9 shiftKey msg


{-| Use with `onKeyDown` to succeed when user hits the tab key while hitting shift.

    onKeyDown [ tabBack GoBack ]

-}
tabBack : msg -> Json.Decoder msg
tabBack msg =
    succeedForKeyCodeWithModifier 9 shiftKey msg



-- KEYCODES


succeedForKeyCode : Int -> msg -> Json.Decoder msg
succeedForKeyCode key msg =
    Json.andThen (forKeyCode key msg) keyCode


forKeyCode : Int -> msg -> Int -> Json.Decoder msg
forKeyCode key msg keyCode =
    if keyCode == key then
        Json.succeed msg
    else
        Json.fail (toString keyCode)



-- SHIFT and other modifiers


succeedForKeyCodeWithModifier : Int -> Json.Decoder Bool -> msg -> Json.Decoder msg
succeedForKeyCodeWithModifier key decodeModifier msg =
    Json.andThen (forModifier key msg identity) decodeModifier


succeedForKeyCodeWithoutModifier : Int -> Json.Decoder Bool -> msg -> Json.Decoder msg
succeedForKeyCodeWithoutModifier key decodeModifier msg =
    Json.andThen (forModifier key msg not) decodeModifier


forModifier : Int -> a -> (Bool -> Bool) -> Bool -> Json.Decoder a
forModifier key msg withModifierPressed modifierKey =
    if withModifierPressed modifierKey then
        succeedForKeyCode key msg
    else
        Json.fail "False"


shiftKey : Json.Decoder Bool
shiftKey =
    Json.field "shiftKey" Json.bool
