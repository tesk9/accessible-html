module Grouping exposing (group, radiogroup)

{-|
@docs group, radiogroup
-}

import Html
import Role exposing (..)


{-| Define a set of controls. (for a group of radio inputs, see radiogroup).
-}
group : Html.Attribute msg
group =
    role Group


{-| Define a set of radio-controls.
-}
radiogroup : Html.Attribute msg
radiogroup =
    role Radiogroup
