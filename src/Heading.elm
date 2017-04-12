module Heading exposing (heading)

import Html
import Role exposing (..)


heading : Html.Attribute msg
heading =
    role Heading
