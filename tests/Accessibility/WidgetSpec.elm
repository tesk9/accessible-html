module Accessibility.WidgetSpec exposing (spec)

import Accessibility.Widget exposing (..)
import Html
import Html.Attributes
import Json.Encode
import SpecHelpers exposing (..)
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
