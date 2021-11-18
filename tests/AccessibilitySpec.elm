module AccessibilitySpec exposing (anchorSpec, htmlSpec, imageSpec, inputSpec)

import Accessibility exposing (..)
import Html.Attributes as Attribute
import Html.Events exposing (onClick)
import Test exposing (..)
import Test.Html.Event as Event
import Test.Html.Query as Query
import Test.Html.Selector as Selector


anchorSpec : Test
anchorSpec =
    let
        anchor =
            div [] [ Accessibility.a "/hello-world" [] [] ]
    in
    describe "anchors" <|
        [ describe "a"
            [ test "has href" <|
                \() ->
                    anchor
                        |> Query.fromHtml
                        |> Query.find [ Selector.tag "a" ]
                        |> Query.has [ Selector.attribute <| Attribute.href "/hello-world" ]
            ]
        ]


inputSpec : Test
inputSpec =
    describe "inputs" <|
        [ describe "text inputs" <|
            let
                expected =
                    { label = "the label"
                    , value = "the value"
                    , type_ = "text"
                    }
            in
            [ describe "labelBefore"
                [ baseInputTests expected <|
                    labelBefore []
                        (text "the label")
                        (inputText "the value" [])
                ]
            , describe "labelAfter"
                [ baseInputTests expected <|
                    labelAfter []
                        (text "the label")
                        (inputText "the value" [])
                ]
            , describe "labelHidden"
                [ baseInputTests expected <|
                    labelHidden "id"
                        []
                        (text "the label")
                        (inputText "the value" [])
                ]
            ]
        , describe "radio inputs" <|
            let
                expected =
                    { label = "the label"
                    , value = "the value"
                    , type_ = "radio"
                    }
            in
            [ describe "labelBefore"
                [ baseInputTests expected <|
                    labelBefore []
                        (text "the label")
                        (radio "group_name" "the value" True [])
                ]
            , describe "labelAfter"
                [ baseInputTests expected <|
                    labelAfter []
                        (text "the label")
                        (radio "group_name" "the value" True [])
                ]
            , describe "labelHidden"
                [ baseInputTests expected <|
                    labelHidden "id"
                        []
                        (text "the label")
                        (radio "group_name" "the value" True [ Attribute.id "id" ])
                ]
            ]
        , describe "checkbox inputs" <|
            let
                expected =
                    { label = "the label"
                    , value = "the value"
                    , type_ = "checkbox"
                    }
            in
            [ describe "labelBefore"
                [ baseInputTests expected <|
                    labelBefore []
                        (text "the label")
                        (checkbox "the value" (Just True) [])
                ]
            , describe "labelAfter"
                [ baseInputTests expected <|
                    labelAfter []
                        (text "the label")
                        (checkbox "the value" (Just True) [])
                ]
            , describe "labelHidden"
                [ baseInputTests expected <|
                    labelHidden "id"
                        []
                        (text "the label")
                        (checkbox "the value" (Just True) [ Attribute.id "id" ])
                ]
            ]
        ]


baseInputTests : { label : String, value : String, type_ : String } -> Html msg -> Test
baseInputTests { label, value, type_ } view =
    let
        queryView =
            div [] [ figure [] [ view ] ]
                |> Query.fromHtml
    in
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
                    |> Query.has [ Selector.attribute <| Attribute.value value ]
        , test "is an input of the appropriate type" <|
            \() ->
                queryView
                    |> Query.find [ Selector.tag "input" ]
                    |> Query.has [ Selector.attribute <| Attribute.type_ type_ ]
        ]


imageSpec : Test
imageSpec =
    let
        queryView view =
            div [] [ Accessibility.figure [] [ view ] ]
                |> Query.fromHtml
                |> Query.find [ Selector.tag "img" ]
    in
    describe "images"
        [ describe "img"
            [ test "has alt text" <|
                \() ->
                    queryView (Accessibility.img "Birthday cake" [])
                        |> Query.has [ Selector.attribute <| Attribute.alt "Birthday cake" ]
            ]
        , describe "decorativeImg"
            [ test "has empty alt text" <|
                \() ->
                    queryView (decorativeImg [])
                        |> Query.has [ Selector.attribute <| Attribute.alt "" ]
            ]
        ]


type Msg
    = DoAThing


