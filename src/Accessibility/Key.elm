module Accessibility.Key exposing
    ( tabbable
    , onKeyDown, onKeyDownPreventDefault
    , onKeyUp, onKeyUpPreventDefault
    , Event
    , tab, tabBack
    , up, right, down, left
    , shift
    , shiftUp, shiftRight, shiftDown, shiftLeft
    , enter, space
    , escape
    , customOneOf
    )

{-|


## Managing focus

@docs tabbable


## Keyboard event listener

@docs onKeyDown, onKeyDownPreventDefault
@docs onKeyUp, onKeyUpPreventDefault


## Events

Note: the API here is different than in previous versions of this library because of <https://github.com/elm/json/issues/15>.
A future version of this library may return to using generic decoders.

@docs Event


### Navigation

@docs tab, tabBack

@docs up, right, down, left
@docs shift
@docs shiftUp, shiftRight, shiftDown, shiftLeft


### Activation

@docs enter, space


### Deactivation

@docs escape


## Advanced

@docs customOneOf

-}

import Html exposing (Attribute)
import Html.Attributes
import Html.Events as Events exposing (on, preventDefaultOn)
import Json.Decode as Json exposing (Decoder)


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


{-| -}
type alias Event msg =
    { keyCode : Int
    , shiftKey : Bool
    , msg : msg
    }


{-| Pass a list of keyboard events to match.

    onKeyDown [ enter TheyHitEnterDoSomething, left DoSomeOtherThing ]

-}
onKeyDown : List (Event msg) -> Attribute msg
onKeyDown decoders =
    on "keydown" (customOneOf decoders)


{-| Pass a list of keyboard events to match.

    onKeyDownPreventDefault [ space TheyHitEnterDoSomethingButDontScrollThePage ]

-}
onKeyDownPreventDefault : List (Event msg) -> Attribute msg
onKeyDownPreventDefault decoders =
    alwaysPreventDefault "keydown" decoders


{-| Pass a list of keyboard events to match.

    onKeyUp [ enter TheyHitEnterDoSomething, left DoSomeOtherThing ]

-}
onKeyUp : List (Event msg) -> Attribute msg
onKeyUp decoders =
    on "keyup" (customOneOf decoders)


{-| Pass a list of keyboard events to match.

    onKeyUpPreventDefault [ space TheyHitEnterDoSomethingButDontScrollThePage ]

-}
onKeyUpPreventDefault : List (Event msg) -> Attribute msg
onKeyUpPreventDefault decoders =
    alwaysPreventDefault "keyup" decoders


alwaysPreventDefault : String -> List (Event msg) -> Attribute msg
alwaysPreventDefault event decoders =
    decoders
        |> customOneOf
        |> Json.map (\decoder -> ( decoder, True ))
        |> preventDefaultOn event


{-| This exists because Json.Decode.oneOf is broken in a way that causes weird & hard-to-diagnose bugs.
-}
customOneOf : List (Event msg) -> Decoder msg
customOneOf events =
    let
        justMatches keyCode shiftKey event =
            if event.keyCode == keyCode && shiftKey == event.shiftKey then
                Just event.msg

            else
                Nothing
    in
    Json.map2
        (\keyCode shiftKey ->
            events
                |> List.filterMap (justMatches keyCode shiftKey)
                |> List.head
        )
        Events.keyCode
        (Json.field "shiftKey" Json.bool)
        |> Json.andThen (Maybe.map Json.succeed >> Maybe.withDefault (Json.fail "No matches"))



-- ACTIVATION


{-| Use with `onKeyDown` to succeed when user hits the Enter key.

    onKeyDown [ enter TheyHitEnterDoSomething ]

-}
enter : msg -> Event msg
enter msg =
    { keyCode = 13
    , shiftKey = False
    , msg = msg
    }


{-| Use with `onKeyDown` to succeed when user hits the spacebar.

    onKeyDown [ space SpaceBar ]

-}
space : msg -> Event msg
space msg =
    { keyCode = 32
    , shiftKey = False
    , msg = msg
    }



-- DEACTIVATION


{-| Use with `onKeyDown` to succeed when user hits `esc`.

    onKeyDown [ escape CloseModal ]

-}
escape : msg -> Event msg
escape msg =
    { keyCode = 27
    , shiftKey = False
    , msg = msg
    }



-- ARROW KEYS


{-| Use with `onKeyDown` to succeed when user hits the left arrow key without the shift key.

    onKeyDown [ left Left ]

-}
left : msg -> Event msg
left msg =
    { keyCode = 37
    , shiftKey = False
    , msg = msg
    }


{-| Use with `onKeyDown` to succeed when user hits the up arrow key without the shift key.

    onKeyDown [ up Up ]

-}
up : msg -> Event msg
up msg =
    { keyCode = 38
    , shiftKey = False
    , msg = msg
    }


{-| Use with `onKeyDown` to succeed when user hits the right arrow key without the shift key.

    onKeyDown [ right Right ]

-}
right : msg -> Event msg
right msg =
    { keyCode = 39
    , shiftKey = False
    , msg = msg
    }


{-| Use with `onKeyDown` to succeed when user hits the down arrow key without the shift key.

    onKeyDown [ down Down ]

-}
down : msg -> Event msg
down msg =
    { keyCode = 40
    , shiftKey = False
    , msg = msg
    }


{-| Succeed when user hits the shift key by itself.

    onKeyDown [ shift Shift ]

-}
shift : msg -> Event msg
shift msg =
    { keyCode = 16
    , shiftKey = True
    , msg = msg
    }


{-| Succeed when user hits the left arrow key with the shift key.

    onKeyDown [ shiftLeft Left ]

-}
shiftLeft : msg -> Event msg
shiftLeft msg =
    { keyCode = 37
    , shiftKey = True
    , msg = msg
    }


{-| Succeed when user hits the up arrow key with the shift key.

    onKeyDown [ shiftUp Up ]

-}
shiftUp : msg -> Event msg
shiftUp msg =
    { keyCode = 38
    , shiftKey = True
    , msg = msg
    }


{-| Succeed when user hits the right arrow key with the shift key.

    onKeyDown [ shiftRight Right ]

-}
shiftRight : msg -> Event msg
shiftRight msg =
    { keyCode = 39
    , shiftKey = True
    , msg = msg
    }


{-| Succeed when user hits the down arrow key with the shift key.

    onKeyDown [ shiftDown Down ]

-}
shiftDown : msg -> Event msg
shiftDown msg =
    { keyCode = 40
    , shiftKey = True
    , msg = msg
    }



-- TABS


{-| Use with `onKeyDown` to succeed when user hits the tab key.

    onKeyDown [ tab Tab ]

-}
tab : msg -> Event msg
tab msg =
    { keyCode = 9
    , shiftKey = False
    , msg = msg
    }


{-| Use with `onKeyDown` to succeed when user hits the tab key while hitting shift.

    onKeyDown [ tabBack GoBack ]

-}
tabBack : msg -> Event msg
tabBack msg =
    { keyCode = 9
    , shiftKey = True
    , msg = msg
    }
