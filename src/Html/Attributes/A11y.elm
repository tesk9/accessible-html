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

## Other

@docs presentation

-}

import Aria
import Css
import Grouping
import Heading
import Html
import Html.Attributes exposing (..)
import Landmark
import Role exposing (..)


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


{-| Sets role presentation.
-}
presentation : Html.Attribute msg
presentation =
    role Presentation
