module Styles
    exposing
        ( Classes(..)
        , css
        , class
        , id
        , classList
        )

{-|
@docs Classes, css, class, id, classList
-}

import Css exposing (..)
import Css.Namespace exposing (namespace)
import Html.CssHelpers exposing (Namespace, withNamespace)


{-| Classes
-}
type Classes
    = Container


snippets : List Snippet
snippets =
    [ Css.class Container [ margin2 zero (px 20) ]
    , Css.selector "img" [ height (px 200), width (px 200) ]
    ]


{ class, classList, id } =
    currentNamespace


currentNamespace : Html.CssHelpers.Namespace String a b c
currentNamespace =
    withNamespace "elm-html-a11y-examples-"


{-| css
The produced stylesheet.
-}
css : String
css =
    snippets
        |> namespace currentNamespace.name
        |> stylesheet
        |> (\x -> [ x ])
        |> compile
        |> .css
