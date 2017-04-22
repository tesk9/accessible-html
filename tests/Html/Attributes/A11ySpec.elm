module Html.Attributes.A11ySpec exposing (spec)

import Html exposing (..)
import Html.A11y exposing (..)
import Html.Attributes.A11y as A11y exposing (..)
import Test exposing (..)
import Test.Html.Query as Query
import Test.Html.Selector as Selector


spec : Test
spec =
    describe "Html.Attributes.A11ySpec"
        [ describe "attribute setters"
            [ addsControls
            , addsLabelledBy
            , addsSelected True
            , addsSelected False
            ]
        , describe "role" <|
            List.map (uncurry addsRole) allRoles
        , longDescriptionTests
        , widgetTests
        ]


addsAttribute : Html.Attribute msg -> ( String, String ) -> Test
addsAttribute setter ( attribute, content ) =
    test ("sets the " ++ toString setter ++ " attribute") <|
        \() ->
            div [] [ div [ setter ] [] ]
                |> Query.fromHtml
                |> Query.has [ Selector.attribute attribute content ]


addsStringAttribute : (String -> Html.Attribute msg) -> ( String, String ) -> Test
addsStringAttribute setter ( attribute, content ) =
    test ("sets the " ++ toString setter ++ " attribute") <|
        \() ->
            div [] [ div [ setter content ] [] ]
                |> Query.fromHtml
                |> Query.has [ Selector.attribute attribute content ]


addsBoolAttribute : (Bool -> Html.Attribute msg) -> String -> Test
addsBoolAttribute setter attribute =
    let
        adds bool =
            \() ->
                div [] [ div [ setter bool ] [] ]
                    |> Query.fromHtml
                    |> Query.has [ Selector.attribute attribute (String.toLower <| toString bool) ]
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


addsAriaTristateAttribute : (Maybe Bool -> Html.Attribute msg) -> String -> Test
addsAriaTristateAttribute setter attribute =
    let
        adds state desiredState =
            \() ->
                div [] [ div [ setter state ] [] ]
                    |> Query.fromHtml
                    |> Query.has [ Selector.attribute ("aria-" ++ attribute) desiredState ]
    in
        describe ("sets the " ++ toString setter ++ " attribute")
            [ test "True" <| adds (Just True) "true"
            , test "False" <| adds (Just False) "false"
            , test "Mixed" <| adds Nothing "mixed"
            ]


addsControls : Test
addsControls =
    addsStringAttribute controls ( "aria-controls", "some-id" )


addsLabelledBy : Test
addsLabelledBy =
    addsStringAttribute labelledBy ( "aria-labelledby", "some-id" )


addsSelected : Bool -> Test
addsSelected selected_ =
    addsBoolAttribute selected "aria-selected"


addsRole : Html.Attribute msg -> String -> Test
addsRole role_ expected =
    test ("sets the role attribute: " ++ toString role_) <|
        \() ->
            div [] [ div [ role_ ] [] ]
                |> Query.fromHtml
                |> Query.has [ Selector.attribute "role" expected ]


longDescriptionTests : Test
longDescriptionTests =
    let
        queryView =
            div [] [ Html.A11y.img "Growth Chart in Some Sweet Unit (Quarter 4)" [ longDescription "/quarter_4_summary#Growth" ] ]
                |> Query.fromHtml
                |> Query.find [ Selector.tag "img" ]
    in
        describe "longDescription"
            [ test "sets the longDesc attribute" <|
                \() ->
                    Query.has [ Selector.attribute "longDesc" "/quarter_4_summary#Growth" ] queryView
            ]


allRoles : List ( Html.Attribute msg, String )
allRoles =
    [ ( alert, "alert" )
    , ( alertDialog, "alertdialog" )
    , ( application, "application" )
    , ( A11y.article, "article" )
    , ( banner, "banner" )
    , ( A11y.button, "button" )
    , ( checkBox, "checkbox" )
    , ( columnHeader, "columnheader" )
    , ( comboBox, "combobox" )
    , ( complementary, "complementary" )
    , ( contentInfo, "contentinfo" )
    , ( definition, "definition" )
    , ( dialog, "dialog" )
    , ( directory, "directory" )
    , ( document, "document" )
    , ( A11y.form, "form" )
    , ( grid, "grid" )
    , ( gridCell, "gridcell" )
    , ( group, "group" )
    , ( heading, "heading" )
    , ( A11y.img, "img" )
    , ( link, "link" )
    , ( list, "list" )
    , ( listBox, "listbox" )
    , ( listItem, "listitem" )
    , ( log, "log" )
    , ( A11y.main_, "main" )
    , ( marquee, "marquee" )
    , ( A11y.math, "math" )
    , ( A11y.menu, "menu" )
    , ( menuBar, "menubar" )
    , ( A11y.menuItem, "menuitem" )
    , ( menuItemCheckBox, "menuitemcheckbox" )
    , ( menuItemRadio, "menuitemradio" )
    , ( navigation, "navigation" )
    , ( note, "note" )
    , ( A11y.option, "option" )
    , ( presentation, "presentation" )
    , ( progressBar, "progressbar" )
    , ( radio, "radio" )
    , ( radioGroup, "radiogroup" )
    , ( region, "region" )
    , ( row, "row" )
    , ( rowGroup, "rowgroup" )
    , ( rowHeader, "rowheader" )
    , ( scrollBar, "scrollbar" )
    , ( search, "search" )
    , ( separator, "separator" )
    , ( slider, "slider" )
    , ( spinButton, "spinbutton" )
    , ( status, "status" )
    , ( A11y.tab, "tab" )
    , ( A11y.tabList, "tablist" )
    , ( A11y.tabPanel, "tabpanel" )
    , ( textBox, "textbox" )
    , ( timer, "timer" )
    , ( toolBar, "toolbar" )
    , ( toolTip, "tooltip" )
    , ( tree, "tree" )
    , ( treeGrid, "treegrid" )
    , ( treeItem, "treeitem" )
    ]


widgetTests : Test
widgetTests =
    describe "Widgets" <|
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
        , addsAriaStringAttribute A11y.label ( "label", "some-id" )
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

        --,  valueMax
        --,  valueMin
        --,  valueNow
        --, level
        ]
