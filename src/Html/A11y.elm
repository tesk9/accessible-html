module Html.A11y
    exposing
        ( textLeftLabeled
        , textRightLabeled
        , textInvisibleLabel
        , radioLeftLabeled
        , radioRightLabeled
        , radioInvisibleLabel
        , checkBoxLeftLabeled
        , checkBoxRightLabeled
        , checkBoxInvisibleLabel
        , tabList
        , tab
        , tabPanel
        , img
        , decorativeImg
        , figure
        )

{-|
## Inputs

Inputs defined in this library are offered in three varieties: left-labeled, right-labeled, and featuring an invisible-label.
Invisible-labelled views require an id.

### Text Inputs

@docs textLeftLabeled, textRightLabeled, textInvisibleLabel

### Radio Inputs

@docs radioLeftLabeled, radioRightLabeled, radioInvisibleLabel

### CheckBox Inputs

@docs checkBoxLeftLabeled, checkBoxRightLabeled, checkBoxInvisibleLabel

## Tabs
@docs tabList, tab, tabPanel

## Images
@docs img, decorativeImg, figure
-}

import Html exposing (..)
import Tags.Images as Images
import Tags.Inputs as Inputs
import Tags.Tabs as Tabs


{- *** Text Inputs *** -}


textModel : String -> List (Html.Attribute msg) -> Html msg -> Inputs.Input msg
textModel value attributes label =
    { typeAndValue = Inputs.textInput value
    , label = label
    , attributes = attributes
    }


{-| Construct a left-labeled text input.

    textLeftLabeled "This appears in the text input." [] <| text "I'm the label!"
-}
textLeftLabeled : String -> List (Html.Attribute msg) -> Html msg -> Html msg
textLeftLabeled value attributes label =
    Inputs.leftLabeledInput (textModel value attributes label)


{-| Construct a right-labeled text input.

    textRightLabeled "This appears in the text input." [] <| text "I'm the label!"
-}
textRightLabeled : String -> List (Html.Attribute msg) -> Html msg -> Html msg
textRightLabeled value attributes label =
    Inputs.rightLabeledInput (textModel value attributes label)


{-| Construct a text input with an invisible label.

    textInvisibleLabel "best-input-everrr" "This appears in the text input." [] <| text "I'm the label!"
-}
textInvisibleLabel : String -> String -> List (Html.Attribute msg) -> Html msg -> Html msg
textInvisibleLabel id value attributes label =
    Inputs.invisibleLabeledInput (textModel value attributes label) id



{- *** Radio Inputs *** -}


radioModel : String -> String -> Bool -> List (Html.Attribute msg) -> Html msg -> Inputs.Input msg
radioModel groupName value checked attributes label =
    { typeAndValue = Inputs.radioInput groupName value checked
    , label = label
    , attributes = attributes
    }


{-| Construct a left-labeled radio input.

    radioLeftLabeled "radio_name" "This is the actual value of the radio." True [] <| text "I'm the label!"
-}
radioLeftLabeled : String -> String -> Bool -> List (Html.Attribute msg) -> Html msg -> Html msg
radioLeftLabeled groupName value checked attributes label =
    Inputs.leftLabeledInput (radioModel groupName value checked attributes label)


{-| Construct a right-labeled radio input.

    radioRightLabeled  "radio_name" "This is the actual value of the radio." True [] <| text "I'm the label!"
-}
radioRightLabeled : String -> String -> Bool -> List (Html.Attribute msg) -> Html msg -> Html msg
radioRightLabeled groupName value checked attributes label =
    Inputs.rightLabeledInput (radioModel groupName value checked attributes label)


{-| Construct a radio button with an invisible label.

    radioInvisibleLabel "best-input-everrr" "This is the actual value of the radio." [] <| text "I'm the label!"
-}
radioInvisibleLabel : String -> String -> String -> Bool -> List (Html.Attribute msg) -> Html msg -> Html msg
radioInvisibleLabel id groupName value checked attributes label =
    Inputs.invisibleLabeledInput (radioModel groupName value checked attributes label) id



{- *** Checkbox Inputs *** -}


checkBoxModel : String -> Maybe Bool -> List (Html.Attribute msg) -> Html msg -> Inputs.Input msg
checkBoxModel value checked attributes label =
    { typeAndValue = Inputs.checkboxInput value checked
    , label = label
    , attributes = attributes
    }


{-| Construct a left-labeled check box input.

    checkBoxLeftLabeled "This is the actual value of the check box." (Just True) [] <| text "I'm the label!"
-}
checkBoxLeftLabeled : String -> Maybe Bool -> List (Html.Attribute msg) -> Html msg -> Html msg
checkBoxLeftLabeled value checked attributes label =
    Inputs.leftLabeledInput (checkBoxModel value checked attributes label)


{-| Construct a right-labeled check box input.

    checkBoxRightLabeled  "This is the actual value of the checkBox." (Just True) [] <| text "I'm the label!"
-}
checkBoxRightLabeled : String -> Maybe Bool -> List (Html.Attribute msg) -> Html msg -> Html msg
checkBoxRightLabeled value checked attributes label =
    Inputs.rightLabeledInput (checkBoxModel value checked attributes label)


{-| Construct a check box with an invisible label.

    checkBoxInvisibleLabel "checkbox-id" "Checkbox value" (Just False) [] <| text "I'm the label!"
-}
checkBoxInvisibleLabel : String -> String -> Maybe Bool -> List (Html.Attribute msg) -> Html msg -> Html msg
checkBoxInvisibleLabel id value checked attributes label =
    Inputs.invisibleLabeledInput (checkBoxModel value checked attributes label) id



{- *** Tabs *** -}


{-| Create a tablist. This is the outer container for a list of tabs.
-}
tabList : List (Html.Attribute msg) -> List (Html msg) -> Html msg
tabList =
    Tabs.tabList


{-| Create a tab. This is the part that you select in order to change panel views.
-}
tab : List (Html.Attribute msg) -> List (Html msg) -> Html msg
tab =
    Tabs.tab


{-| Create a tab panel.

    tabPanel [] [ h3 [] [ text "Panel Header" ], text "Panel Content" ]
-}
tabPanel : List (Html.Attribute msg) -> List (Html msg) -> Html msg
tabPanel =
    Tabs.tabPanel



{- *** Images *** -}


{-| Use this tag when the image provides information not expressed in the text of the page.
When images are used to express the purpose of a button or link, aim for alternative text that encapsulates the function of the image.

Read through [the w3 informative image tutorial](https://www.w3.org/WAI/tutorials/images/informative/) and the [the w3 functional image tutorial](https://www.w3.org/WAI/tutorials/images/functional/) to learn more.

For graphs and diagrams, see `figure` and `longDesc`.

    img "Bear rubbing back on tree" [ src "bear.png" ]
-}
img : String -> List (Html.Attribute msg) -> Html msg
img =
    Images.img


{-| Use this tag when the image is decorative or provides redundant information. Read through [the w3 decorative image tutorial](https://www.w3.org/WAI/tutorials/images/decorative/) to learn more.

    decorativeImg [ src "smiling_family.jpg" ]
-}
decorativeImg : List (Html.Attribute msg) -> Html msg
decorativeImg =
    Images.decorativeImg


{-| Adds the group role to a figure.
-}
figure : List (Html.Attribute msg) -> List (Html msg) -> Html msg
figure =
    Images.figure
