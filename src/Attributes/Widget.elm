module Attributes.Widget
    exposing
        ( autoCompleteInline
        , autoCompleteList
        , autoCompleteBoth
        , checked
        , disabled
        , expanded
        , hasMenuPopUp
        , hasListBoxPopUp
        , hasTreePopUp
        , hasGridPopUp
        , hasDialogPopUp
        , hidden
        , invalid
        , invalidGrammar
        , invalidSpelling
        , label
        , level
        , multiLine
        , multiSelectable
        , orientationHorizontal
        , orientationVertical
        , pressed
        , readOnly
        , required
        , selected
        , sortAscending
        , sortDescending
        , sortCustom
        , sortNone
        , valueMax
        , valueMin
        , valueNow
        , valueText
        )

import Attributes.Utils exposing (..)
import Html


autoCompleteInline : Html.Attribute msg
autoCompleteInline =
    aria "autocomplete" "inline"


autoCompleteList : Html.Attribute msg
autoCompleteList =
    aria "autocomplete" "list"


autoCompleteBoth : Html.Attribute msg
autoCompleteBoth =
    aria "autocomplete" "both"


checked : Maybe Bool -> Html.Attribute msg
checked =
    aria "checked" << toTriStateString


disabled : Bool -> Html.Attribute msg
disabled =
    aria "disabled" << toBoolString


expanded : Bool -> Html.Attribute msg
expanded =
    aria "expanded" << toBoolString


hasMenuPopUp : Html.Attribute msg
hasMenuPopUp =
    aria "haspopup" "menu"


hasListBoxPopUp : Html.Attribute msg
hasListBoxPopUp =
    aria "haspopup" "listbox"


hasTreePopUp : Html.Attribute msg
hasTreePopUp =
    aria "haspopup" "tree"


hasGridPopUp : Html.Attribute msg
hasGridPopUp =
    aria "haspopup" "grid"


hasDialogPopUp : Html.Attribute msg
hasDialogPopUp =
    aria "haspopup" "dialog"


hidden : Bool -> Html.Attribute msg
hidden =
    aria "hidden" << toBoolString


invalid : Bool -> Html.Attribute msg
invalid =
    aria "invalid" << toBoolString


invalidGrammar : Html.Attribute msg
invalidGrammar =
    aria "invalid" "grammar"


invalidSpelling : Html.Attribute msg
invalidSpelling =
    aria "invalid" "spelling"


label : String -> Html.Attribute msg
label =
    aria "label"


level : Int -> Html.Attribute msg
level =
    aria "level" << toString


multiLine : Bool -> Html.Attribute msg
multiLine =
    aria "multiline" << toBoolString


multiSelectable : Bool -> Html.Attribute msg
multiSelectable =
    aria "multiselectable" << toBoolString


orientationHorizontal : Html.Attribute msg
orientationHorizontal =
    aria "orientation" "horizontal"


orientationVertical : Html.Attribute msg
orientationVertical =
    aria "orientation" "vertical"


pressed : Maybe Bool -> Html.Attribute msg
pressed =
    aria "pressed" << toTriStateString


readOnly : Bool -> Html.Attribute msg
readOnly =
    aria "readonly" << toBoolString


required : Bool -> Html.Attribute msg
required =
    aria "required" << toBoolString


selected : Bool -> Html.Attribute msg
selected =
    aria "selected" << toBoolString


sortAscending : Html.Attribute msg
sortAscending =
    aria "sort" "ascending"


sortDescending : Html.Attribute msg
sortDescending =
    aria "sort" "descending"


sortCustom : Html.Attribute msg
sortCustom =
    aria "sort" "other"


sortNone : Html.Attribute msg
sortNone =
    aria "sort" "none"


valueMax : number -> Html.Attribute msg
valueMax =
    aria "valuemax" << toString


valueMin : number -> Html.Attribute msg
valueMin =
    aria "valuemin" << toString


valueNow : number -> Html.Attribute msg
valueNow =
    aria "valuenow" << toString


valueText : String -> Html.Attribute msg
valueText =
    aria "valuetext"
