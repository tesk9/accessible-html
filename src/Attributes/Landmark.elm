module Attributes.Landmark
    exposing
        ( application
        , banner
        , complementary
        , contentinfo
        , form
        , main_
        , navigation
        , region
        , search
        )

import Attributes.Role exposing (..)
import Html


banner : Html.Attribute msg
banner =
    role Banner


complementary : Html.Attribute msg
complementary =
    role Complementary


contentinfo : Html.Attribute msg
contentinfo =
    role Contentinfo


form : Html.Attribute msg
form =
    role Form


main_ : Html.Attribute msg
main_ =
    role Main


navigation : Html.Attribute msg
navigation =
    role Navigation


search : Html.Attribute msg
search =
    role Search


application : Html.Attribute msg
application =
    role Application


region : Html.Attribute msg
region =
    role Region
