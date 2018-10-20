module Views.Images exposing (view)

import Accessibility exposing (..)
import Html.Attributes exposing (href, src, style)


view : Html msg
view =
    div []
        [ h3 [] [ text "Image Examples" ]
        , viewImageBlock "An informative image" <|
            img "Elm Logo" [ src "/assets/elm-logo.png" ]
        , viewImageBlock "A decorative image" <|
            decorativeImg [ src "/assets/elm-logo.png" ]
        , viewImageBlock "A functional image" <|
            a [ href "http://package.elm-lang.org/" ] [ decorativeImg [ src "/assets/elm-logo.png" ] ]
        ]


viewImageBlock : String -> Html msg -> Html msg
viewImageBlock header content =
    div [ style "max-height" "200px", style "max-width" "200px" ]
        [ h4 [] [ text header ]
        , content
        ]
