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
        ]


addsAttribute : (String -> Html.Attribute msg) -> ( String, String ) -> Test
addsAttribute setter ( attribute, content ) =
    test ("sets the " ++ toString setter ++ " attribute") <|
        \() ->
            div [] [ div [ setter content ] [] ]
                |> Query.fromHtml
                |> Query.has [ Selector.attribute attribute content ]


addsControls : Test
addsControls =
    addsAttribute controls ( "aria-controls", "some-id" )


addsLabelledBy : Test
addsLabelledBy =
    addsAttribute labelledBy ( "aria-labelledby", "some-id" )


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
    , ( alertdialog, "alertdialog" )
    , ( application, "application" )
    , ( A11y.article, "article" )
    , ( banner, "banner" )
    , ( A11y.button, "button" )
    , ( checkbox, "checkbox" )
    , ( columnheader, "columnheader" )
    , ( combobox, "combobox" )
    , ( complementary, "complementary" )
    , ( contentinfo, "contentinfo" )
    , ( definition, "definition" )
    , ( dialog, "dialog" )
    , ( directory, "directory" )
    , ( document, "document" )
    , ( A11y.form, "form" )
    , ( grid, "grid" )
    , ( gridcell, "gridcell" )
    , ( group, "group" )
    , ( heading, "heading" )
    , ( A11y.img, "img" )
    , ( link, "link" )
    , ( list, "list" )
    , ( listbox, "listbox" )
    , ( listitem, "listitem" )
    , ( log, "log" )
    , ( A11y.main_, "main" )
    , ( marquee, "marquee" )
    , ( A11y.math, "math" )
    , ( A11y.menu, "menu" )
    , ( menubar, "menubar" )
    , ( A11y.menuitem, "menuitem" )
    , ( menuitemcheckbox, "menuitemcheckbox" )
    , ( menuitemradio, "menuitemradio" )
    , ( navigation, "navigation" )
    , ( note, "note" )
    , ( A11y.option, "option" )
    , ( presentation, "presentation" )
    , ( progressbar, "progressbar" )
    , ( radio, "radio" )
    , ( radiogroup, "radiogroup" )
    , ( region, "region" )
    , ( row, "row" )
    , ( rowgroup, "rowgroup" )
    , ( rowheader, "rowheader" )
    , ( scrollbar, "scrollbar" )
    , ( search, "search" )
    , ( separator, "separator" )
    , ( slider, "slider" )
    , ( spinbutton, "spinbutton" )
    , ( status, "status" )
    , ( A11y.tab, "tab" )
    , ( tablist, "tablist" )
    , ( tabpanel, "tabpanel" )
    , ( textbox, "textbox" )
    , ( timer, "timer" )
    , ( toolbar, "toolbar" )
    , ( tooltip, "tooltip" )
    , ( tree, "tree" )
    , ( treegrid, "treegrid" )
    , ( treeitem, "treeitem" )
    ]
