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
        , addsAriaBoolAttribute disabled "disabled"
        , addsAriaBoolAttribute expanded "expanded"
        , addsAriaBoolAttribute hidden "hidden"
        , addsAriaBoolAttribute invalid "invalid"
        , addsAriaBoolAttribute multiLine "multiline"
        , addsAriaBoolAttribute multiSelectable "multiselectable"
        , addsAriaBoolAttribute readOnly "readonly"
        , addsAriaBoolAttribute required "required"
        , addsAriaBoolAttribute selected "selected"
        , addsAriaTristateAttribute pressed "pressed"
        , addsAriaTristateAttribute checked "checked"
        , addsAriaNumAttribute valueMax "valuemax"
        , addsAriaNumAttribute valueMin "valuemin"
        , addsAriaNumAttribute valueNow "valuenow"
        , addsAriaNumAttribute level "level"
        ]
