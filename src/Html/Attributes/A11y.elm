module Html.Attributes.A11y exposing (invisible)

{-|
@docs invisible

For more information on hiding/semi-hiding elements, please see [the a11y project.](http://a11yproject.com/posts/how-to-hide-content/)
-}

import Css
import Html
import Html.Attributes exposing (..)


{-| invisible
Makes content invisible without making it inaccessible.
    label [ invisible ] [ text "Screen readers can still read me!" ]
-}
invisible : Html.Attribute msg
invisible =
    style <|
        Css.asPairs
            [ Css.property "clip" "rect(1px, 1px, 1px, 1px)"
            , Css.position Css.absolute
            , Css.height (Css.px 1)
            , Css.width (Css.px 1)
            , Css.overflow Css.hidden
            , Css.margin (Css.px -1)
            , Css.padding Css.zero
            , Css.border Css.zero
            ]
