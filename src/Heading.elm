module Heading exposing (heading)

{-| Prefer using `h1`, `h2`, `h3`, `h4`, `h5`, and `h6`.
Really this module should only be necessary if you need an `h7`-type heading.
-}

import Html
import Role exposing (..)


heading : Html.Attribute msg
heading =
    role Heading
