module Accessibility exposing
    ( labelBefore, labelAfter, labelHidden
    , inputText, inputNumber, radio, checkbox
    , tabList, tab, tabPanel, viewTabs, TabConfig, ViewTabsSettings
    , img, decorativeImg
    , button, textarea, select
    , text
    , h1, h2, h3, h4, h5, h6
    , div, p, hr, pre, blockquote
    , span, a, code, em, strong, i, b, u, sub, sup, br
    , ol, ul, li, dl, dt, dd
    , iframe, canvas, math
    , form, formWithListeners, option
    , section, nav, article, aside, header, footer, address, main_
    , figure, figcaption
    , table, caption, colgroup, col, tbody, thead, tfoot, tr, td, th
    , fieldset, legend, label, datalist, optgroup, output, progress, meter
    , audio, video, source, track
    , embed, object, param
    , ins, del
    , small, cite, dfn, abbr, time, var, samp, kbd, s, q
    , mark, ruby, rt, rp, bdi, bdo, wbr
    , details, summary, menuitem, menu
    , Html, Attribute, map
    )

{-|


## Labels

@docs labelBefore, labelAfter, labelHidden


## Inputs

Right now, this library only supports a few input types. Many more input types exist.
See [MDN's input information](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input) for
more options.

@docs inputText, inputNumber, radio, checkbox


## Tabs

Together, `tabList`, `tab`, and `tabPanel` describe the pieces of a tab component view.

    import Accessibility exposing (Html, tab, tabList, tabPanel, text)
    import Accessibility.Aria exposing (controls, hidden, labelledBy, selected)
    import Html.Attributes exposing (id)

    view : Html msg
    view =
        tabList
            [ id "tab-list" ]
            [ tab
                [ id "tab-1"
                , selected True
                , controls "panel-1"
                ]
                [ text "Tab One" ]
            , tab
                [ id "tab-2"
                , selected False
                , controls "panel-2"
                ]
                [ text "Tab Two" ]
            , tabPanel
                [ id "panel-1"
                , labelledBy "tab-1"
                , hidden False
                , Html.Attributes.hidden False
                ]
                [ text "Panel One Content" ]
            , tabPanel
                [ id "panel-2"
                , labelledBy "tab-2"
                , hidden True
                , Html.Attributes.hidden True
                ]
                [ text "Panel Two Content" ]
            ]

@docs tabList, tab, tabPanel, viewTabs, TabConfig, ViewTabsSettings


## Images

There are two `img` tag helpers that ask you as the developer to decide whether
the image you want to display for screenviewers is necessary or distracting for
screenreaders. Essentially, does it convey meaning and value, or is it decorative?
Remember, **redundant** information can be confusing too.

    import Accessibility as Html exposing (..)
    import Html.Attributes exposing (src)

    view : Html msg
    view =
        div []
            [ img "Bear rubbing back on tree" [ src "bear.png" ]
            , decorativeImg [ src "smiling_family.jpg" ]
            ]

@docs img, decorativeImg


## From [Html](http://package.elm-lang.org/packages/elm/html/latest)


### Interactive

@docs button, textarea, select


### Non-interactive

These elements will prevent you from adding event listeners.

    import Accessibility exposing (..)

@docs text
@docs h1, h2, h3, h4, h5, h6
@docs div, p, hr, pre, blockquote
@docs span, a, code, em, strong, i, b, u, sub, sup, br
@docs ol, ul, li, dl, dt, dd
@docs iframe, canvas, math
@docs form, formWithListeners, option
@docs section, nav, article, aside, header, footer, address, main_
@docs figure, figcaption
@docs table, caption, colgroup, col, tbody, thead, tfoot, tr, td, th
@docs fieldset, legend, label, datalist, optgroup, output, progress, meter
@docs audio, video, source, track
@docs embed, object, param
@docs ins, del
@docs small, cite, dfn, abbr, time, var, samp, kbd, s, q
@docs mark, ruby, rt, rp, bdi, bdo, wbr
@docs details, summary, menuitem, menu


### Html aliases for Convenience

These are here to make the following nicer:

    import Accessibility as Html exposing (..)

@docs Html, Attribute, map

-}

import Accessibility.Aria as Aria
import Accessibility.Key as Key
import Accessibility.Role as Role
import Accessibility.Style as Style
import Accessibility.Utils exposing (nonInteractive)
import Html
import Html.Attributes exposing (id)


{-| All inputs must be associated with a `label`.

    labelBefore [] viewLabel viewInput

-}
labelBefore : List (Attribute Never) -> Html Never -> Html msg -> Html msg
labelBefore attributes labelContent input =
    label attributes [ Html.map Basics.never labelContent, input ]


{-| All inputs must be associated with a `label`.

    labelAfter [] viewLabel viewInput

-}
labelAfter : List (Attribute Never) -> Html Never -> Html msg -> Html msg
labelAfter attributes labelContent input =
    label attributes [ input, Html.map Basics.never labelContent ]


{-| All inputs must be associated with a `label`.

    labelHidden "id-of-input" [] viewLabel viewInput

The id that's passed in must be added to the input!

-}
labelHidden : String -> List (Attribute Never) -> Html Never -> Html msg -> Html msg
labelHidden id attributes labelContent input =
    span []
        [ label (Html.Attributes.for id :: Style.invisible ++ attributes)
            [ Html.map Basics.never labelContent ]
        , input
        ]



{- *** Inputs *** -}


{-| Constructs an input of type `text`. Use in conjunction with one of the label helpers (`labelBefore`, `labelAfter`, `labelHidden`).

    inputText "the value of the input" [ property "autocomplete" "given-name" ]

Use the HTML autocomplete attribute whenever possible. Read [Understanding Success Criterion 1.3.5: Identify Input Purpose](https://www.w3.org/WAI/WCAG21/Understanding/identify-input-purpose) and [Using HTML 5.2 autocomplete attributes (Technique H98)](https://www.w3.org/WAI/WCAG21/Techniques/html/H98) for more information.

You might notice that `Html.Attributes` and `Html.Attributes` don't provide full autocomplete support. This is tracked in [elm/html issue 189](https://github.com/elm/html/issues/189).

-}
inputText : String -> List (Attribute msg) -> Html msg
inputText value_ attributes =
    Html.input
        ([ Html.Attributes.type_ "text"
         , Html.Attributes.value value_
         ]
            ++ attributes
        )
        []


{-| Constructs an input of type "text" but constricting the input to allow only numbers as recommended by [gov.uk](https://technology.blog.gov.uk/2020/02/24/why-the-gov-uk-design-system-team-changed-the-input-type-for-numbers/). Use in conjunction with one of the label helpers (`labelBefore`, `labelAfter`, `labelHidden`).

    inputNumber 1950 [ property "autocomplete" "bday-year" ]

Use the HTML autocomplete attribute whenever possible. Read [Understanding Success Criterion 1.3.5: Identify Input Purpose](https://www.w3.org/WAI/WCAG21/Understanding/identify-input-purpose) and [Using HTML 5.2 autocomplete attributes (Technique H98)](https://www.w3.org/WAI/WCAG21/Techniques/html/H98) for more information.

You might notice that `Html.Attributes` and `Html.Attributes` don't provide full autocomplete support. This is tracked in [elm/html issue 189](https://github.com/elm/html/issues/189).

-}
inputNumber : String -> List (Attribute msg) -> Html msg
inputNumber value_ attributes =
    Html.input
        ([ Html.Attributes.type_ "text"
         , Html.Attributes.attribute "inputmode" "numeric"
         , Html.Attributes.pattern "[0-9]*"
         , Html.Attributes.value value_
         ]
            ++ attributes
        )
        []


{-| Constructs an input of type "radio". Use in conjunction with one of the label helpers (`labelBefore`, `labelAfter`, `labelHidden`).

    radio "radio-group-name" "Radio input value" True []

-}
radio : String -> String -> Bool -> List (Attribute msg) -> Html msg
radio name_ value_ checked_ attributes =
    Html.input
        ([ Html.Attributes.type_ "radio"
         , Html.Attributes.name name_
         , Html.Attributes.value value_
         , Html.Attributes.checked checked_
         ]
            ++ attributes
        )
        []


{-| Constructs an input of type "checkbox". Use in conjunction with one of the label helpers (`labelBefore`, `labelAfter`, `labelHidden`).

Checkboxes may be checked (`Just True`), unchecked (`Just False`), or indeterminate (`Nothing`).

    checkbox "Checkbox value" Nothing []

-}
checkbox : String -> Maybe Bool -> List (Attribute msg) -> Html msg
checkbox value_ maybeChecked attributes =
    Html.input
        (nonInteractive
            [ Html.Attributes.type_ "checkbox"
            , Html.Attributes.value value_
            , Maybe.withDefault Aria.indeterminate (Maybe.map Html.Attributes.checked maybeChecked)
            ]
            ++ attributes
        )
        []



{- *** Tabs *** -}


{-| Create a tablist. This is the outer container for a list of tabs.
-}
tabList : List (Attribute Never) -> List (Html msg) -> Html msg
tabList attributes =
    Html.div (Role.tabList :: nonInteractive attributes)


{-| Create a tab. This is the part that you select in order to change panel views.

You'll want to listen for click events **and** for keyboard events: when users hit
the right and left keys on their keyboards, they expect for the selected tab to change.

The controls setting is the ID of the tabpanel related to the tab. These must be the same!

    tab { id = "tab-1", controls = "tab-panel-1", selected = True } [] [ Html.text "Tab 1" ]

-}
tab : { id : String, controls : String, selected : Bool } -> List (Html.Attribute msg) -> List (Html msg) -> Html msg
tab settings attributes =
    Html.div
        (Role.tab
            :: Key.tabbable settings.selected
            :: id settings.id
            :: Aria.controls [ settings.controls ]
            :: Aria.selected settings.selected
            :: attributes
        )


{-| Create a tab panel.
-}
tabPanel : { id : String } -> List (Attribute Never) -> List (Html msg) -> Html msg
tabPanel settings attributes =
    Html.div (id settings.id :: Aria.labelledBy settings.id :: Role.tabPanel :: nonInteractive attributes)


{-| Representation type for a tab for use in the [viewTabs](#viewTabs) helper function.
-}
type alias TabConfig msg =
    { tabId : String
    , panelId : String
    , tabContent : List (Html msg)
    , panelContent : List (Html msg)
    }


{-| Settings required for the [viewTabs](#viewTabs) helper function to generate the correct structure for a tab layout.
-}
type alias ViewTabsSettings msg =
    { tabs : List (TabConfig msg)
    , selectedTabId : String
    , tabListAttributes : List (Attribute Never)
    }


{-| Create a set of tabs with associated panels.

    viewTabs
        { tabs =
            [ { tabId = "tab-1", panelId = "panel-1", tabContent = Html.p [] [ Html.text "Tab content 1" ], panelContent = Html.p [] [ Html.text "Panel content 1" ] }
            , { tabId = "tab-2", panelId = "panel-2", tabContent = Html.p [] [ Html.text "Tab content 2" ], panelContent = Html.p [] [ Html.text "Panel content 2" ] }
            ]
        , selectedTabId = "tab-1"
        , tabListAttributes = [ Html.Attributes.class "tablist" ]
        }

-}
viewTabs : ViewTabsSettings msg -> Html msg
viewTabs settings =
    let
        toTab : TabConfig msg -> Html msg
        toTab { tabId, panelId, tabContent } =
            tab
                { id = tabId, controls = panelId, selected = settings.selectedTabId == tabId }
                []
                tabContent

        toTabPanel : TabConfig msg -> Html msg
        toTabPanel { panelId, panelContent } =
            tabPanel
                { id = panelId }
                []
                panelContent

        tabs : List (Html msg)
        tabs =
            List.map toTab settings.tabs

        tabPanels : List (Html msg)
        tabPanels =
            List.map toTabPanel settings.tabs

        tabListForTabs : Html msg
        tabListForTabs =
            tabList settings.tabListAttributes tabs
    in
    [ List.singleton tabListForTabs, tabPanels ]
        |> List.concat
        |> Html.div []



{- *** Images *** -}


{-| Use this tag when the image provides information not expressed in the text of the page. When images are used to express the purpose of a button or link, aim for alternative text that encapsulates the function of the image.

Read through [the w3 informative image tutorial](https://www.w3.org/WAI/tutorials/images/informative/) and the [the w3 functional image tutorial](https://www.w3.org/WAI/tutorials/images/functional/) to learn more.

For graphs and diagrams, see `figure` and `longDesc`.

    img "Bear rubbing back on tree" [ src "bear.png" ]

-}
img : String -> List (Attribute Never) -> Html msg
img alt_ attributes =
    Html.img (Html.Attributes.alt alt_ :: nonInteractive attributes) []


{-| Use this tag when the image is decorative or provides redundant information. Read through [the w3 decorative image tutorial](https://www.w3.org/WAI/tutorials/images/decorative/) to learn more.

    decorativeImg [ src "smiling_family.jpg" ]

-}
decorativeImg : List (Attribute Never) -> Html msg
decorativeImg attributes =
    Html.img (Html.Attributes.alt "" :: nonInteractive (Role.presentation :: attributes)) []


{-| Adds the group role to a figure.
-}
figure : List (Attribute Never) -> List (Html msg) -> Html msg
figure attributes =
    Html.figure (nonInteractive (Role.group :: attributes))



{- *** Aliasing Html Elements *** -}


{-| -}
type alias Html msg =
    Html.Html msg


{-| -}
type alias Attribute msg =
    Html.Attribute msg


{-| `map` directly aliases the function of the same name from rtfeldman/elm-css.

Please see [the docs for the Html.map](https://package.elm-lang.org/packages/rtfeldman/elm-css/17.0.1/Html-Styled#map).

-}
map : (a -> msg) -> Html a -> Html msg
map =
    Html.map


{-| -}
text : String -> Html.Html msg
text =
    Html.text



-- INTERACTABLE


{-| -}
select : List (Attribute msg) -> List (Html msg) -> Html msg
select =
    Html.select


{-| -}
button : List (Attribute msg) -> List (Html msg) -> Html msg
button =
    Html.button


{-| -}
textarea : List (Attribute msg) -> List (Html msg) -> Html msg
textarea =
    Html.textarea



-- NOT INTERACTABLE


{-| `section` should generally not have event listeners. If you _really_ need to add
an event listener, use the elm/html library instead.
-}
section : List (Attribute Never) -> List (Html msg) -> Html msg
section attributes =
    Html.section (nonInteractive attributes)


{-| `nav` should generally not have event listeners. If you _really_ need to add
an event listener, use the elm/html library instead.
-}
nav : List (Attribute Never) -> List (Html msg) -> Html msg
nav attributes =
    Html.nav (nonInteractive attributes)


{-| `article` should generally not have event listeners. If you _really_ need to add
an event listener, use the elm/html library instead.
-}
article : List (Attribute Never) -> List (Html msg) -> Html msg
article attributes =
    Html.article (nonInteractive attributes)


{-| `aside` should generally not have event listeners. If you _really_ need to add
an event listener, use the elm/html library instead.
-}
aside : List (Attribute Never) -> List (Html msg) -> Html msg
aside attributes =
    Html.aside (nonInteractive attributes)


{-| `h1` should generally not have event listeners. If you _really_ need to add
an event listener, use the elm/html library instead.
-}
h1 : List (Attribute Never) -> List (Html msg) -> Html msg
h1 attributes =
    Html.h1 (nonInteractive attributes)


{-| `h2` should generally not have event listeners. If you _really_ need to add
an event listener, use the elm/html library instead.
-}
h2 : List (Attribute Never) -> List (Html msg) -> Html msg
h2 attributes =
    Html.h2 (nonInteractive attributes)


{-| `h3` should generally not have event listeners. If you _really_ need to add
an event listener, use the elm/html library instead.
-}
h3 : List (Attribute Never) -> List (Html msg) -> Html msg
h3 attributes =
    Html.h3 (nonInteractive attributes)


{-| `h4` should generally not have event listeners. If you _really_ need to add
an event listener, use the elm/html library instead.
-}
h4 : List (Attribute Never) -> List (Html msg) -> Html msg
h4 attributes =
    Html.h4 (nonInteractive attributes)


{-| `h5` should generally not have event listeners. If you _really_ need to add
an event listener, use the elm/html library instead.
-}
h5 : List (Attribute Never) -> List (Html msg) -> Html msg
h5 attributes =
    Html.h5 (nonInteractive attributes)


{-| `h6` should generally not have event listeners. If you _really_ need to add
an event listener, use the elm/html library instead.
-}
h6 : List (Attribute Never) -> List (Html msg) -> Html msg
h6 attributes =
    Html.h6 (nonInteractive attributes)


{-| `header` should generally not have event listeners. If you _really_ need to add
an event listener, use the elm/html library instead.
-}
header : List (Attribute Never) -> List (Html msg) -> Html msg
header attributes =
    Html.header (nonInteractive attributes)


{-| `footer` should generally not have event listeners. If you _really_ need to add
an event listener, use the elm/html library instead.
-}
footer : List (Attribute Never) -> List (Html msg) -> Html msg
footer attributes =
    Html.footer (nonInteractive attributes)


{-| `address` should generally not have event listeners. If you _really_ need to add
an event listener, use the elm/html library instead.
-}
address : List (Attribute Never) -> List (Html msg) -> Html msg
address attributes =
    Html.address (nonInteractive attributes)


{-| `main_` should generally not have event listeners. If you _really_ need to add
an event listener, use the elm/html library instead.
-}
main_ : List (Attribute Never) -> List (Html msg) -> Html msg
main_ attributes =
    Html.main_ (nonInteractive attributes)



-- GROUPING CONTENT


{-| `p` should generally not have event listeners. If you _really_ need to add
an event listener, use the elm/html library instead.
-}
p : List (Attribute Never) -> List (Html msg) -> Html msg
p attributes =
    Html.p (nonInteractive attributes)


{-| `hr` should generally not have event listeners. If you _really_ need to add
an event listener, use the elm/html library instead.
-}
hr : List (Attribute Never) -> List (Html msg) -> Html msg
hr attributes =
    Html.hr (nonInteractive attributes)


{-| `pre` should generally not have event listeners. If you _really_ need to add
an event listener, use the elm/html library instead.
-}
pre : List (Attribute Never) -> List (Html msg) -> Html msg
pre attributes =
    Html.pre (nonInteractive attributes)


{-| `blockquote` should generally not have event listeners. If you _really_ need to add
an event listener, use the elm/html library instead.
-}
blockquote : List (Attribute Never) -> List (Html msg) -> Html msg
blockquote attributes =
    Html.blockquote (nonInteractive attributes)


{-| `ol` should generally not have event listeners. If you _really_ need to add
an event listener, use the elm/html library instead.
-}
ol : List (Attribute Never) -> List (Html msg) -> Html msg
ol attributes =
    Html.ol (nonInteractive attributes)


{-| `ul` should generally not have event listeners. If you _really_ need to add
an event listener, use the elm/html library instead.
-}
ul : List (Attribute Never) -> List (Html msg) -> Html msg
ul attributes =
    Html.ul (nonInteractive attributes)


{-| `li` should generally not have event listeners. If you _really_ need to add
an event listener, use the elm/html library instead.
-}
li : List (Attribute Never) -> List (Html msg) -> Html msg
li attributes =
    Html.li (nonInteractive attributes)


{-| `dl` should generally not have event listeners. If you _really_ need to add
an event listener, use the elm/html library instead.
-}
dl : List (Attribute Never) -> List (Html msg) -> Html msg
dl attributes =
    Html.dl (nonInteractive attributes)


{-| `dt` should generally not have event listeners. If you _really_ need to add
an event listener, use the elm/html library instead.
-}
dt : List (Attribute Never) -> List (Html msg) -> Html msg
dt attributes =
    Html.dt (nonInteractive attributes)


{-| `dd` should generally not have event listeners. If you _really_ need to add
an event listener, use the elm/html library instead.
-}
dd : List (Attribute Never) -> List (Html msg) -> Html msg
dd attributes =
    Html.dd (nonInteractive attributes)


{-| `figcaption` should generally not have event listeners. If you _really_ need to add
an event listener, use the elm/html library instead.
-}
figcaption : List (Attribute Never) -> List (Html msg) -> Html msg
figcaption attributes =
    Html.figcaption (nonInteractive attributes)


{-| `div` should generally not have event listeners. If you _really_ need to add
an event listener, use the elm/html library instead.
-}
div : List (Attribute Never) -> List (Html msg) -> Html msg
div attributes =
    Html.div (nonInteractive attributes)



-- TEXT LEVEL SEMANTIC


{-| Read [Understanding Success Criterion 2.4.9: Link Purpose (Link Only)](https://www.w3.org/WAI/WCAG21/Understanding/link-purpose-link-only) to improve the usability of your links.

As you add links in your web application, please also consider reading through [Understanding Success Criterion 2.4.8: Location](https://www.w3.org/WAI/WCAG21/Understanding/location), which will help you learn how you can orient users to where they are in relation to the rest of the website content.

`a` should generally not have event listeners. If you _really_ need to add
an event listener, use the elm/html library instead.

-}
a : List (Attribute Never) -> List (Html msg) -> Html msg
a attributes =
    Html.a (nonInteractive attributes)


{-| `em` should generally not have event listeners. If you _really_ need to add
an event listener, use the elm/html library instead.
-}
em : List (Attribute Never) -> List (Html msg) -> Html msg
em attributes =
    Html.em (nonInteractive attributes)


{-| `strong` should generally not have event listeners. If you _really_ need to add
an event listener, use the elm/html library instead.
-}
strong : List (Attribute Never) -> List (Html msg) -> Html msg
strong attributes =
    Html.strong (nonInteractive attributes)


{-| `small` should generally not have event listeners. If you _really_ need to add
an event listener, use the elm/html library instead.
-}
small : List (Attribute Never) -> List (Html msg) -> Html msg
small attributes =
    Html.small (nonInteractive attributes)


{-| `s` should generally not have event listeners. If you _really_ need to add
an event listener, use the elm/html library instead.
-}
s : List (Attribute Never) -> List (Html msg) -> Html msg
s attributes =
    Html.s (nonInteractive attributes)


{-| `cite` should generally not have event listeners. If you _really_ need to add
an event listener, use the elm/html library instead.
-}
cite : List (Attribute Never) -> List (Html msg) -> Html msg
cite attributes =
    Html.cite (nonInteractive attributes)


{-| `q` should generally not have event listeners. If you _really_ need to add
an event listener, use the elm/html library instead.
-}
q : List (Attribute Never) -> List (Html msg) -> Html msg
q attributes =
    Html.q (nonInteractive attributes)


{-| `dfn` should generally not have event listeners. If you _really_ need to add
an event listener, use the elm/html library instead.
-}
dfn : List (Attribute Never) -> List (Html msg) -> Html msg
dfn attributes =
    Html.dfn (nonInteractive attributes)


{-| `abbr` should generally not have event listeners. If you _really_ need to add
an event listener, use the elm/html library instead.
-}
abbr : List (Attribute Never) -> List (Html msg) -> Html msg
abbr attributes =
    Html.abbr (nonInteractive attributes)


{-| `time` should generally not have event listeners. If you _really_ need to add
an event listener, use the elm/html library instead.
-}
time : List (Attribute Never) -> List (Html msg) -> Html msg
time attributes =
    Html.time (nonInteractive attributes)


{-| `code` should generally not have event listeners. If you _really_ need to add
an event listener, use the elm/html library instead.
-}
code : List (Attribute Never) -> List (Html msg) -> Html msg
code attributes =
    Html.code (nonInteractive attributes)


{-| `var` should generally not have event listeners. If you _really_ need to add
an event listener, use the elm/html library instead.
-}
var : List (Attribute Never) -> List (Html msg) -> Html msg
var attributes =
    Html.var (nonInteractive attributes)


{-| `samp` should generally not have event listeners. If you _really_ need to add
an event listener, use the elm/html library instead.
-}
samp : List (Attribute Never) -> List (Html msg) -> Html msg
samp attributes =
    Html.samp (nonInteractive attributes)


{-| `kbd` should generally not have event listeners. If you _really_ need to add
an event listener, use the elm/html library instead.
-}
kbd : List (Attribute Never) -> List (Html msg) -> Html msg
kbd attributes =
    Html.kbd (nonInteractive attributes)


{-| `sub` should generally not have event listeners. If you _really_ need to add
an event listener, use the elm/html library instead.
-}
sub : List (Attribute Never) -> List (Html msg) -> Html msg
sub attributes =
    Html.sub (nonInteractive attributes)


{-| `sup` should generally not have event listeners. If you _really_ need to add
an event listener, use the elm/html library instead.
-}
sup : List (Attribute Never) -> List (Html msg) -> Html msg
sup attributes =
    Html.sup (nonInteractive attributes)


{-| `i` should generally not have event listeners. If you _really_ need to add
an event listener, use the elm/html library instead.
-}
i : List (Attribute Never) -> List (Html msg) -> Html msg
i attributes =
    Html.i (nonInteractive attributes)


{-| `b` should generally not have event listeners. If you _really_ need to add
an event listener, use the elm/html library instead.
-}
b : List (Attribute Never) -> List (Html msg) -> Html msg
b attributes =
    Html.b (nonInteractive attributes)


{-| `u` should generally not have event listeners. If you _really_ need to add
an event listener, use the elm/html library instead.
-}
u : List (Attribute Never) -> List (Html msg) -> Html msg
u attributes =
    Html.u (nonInteractive attributes)


{-| `mark` should generally not have event listeners. If you _really_ need to add
an event listener, use the elm/html library instead.
-}
mark : List (Attribute Never) -> List (Html msg) -> Html msg
mark attributes =
    Html.mark (nonInteractive attributes)


{-| `ruby` should generally not have event listeners. If you _really_ need to add
an event listener, use the elm/html library instead.
-}
ruby : List (Attribute Never) -> List (Html msg) -> Html msg
ruby attributes =
    Html.ruby (nonInteractive attributes)


{-| `rt` should generally not have event listeners. If you _really_ need to add
an event listener, use the elm/html library instead.
-}
rt : List (Attribute Never) -> List (Html msg) -> Html msg
rt attributes =
    Html.rt (nonInteractive attributes)


{-| `rp` should generally not have event listeners. If you _really_ need to add
an event listener, use the elm/html library instead.
-}
rp : List (Attribute Never) -> List (Html msg) -> Html msg
rp attributes =
    Html.rp (nonInteractive attributes)


{-| `bdi` should generally not have event listeners. If you _really_ need to add
an event listener, use the elm/html library instead.
-}
bdi : List (Attribute Never) -> List (Html msg) -> Html msg
bdi attributes =
    Html.bdi (nonInteractive attributes)


{-| `bdo` should generally not have event listeners. If you _really_ need to add
an event listener, use the elm/html library instead.
-}
bdo : List (Attribute Never) -> List (Html msg) -> Html msg
bdo attributes =
    Html.bdo (nonInteractive attributes)


{-| `span` should generally not have event listeners. If you _really_ need to add
an event listener, use the elm/html library instead.
-}
span : List (Attribute Never) -> List (Html msg) -> Html msg
span attributes =
    Html.span (nonInteractive attributes)


{-| `br` should generally not have event listeners. If you _really_ need to add
an event listener, use the elm/html library instead.
-}
br : List (Attribute Never) -> Html msg
br attributes =
    Html.br (nonInteractive attributes) []


{-| `wbr` should generally not have event listeners. If you _really_ need to add
an event listener, use the elm/html library instead.
-}
wbr : List (Attribute Never) -> List (Html msg) -> Html msg
wbr attributes =
    Html.wbr (nonInteractive attributes)


{-| `ins` should generally not have event listeners. If you _really_ need to add
an event listener, use the elm/html library instead.
-}
ins : List (Attribute Never) -> List (Html msg) -> Html msg
ins attributes =
    Html.ins (nonInteractive attributes)


{-| `del` should generally not have event listeners. If you _really_ need to add
an event listener, use the elm/html library instead.
-}
del : List (Attribute Never) -> List (Html msg) -> Html msg
del attributes =
    Html.del (nonInteractive attributes)


{-| `iframe` should generally not have event listeners. If you _really_ need to add
an event listener, use the elm/html library instead.
-}
iframe : List (Attribute Never) -> List (Html msg) -> Html msg
iframe attributes =
    Html.iframe (nonInteractive attributes)


{-| `embed` should generally not have event listeners. If you _really_ need to add
an event listener, use the elm/html library instead.
-}
embed : List (Attribute Never) -> List (Html msg) -> Html msg
embed attributes =
    Html.embed (nonInteractive attributes)


{-| `object` should generally not have event listeners. If you _really_ need to add
an event listener, use the elm/html library instead.
-}
object : List (Attribute Never) -> List (Html msg) -> Html msg
object attributes =
    Html.object (nonInteractive attributes)


{-| `param` should generally not have event listeners. If you _really_ need to add
an event listener, use the elm/html library instead.
-}
param : List (Attribute Never) -> List (Html msg) -> Html msg
param attributes =
    Html.param (nonInteractive attributes)


{-| `video` should generally not have event listeners. If you _really_ need to add
an event listener, use the elm/html library instead.
-}
video : List (Attribute Never) -> List (Html msg) -> Html msg
video attributes =
    Html.video (nonInteractive attributes)


{-| `audio` should generally not have event listeners. If you _really_ need to add
an event listener, use the elm/html library instead.
-}
audio : List (Attribute Never) -> List (Html msg) -> Html msg
audio attributes =
    Html.audio (nonInteractive attributes)


{-| `source` should generally not have event listeners. If you _really_ need to add
an event listener, use the elm/html library instead.
-}
source : List (Attribute Never) -> List (Html msg) -> Html msg
source attributes =
    Html.source (nonInteractive attributes)


{-| `track` should generally not have event listeners. If you _really_ need to add
an event listener, use the elm/html library instead.
-}
track : List (Attribute Never) -> List (Html msg) -> Html msg
track attributes =
    Html.track (nonInteractive attributes)


{-| `canvas` should generally not have event listeners. If you _really_ need to add
an event listener, use the elm/html library instead.
-}
canvas : List (Attribute Never) -> List (Html msg) -> Html msg
canvas attributes =
    Html.canvas (nonInteractive attributes)


{-| `math` should generally not have event listeners. If you _really_ need to add
an event listener, use the elm/html library instead.
-}
math : List (Attribute Never) -> List (Html msg) -> Html msg
math attributes =
    Html.math (nonInteractive attributes)


{-| `table` should generally not have event listeners. If you _really_ need to add
an event listener, use the elm/html library instead.
-}
table : List (Attribute Never) -> List (Html msg) -> Html msg
table attributes =
    Html.table (nonInteractive attributes)


{-| `caption` should generally not have event listeners. If you _really_ need to add
an event listener, use the elm/html library instead.
-}
caption : List (Attribute Never) -> List (Html msg) -> Html msg
caption attributes =
    Html.caption (nonInteractive attributes)


{-| `colgroup` should generally not have event listeners. If you _really_ need to add
an event listener, use the elm/html library instead.
-}
colgroup : List (Attribute Never) -> List (Html msg) -> Html msg
colgroup attributes =
    Html.colgroup (nonInteractive attributes)


{-| `col` should generally not have event listeners. If you _really_ need to add
an event listener, use the elm/html library instead.
-}
col : List (Attribute Never) -> List (Html msg) -> Html msg
col attributes =
    Html.col (nonInteractive attributes)


{-| `tbody` should generally not have event listeners. If you _really_ need to add
an event listener, use the elm/html library instead.
-}
tbody : List (Attribute Never) -> List (Html msg) -> Html msg
tbody attributes =
    Html.tbody (nonInteractive attributes)


{-| `thead` should generally not have event listeners. If you _really_ need to add
an event listener, use the elm/html library instead.
-}
thead : List (Attribute Never) -> List (Html msg) -> Html msg
thead attributes =
    Html.thead (nonInteractive attributes)


{-| `tfoot` should generally not have event listeners. If you _really_ need to add
an event listener, use the elm/html library instead.
-}
tfoot : List (Attribute Never) -> List (Html msg) -> Html msg
tfoot attributes =
    Html.tfoot (nonInteractive attributes)


{-| `tr` should generally not have event listeners. If you _really_ need to add
an event listener, use the elm/html library instead.
-}
tr : List (Attribute Never) -> List (Html msg) -> Html msg
tr attributes =
    Html.tr (nonInteractive attributes)


{-| `td` should generally not have event listeners. If you _really_ need to add
an event listener, use the elm/html library instead.
-}
td : List (Attribute Never) -> List (Html msg) -> Html msg
td attributes =
    Html.td (nonInteractive attributes)


{-| `th` should generally not have event listeners. If you _really_ need to add
an event listener, use the elm/html library instead.
-}
th : List (Attribute Never) -> List (Html msg) -> Html msg
th attributes =
    Html.th (nonInteractive attributes)


{-| `form` should generally not have event listeners. If you _really_ need to add
an event listener, use the formWithListeners method or directly use the elm/html library instead.
-}
form : List (Attribute Never) -> List (Html msg) -> Html msg
form attributes =
    Html.form (nonInteractive attributes)


{-| `form` should generally not have event listeners and `Accessibility.form` method
should be your go to implementation. If you _really_ need to add an event listener,
you can use this method instead but use caution when doing so!
-}
formWithListeners : List (Attribute msg) -> List (Html msg) -> Html msg
formWithListeners attributes =
    Html.form attributes


{-| `fieldset` should generally not have event listeners. If you _really_ need to add
an event listener, use the elm/html library instead.
-}
fieldset : List (Attribute Never) -> List (Html msg) -> Html msg
fieldset attributes =
    Html.fieldset (nonInteractive attributes)


{-| `legend` should generally not have event listeners. If you _really_ need to add
an event listener, use the elm/html library instead.
-}
legend : List (Attribute Never) -> List (Html msg) -> Html msg
legend attributes =
    Html.legend (nonInteractive attributes)


{-| `label` should generally not have event listeners. If you _really_ need to add
an event listener, use the elm/html library instead.
-}
label : List (Attribute Never) -> List (Html msg) -> Html msg
label attributes =
    Html.label (nonInteractive attributes)


{-| `datalist` should generally not have event listeners. If you _really_ need to add
an event listener, use the elm/html library instead.
-}
datalist : List (Attribute Never) -> List (Html msg) -> Html msg
datalist attributes =
    Html.datalist (nonInteractive attributes)


{-| `optgroup` should generally not have event listeners. If you _really_ need to add
an event listener, use the elm/html library instead.
-}
optgroup : List (Attribute Never) -> List (Html msg) -> Html msg
optgroup attributes =
    Html.optgroup (nonInteractive attributes)


{-| `option` should generally not have event listeners. If you _really_ need to add
an event listener, use the elm/html library instead.
-}
option : List (Attribute Never) -> List (Html msg) -> Html msg
option attributes =
    Html.option (nonInteractive attributes)


{-| `output` should generally not have event listeners. If you _really_ need to add
an event listener, use the elm/html library instead.
-}
output : List (Attribute Never) -> List (Html msg) -> Html msg
output attributes =
    Html.output (nonInteractive attributes)


{-| `progress` should generally not have event listeners. If you _really_ need to add
an event listener, use the elm/html library instead.
-}
progress : List (Attribute Never) -> List (Html msg) -> Html msg
progress attributes =
    Html.progress (nonInteractive attributes)


{-| `meter` should generally not have event listeners. If you _really_ need to add
an event listener, use the elm/html library instead.
-}
meter : List (Attribute Never) -> List (Html msg) -> Html msg
meter attributes =
    Html.meter (nonInteractive attributes)


{-| `details` should generally not have event listeners. If you _really_ need to add
an event listener, use the elm/html library instead.
-}
details : List (Attribute Never) -> List (Html msg) -> Html msg
details attributes =
    Html.details (nonInteractive attributes)


{-| `summary` should generally not have event listeners. If you _really_ need to add
an event listener, use the elm/html library instead.
-}
summary : List (Attribute Never) -> List (Html msg) -> Html msg
summary attributes =
    Html.summary (nonInteractive attributes)


{-| `menuitem` should generally not have event listeners. If you _really_ need to add
an event listener, use the elm/html library instead.
-}
menuitem : List (Attribute Never) -> List (Html msg) -> Html msg
menuitem attributes =
    Html.menuitem (nonInteractive attributes)


{-| `menu` should generally not have event listeners. If you _really_ need to add
an event listener, use the elm/html library instead.
-}
menu : List (Attribute Never) -> List (Html msg) -> Html msg
menu attributes =
    Html.menu (nonInteractive attributes)
