module Html.Attributes.A11y
    exposing
        ( invisible
        , controls
        , labelledBy
        , selected
        , hidden
        , longDescription
        , indeterminate
        , banner
        , complementary
        , contentinfo
        , form
        , main_
        , navigation
        , search
        , application
        , region
        , group
        , radiogroup
        , heading
        , presentation
        , alert
        , alertdialog
        , article
        , button
        , checkbox
        , columnheader
        , combobox
        , definition
        , dialog
        , directory
        , document
        , grid
        , gridcell
        , img
        , link
        , list
        , listbox
        , listitem
        , log
        , marquee
        , math
        , menu
        , menubar
        , menuitem
        , menuitemcheckbox
        , menuitemradio
        , note
        , option
        , progressbar
        , radio
        , row
        , rowgroup
        , rowheader
        , scrollbar
        , separator
        , slider
        , spinbutton
        , status
        , tab
        , tablist
        , tabpanel
        , textbox
        , timer
        , toolbar
        , tooltip
        , tree
        , treegrid
        , treeitem
        )

{-|
## Hiding content

For more information on hiding/semi-hiding elements, please see [the a11y project.](http://a11yproject.com/posts/how-to-hide-content/)

@docs invisible

## Aria

@docs controls, labelledBy, selected, hidden, longDescription, indeterminate

## Landmark

[On page regions.](https://www.w3.org/TR/WCAG20-TECHS/ARIA11.html)

@docs banner, complementary, contentinfo, form, main_, navigation, search, application, region

## Grouping

@docs group, radiogroup

## Heading

@docs heading

## Elements

(e.g., stuff that isn't in the HTML spec or is in the HTML spec but you want to do something tricky.)

@docs alert, alertdialog, article, button, checkbox, columnheader, combobox, definition, dialog, directory, document, grid, gridcell, img, link, list, listbox, listitem, log, marquee, math, menu, menubar, menuitem, menuitemcheckbox, menuitemradio, note, option, progressbar, radio, row, rowgroup, rowheader, scrollbar, separator, slider, spinbutton, status, tab, tablist, tabpanel, textbox, timer, toolbar, tooltip, tree, treegrid, treeitem
## Other

@docs presentation

-}

import Attributes.Aria as Aria
import Attributes.Element as Element
import Attributes.Grouping as Grouping
import Attributes.Heading as Heading
import Attributes.Landmark as Landmark
import Attributes.Role exposing (..)
import Css
import Html
import Html.Attributes exposing (..)


{-| Makes content invisible without making it inaccessible.

    label [ invisible ] [ text "Screen readers can still read me!" ]
-}
invisible : Html.Attribute msg
invisible =
    style <|
        Css.asPairs
            [ Css.property "clip" "rect(1px, 1px, 1px, 1px)"
            , Css.position Css.absolute
            , Css.height (Css.px 1)
            , Css.width (Css.px 1)
            , Css.overflow Css.hidden
            , Css.margin (Css.px -1)
            , Css.padding Css.zero
            , Css.border Css.zero
            ]


{-| Creates aria controls attribute. Pass the unique string id of whatever is being controlled.
-}
controls : String -> Html.Attribute msg
controls =
    Aria.controls


{-| Creates aria labelledby attribute. Pass the unique string id of the labelling element.
-}
labelledBy : String -> Html.Attribute msg
labelledBy =
    Aria.labelledBy


{-| Creates aria selected attribute.
-}
selected : Bool -> Html.Attribute msg
selected =
    Aria.selected


{-| Creates aria hidden attribute.
-}
hidden : Bool -> Html.Attribute msg
hidden =
    Aria.hidden


{-| Creates the longDesc attribute with the given url, which should point to a text description of the content. This attribute is only supported on img tags.

    Html.A11y.img "Growth Chart in Some Sweet Unit (Quarter 4)" [ longDescription "/quarter_4_summary#Growth" ]
-}
longDescription : String -> Html.Attribute msg
longDescription =
    Aria.longDescription


{-| Sets the indeterminate value to be true.
-}
indeterminate : Html.Attribute msg
indeterminate =
    Aria.indeterminate


{-| This banner should have the page title in it.
-}
banner : Html.Attribute msg
banner =
    Landmark.banner


{-| "Complements" the main content.
-}
complementary : Html.Attribute msg
complementary =
    Landmark.complementary


{-| Copyrights, privacy statements, etc.
-}
contentinfo : Html.Attribute msg
contentinfo =
    Landmark.contentinfo


{-| A form container.
-}
form : Html.Attribute msg
form =
    Landmark.form


{-| Main content in a document. (There can only be one.)
-}
main_ : Html.Attribute msg
main_ =
    Landmark.main_


{-| Navigation.
-}
navigation : Html.Attribute msg
navigation =
    Landmark.navigation


{-| A search input.
-}
search : Html.Attribute msg
search =
    Landmark.search


{-| Declare a region as a web application.
Be careful with this one--see https://www.w3.org/TR/WCAG20-TECHS/ARIA11.html.
-}
application : Html.Attribute msg
application =
    Landmark.application


{-| Prefer the other Landmark options to `region`. Be sure to add a name when using this attribute!
-}
region : Html.Attribute msg
region =
    Landmark.region


{-| Define a set of controls. (for a group of radio inputs, see radiogroup).
-}
group : Html.Attribute msg
group =
    Grouping.group


{-| Define a set of radio-controls.
-}
radiogroup : Html.Attribute msg
radiogroup =
    Grouping.radiogroup


{-| Prefer using `h1`, `h2`, `h3`, `h4`, `h5`, and `h6`.
Really this attribute should only be necessary if you need an `h7`-type heading.

    div [ heading, level 7 ] []
-}
heading : Html.Attribute msg
heading =
    Heading.heading


{-| Add `alert` to the attributes of an element.
-}
alert : Html.Attribute msg
alert =
    Element.alert


{-| Add `alertdialog` to the attributes of an element.
-}
alertdialog : Html.Attribute msg
alertdialog =
    Element.alertdialog


{-| Add `article` to the attributes of an element.
-}
article : Html.Attribute msg
article =
    Element.article


{-| Add `button` to the attributes of an element.
-}
button : Html.Attribute msg
button =
    Element.button


{-| Add `checkbox` to the attributes of an element.
-}
checkbox : Html.Attribute msg
checkbox =
    Element.checkbox


{-| Add `columnheader` to the attributes of an element.
-}
columnheader : Html.Attribute msg
columnheader =
    Element.columnheader


{-| Add `combobox` to the attributes of an element.
-}
combobox : Html.Attribute msg
combobox =
    Element.combobox


{-| Add `definition` to the attributes of an element.
-}
definition : Html.Attribute msg
definition =
    Element.definition


{-| Add `dialog` to the attributes of an element.
-}
dialog : Html.Attribute msg
dialog =
    Element.dialog


{-| Add `directory` to the attributes of an element.
-}
directory : Html.Attribute msg
directory =
    Element.directory


{-| Add `document` to the attributes of an element.
-}
document : Html.Attribute msg
document =
    Element.document


{-| Add `grid` to the attributes of an element.
-}
grid : Html.Attribute msg
grid =
    Element.grid


{-| Add `gridcell` to the attributes of an element.
-}
gridcell : Html.Attribute msg
gridcell =
    Element.gridcell


{-| Add `img` to the attributes of an element.
-}
img : Html.Attribute msg
img =
    Element.img


{-| Add `link` to the attributes of an element.
-}
link : Html.Attribute msg
link =
    Element.link


{-| Add `list` to the attributes of an element.
-}
list : Html.Attribute msg
list =
    Element.list


{-| Add `listbox` to the attributes of an element.
-}
listbox : Html.Attribute msg
listbox =
    Element.listbox


{-| Add `listitem` to the attributes of an element.
-}
listitem : Html.Attribute msg
listitem =
    Element.listitem


{-| Add `log` to the attributes of an element.
-}
log : Html.Attribute msg
log =
    Element.log


{-| Add `marquee` to the attributes of an element.
-}
marquee : Html.Attribute msg
marquee =
    Element.marquee


{-| Add `math` to the attributes of an element.
-}
math : Html.Attribute msg
math =
    Element.math


{-| Add `menu` to the attributes of an element.
-}
menu : Html.Attribute msg
menu =
    Element.menu


{-| Add `menubar` to the attributes of an element.
-}
menubar : Html.Attribute msg
menubar =
    Element.menubar


{-| Add `menuitem` to the attributes of an element.
-}
menuitem : Html.Attribute msg
menuitem =
    Element.menuitem


{-| Add `menuitemcheckbox` to the attributes of an element.
-}
menuitemcheckbox : Html.Attribute msg
menuitemcheckbox =
    Element.menuitemcheckbox


{-| Add `menuitemradio` to the attributes of an element.
-}
menuitemradio : Html.Attribute msg
menuitemradio =
    Element.menuitemradio


{-| Add `note` to the attributes of an element.
-}
note : Html.Attribute msg
note =
    Element.note


{-| Add `option` to the attributes of an element.
-}
option : Html.Attribute msg
option =
    Element.option


{-| Add `progressbar` to the attributes of an element.
-}
progressbar : Html.Attribute msg
progressbar =
    Element.progressbar


{-| Add `radio` to the attributes of an element.
-}
radio : Html.Attribute msg
radio =
    Element.radio


{-| Add `row` to the attributes of an element.
-}
row : Html.Attribute msg
row =
    Element.row


{-| Add `rowgroup` to the attributes of an element.
-}
rowgroup : Html.Attribute msg
rowgroup =
    Element.rowgroup


{-| Add `rowheader` to the attributes of an element.
-}
rowheader : Html.Attribute msg
rowheader =
    Element.rowheader


{-| Add `scrollbar` to the attributes of an element.
-}
scrollbar : Html.Attribute msg
scrollbar =
    Element.scrollbar


{-| Add `separator` to the attributes of an element.
-}
separator : Html.Attribute msg
separator =
    Element.separator


{-| Add `slider` to the attributes of an element.
-}
slider : Html.Attribute msg
slider =
    Element.slider


{-| Add `spinbutton` to the attributes of an element.
-}
spinbutton : Html.Attribute msg
spinbutton =
    Element.spinbutton


{-| Add `status` to the attributes of an element.
-}
status : Html.Attribute msg
status =
    Element.status


{-| Add `tab` to the attributes of an element.
-}
tab : Html.Attribute msg
tab =
    Element.tab


{-| Add `tablist` to the attributes of an element.
-}
tablist : Html.Attribute msg
tablist =
    Element.tablist


{-| Add `tabpanel` to the attributes of an element.
-}
tabpanel : Html.Attribute msg
tabpanel =
    Element.tabpanel


{-| Add `textbox` to the attributes of an element.
-}
textbox : Html.Attribute msg
textbox =
    Element.textbox


{-| Add `timer` to the attributes of an element.
-}
timer : Html.Attribute msg
timer =
    Element.timer


{-| Add `toolbar` to the attributes of an element.
-}
toolbar : Html.Attribute msg
toolbar =
    Element.toolbar


{-| Add `tooltip` to the attributes of an element.
-}
tooltip : Html.Attribute msg
tooltip =
    Element.tooltip


{-| Add `tree` to the attributes of an element.
-}
tree : Html.Attribute msg
tree =
    Element.tree


{-| Add `treegrid` to the attributes of an element.
-}
treegrid : Html.Attribute msg
treegrid =
    Element.treegrid


{-| Add `treeitem` to the attributes of an element.
-}
treeitem : Html.Attribute msg
treeitem =
    Element.treeitem


{-| Sets role presentation.
-}
presentation : Html.Attribute msg
presentation =
    role Presentation
