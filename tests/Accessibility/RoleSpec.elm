module Accessibility.RoleSpec exposing (spec)

import Accessibility exposing (div)
import Accessibility.Role exposing (..)
import Html exposing (Attribute)
import Html.Attributes exposing (property)
import Json.Encode
import Test exposing (..)
import Test.Html.Query as Query
import Test.Html.Selector as Selector


spec : Test
spec =
    describe "Accessibility.Role" <|
        List.map (\( a, b ) -> addsRole a b)
            [ ( alert, "alert" )
            , ( alertDialog, "alertdialog" )
            , ( application, "application" )
            , ( article, "article" )
            , ( button, "button" )
            , ( checkBox, "checkbox" )
            , ( columnHeader, "columnheader" )
            , ( comboBox, "combobox" )
            , ( definition, "definition" )
            , ( dialog, "dialog" )
            , ( directory, "directory" )
            , ( document, "document" )
            , ( grid, "grid" )
            , ( gridCell, "gridcell" )
            , ( group, "group" )
            , ( heading, "heading" )
            , ( img, "img" )
            , ( link, "link" )
            , ( list, "list" )
            , ( listBox, "listbox" )
            , ( listItem, "listitem" )
            , ( log, "log" )
            , ( marquee, "marquee" )
            , ( math, "math" )
            , ( menu, "menu" )
            , ( menuBar, "menubar" )
            , ( menuItem, "menuitem" )
            , ( menuItemCheckBox, "menuitemcheckbox" )
            , ( menuItemRadio, "menuitemradio" )
            , ( note, "note" )
            , ( option, "option" )
            , ( presentation, "presentation" )
            , ( progressBar, "progressbar" )
            , ( radio, "radio" )
            , ( radioGroup, "radiogroup" )
            , ( row, "row" )
            , ( rowGroup, "rowgroup" )
            , ( rowHeader, "rowheader" )
            , ( scrollBar, "scrollbar" )
            , ( separator, "separator" )
            , ( slider, "slider" )
            , ( spinButton, "spinbutton" )
            , ( status, "status" )
            , ( tab, "tab" )
            , ( tabList, "tablist" )
            , ( tabPanel, "tabpanel" )
            , ( textBox, "textbox" )
            , ( timer, "timer" )
            , ( toolBar, "toolbar" )
            , ( toolTip, "tooltip" )
            , ( tree, "tree" )
            , ( treeGrid, "treegrid" )
            , ( treeItem, "treeitem" )
            ]


addsRole : Attribute Never -> String -> Test
addsRole role_ expected =
    test ("sets the role attribute: " ++ expected) <|
        \() ->
            div [] [ div [ role_ ] [] ]
                |> Query.fromHtml
                |> Query.has
                    [ Selector.attribute <|
                        property "role" (Json.Encode.string expected)
                    ]
