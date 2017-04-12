module Grouping exposing (group, radiogroup)

import Html
import Role exposing (..)


group : Html.Attribute msg
group =
    role Group


radiogroup : Html.Attribute msg
radiogroup =
    role Radiogroup
