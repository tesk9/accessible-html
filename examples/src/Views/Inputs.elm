module Views.Inputs exposing (view)

import Accessibility exposing (..)
import Html
import Html.Attributes exposing (id)


view : Html msg
view =
    div []
        [ viewInputType "Text"
            { before = [ inputText "Value" [] ]
            , after = [ inputText "Value" [] ]
            , hidden = [ inputText "Value" ]
            }
        , viewInputType "Radio"
            { before = [ radio "left" "Value" False [], radio "left" "Value" False [] ]
            , after = [ radio "right" "Value" False [], radio "right" "Value" False [] ]
            , hidden = [ radio "invisible" "Value" False, radio "invisible" "Value" False ]
            }
        , viewInputType "Checkbox"
            { before = [ checkbox "value" (Just True) [], checkbox "value" Nothing [], checkbox "value" (Just False) [] ]
            , after = [ checkbox "value" (Just True) [], checkbox "value" Nothing [], checkbox "value" (Just False) [] ]
            , hidden = [ checkbox "value" (Just True), checkbox "value" Nothing, checkbox "value" (Just False) ]
            }
        ]


viewInputType :
    String
    ->
        { before : List (Html msg)
        , after : List (Html msg)
        , hidden : List (List (Html.Attribute msg) -> Html msg)
        }
    -> Html msg
viewInputType inputType { before, after, hidden } =
    div []
        [ h3 [] [ text (inputType ++ " Inputs") ]
        , h4 [] [ text "labelBefore:" ]
        , div [] (List.map (labelBefore [] (text "Label")) before)
        , h4 [] [ text "labelAfter:" ]
        , div [] (List.map (labelAfter [] (text "Label")) after)
        , h4 [] [ text "labelHidden:" ]
        , div [] (List.indexedMap (viewHidden inputType) hidden)
        ]


viewHidden : String -> Int -> (List (Html.Attribute msg) -> Html msg) -> Html msg
viewHidden inputType index viewInput =
    let
        hiddenId =
            "hidden-" ++ String.toLower inputType ++ "-" ++ toString index
    in
    labelHidden hiddenId
        []
        (text "Label")
        (viewInput [ id hiddenId ])
