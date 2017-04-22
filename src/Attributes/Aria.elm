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
        , currentItem
        , currentPage
        , currentStep
        , currentLocation
        , currentDate
        , currentTime
        , describedBy
        , details
        , errorMessage
        , flowTo
        , keyShortcuts
        , livePolite
        , liveAssertive
        , modal
        , placeholder
        , posInSet
        , relevantAdditions
        , relevantAdditionsText
        , relevantAll
        , relevantRemovals
        , relevantText
        , roleDescription
        , rowCount
        , rowIndex
        , rowSpan
        , setSize
        )

import Attributes.Utils exposing (..)
import Html
import Html.Attributes exposing (..)
import Json.Encode


labelledBy : String -> Html.Attribute msg
labelledBy =
    attribute "aria-labelledby"


longDescription : String -> Html.Attribute msg
longDescription =
    attribute "longdesc"


indeterminate : Html.Attribute msg
indeterminate =
    property "indeterminate" (Json.Encode.bool True)


activeDescendant : String -> Html.Attribute msg
activeDescendant =
    aria "activedescendant"


atomic : Bool -> Html.Attribute msg
atomic =
    aria "atomic" << toBoolString


busy : Bool -> Html.Attribute msg
busy =
    aria "busy" << toBoolString


colCount : Int -> Html.Attribute msg
colCount =
    aria "colcount" << toString


colIndex : Int -> Html.Attribute msg
colIndex =
    aria "colindex" << toString


colSpan : Int -> Html.Attribute msg
colSpan =
    aria "colspan" << toString


rowCount : Int -> Html.Attribute msg
rowCount =
    aria "rowcount" << toString


rowIndex : Int -> Html.Attribute msg
rowIndex =
    aria "rowindex" << toString


rowSpan : Int -> Html.Attribute msg
rowSpan =
    aria "rowspan" << toString


posInSet : Int -> Html.Attribute msg
posInSet =
    aria "posinset" << toString


setSize : Int -> Html.Attribute msg
setSize =
    aria "setsize" << toString


controls : String -> Html.Attribute msg
controls =
    aria "controls"


currentPage : Html.Attribute msg
currentPage =
    aria "current" "page"


currentStep : Html.Attribute msg
currentStep =
    aria "current" "step"


currentLocation : Html.Attribute msg
currentLocation =
    aria "current" "location"


currentDate : Html.Attribute msg
currentDate =
    aria "current" "date"


currentTime : Html.Attribute msg
currentTime =
    aria "current" "time"


currentItem : Bool -> Html.Attribute msg
currentItem =
    aria "current" << toBoolString


describedBy : List String -> Html.Attribute msg
describedBy =
    aria "describedby" << toListString


details : String -> Html.Attribute msg
details =
    aria "details"


errorMessage : String -> Html.Attribute msg
errorMessage =
    aria "errormessage"


flowTo : List String -> Html.Attribute msg
flowTo =
    aria "flowto" << toListString


keyShortcuts : List String -> Html.Attribute msg
keyShortcuts =
    aria "keyshortcuts" << toListString


livePolite : Html.Attribute msg
livePolite =
    aria "live" "polite"


liveAssertive : Html.Attribute msg
liveAssertive =
    aria "live" "assertive"


modal : Bool -> Html.Attribute msg
modal =
    aria "modal" << toBoolString


placeholder : String -> Html.Attribute msg
placeholder =
    aria "placeholder"


relevantAdditions : Html.Attribute msg
relevantAdditions =
    aria "relevant" "additions"


relevantAdditionsText : Html.Attribute msg
relevantAdditionsText =
    aria "relevant" "additions text"


relevantAll : Html.Attribute msg
relevantAll =
    aria "relevant" "all"


relevantRemovals : Html.Attribute msg
relevantRemovals =
    aria "relevant" "removals"


relevantText : Html.Attribute msg
relevantText =
    aria "relevant" "text"


roleDescription : String -> Html.Attribute msg
roleDescription =
    aria "roledescription"
