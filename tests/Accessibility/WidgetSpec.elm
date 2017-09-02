module Accessibility.WidgetSpec exposing (spec)

import Accessibility.Widget exposing (..)
import Html
import Html.Attributes
import Json.Encode
import Test exposing (..)
import Test.Html.Query as Query
import Test.Html.Selector as Selector


spec : Test
spec =
    describe "Accessibility.Widget"
        [ addsAriaAttribute autoCompleteInline ( "autocomplete", "inline" )
        , addsAriaAttribute autoCompleteList ( "autocomplete", "list" )
        , addsAriaAttribute autoCompleteBoth ( "autocomplete", "both" )
        , addsAriaAttribute hasMenuPopUp ( "haspopup", "menu" )
        , addsAriaAttribute hasListBoxPopUp ( "haspopup", "listbox" )
        , addsAriaAttribute hasTreePopUp ( "haspopup", "tree" )
        , addsAriaAttribute hasGridPopUp ( "haspopup", "grid" )
        , addsAriaAttribute hasDialogPopUp ( "haspopup", "dialog" )
        , addsAriaAttribute invalidGrammar ( "invalid", "grammar" )
        , addsAriaAttribute invalidSpelling ( "invalid", "spelling" )
        , addsAriaAttribute orientationHorizontal ( "orientation", "horizontal" )
        , addsAriaAttribute orientationVertical ( "orientation", "vertical" )
        , addsAriaAttribute sortAscending ( "sort", "ascending" )
        , addsAriaAttribute sortDescending ( "sort", "descending" )
        , addsAriaAttribute sortCustom ( "sort", "other" )
        , addsAriaAttribute sortNone ( "sort", "none" )
        , addsAriaStringAttribute label ( "label", "some-id" )
        , addsAriaStringAttribute valueText ( "valuetext", "Medium on the Range" )
        , addsAriaBoolAttribute disabled "disabled"
        , addsAriaBoolAttribute expanded "expanded"
        , addsAriaBoolAttribute hidden "hidden"
        , addsAriaBoolAttribute invalid "invalid"
        , addsAriaBoolAttribute multiLine "multiline"
        , addsAriaBoolAttribute multiSelectable "multiselectable"
        , addsAriaBoolAttribute readOnly "readonly"
        , addsAriaBoolAttribute required "required"
        , addsAriaBoolAttribute selected "selected"
        , addsAriaTristateAttribute pressed "pressed"
        , addsAriaTristateAttribute checked "checked"
        , addsAriaNumAttribute valueMax "valuemax"
        , addsAriaNumAttribute valueMin "valuemin"
        , addsAriaNumAttribute valueNow "valuenow"
        , addsAriaNumAttribute level "level"
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
