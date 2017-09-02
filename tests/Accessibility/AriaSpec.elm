module Accessibility.AriaSpec exposing (spec)

import Accessibility.Aria exposing (..)
import Html
import Html.Attributes
import Json.Encode
import SpecHelpers exposing (..)
import Test exposing (..)
import Test.Html.Query as Query
import Test.Html.Selector as Selector


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
        , addsAriaAttribute currentPage ( "current", "page" )
        , addsAriaAttribute currentStep ( "current", "step" )
        , addsAriaAttribute currentLocation ( "current", "location" )
        , addsAriaAttribute currentDate ( "current", "date" )
        , addsAriaAttribute currentTime ( "current", "time" )
        , addsAriaListStringAttribute describedBy ( "describedby", "some-value some-other-value" )
        , addsAriaStringAttribute details ( "details", "element-id" )
        , addsAriaStringAttribute errorMessage ( "errormessage", "element-id" )
        , addsAriaListStringAttribute flowTo ( "flowto", "element-id some-other-element-id" )
        , addsAriaListStringAttribute keyShortcuts ( "keyshortcuts", "Alt+Shift+P Control+F" )
        , addsAriaAttribute livePolite ( "live", "polite" )
        , addsAriaAttribute liveAssertive ( "live", "assertive" )
        , addsAriaBoolAttribute modal "modal"
        , addsAriaStringAttribute placeholder ( "placeholder", "element-id" )
        , addsAriaNumAttribute posInSet "posinset"
        , addsAriaAttribute relevantAdditions ( "relevant", "additions" )
        , addsAriaAttribute relevantAdditionsText ( "relevant", "additions text" )
        , addsAriaAttribute relevantAll ( "relevant", "all" )
        , addsAriaAttribute relevantRemovals ( "relevant", "removals" )
        , addsAriaAttribute relevantText ( "relevant", "text" )
        , addsAriaStringAttribute roleDescription ( "roledescription", "element-id" )
        , addsAriaNumAttribute rowCount "rowcount"
        , addsAriaNumAttribute rowIndex "rowindex"
        , addsAriaNumAttribute rowSpan "rowspan"
        , addsAriaNumAttribute setSize "setsize"
        ]
