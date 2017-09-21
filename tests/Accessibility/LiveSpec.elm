module Accessibility.LiveSpec exposing (spec)

import Accessibility.Live exposing (..)
import SpecHelpers exposing (..)
import Test exposing (..)


spec : Test
spec =
    describe "Accessibility.Aria"
        [ describe "atomic" <|
            expectAriaBoolAttribute atomic "atomic"
        , describe "busy" <|
            expectAriaBoolAttribute busy "busy"
        , test "livePolite" <|
            expectAria ( \() -> livePolite, () ) ( "live", "polite" )
        , test "liveAssertive" <|
            expectAria ( \() -> liveAssertive, () ) ( "live", "assertive" )
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
        ]
