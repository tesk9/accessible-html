module Accessibility.Key exposing
    ( tabbable
    , onKeyDown, onKeyDownPreventDefault
    , onKeyUp, onKeyUpPreventDefault
    , tab, tabBack
    , up, right, down, left
    , shiftUp, shiftRight, shiftDown, shiftLeft
    , enter, space
    , escape
    )

{-|


## Managing focus

@docs tabbable


## Keyboard event listener

@docs onKeyDown, onKeyDownPreventDefault
@docs onKeyUp, onKeyUpPreventDefault


## Decoders


### Navigation

@docs tab, tabBack

@docs up, right, down, left
@docs shiftUp, shiftRight, shiftDown, shiftLeft


### Activation

@docs enter, space


### Deactivation

@docs escape

-}

import Html exposing (Attribute)
import Html.Attributes
import Html.Events exposing (keyCode, on, preventDefaultOn)
import Json.Decode as Json


{-| Add or remove an element from the normal flow of tabbable/focusable elements.

`tabbable True` will set the tabindex to 0, and `tabbable False` will set the tabindex to -1.

You may use `Html.Attributes.tabindex` if you need to control the tab order more explicitly, but you may want to restructure your HTML to match how you want users to interact with it instead. If you're considering changing tabindex or restructuring your HTML, read [Understanding Success Criterion 1.3.2: Meaningful Sequence](https://www.w3.org/WAI/WCAG21/Understanding/meaningful-sequence).

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


{-| Pass a list of decoders.

    onKeyDownPreventDefault [ space TheyHitEnterDoSomethingButDontScrollThePage ]

-}
onKeyDownPreventDefault : List (Json.Decoder msg) -> Attribute msg
onKeyDownPreventDefault decoders =
    alwaysPreventDefault "keydown" decoders


{-| Pass a list of decoders.

    onKeyUp [ enter TheyHitEnterDoSomething, left DoSomeOtherThing ]

-}
onKeyUp : List (Json.Decoder msg) -> Attribute msg
onKeyUp decoders =
    on "keyup" (Json.oneOf decoders)


{-| Pass a list of decoders.

    onKeyUpPreventDefault [ space TheyHitEnterDoSomethingButDontScrollThePage ]

-}
onKeyUpPreventDefault : List (Json.Decoder msg) -> Attribute msg
onKeyUpPreventDefault decoders =
    alwaysPreventDefault "keyup" decoders


alwaysPreventDefault : String -> List (Json.Decoder msg) -> Attribute msg
alwaysPreventDefault event decoders =
    decoders
        |> List.map (Json.map (\decoder -> ( decoder, True )))
        |> Json.oneOf
        |> preventDefaultOn event



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


{-| Use with `onKeyDown` to succeed when user hits the left arrow key without the shift key.

    onKeyDown [ left Left ]

-}
left : msg -> Json.Decoder msg
left msg =
    succeedForKeyCodeWithoutModifier 37 shiftKey msg


{-| Use with `onKeyDown` to succeed when user hits the up arrow key without the shift key.

    onKeyDown [ up Up ]

-}
up : msg -> Json.Decoder msg
up msg =
    succeedForKeyCodeWithoutModifier 38 shiftKey msg


{-| Use with `onKeyDown` to succeed when user hits the right arrow key without the shift key.

    onKeyDown [ right Right ]

-}
right : msg -> Json.Decoder msg
right msg =
    succeedForKeyCodeWithoutModifier 39 shiftKey msg


{-| Use with `onKeyDown` to succeed when user hits the down arrow key without the shift key.

    onKeyDown [ down Down ]

-}
down : msg -> Json.Decoder msg
down msg =
    succeedForKeyCodeWithoutModifier 40 shiftKey msg


{-| Succeed when user hits the left arrow key with the shift key.

    onKeyDown [ shiftLeft Left ]

-}
shiftLeft : msg -> Json.Decoder msg
shiftLeft msg =
    succeedForKeyCodeWithModifier 37 shiftKey msg


{-| Succeed when user hits the up arrow key with the shift key.

    onKeyDown [ shiftUp Up ]

-}
shiftUp : msg -> Json.Decoder msg
shiftUp msg =
    succeedForKeyCodeWithModifier 38 shiftKey msg


{-| Succeed when user hits the right arrow key with the shift key.

    onKeyDown [ shiftRight Right ]

-}
shiftRight : msg -> Json.Decoder msg
shiftRight msg =
    succeedForKeyCodeWithModifier 39 shiftKey msg


{-| Succeed when user hits the down arrow key with the shift key.

    onKeyDown [ shiftDown Down ]

-}
shiftDown : msg -> Json.Decoder msg
shiftDown msg =
    succeedForKeyCodeWithModifier 40 shiftKey msg



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
        Json.fail (String.fromInt keyCode)



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
