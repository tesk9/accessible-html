module Attributes.Aria
    exposing
        ( labelledBy
        , longDescription
        , indeterminate
        , activeDescendant
        , atomic
        , busy
        , colCount
        , colIndex
        , colSpan
        , controls
        , current
        , describedBy
        , details
        , dropEffect
        , errorMessage
        , flowTo
        , grabbed
        , keyShortcuts
        , live
        , modal
        , placeholder
        , posInset
        , relevant
        , roleDescription
        , rowCount
        , rowIndex
        , rowSpan
        , setSize
        )

{-|
@docs indeterminate
@docs longDescription, details
@docs describedBy, labelledBy, controls

### Live Region Attributes
@docs atomic, busy, live, relevant

@docs activeDescendant, current, dropEffect, flowTo, grabbed, keyShortcuts,
@docs modal, placeholder, posInset,  roleDescription, setSize

### Table Related
@docs colCount, colIndex, colSpan, rowCount, rowIndex, rowSpan

@docs errorMessage
-}

import Attributes.Utils exposing (..)
import Html
import Html.Attributes exposing (..)
import Json.Encode


labelledBy : String -> Html.Attribute msg
labelledBy =
    attribute "aria-labelledby"


longDescription : String -> Html.Attribute msg
longDescription =
    attribute "longDesc"


indeterminate : Html.Attribute msg
indeterminate =
    property "indeterminate" (Json.Encode.bool True)


activeDescendant : String -> Html.Attribute msg
activeDescendant =
    aria "activedescendant"


atomic : String -> Html.Attribute msg
atomic =
    aria "atomic"


busy : String -> Html.Attribute msg
busy =
    aria "busy"


colCount : String -> Html.Attribute msg
colCount =
    aria "colcount"


colIndex : String -> Html.Attribute msg
colIndex =
    aria "colindex"


colSpan : String -> Html.Attribute msg
colSpan =
    aria "colspan"


controls : String -> Html.Attribute msg
controls =
    aria "controls"


current : String -> Html.Attribute msg
current =
    aria "current"


describedBy : String -> Html.Attribute msg
describedBy =
    aria "describedby"


details : String -> Html.Attribute msg
details =
    aria "details"


dropEffect : String -> Html.Attribute msg
dropEffect =
    aria "dropeffect"


errorMessage : String -> Html.Attribute msg
errorMessage =
    aria "errormessage"


flowTo : String -> Html.Attribute msg
flowTo =
    aria "flowto"


grabbed : String -> Html.Attribute msg
grabbed =
    aria "grabbed"


keyShortcuts : String -> Html.Attribute msg
keyShortcuts =
    aria "keyshortcuts"


live : String -> Html.Attribute msg
live =
    aria "live"


modal : String -> Html.Attribute msg
modal =
    aria "modal"


placeholder : String -> Html.Attribute msg
placeholder =
    aria "placeholder"


posInset : String -> Html.Attribute msg
posInset =
    aria "posinset"


relevant : String -> Html.Attribute msg
relevant =
    aria "relevant"


roleDescription : String -> Html.Attribute msg
roleDescription =
    aria "roledescription"


rowCount : String -> Html.Attribute msg
rowCount =
    aria "rowcount"


rowIndex : String -> Html.Attribute msg
rowIndex =
    aria "rowindex"


rowSpan : String -> Html.Attribute msg
rowSpan =
    aria "rowspan"


setSize : String -> Html.Attribute msg
setSize =
    aria "setsize"
