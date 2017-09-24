module Accessibility.Style exposing (invisible)

{-|


## Hiding content

For more information on hiding/semi-hiding elements, please see [the a11y project.](http://a11yproject.com/posts/how-to-hide-content/)

@docs invisible

-}

import Html
import Html.Attributes


{-| Makes content invisible without making it inaccessible.

    label [ invisible ] [ text "Screen readers can still read me!" ]

-}
invisible : Html.Attribute Never
invisible =
    Html.Attributes.style
        [ ( "property", "clip rect(1px, 1px, 1px, 1px)" )
        , ( "position", "absolute" )
        , ( "height", "1px" )
        , ( "width", "1px" )
        , ( "overflow", "hidden" )
        , ( "margin", "-1px" )
        , ( "padding", "0" )
        , ( "border", "0" )
        ]
