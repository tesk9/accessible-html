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
        , addsAriaBoolAttribute atomic "atomic"
        , addsAriaBoolAttribute busy "busy"
        , addsAriaNumAttribute colCount "colcount"
        , addsAriaNumAttribute colIndex "colindex"
        , addsAriaNumAttribute colSpan "colspan"
        , test "controls" <|
            expectAria ( controls, "controlled-element-id" ) ( "controls", "controlled-element-id" )
        , addsAriaBoolAttribute currentItem "current"
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
        , addsAriaListStringAttribute describedBy ( "describedby", "some-value some-other-value" )
        , test "details" <|
            expectAria ( details, "element-id" ) ( "details", "element-id" )
        , test "errorMessage" <|
            expectAria ( errorMessage, "element-id" ) ( "errormessage", "element-id" )
        , addsAriaListStringAttribute flowTo ( "flowto", "element-id some-other-element-id" )
        , addsAriaListStringAttribute keyShortcuts ( "keyshortcuts", "Alt+Shift+P Control+F" )
        , test "livePolite" <|
            expectAria ( \() -> livePolite, () ) ( "live", "polite" )
        , test "liveAssertive" <|
            expectAria ( \() -> liveAssertive, () ) ( "live", "assertive" )
        , addsAriaBoolAttribute modal "modal"
        , test "placeholder" <|
            expectAria ( placeholder, "element-id" ) ( "placeholder", "element-id" )
        , addsAriaNumAttribute posInSet "posinset"
        , test "relevantAdditions" <|
            expectAria ( \() -> relevantAdditions, () ) ( "relevant", "additions" )
        , test "relevantAdditionsText" <|
            expectAria ( \() -> relevantAdditionsText, () ) ( "relevant", "additions text" )
        , test "relevantAll" <|
            expectAria ( \() -> relevantAll, () ) ( "relevant", "all" )
        , test "relevantRemovals" <|
            expectAria ( \() -> relevantRemovals, () ) ( "relevant", "removals" )
        , test "relevantText" <|
            expectAria ( \() -> relevantText, () ) ( "relevant", "text" )
        , test "roleDescription" <|
            expectAria ( roleDescription, "element-id" ) ( "roledescription", "element-id" )
        , addsAriaNumAttribute rowCount "rowcount"
        , addsAriaNumAttribute rowIndex "rowindex"
        , addsAriaNumAttribute rowSpan "rowspan"
        , addsAriaNumAttribute setSize "setsize"
        ]
