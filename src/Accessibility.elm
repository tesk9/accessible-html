module Accessibility
    exposing
        ( checkBoxInvisibleLabel
        , checkBoxLeftLabeled
        , checkBoxRightLabeled
        , decorativeImg
        , figure
        , img
        , radioInvisibleLabel
        , radioLeftLabeled
        , radioRightLabeled
        , tab
        , tabList
        , tabPanel
        , textInvisibleLabel
        , textLeftLabeled
        , textRightLabeled
        )

{-|


## Inputs

Inputs defined in this library are offered in three varieties: left-labeled, right-labeled, and featuring an invisible-label.
Invisible-labeled views require an id.


### Text Inputs

@docs textLeftLabeled, textRightLabeled, textInvisibleLabel


### Radio Inputs

@docs radioLeftLabeled, radioRightLabeled, radioInvisibleLabel


### CheckBox Inputs

@docs checkBoxLeftLabeled, checkBoxRightLabeled, checkBoxInvisibleLabel


## Tabs

Together, `tabList`, `tab`, and `tabPanel` describe the pieces of a tab component view.

    import Html exposing (text)
    import Html.A11y exposing (tab, tabList, tabPanel)
    import Html.Attributes
    import Html.Attributes.A11y as A11yAttributes

    view : Html.Html msg
    view =
        tabList
            [ id "tab-list" ]
            [ tab
                [ id "tab-1"
                , A11yAttributes.selected True
                , A11yAttributes.controls "panel-1"
                ]
                [ text "Tab One" ]
            , tab
                [ id "tab-2"
                , A11yAttributes.selected False
                , A11yAttributes.controls "panel-1"
                ]
                [ text "Tab Two" ]
            , tabPanel
                [ id "panel-1"
                , A11yAttributes.labelledBy "tab-1"
                , A11yAttributes.hidden False
                , Html.Attributes.hidden False
                ]
                [ text "Panel One Content" ]
            , tabPanel
                [ id "panel-2"
                , A11yAttributes.labelledBy "tab-2"
                , A11yAttributes.hidden True
                , Html.Attributes.hidden True
                ]
                [ text "Panel Two Content" ]
            ]

For a more fully-fledged example using these helpers check out [elm-tabs](http://package.elm-lang.org/packages/tesk9/elm-tabs/latest).

@docs tabList, tab, tabPanel


## Images

@docs img, decorativeImg, figure

-}

import Accessibility.Role as Role
import Accessibility.Style as Style
import Accessibility.Widget as Widget
import Html
import Html.Attributes


{- *** Text Inputs *** -}


textModel : String -> List (Html.Attribute msg) -> Html.Html msg -> Input msg
textModel value attributes label =
    { typeAndValue = textInput value
    , label = label
    , attributes = attributes
    }


{-| Construct a left-labeled text input.

    textLeftLabeled "This appears in the text input." [] <| text "I'm the label!"

-}
textLeftLabeled : String -> List (Html.Attribute msg) -> Html.Html msg -> Html.Html msg
textLeftLabeled value attributes label =
    leftLabeledInput (textModel value attributes label)


{-| Construct a right-labeled text input.

    textRightLabeled "This appears in the text input." [] <| text "I'm the label!"

-}
textRightLabeled : String -> List (Html.Attribute msg) -> Html.Html msg -> Html.Html msg
textRightLabeled value attributes label =
    rightLabeledInput (textModel value attributes label)


{-| Construct a text input with an invisible label.

    textInvisibleLabel "best-input-everrr" "This appears in the text input." [] <| text "I'm the label!"

-}
textInvisibleLabel : String -> String -> List (Html.Attribute msg) -> Html.Html msg -> Html.Html msg
textInvisibleLabel id value attributes label =
    invisibleLabeledInput (textModel value attributes label) id



{- *** Radio Inputs *** -}


radioModel : String -> String -> Bool -> List (Html.Attribute msg) -> Html.Html msg -> Input msg
radioModel groupName value checked attributes label =
    { typeAndValue = radioInput groupName value checked
    , label = label
    , attributes = attributes
    }


{-| Construct a left-labeled radio input.

    radioLeftLabeled "radio_name" "This is the actual value of the radio." True [] <| text "I'm the label!"

-}
radioLeftLabeled : String -> String -> Bool -> List (Html.Attribute msg) -> Html.Html msg -> Html.Html msg
radioLeftLabeled groupName value checked attributes label =
    leftLabeledInput (radioModel groupName value checked attributes label)


{-| Construct a right-labeled radio input.

    radioRightLabeled  "radio_name" "This is the actual value of the radio." True [] <| text "I'm the label!"

-}
radioRightLabeled : String -> String -> Bool -> List (Html.Attribute msg) -> Html.Html msg -> Html.Html msg
radioRightLabeled groupName value checked attributes label =
    rightLabeledInput (radioModel groupName value checked attributes label)


{-| Construct a radio button with an invisible label.

    radioInvisibleLabel "best-input-everrr" "This is the actual value of the radio." [] <| text "I'm the label!"

-}
radioInvisibleLabel : String -> String -> String -> Bool -> List (Html.Attribute msg) -> Html.Html msg -> Html.Html msg
radioInvisibleLabel id groupName value checked attributes label =
    invisibleLabeledInput (radioModel groupName value checked attributes label) id



{- *** Checkbox Inputs *** -}


checkBoxModel : String -> Maybe Bool -> List (Html.Attribute msg) -> Html.Html msg -> Input msg
checkBoxModel value checked attributes label =
    { typeAndValue = checkboxInput value checked
    , label = label
    , attributes = attributes
    }


{-| Construct a left-labeled check box input.

    checkBoxLeftLabeled "This is the actual value of the check box." (Just True) [] <| text "I'm the label!"

-}
checkBoxLeftLabeled : String -> Maybe Bool -> List (Html.Attribute msg) -> Html.Html msg -> Html.Html msg
checkBoxLeftLabeled value checked attributes label =
    leftLabeledInput (checkBoxModel value checked attributes label)


{-| Construct a right-labeled check box input.

    checkBoxRightLabeled  "This is the actual value of the checkBox." (Just True) [] <| text "I'm the label!"

-}
checkBoxRightLabeled : String -> Maybe Bool -> List (Html.Attribute msg) -> Html.Html msg -> Html.Html msg
checkBoxRightLabeled value checked attributes label =
    rightLabeledInput (checkBoxModel value checked attributes label)


{-| Construct a check box with an invisible label.

    checkBoxInvisibleLabel "checkbox-id" "Checkbox value" (Just False) [] <| text "I'm the label!"

-}
checkBoxInvisibleLabel : String -> String -> Maybe Bool -> List (Html.Attribute msg) -> Html.Html msg -> Html.Html msg
checkBoxInvisibleLabel id value checked attributes label =
    invisibleLabeledInput (checkBoxModel value checked attributes label) id



-- INPUT HELPERS


type alias Input msg =
    { label : Html.Html msg
    , typeAndValue : InputTypeAndValue
    , attributes : List (Html.Attribute msg)
    }


type InputTypeAndValue
    = Text String
    | Radio String String Bool
    | Checkbox String (Maybe Bool)


textInput : String -> InputTypeAndValue
textInput =
    Text


radioInput : String -> String -> Bool -> InputTypeAndValue
radioInput =
    Radio


checkboxInput : String -> Maybe Bool -> InputTypeAndValue
checkboxInput =
    Checkbox


typeAndValueAttibutes : InputTypeAndValue -> List (Html.Attribute msg)
typeAndValueAttibutes typeAndValue =
    case typeAndValue of
        Text value_ ->
            [ Html.Attributes.type_ "text"
            , Html.Attributes.value value_
            ]

        Radio name_ value_ checked_ ->
            [ Html.Attributes.type_ "radio"
            , Html.Attributes.name name_
            , Html.Attributes.value value_
            , Html.Attributes.checked checked_
            ]

        Checkbox value_ maybe_checked ->
            [ Html.Attributes.type_ "checkbox"
            , Html.Attributes.value value_
            , Maybe.withDefault Widget.indeterminate (Maybe.map Html.Attributes.checked maybe_checked)
            ]


baseInput : Input msg -> Html.Html msg
baseInput inputModel =
    Html.input (typeAndValueAttibutes inputModel.typeAndValue ++ inputModel.attributes) []


leftLabeledInput : Input msg -> Html.Html msg
leftLabeledInput inputModel =
    Html.label
        []
        [ inputModel.label
        , baseInput inputModel
        ]


rightLabeledInput : Input msg -> Html.Html msg
rightLabeledInput inputModel =
    Html.label
        []
        [ baseInput inputModel
        , inputModel.label
        ]


invisibleLabeledInput : Input msg -> String -> Html.Html msg
invisibleLabeledInput inputModel id_ =
    Html.span
        []
        [ Html.label [ Style.invisible, Html.Attributes.for id_ ] [ inputModel.label ]
        , Html.input
            (typeAndValueAttibutes inputModel.typeAndValue
                ++ Html.Attributes.id id_
                :: inputModel.attributes
            )
            []
        ]



{- *** Tabs *** -}


{-| Create a tablist. This is the outer container for a list of tabs.
-}
tabList : List (Html.Attribute msg) -> List (Html.Html msg) -> Html.Html msg
tabList attributes =
    Html.div (Role.tabList :: attributes)


{-| Create a tab. This is the part that you select in order to change panel views.
-}
tab : List (Html.Attribute msg) -> List (Html.Html msg) -> Html.Html msg
tab attributes =
    Html.div (Role.tab :: Html.Attributes.tabindex 0 :: attributes)


{-| Create a tab panel.

    tabPanel [] [ h3 [] [ text "Panel Header" ], text "Panel Content" ]

-}
tabPanel : List (Html.Attribute msg) -> List (Html.Html msg) -> Html.Html msg
tabPanel attributes =
    Html.div (Role.tabPanel :: attributes)



{- *** Images *** -}


{-| Use this tag when the image provides information not expressed in the text of the page.
When images are used to express the purpose of a button or link, aim for alternative text that encapsulates the function of the image.

Read through [the w3 informative image tutorial](https://www.w3.org/WAI/tutorials/images/informative/) and the [the w3 functional image tutorial](https://www.w3.org/WAI/tutorials/images/functional/) to learn more.

For graphs and diagrams, see `figure` and `longDesc`.

    img "Bear rubbing back on tree" [ src "bear.png" ]

-}
img : String -> List (Html.Attribute msg) -> Html.Html msg
img alt_ attributes =
    Html.img (Html.Attributes.alt alt_ :: attributes) []


{-| Use this tag when the image is decorative or provides redundant information. Read through [the w3 decorative image tutorial](https://www.w3.org/WAI/tutorials/images/decorative/) to learn more.

    decorativeImg [ src "smiling_family.jpg" ]

-}
decorativeImg : List (Html.Attribute msg) -> Html.Html msg
decorativeImg attributes =
    Html.img (Html.Attributes.alt "" :: Role.presentation :: attributes) []


{-| Adds the group role to a figure.
-}
figure : List (Html.Attribute msg) -> List (Html.Html msg) -> Html.Html msg
figure attributes =
    Html.figure (Role.group :: attributes)
