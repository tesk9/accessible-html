module Html.Attributes.A11ySpec exposing (spec)

import Html exposing (..)
import Html.Attributes.A11y exposing (..)
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
        ]


addsControls : Test
addsControls =
    test "sets the aria-controls attribute" <|
        \() ->
            div [] [ div [ controls "some-id" ] [] ]
                |> Query.fromHtml
                |> Query.has [ Selector.attribute "aria-controls" "some-id" ]


addsLabelledBy : Test
addsLabelledBy =
    test "sets the aria-labelledby attribute" <|
        \() ->
            div [] [ div [ labelledBy "some-id" ] [] ]
                |> Query.fromHtml
                |> Query.has [ Selector.attribute "aria-labelledby" "some-id" ]


addsSelected : Bool -> Test
addsSelected selected_ =
    test "sets the aria-selected attribute" <|
        \() ->
            div [] [ div [ selected selected_ ] [] ]
                |> Query.fromHtml
                |> Query.has [ Selector.attribute "aria-selected" (String.toLower <| toString selected_) ]


addsRole : Role -> String -> Test
addsRole role_ expected =
    test ("sets the role attribute: " ++ toString role_) <|
        \() ->
            div [] [ div [ role role_ ] [] ]
                |> Query.fromHtml
                |> Query.has [ Selector.attribute "role" expected ]


allRoles : List ( Role, String )
allRoles =
    [ ( Alert, "alert" )
    , ( Alertdialog, "alertdialog" )
    , ( Application, "application" )
    , ( Article, "article" )
    , ( Banner, "banner" )
    , ( Button, "button" )
    , ( Checkbox, "checkbox" )
    , ( Columnheader, "columnheader" )
    , ( Combobox, "combobox" )
    , ( Complementary, "complementary" )
    , ( Contentinfo, "contentinfo" )
    , ( Definition, "definition" )
    , ( Dialog, "dialog" )
    , ( Directory, "directory" )
    , ( Document, "document" )
    , ( Form, "form" )
    , ( Grid, "grid" )
    , ( Gridcell, "gridcell" )
    , ( Group, "group" )
    , ( Heading, "heading" )
    , ( Img, "img" )
    , ( Link, "link" )
    , ( List, "list" )
    , ( Listbox, "listbox" )
    , ( Listitem, "listitem" )
    , ( Log, "log" )
    , ( Main, "main" )
    , ( Marquee, "marquee" )
    , ( Math, "math" )
    , ( Menu, "menu" )
    , ( Menubar, "menubar" )
    , ( Menuitem, "menuitem" )
    , ( Menuitemcheckbox, "menuitemcheckbox" )
    , ( Menuitemradio, "menuitemradio" )
    , ( Navigation, "navigation" )
    , ( Note, "note" )
    , ( Option, "option" )
    , ( Presentation, "presentation" )
    , ( Progressbar, "progressbar" )
    , ( Radio, "radio" )
    , ( Radiogroup, "radiogroup" )
    , ( Region, "region" )
    , ( Row, "row" )
    , ( Rowgroup, "rowgroup" )
    , ( Rowheader, "rowheader" )
    , ( Scrollbar, "scrollbar" )
    , ( Search, "search" )
    , ( Separator, "separator" )
    , ( Slider, "slider" )
    , ( Spinbutton, "spinbutton" )
    , ( Status, "status" )
    , ( Tab, "tab" )
    , ( Tablist, "tablist" )
    , ( Tabpanel, "tabpanel" )
    , ( Textbox, "textbox" )
    , ( Timer, "timer" )
    , ( Toolbar, "toolbar" )
    , ( Tooltip, "tooltip" )
    , ( Tree, "tree" )
    , ( Treegrid, "treegrid" )
    , ( Treeitem, "treeitem" )
    ]
