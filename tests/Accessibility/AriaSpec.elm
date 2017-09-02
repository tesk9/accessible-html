module Accessibility.AriaSpec exposing (spec)

import Accessibility.Aria exposing (..)
import Html
import Html.Attributes
import Json.Encode
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


addsAttribute : Html.Attribute msg -> ( String, String ) -> Test
addsAttribute setter ( attribute, content ) =
    test ("sets the " ++ toString setter ++ " attribute") <|
        \() ->
            Html.div [] [ Html.div [ setter ] [] ]
                |> Query.fromHtml
                |> Query.has
                    [ Selector.attribute <|
                        Html.Attributes.property attribute (Json.Encode.string content)
                    ]


addsStringAttribute : (String -> Html.Attribute msg) -> ( String, String ) -> Test
addsStringAttribute setter ( attribute, content ) =
    test ("sets the " ++ toString setter ++ " attribute") <|
        \() ->
            Html.div [] [ Html.div [ setter content ] [] ]
                |> Query.fromHtml
                |> Query.has
                    [ Selector.attribute <|
                        Html.Attributes.property attribute (Json.Encode.string content)
                    ]


addsBoolAttribute : (Bool -> Html.Attribute msg) -> String -> Test
addsBoolAttribute setter attribute =
    let
        adds bool =
            \() ->
                Html.div [] [ Html.div [ setter bool ] [] ]
                    |> Query.fromHtml
                    |> Query.has
                        [ Selector.attribute <|
                            Html.Attributes.property attribute
                                ((Json.Encode.string << String.toLower << toString) bool)
                        ]
    in
    describe ("sets the " ++ toString setter ++ " attribute")
        [ test "True" <| adds True
        , test "False" <| adds False
        ]


addsAriaAttribute : Html.Attribute msg -> ( String, String ) -> Test
addsAriaAttribute setter ( attribute, content ) =
    addsAttribute setter ( "aria-" ++ attribute, content )


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
    let
        adds state desiredState =
            \() ->
                Html.div [] [ Html.div [ setter state ] [] ]
                    |> Query.fromHtml
                    |> Query.has
                        [ Selector.attribute <|
                            Html.Attributes.property ("aria-" ++ attribute)
                                (Json.Encode.string desiredState)
                        ]
    in
    describe ("sets the " ++ toString setter ++ " attribute")
        [ test "True" <| adds (Just True) "true"
        , test "False" <| adds (Just False) "false"
        , test "Mixed" <| adds Nothing "mixed"
        ]


addsAriaNumAttribute : (number -> Html.Attribute msg) -> String -> Test
addsAriaNumAttribute setter attribute =
    --TODO: Fuzz?
    let
        adds state =
            \() ->
                Html.div [] [ Html.div [ setter state ] [] ]
                    |> Query.fromHtml
                    |> Query.has
                        [ Selector.attribute <|
                            Html.Attributes.property ("aria-" ++ attribute)
                                ((Json.Encode.string << toString) state)
                        ]
    in
    describe ("sets the " ++ toString setter ++ " attribute")
        [ test "True" <| adds 8 ]
