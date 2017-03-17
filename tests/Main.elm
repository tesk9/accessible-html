port module Main exposing (..)

import Html.A11ySpec
import Html.Attributes.A11ySpec
import Test
import Test.Runner.Node exposing (run, TestProgram)
import Json.Encode exposing (Value)


main : TestProgram
main =
    run emit <|
        Test.concat
            [ Html.A11ySpec.spec
            , Html.Attributes.A11ySpec.spec
            ]


port emit : ( String, Value ) -> Cmd msg
