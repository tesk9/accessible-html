module SpecHelpers exposing (expectAria, expectAriaBoolAttribute, expectAriaTristateAttribute, expectAttribute)

import Expect
import Html
import Html.Attributes
import Json.Encode
import Test exposing (..)
import Test.Html.Query as Query
import Test.Html.Selector as Selector


expectAriaBoolAttribute : (Bool -> Html.Attribute msg) -> String -> List Test
expectAriaBoolAttribute setter attribute =
    [ test "True" <| expectAria ( setter, True ) ( attribute, "true" )
    , test "False" <| expectAria ( setter, False ) ( attribute, "false" )
    ]


expectAriaTristateAttribute : (Maybe Bool -> Html.Attribute msg) -> String -> List Test
expectAriaTristateAttribute setter attribute =
    [ test "True" <| expectAria ( setter, Just True ) ( attribute, "true" )
    , test "False" <| expectAria ( setter, Just False ) ( attribute, "false" )
    , test "Mixed" <| expectAria ( setter, Nothing ) ( attribute, "mixed" )
    ]


expectAria :
    ( a -> Html.Attribute msg, a )
    -> ( String, String )
    -> ()
    -> Expect.Expectation
expectAria ( setter, state ) ( attribute, attrState ) =
    expectAttribute ( setter, state ) ( "aria-" ++ attribute, attrState )


expectAttribute :
    ( a -> Html.Attribute msg, a )
    -> ( String, String )
    -> ()
    -> Expect.Expectation
expectAttribute ( setter, state ) ( attribute, attrState ) =
    \() ->
        Html.div [] [ Html.div [ setter state ] [] ]
            |> Query.fromHtml
            |> hasAttribute attribute attrState


hasAttribute : String -> String -> Query.Single msg -> Expect.Expectation
hasAttribute attribute state =
    Query.has
        [ Selector.attribute <|
            Html.Attributes.property attribute
                (Json.Encode.string state)
        ]
