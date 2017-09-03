module Accessibility.WidgetSpec exposing (spec)

import Accessibility.Widget exposing (..)
import SpecHelpers exposing (..)
import Test exposing (..)


spec : Test
spec =
    describe "Accessibility.Widget"
        [ test "autoCompleteInline" <|
            expectAria ( \() -> autoCompleteInline, () ) ( "autocomplete", "inline" )
        , test "autoCompleteList" <|
            expectAria ( \() -> autoCompleteList, () ) ( "autocomplete", "list" )
        , test "autoCompleteBoth" <|
            expectAria ( \() -> autoCompleteBoth, () ) ( "autocomplete", "both" )
        , test "hasMenuPopUp" <|
            expectAria ( \() -> hasMenuPopUp, () ) ( "haspopup", "menu" )
        , test "hasListBoxPopUp" <|
            expectAria ( \() -> hasListBoxPopUp, () ) ( "haspopup", "listbox" )
        , test "hasTreePopUp" <|
            expectAria ( \() -> hasTreePopUp, () ) ( "haspopup", "tree" )
        , test "hasGridPopUp" <|
            expectAria ( \() -> hasGridPopUp, () ) ( "haspopup", "grid" )
        , test "hasDialogPopUp" <|
            expectAria ( \() -> hasDialogPopUp, () ) ( "haspopup", "dialog" )
        , test "invalidGrammar" <|
            expectAria ( \() -> invalidGrammar, () ) ( "invalid", "grammar" )
        , test "invalidSpelling" <|
            expectAria ( \() -> invalidSpelling, () ) ( "invalid", "spelling" )
        , test "orientationHorizontal" <|
            expectAria ( \() -> orientationHorizontal, () ) ( "orientation", "horizontal" )
        , test "orientationVertical" <|
            expectAria ( \() -> orientationVertical, () ) ( "orientation", "vertical" )
        , test "sortAscending" <|
            expectAria ( \() -> sortAscending, () ) ( "sort", "ascending" )
        , test "sortDescending" <|
            expectAria ( \() -> sortDescending, () ) ( "sort", "descending" )
        , test "sortCustom" <|
            expectAria ( \() -> sortCustom, () ) ( "sort", "other" )
        , test "sortNone" <|
            expectAria ( \() -> sortNone, () ) ( "sort", "none" )
        , test "label" <|
            expectAria ( label, "some-id" ) ( "label", "some-id" )
        , test "valueText" <|
            expectAria ( valueText, "Medium on the Range" ) ( "valuetext", "Medium on the Range" )
        , describe "disabled" <|
            expectAriaBoolAttribute disabled "disabled"
        , describe "expanded" <|
            expectAriaBoolAttribute expanded "expanded"
        , describe "hidden" <|
            expectAriaBoolAttribute hidden "hidden"
        , describe "invalid" <|
            expectAriaBoolAttribute invalid "invalid"
        , describe "multiLine" <|
            expectAriaBoolAttribute multiLine "multiline"
        , describe "multiSelectable" <|
            expectAriaBoolAttribute multiSelectable "multiselectable"
        , describe "readOnly" <|
            expectAriaBoolAttribute readOnly "readonly"
        , describe "required" <|
            expectAriaBoolAttribute required "required"
        , describe "selected" <|
            expectAriaBoolAttribute selected "selected"
        , describe "pressed" <|
            expectAriaTristateAttribute pressed "pressed"
        , describe "checked" <|
            expectAriaTristateAttribute checked "checked"
        , test "valueMax" <|
            expectAria ( valueMax, 10 ) ( "valuemax", "10" )
        , test "valueMin" <|
            expectAria ( valueMin, 10 ) ( "valuemin", "10" )
        , test "valueNow" <|
            expectAria ( valueNow, 10 ) ( "valuenow", "10" )
        , test "level" <|
            expectAria ( level, 10 ) ( "level", "10" )
        ]
