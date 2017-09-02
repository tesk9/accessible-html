module Accessibility.AriaSpec exposing (spec)

import Accessibility.Aria exposing (..)
import SpecHelpers exposing (..)
import Test exposing (..)


spec : Test
spec =
    describe "Accessibility.Aria"
        [ addsAriaStringAttribute labelledBy ( "labelledby", "label-id" )
        , addsAriaStringAttribute labeledBy ( "labelledby", "label-id" )
        , addsStringAttribute longDescription ( "longdesc", "element-id" )
        , addsAriaStringAttribute activeDescendant ( "activedescendant", "element-id" )
        , addsAriaBoolAttribute atomic "atomic"
        , addsAriaBoolAttribute busy "busy"
        , addsAriaNumAttribute colCount "colcount"
        , addsAriaNumAttribute colIndex "colindex"
        , addsAriaNumAttribute colSpan "colspan"
        , addsAriaStringAttribute controls ( "controls", "controlled-element-id" )
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
        , addsAriaStringAttribute details ( "details", "element-id" )
        , addsAriaStringAttribute errorMessage ( "errormessage", "element-id" )
        , addsAriaListStringAttribute flowTo ( "flowto", "element-id some-other-element-id" )
        , addsAriaListStringAttribute keyShortcuts ( "keyshortcuts", "Alt+Shift+P Control+F" )
        , test "livePolite" <|
            expectAria ( \() -> livePolite, () ) ( "live", "polite" )
        , test "liveAssertive" <|
            expectAria ( \() -> liveAssertive, () ) ( "live", "assertive" )
        , addsAriaBoolAttribute modal "modal"
        , addsAriaStringAttribute placeholder ( "placeholder", "element-id" )
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
        , addsAriaStringAttribute roleDescription ( "roledescription", "element-id" )
        , addsAriaNumAttribute rowCount "rowcount"
        , addsAriaNumAttribute rowIndex "rowindex"
        , addsAriaNumAttribute rowSpan "rowspan"
        , addsAriaNumAttribute setSize "setsize"
        ]
