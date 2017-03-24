module Html.A11ySpec exposing (spec)

import Html exposing (..)
import Html.A11y exposing (..)
import List.Zipper as Zipper
import Test.Html.Query as Query
import Test.Html.Selector as Selector
import Test exposing (..)


spec : Test
spec =
    describe "Html.Attributes.A11ySpec"
        [ describe "inputs" <|
            [ describe "leftLabeledInput" (inputTests leftLabeledInput)
            , describe "rightLabeledInput" (inputTests rightLabeledInput)
            , describe "invisibleLabeledInput" (inputTests ((flip invisibleLabeledInput) "input-id"))
            ]
        , tabsTests
        ]


inputTests : (Input msg -> Html msg) -> List Test
inputTests toView =
    let
        queryView model =
            div [] [ toView model ]
                |> Query.fromHtml
    in
        [ describe "textInput" <|
            let
                mockInputModel =
                    { label = text "Name"
                    , typeAndValue = textInput "Tessa"
                    , attributes = []
                    }
            in
                [ baseInputTests (queryView mockInputModel)
                    { label = "Name", value = "Tessa", type_ = "text" }
                ]
        , describe "radioInput" <|
            let
                mockInputModel =
                    { label = text "Radio input"
                    , typeAndValue = radioInput "radio-group-name" "8" True
                    , attributes = []
                    }
            in
                [ baseInputTests (queryView mockInputModel)
                    { label = "Radio input", value = "8", type_ = "radio" }
                , test "is checked" <|
                    \() ->
                        queryView mockInputModel
                            |> Query.find [ Selector.tag "input" ]
                            |> Query.has [ Selector.boolAttribute "checked" True ]
                ]
        , describe "checkboxInput" <|
            let
                mockInputModel maybeSelected =
                    { label = text "To check or not to check?"
                    , typeAndValue = checkboxInput "some sick value" maybeSelected
                    , attributes = []
                    }
            in
                [ baseInputTests (queryView <| mockInputModel (Just True))
                    { label = "To check or not to check?", value = "some sick value", type_ = "checkbox" }
                , test "is checked" <|
                    \() ->
                        queryView (mockInputModel (Just True))
                            |> Query.find [ Selector.tag "input" ]
                            |> Query.has [ Selector.boolAttribute "checked" True ]
                , test "is not checked" <|
                    \() ->
                        queryView (mockInputModel (Just False))
                            |> Query.find [ Selector.tag "input" ]
                            |> Query.has [ Selector.boolAttribute "checked" False ]
                , test "is indeterminate" <|
                    \() ->
                        queryView (mockInputModel Nothing)
                            |> Query.find [ Selector.tag "input" ]
                            |> Query.has [ Selector.boolAttribute "indeterminate" True ]
                ]
        ]


baseInputTests : Query.Single -> { label : String, value : String, type_ : String } -> Test
baseInputTests queryView { label, value, type_ } =
    describe "Basic input tests"
        [ test "has label with the given label text" <|
            \() ->
                queryView
                    |> Query.find [ Selector.tag "label" ]
                    |> Query.has [ Selector.text label ]
        , test "has input with the appropriate value" <|
            \() ->
                queryView
                    |> Query.find [ Selector.tag "input" ]
                    |> Query.has [ Selector.attribute "value" value ]
        , test "is an input of the appropriate type" <|
            \() ->
                queryView
                    |> Query.find [ Selector.tag "input" ]
                    |> Query.has [ Selector.attribute "type" type_ ]
        ]


tabsTests : Test
tabsTests =
    let
        header content =
            h3 [] [ text content ]

        panel content =
            div [] [ h4 [] [ text "Section header" ], div [] [ text content ] ]
    in
        describe "tabs"
            [ describe "for a single tab" <|
                testCurrentTab (Zipper.singleton ( header "Tab1", panel "Panel1" )) ( "Tab1", "Panel1" )
            , describe "for many tabs" <|
                let
                    default =
                        Zipper.withDefault ( header "Failed", panel "Failed" )

                    tabPanelPairsZipper =
                        default <|
                            Zipper.fromList
                                [ ( header "Tab1", panel "Panel1" )
                                , ( header "Tab2", panel "Panel2" )
                                , ( header "Tab3", panel "Panel3" )
                                , ( header "Tab4", panel "Panel4" )
                                , ( header "Tab5", panel "Panel5" )
                                ]
                in
                    [ describe "first tab selected" <|
                        testCurrentTab tabPanelPairsZipper ( "Tab1", "Panel1" )
                    , describe "second tab selected" <|
                        testCurrentTab (default <| Zipper.next tabPanelPairsZipper) ( "Tab2", "Panel2" )
                    , describe "last tab selected" <|
                        testCurrentTab (Zipper.last tabPanelPairsZipper) ( "Tab5", "Panel5" )
                    ]
            ]


testCurrentTab : Zipper.Zipper ( Html TabMsg, Html TabMsg ) -> ( String, String ) -> List Test
testCurrentTab tabPanelPairsZipper ( tabContent, panelContent ) =
    let
        queryView =
            tabs "group-id" tabPanelPairsZipper
                |> Query.fromHtml

        tabSelector =
            Query.find [ Selector.attribute "role" "tab", Selector.attribute "aria-selected" "true" ] queryView

        panelSelector =
            Query.find [ Selector.attribute "role" "tabpanel", Selector.attribute "aria-hidden" "false" ] queryView
    in
        [ test "the current tab has the right content" <|
            \() ->
                Query.has [ Selector.text tabContent ] tabSelector
        , test "the tab controls the associated panel" <|
            \() ->
                Query.has [ Selector.attribute "aria-controls" "group-id-tabPanel-current" ] tabSelector
        , test "the current panel has the right content" <|
            \() ->
                Query.has [ Selector.text panelContent ] panelSelector
        , test "the panel is labelled by the tab" <|
            \() ->
                Query.has [ Selector.attribute "aria-labelledby" "group-id-tab-current" ] panelSelector
        ]
