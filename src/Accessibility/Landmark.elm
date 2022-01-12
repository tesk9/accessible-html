module Accessibility.Landmark exposing (banner, complementary, contentInfo, form, main_, navigation, region, search)

{-| [On page regions.](https://www.w3.org/TR/WCAG20-TECHS/ARIA11.html)

Landmarks help screenreader users navigate by giving them direct links to the the regions they are interested in. Are they trying the `search` the site? Do they want to access the `main` content? Do they want information about the content, like copyright and legal notices--`contentInfo`?

Landmarks keep your users from being overwhelmed by a slew of information to sift through and from needing to tab through the same old set of unlabeled links on every single page of your site.

Most landmark tags are implicit in HTML5. The default landmark roles are specified [here](https://www.w3.org/TR/wai-aria-practices/examples/landmarks/HTML5.html). Note that on this page (and on all the Aria Landmark Examples linked from this module), you can toggle the "Show Landmarks" button at the top of the page to see landmarks in action!

The landmark you're most likely to need to set directly is `search`, as it does not have a corresponding HTML5 tag. In other cases, consider using the appropriate semantic HTML element instead.

@docs banner, complementary, contentInfo, form, main_, navigation, region, search

-}

import Accessibility.Utils exposing (Role(..), role)
import Html as Html


{-| Creates a [`role="banner"`](https://www.w3.org/TR/wai-aria-1.1/#banner) attribute.

Elements with `banner` should contain the page title. In HTML5, the `header` element is considered a `banner` as long as it's contained by `body` but not a descendant of `article`, `aside`, `main`, `nav`, or `section` ([ARIA Landmarks Banner Example ](https://www.w3.org/TR/wai-aria-practices/examples/landmarks/banner.html), see "HTML Techniques" tab).

    import Accessibility as Html exposing (Html, div, h1, img, text)
    import Accessibility.Landmark exposing (banner)
    import Html.Attributes exposing (src)

    view : Html msg
    view =
        div
            [ banner ]
            [ h1 [] [ text "Such Site!" ]
            , img "Such Logo!" [ src "logo.png" ]
            ]

-}
banner : Html.Attribute msg
banner =
    role Banner


{-| Creates a [`role="complementary"`](https://www.w3.org/TR/wai-aria-1.1/#complementary) attribute.

"Complements" the main content. If there are more than one complementary elements on the page, please be sure to use `labeledBy` to point to the heading of each complementary element.

The HTML5 `aside` tag has this role by default (you still need to use `labeledBy` if there are multiple asides!).

Check out [ARIA Landmarks Complementary Example](https://www.w3.org/TR/wai-aria-practices/examples/landmarks/complementary.html).

    import Accessibility as Html exposing (Html, div, text)
    import Accessibility.Aria exposing (labeledBy)
    import Accessibility.Landmark exposing (complementary)

    view : Html msg
    view =
        div []
            [ div
                [ complementary, labeledBy "extra-thoughts" ]
                [ h2 [ id "extra-thoughts" ] [ text "Extra thoughts..." ]
                , text "some content"
                ]
            , div
                [ complementary, labeledBy "related-docs" ]
                [ h2 [ id "related-docs" ] [ text "Related Documentation" ] ]
            ]

-}
complementary : Html.Attribute msg
complementary =
    role Complementary


{-| Creates a [`role="contentinfo"`](https://www.w3.org/TR/wai-aria-1.1/#contentinfo) attribute.

Copyrights, privacy statements, etc. There ought only be one element with the content info role per page.

You may already have a content info element role fulfilled on your page via the HTML5 `footer` element--as long as its context is the `body`, not a `section` or `main` or what-have-you (see [ARIA Landmarks Contentinfo Example](https://www.w3.org/TR/wai-aria-practices/examples/landmarks/contentinfo.html) for the full list).

    div [ contentInfo ]
        [ h2 []
            [ text "Link to the Privacy Statement You Probably Really Should Read Someday" ]
        ]

-}
contentInfo : Html.Attribute msg
contentInfo =
    role Contentinfo


{-| Creates a [`role="form"`](https://www.w3.org/TR/wai-aria-1.1/#form) attribute.

A form container. The HTML5 alternative is to use a `form` element with a `name`.

For examples, please see [ARIA Landmarks Form Example](https://www.w3.org/TR/wai-aria-practices/examples/landmarks/form.html).

-}
form : Html.Attribute msg
form =
    role Form


{-| Creates a [`role="main"`](https://www.w3.org/TR/wai-aria-1.1/#main) attribute.

Main content in a document. (There should only be one--if you require more than one element with role main, make sure each is labeled. See [ARIA Landmarks Main Example](https://www.w3.org/TR/wai-aria-practices/examples/landmarks/main.html).)

HTML5's `main` tag is implicitly role `main`.

-}
main_ : Html.Attribute msg
main_ =
    role Main


{-| Creates a [`role="navigation"`](https://www.w3.org/TR/wai-aria-1.1/#navigation) attribute.

Navigation--wrap lists of links intended to help your users navigate your site in an element with this role or use HTML5's `nav` tag.

If there's more than one `nav` list on a given page, please make sure that the navigation is labeled (what kinds of links should your users expect to find in this list?). For examples of how to do this using the `labeledBy` property, check out [ARIA Landmarks Navigation Example](https://www.w3.org/TR/wai-aria-practices/examples/landmarks/navigation.html).

-}
navigation : Html.Attribute msg
navigation =
    role Navigation


{-| Creates a [`role="search"`](https://www.w3.org/TR/wai-aria-1.1/#search) attribute.

A search input. [ARIA Landmarks Search Example](https://www.w3.org/TR/wai-aria-practices/examples/landmarks/search.html?)

If you're going to learn about an ARIA Landmark role, this is the one to know,
as HTML5 does NOT have a corresponding element! Add this property to forms to signify
that they describe search functionality.

    import Accessibility exposing (Html, button, form, inputText, labelBefore, text)
    import Accessibility.Landmark exposing (search)
    import Html.Attributes exposing (type_)
    import Html.Events exposing (onChange)

    type Msg
        = Search String

    view : String -> Html Msg
    view value =
        form [ search ]
            [ labelBefore []
                (text "Search for something good")
                (inputText value [ onChange Search ])
            , button [ type_ "submit" ] [ text "Search" ]
            ]

-}
search : Html.Attribute msg
search =
    role Search


{-| Prefer the other Landmark options to `region`. Be sure to add a name when using this attribute!
-}
region : Html.Attribute msg
region =
    role Region
