module Accessibility.AriaSpec exposing (spec)

import Accessibility.Aria exposing (..)
import SpecHelpers exposing (..)
import Test exposing (..)


spec : Test
spec =
    describe "Accessibility.Aria"
        [ test "labelledBy" <|
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
            expectAria ( controls, "controlled-element-id" ) ( "controls", "controlled-element-id" )
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
        , describe "modal" <|
            expectAriaBoolAttribute modal "modal"
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
        ]
