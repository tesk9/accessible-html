module Attributes.Grouping exposing (group, radiogroup)

import Attributes.Role exposing (..)
import Html


group : Html.Attribute msg
group =
    role Group


radiogroup : Html.Attribute msg
radiogroup =
    role Radiogroup
