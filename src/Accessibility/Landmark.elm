module Accessibility.Landmark exposing (banner, complementary, contentInfo, form, main_, navigation, search, application, region)

{-| [On page regions.](https://www.w3.org/TR/WCAG20-TECHS/ARIA11.html)

Landmarks help your users to navigate your site by giving them "landmarks" to
the regions they might want to see. Are they trying the `search` the site? Do
they want to access the `main` content? Do they want information about the content,
like copyright and legal notices--`contentInfo`, if you will?

Landmarks keep your users from being overwhelmed by a slew of information to sift through
or from being bored by need to tab through the same old set of unlabeled links on
every single page of your site.

Generally, these landmark tags are implicit in HTML5. The default landmark roles
are specified [here](https://www.w3.org/TR/wai-aria-practices/examples/landmarks/HTML5.html).
`search` does not have a corresponding HTML5 tag.

@docs banner, complementary, contentInfo, form, main_, navigation, search, application, region

-}

import Accessibility.Utils exposing (Role(..), role)
import Html


{-| This banner should have the page title in it. In HTML5, the `header` element
generally is implicitly a `banner`. (For specifics on what DOM relationships will
affect this default behavior, please check out [W3](https://www.w3.org/TR/wai-aria-practices/examples/landmarks/banner.html).)

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


{-| "Complements" the main content. If there are more than one complementary elements
on the page, please be sure to use `labeledBy` to point to the heading of each
complementary element.

The HTML5 `aside` tag has this role by default (you still need to use `labeledBy`
if there are more than one asides!).

Check out [W3's docs for `complementary`](https://www.w3.org/TR/wai-aria-practices/examples/landmarks/complementary.html)--
note that you can toggle the "Show Landmarks" button at the top of the page
to see a real example of using the complementary role!

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


{-| Copyrights, privacy statements, etc. There ought only be one element with the
content info role per page.

You may already have a content info element role fulfilled
on your page via the HTML5 `footer` element--as long as its context is the `body`, not
a `section` or `main` or what-have-you (see [W3](https://www.w3.org/TR/wai-aria-practices/examples/landmarks/contentinfo.html) for the full list).

    div [ contentInfo ]
        [ h2 []
            [ text "Link to the Privacy Statement You Probably Really Should Read Someday" ]
        ]

-}
contentInfo : Html.Attribute msg
contentInfo =
    role Contentinfo


{-| A form container. The HTML5 alternative is to use a `form` element with a `name`.

For examples, please see [W3](https://www.w3.org/TR/wai-aria-practices/examples/landmarks/form.html).

-}
form : Html.Attribute msg
form =
    role Form


{-| Main content in a document. (There should only be one--if you require more than
one element with role main, make sure each is labeled. See [W3](https://www.w3.org/TR/wai-aria-practices/examples/landmarks/main.html).)

HTML5's `main` tag is implicitly role `main`.

-}
main_ : Html.Attribute msg
main_ =
    role Main


{-| Navigation--wrap lists of links intended to help your users navigate your site
in an element with this role or use HTML5's `nav` tag.

If there's more than one `nav` list on a given page, please make sure that the
navigation is labeled (what kinds of links should your users expect to find in
this list?). For examples of how to do this using the `labeledBy` property,
check out [W3](https://www.w3.org/TR/wai-aria-practices/examples/landmarks/navigation.html).

-}
navigation : Html.Attribute msg
navigation =
    role Navigation


{-| A search input. [W3 docs](https://www.w3.org/TR/wai-aria-practices/examples/landmarks/search.html?)

If you're going to learn about an ARIA Landmark role, this is the one to know,
as HTML5 does NOT have a corresponding element! Add this property to forms to signify
that they describe search functionality.

As ever, if there's more than one search element on the page, please be sure to label.

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


{-| Declare a region as a web application.
Be careful with this one--see <https://www.w3.org/TR/WCAG20-TECHS/ARIA11.html>.
-}
application : Html.Attribute msg
application =
    role Application


{-| Prefer the other Landmark options to `region`. Be sure to add a name when using this attribute!
-}
region : Html.Attribute msg
region =
    role Region