htmlSpec : Test
htmlSpec =
    let
        expectClickableChild element =
            div [] [ element [] [ button [ onClick DoAThing ] [] ] ]
                |> Query.fromHtml
                |> Query.find [ Selector.tag "button" ]
                |> Event.simulate Event.click
                |> Event.expect DoAThing
    in
    describe "aliased elements without event listener support"
        [ test "section" <|
            \() ->
                expectClickableChild section
        , test "nav" <|
            \() ->
                expectClickableChild nav
        , test "article" <|
            \() ->
                expectClickableChild article
        , test "aside" <|
            \() ->
                expectClickableChild aside
        , test "h1" <|
            \() ->
                expectClickableChild h1
        , test "h2" <|
            \() ->
                expectClickableChild h2
        , test "h3" <|
            \() ->
                expectClickableChild h3
        , test "h4" <|
            \() ->
                expectClickableChild h4
        , test "h5" <|
            \() ->
                expectClickableChild h5
        , test "h6" <|
            \() ->
                expectClickableChild h6
        , test "header" <|
            \() ->
                expectClickableChild header
        , test "footer" <|
            \() ->
                expectClickableChild footer
        , test "address" <|
            \() ->
                expectClickableChild address
        , test "main_" <|
            \() ->
                expectClickableChild main_
        , test "p" <|
            \() ->
                expectClickableChild p
        , test "hr" <|
            \() ->
                expectClickableChild hr
        , test "pre" <|
            \() ->
                expectClickableChild pre
        , test "blockquote" <|
            \() ->
                expectClickableChild blockquote
        , test "ol" <|
            \() ->
                expectClickableChild ol
        , test "ul" <|
            \() ->
                expectClickableChild ul
        , test "li" <|
            \() ->
                expectClickableChild li
        , test "dl" <|
            \() ->
                expectClickableChild dl
        , test "dt" <|
            \() ->
                expectClickableChild dt
        , test "dd" <|
            \() ->
                expectClickableChild dd
        , test "figcaption" <|
            \() ->
                expectClickableChild figcaption
        , test "div" <|
            \() ->
                expectClickableChild div
        , test "em" <|
            \() ->
                expectClickableChild em
        , test "strong" <|
            \() ->
                expectClickableChild strong
        , test "small" <|
            \() ->
                expectClickableChild small
        , test "s" <|
            \() ->
                expectClickableChild s
        , test "cite" <|
            \() ->
                expectClickableChild cite
        , test "q" <|
            \() ->
                expectClickableChild q
        , test "dfn" <|
            \() ->
                expectClickableChild dfn
        , test "abbr" <|
            \() ->
                expectClickableChild abbr
        , test "time" <|
            \() ->
                expectClickableChild time
        , test "code" <|
            \() ->
                expectClickableChild code
        , test "var" <|
            \() ->
                expectClickableChild var
        , test "samp" <|
            \() ->
                expectClickableChild samp
        , test "kbd" <|
            \() ->
                expectClickableChild kbd
        , test "sub" <|
            \() ->
                expectClickableChild sub
        , test "sup" <|
            \() ->
                expectClickableChild sup
        , test "i" <|
            \() ->
                expectClickableChild i
        , test "b" <|
            \() ->
                expectClickableChild b
        , test "u" <|
            \() ->
                expectClickableChild u
        , test "mark" <|
            \() ->
                expectClickableChild mark
        , test "ruby" <|
            \() ->
                expectClickableChild ruby
        , test "rt" <|
            \() ->
                expectClickableChild rt
        , test "rp" <|
            \() ->
                expectClickableChild rp
        , test "bdi" <|
            \() ->
                expectClickableChild bdi
        , test "bdo" <|
            \() ->
                expectClickableChild bdo
        , test "span" <|
            \() ->
                expectClickableChild span
        , test "wbr" <|
            \() ->
                expectClickableChild wbr
        , test "ins" <|
            \() ->
                expectClickableChild ins
        , test "del" <|
            \() ->
                expectClickableChild del
        , test "iframe" <|
            \() ->
                expectClickableChild iframe
        , test "embed" <|
            \() ->
                expectClickableChild embed
        , test "object" <|
            \() ->
                expectClickableChild object
        , test "param" <|
            \() ->
                expectClickableChild param
        , test "video" <|
            \() ->
                expectClickableChild video
        , test "audio" <|
            \() ->
                expectClickableChild audio
        , test "source" <|
            \() ->
                expectClickableChild source
        , test "track" <|
            \() ->
                expectClickableChild track
        , test "canvas" <|
            \() ->
                expectClickableChild canvas
        , test "math" <|
            \() ->
                expectClickableChild math
        , test "table" <|
            \() ->
                expectClickableChild table
        , test "caption" <|
            \() ->
                expectClickableChild caption
        , test "colgroup" <|
            \() ->
                expectClickableChild colgroup
        , test "col" <|
            \() ->
                expectClickableChild col
        , test "tbody" <|
            \() ->
                expectClickableChild tbody
        , test "thead" <|
            \() ->
                expectClickableChild thead
        , test "tfoot" <|
            \() ->
                expectClickableChild tfoot
        , test "tr" <|
            \() ->
                expectClickableChild tr
        , test "td" <|
            \() ->
                expectClickableChild td
        , test "th" <|
            \() ->
                expectClickableChild th
        , test "form" <|
            \() ->
                expectClickableChild form
        , test "fieldset" <|
            \() ->
                expectClickableChild fieldset
        , test "legend" <|
            \() ->
                expectClickableChild legend
        , test "label" <|
            \() ->
                expectClickableChild label
        , test "datalist" <|
            \() ->
                expectClickableChild datalist
        , test "optgroup" <|
            \() ->
                expectClickableChild optgroup
        , test "option" <|
            \() ->
                expectClickableChild option
        , test "textarea" <|
            \() ->
                expectClickableChild textarea
        , test "output" <|
            \() ->
                expectClickableChild output
        , test "progress" <|
            \() ->
                expectClickableChild progress
        , test "meter" <|
            \() ->
                expectClickableChild meter
        , test "details" <|
            \() ->
                expectClickableChild details
        , test "summary" <|
            \() ->
                expectClickableChild summary
        , test "menuitem" <|
            \() ->
                expectClickableChild menuitem
        , test "menu" <|
            \() ->
                expectClickableChild menu
        ]
