module Attributes.Grouping exposing (group, radiogroup)

import Html
import Attributes.Role exposing (..)


group : Html.Attribute msg
group =
    role Group


radiogroup : Html.Attribute msg
radiogroup =
    role Radiogroup
