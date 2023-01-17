module Accessibility.Style exposing (invisible)

{-|


## Focus rings

Please be aware that hiding a user's focus can make your site completely unusable for them. Learn more about focus ring styling options in [Understanding Success Criterion 2.4.7: Focus Visible](https://www.w3.org/WAI/WCAG21/Understanding/focus-visible).


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
