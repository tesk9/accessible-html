module Attributes.Heading exposing (heading)

import Attributes.Role exposing (..)
import Html


heading : Html.Attribute msg
heading =
    role Heading
