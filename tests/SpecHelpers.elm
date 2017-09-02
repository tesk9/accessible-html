module SpecHelpers exposing (..)

import Expect
import Html
import Html.Attributes
import Json.Encode
import Test exposing (..)
import Test.Html.Query as Query
import Test.Html.Selector as Selector


addsAttribute : Html.Attribute msg -> ( String, String ) -> Test
addsAttribute setter ( attribute, content ) =
    test ("sets the " ++ toString setter ++ " attribute") <|
        expectAttribute ( \() -> setter, () ) ( attribute, content )


addsStringAttribute : (String -> Html.Attribute msg) -> ( String, String ) -> Test
addsStringAttribute setter ( attribute, content ) =
    test ("sets the " ++ toString setter ++ " attribute") <|
        expectAttribute ( setter, content ) ( attribute, content )


addsBoolAttribute : (Bool -> Html.Attribute msg) -> String -> Test
addsBoolAttribute setter attribute =
    describe ("sets the " ++ toString setter ++ " attribute")
        [ test "True" <| expectAttribute ( setter, True ) ( attribute, "true" )
        , test "False" <| expectAttribute ( setter, False ) ( attribute, "false" )
        ]


addsAriaStringAttribute : (String -> Html.Attribute msg) -> ( String, String ) -> Test
addsAriaStringAttribute setter ( attribute, content ) =
    addsStringAttribute setter ( "aria-" ++ attribute, content )


addsAriaBoolAttribute : (Bool -> Html.Attribute msg) -> String -> Test
addsAriaBoolAttribute setter attribute =
    addsBoolAttribute setter ("aria-" ++ attribute)


addsAriaListStringAttribute : (List String -> Html.Attribute msg) -> ( String, String ) -> Test
addsAriaListStringAttribute setter ( attribute, content ) =
    addsAttribute (setter [ content ]) ( "aria-" ++ attribute, content )


addsAriaTristateAttribute : (Maybe Bool -> Html.Attribute msg) -> String -> Test
addsAriaTristateAttribute setter attribute =
    describe ("sets the " ++ toString setter ++ " attribute")
        [ test "True" <| expectAria ( setter, Just True ) ( attribute, "true" )
        , test "False" <| expectAria ( setter, Just False ) ( attribute, "false" )
        , test "Mixed" <| expectAria ( setter, Nothing ) ( attribute, "mixed" )
        ]


addsAriaNumAttribute : (number -> Html.Attribute msg) -> String -> Test
addsAriaNumAttribute setter attribute =
    describe ("sets the " ++ toString setter ++ " attribute")
        [ test "True" <| expectAria ( setter, 8 ) ( attribute, "8" ) ]


expectAria :
    ( a -> Html.Attribute msg, a )
    -> ( String, b )
    -> ()
    -> Expect.Expectation
expectAria ( setter, state ) ( attribute, attrState ) =
    expectAttribute ( setter, state ) ( "aria-" ++ attribute, attrState )


expectAttribute :
    ( a -> Html.Attribute msg, a )
    -> ( String, b )
    -> ()
    -> Expect.Expectation
expectAttribute ( setter, state ) ( attribute, attrState ) =
    \() ->
        Html.div [] [ Html.div [ setter state ] [] ]
            |> Query.fromHtml
            |> hasAttribute attribute attrState


hasAttribute : String -> a -> Query.Single msg -> Expect.Expectation
hasAttribute attribute state =
    Query.has
        [ Selector.attribute <|
            Html.Attributes.property attribute
                ((Json.Encode.string << toString) state)
        ]
