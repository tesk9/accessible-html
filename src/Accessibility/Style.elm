module Accessibility.Style exposing (invisible)

{-|


## Hiding content

For more information on hiding/semi-hiding elements, please see [the a11y project.](http://a11yproject.com/posts/how-to-hide-content/)

@docs invisible

-}

import Html
import Html.Attributes


{-| Makes content invisible without making it inaccessible.

    label invisible [ text "Screen readers can still read me!" ]

-}
invisible : List (Html.Attribute msg)
invisible =
    [ Html.Attributes.style "property" "clip rect(1px, 1px, 1px, 1px)"
    , Html.Attributes.style "position" "absolute"
    , Html.Attributes.style "height" "1px"
    , Html.Attributes.style "width" "1px"
    , Html.Attributes.style "overflow" "hidden"
    , Html.Attributes.style "margin" "-1px"
    , Html.Attributes.style "padding" "0"
    , Html.Attributes.style "border" "0"
    ]
