module Html.Attributes.A11ySpec exposing (spec)

import Html exposing (..)
import Html.A11y exposing (..)
import Html.Attributes.A11y exposing (..)
import Test exposing (..)
import Test.Html.Query as Query
import Test.Html.Selector as Selector
import Role exposing (..)


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
    [ ( role Alert, "alert" )
    , ( role Alertdialog, "alertdialog" )
    , ( role Application, "application" )
    , ( role Article, "article" )
    , ( role Banner, "banner" )
    , ( role Button, "button" )
    , ( role Checkbox, "checkbox" )
    , ( role Columnheader, "columnheader" )
    , ( role Combobox, "combobox" )
    , ( role Complementary, "complementary" )
    , ( role Contentinfo, "contentinfo" )
    , ( role Definition, "definition" )
    , ( role Dialog, "dialog" )
    , ( role Directory, "directory" )
    , ( role Document, "document" )
    , ( role Form, "form" )
    , ( role Grid, "grid" )
    , ( role Gridcell, "gridcell" )
    , ( role Group, "group" )
    , ( role Heading, "heading" )
    , ( role Img, "img" )
    , ( role Link, "link" )
    , ( role List, "list" )
    , ( role Listbox, "listbox" )
    , ( role Listitem, "listitem" )
    , ( role Log, "log" )
    , ( role Main, "main" )
    , ( role Marquee, "marquee" )
    , ( role Math, "math" )
    , ( role Menu, "menu" )
    , ( role Menubar, "menubar" )
    , ( role Menuitem, "menuitem" )
    , ( role Menuitemcheckbox, "menuitemcheckbox" )
    , ( role Menuitemradio, "menuitemradio" )
    , ( role Navigation, "navigation" )
    , ( role Note, "note" )
    , ( role Option, "option" )
    , ( role Presentation, "presentation" )
    , ( role Progressbar, "progressbar" )
    , ( role Radio, "radio" )
    , ( role Radiogroup, "radiogroup" )
    , ( role Region, "region" )
    , ( role Row, "row" )
    , ( role Rowgroup, "rowgroup" )
    , ( role Rowheader, "rowheader" )
    , ( role Scrollbar, "scrollbar" )
    , ( role Search, "search" )
    , ( role Separator, "separator" )
    , ( role Slider, "slider" )
    , ( role Spinbutton, "spinbutton" )
    , ( role Status, "status" )
    , ( role Tab, "tab" )
    , ( role Tablist, "tablist" )
    , ( role Tabpanel, "tabpanel" )
    , ( role Textbox, "textbox" )
    , ( role Timer, "timer" )
    , ( role Toolbar, "toolbar" )
    , ( role Tooltip, "tooltip" )
    , ( role Tree, "tree" )
    , ( role Treegrid, "treegrid" )
    , ( role Treeitem, "treeitem" )
    ]
