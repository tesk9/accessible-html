module Navigation
    exposing
        ( banner
        , complementary
        , contentinfo
        , form
        , main_
        , navigation
        , search
        , application
        )

{-| See https://www.w3.org/TR/WCAG20-TECHS/ARIA11.html for more detail on this module.
(Descriptions are adopted from this page).
-}

import Html
import Role exposing (..)


{-| This banner should have the page title in it.
-}
banner : Html.Attribute msg
banner =
    role Banner


{-| "Complements" the main content.
-}
complementary : Html.Attribute msg
complementary =
    role Complementary


{-| Copyrights, privacy statements, etc.
-}
contentinfo : Html.Attribute msg
contentinfo =
    role Contentinfo


{-| A form container.
-}
form : Html.Attribute msg
form =
    role Form


{-| Main content in a document. (There can only be one.)
-}
main_ : Html.Attribute msg
main_ =
    role Main


{-| Navigation.
-}
navigation : Html.Attribute msg
navigation =
    role Navigation


{-| A search input.
-}
search : Html.Attribute msg
search =
    role Search


{-| Declare a region as a web application.
Be careful with this one--see https://www.w3.org/TR/WCAG20-TECHS/ARIA11.html.
-}
application : Html.Attribute msg
application =
    role Application
