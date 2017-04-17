port module Main exposing (..)

import Html.A11ySpec
import Html.Attributes.A11ySpec
import Json.Encode exposing (Value)
import Tags.InputsSpec
import Test
import Test.Runner.Node exposing (run, TestProgram)


main : TestProgram
main =
    run emit <|
        Test.concat
            [ Html.A11ySpec.spec
            , Html.Attributes.A11ySpec.spec
            , Tags.InputsSpec.spec
            ]


port emit : ( String, Value ) -> Cmd msg
