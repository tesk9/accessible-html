module Accessibility.Utils exposing (Role(..), aria, nonInteractive, role, toBoolString, toListString, toTriStateString)

import Html
import Html.Attributes exposing (..)



-- ARIA


aria : String -> String -> Html.Attribute msg
aria =
    attribute << (++) "aria-"



-- WIDGET STATE


toBoolString : Bool -> String
toBoolString bool =
    if bool then
        "true"

    else
        "false"


toTriStateString : Maybe Bool -> String
toTriStateString =
    Maybe.withDefault "mixed" << Maybe.map toBoolString


toListString : List String -> String
toListString =
    String.join " "



-- NEVER-ing


nonInteractive : List (Html.Attribute Never) -> List (Html.Attribute a)
nonInteractive =
    List.map (Html.Attributes.map Basics.never)



-- ROLE


role : Role -> Html.Attribute msg
role role_ =
    attribute "role" <| roleToString role_


{-| The roles defined here match [w3 website](https://www.w3.org/TR/wai-aria/roles).

To be used with `role`.

    div [ customRole Button ] []

-}
type Role
    = Alert
    | Alertdialog
    | Application
    | Article
    | Banner
    | Button
    | Checkbox
    | Columnheader
    | Combobox
    | Complementary
    | Contentinfo
    | Definition
    | Dialog
    | Directory
    | Document
    | Form
    | Grid
    | Gridcell
    | Group
    | Heading
    | Img
    | Link
    | List
    | Listbox
    | Listitem
    | Log
    | Main
    | Marquee
    | Math
    | Menu
    | Menubar
    | Menuitem
    | Menuitemcheckbox
    | Menuitemradio
    | Navigation
    | Note
    | Option
    | Presentation
    | Progressbar
    | Radio
    | Radiogroup
    | Region
    | Row
    | Rowgroup
    | Rowheader
    | Scrollbar
    | Search
    | Separator
    | Slider
    | Spinbutton
    | Status
    | Switch
    | Tab
    | Tablist
    | Tabpanel
    | Textbox
    | Timer
    | Toolbar
    | Tooltip
    | Tree
    | Treegrid
    | Treeitem


roleToString : Role -> String
roleToString role_ =
    case role_ of
        Alert ->
            "alert"

        Alertdialog ->
            "alertdialog"

        Application ->
            "application"

        Article ->
            "article"

        Banner ->
            "banner"

        Button ->
            "button"

        Checkbox ->
            "checkbox"

        Columnheader ->
            "columnheader"

        Combobox ->
            "combobox"

        Complementary ->
            "complementary"

        Contentinfo ->
            "contentinfo"

        Definition ->
            "definition"

        Dialog ->
            "dialog"

        Directory ->
            "directory"

        Document ->
            "document"

        Form ->
            "form"

        Grid ->
            "grid"

        Gridcell ->
            "gridcell"

        Group ->
            "group"

        Heading ->
            "heading"

        Img ->
            "img"

        Link ->
            "link"

        List ->
            "list"

        Listbox ->
            "listbox"

        Listitem ->
            "listitem"

        Log ->
            "log"

        Main ->
            "main"

        Marquee ->
            "marquee"

        Math ->
            "math"

        Menu ->
            "menu"

        Menubar ->
            "menubar"

        Menuitem ->
            "menuitem"

        Menuitemcheckbox ->
            "menuitemcheckbox"

        Menuitemradio ->
            "menuitemradio"

        Navigation ->
            "navigation"

        Note ->
            "note"

        Option ->
            "option"

        Presentation ->
            "presentation"

        Progressbar ->
            "progressbar"

        Radio ->
            "radio"

        Radiogroup ->
            "radiogroup"

        Region ->
            "region"

        Row ->
            "row"

        Rowgroup ->
            "rowgroup"

        Rowheader ->
            "rowheader"

        Scrollbar ->
            "scrollbar"

        Search ->
            "search"

        Separator ->
            "separator"

        Slider ->
            "slider"

        Spinbutton ->
            "spinbutton"

        Status ->
            "status"

        Switch ->
            "switch"

        Tab ->
            "tab"

        Tablist ->
            "tablist"

        Tabpanel ->
            "tabpanel"

        Textbox ->
            "textbox"

        Timer ->
            "timer"

        Toolbar ->
            "toolbar"

        Tooltip ->
            "tooltip"

        Tree ->
            "tree"

        Treegrid ->
            "treegrid"

        Treeitem ->
            "treeitem"
