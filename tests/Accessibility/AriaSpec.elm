module Accessibility.AriaSpec exposing (spec)

import Accessibility.Aria exposing (..)
import SpecHelpers exposing (..)
import Test exposing (..)


spec : Test
spec =
    describe "Accessibility.Aria"
        [ test "brailleLabel" <|
            expectAria ( brailleLabel, "Braille-specific secondary label" ) ( "braillelabel", "Braille-specific secondary label" )
        , test "labelledBy" <|
            expectAria ( labelledBy, "label-id" ) ( "labelledby", "label-id" )
        , test "labeledBy" <|
            expectAria ( labeledBy, "label-id" ) ( "labelledby", "label-id" )
        , test "longDescription" <|
            expectAttribute ( longDescription, "element-id" ) ( "longdesc", "element-id" )
        , test "activeDescendant" <|
            expectAria ( activeDescendant, "element-id" ) ( "activedescendant", "element-id" )
        , test "colCount" <|
            expectAria ( colCount, 15 ) ( "colcount", "15" )
        , test "colIndex" <|
            expectAria ( colIndex, 15 ) ( "colindex", "15" )
        , test "colSpan" <|
            expectAria ( colSpan, 15 ) ( "colspan", "15" )
        , test "controls" <|
            expectAria ( controls, [ "controlled-element-id", "controlled-element-id-2" ] )
                ( "controls", "controlled-element-id controlled-element-id-2" )
        , test "owns" <|
            expectAria ( owns, [ "owned-element-id", "owned-element-id-2" ] )
                ( "owns", "owned-element-id owned-element-id-2" )
        , describe "currentItem" <|
            expectAriaBoolAttribute currentItem "current"
        , test "currentPage" <|
            expectAria ( \() -> currentPage, () ) ( "current", "page" )
        , test "currentStep" <|
            expectAria ( \() -> currentStep, () ) ( "current", "step" )
        , test "currentLocation" <|
            expectAria ( \() -> currentLocation, () ) ( "current", "location" )
        , test "currentDate" <|
            expectAria ( \() -> currentDate, () ) ( "current", "date" )
        , test "currentTime" <|
            expectAria ( \() -> currentTime, () ) ( "current", "time" )
        , test "describedBy" <|
            expectAria ( describedBy, [ "some-value", "some-other-value" ] )
                ( "describedby", "some-value some-other-value" )
        , test "details" <|
            expectAria ( details, "element-id" ) ( "details", "element-id" )
        , test "errorMessage" <|
            expectAria ( errorMessage, "element-id" ) ( "errormessage", "element-id" )
        , test "flowTo" <|
            expectAria ( flowTo, [ "element-id", "some-other-element-id" ] )
                ( "flowto", "element-id some-other-element-id" )
        , test "keyShortcuts" <|
            expectAria ( keyShortcuts, [ "Alt+Shift+P", "Control+F" ] )
                ( "keyshortcuts", "Alt+Shift+P Control+F" )
        , test "placeholder" <|
            expectAria ( placeholder, "element-id" ) ( "placeholder", "element-id" )
        , test "posInSet" <|
            expectAria ( posInSet, 15 ) ( "posinset", "15" )
        , test "roleDescription" <|
            expectAria ( roleDescription, "element-id" ) ( "roledescription", "element-id" )
        , test "rowCount" <|
            expectAria ( rowCount, 15 ) ( "rowcount", "15" )
        , test "rowIndex" <|
            expectAria ( rowIndex, 15 ) ( "rowindex", "15" )
        , test "rowSpan" <|
            expectAria ( rowSpan, 15 ) ( "rowspan", "15" )
        , test "setSize" <|
            expectAria ( setSize, 15 ) ( "setsize", "15" )
        , test "autoCompleteInline" <|
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
        , describe "modal" <|
            expectAriaBoolAttribute modal "modal"
        ]
