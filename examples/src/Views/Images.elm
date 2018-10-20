module Views.Images exposing (view)

import Accessibility exposing (..)
import Html.Attributes exposing (href, src, style)


view : Html msg
view =
    div []
        [ h3 [] [ text "Image Examples" ]
        , viewImageBlock "An informative image"
            "img \"Elm Logo\" [ src \"/assets/elm-logo.png\" ]"
            (img "Elm Logo" [ src "examples/assets/elm-logo.png" ])
        , viewImageBlock "A decorative image"
            "decorativeImg [ src \"/assets/elm-logo.png\" ]"
            (decorativeImg [ src "examples/assets/elm-logo.png" ])
        , viewImageBlock "A functional image"
            "a [ href \"http://package.elm-lang.org/\" ] [ decorativeImg [ src \"/assets/elm-logo.png\" ] ]"
            (a [ href "http://package.elm-lang.org/" ] [ decorativeImg [ src "examples/assets/elm-logo.png" ] ])
        ]


viewImageBlock : String -> String -> Html msg -> Html msg
viewImageBlock header howToCall content =
    div []
        [ h4 [ style "margin-bottom" "4px" ] [ text header ]
        , code [ style "display" "block", style "margin" "4px 0" ] [ text howToCall ]
        , content
        ]
