module Attributes.Heading exposing (heading)

import Html
import Attributes.Role exposing (..)


heading : Html.Attribute msg
heading =
    role Heading
