module Html.A11y
    exposing
        ( Input
        , textInput
        , radioInput
        , checkboxInput
        , leftLabeledInput
        , rightLabeledInput
        , invisibleLabeledInput
        , tabList
        , tab
        , tabPanel
        , img
        , decorativeImg
        , figure
        )

{-|
## Inputs
@docs Input
@docs textInput, radioInput, checkboxInput
@docs leftLabeledInput, rightLabeledInput, invisibleLabeledInput

## Tabs
@docs tabList, tab, tabPanel

## Images
@docs img, decorativeImg, figure
-}

import Html exposing (..)
import Tags.Images as Images
import Tags.Inputs as Inputs
import Tags.Tabs as Tabs


{-| Describes the model used in input views in this library.
-}
type alias Input msg =
    Inputs.Input msg


{-| Use helpers like `textInput` and `radioInput` to create InputTypeAndValue items.
-}
type alias InputTypeAndValue =
    Inputs.InputTypeAndValue


{-| This will construct a text input with the value passed in.

    textInput "This appears in the text input."
-}
textInput : String -> InputTypeAndValue
textInput =
    Inputs.textInput


{-| This will construct a radio input. The first argument is the radio group name
in common across radio items. THe second argument is the value of the radio.
The third is whether the radio is checked or not.

    radioInput "radio_name" "This is the actual value of the radio." True
-}
radioInput : String -> String -> Bool -> InputTypeAndValue
radioInput =
    Inputs.radioInput


{-| This will construct a checkbox input. THe first argument is the value of the checkbox.
The second is whether the radio is checked, unchecked, or indeterminate.

    checkboxInput "radio_name" "This is the actual value of the radio." True
-}
checkboxInput : String -> Maybe Bool -> InputTypeAndValue
checkboxInput =
    Inputs.checkboxInput


{-| Produces a labeled input of a given label type. The label appears on the left side on the input.
-}
leftLabeledInput : Input msg -> Html msg
leftLabeledInput =
    Inputs.leftLabeledInput


{-| Produces a labeled input of a given label type. The label appears on the right side on the input.
-}
rightLabeledInput : Input msg -> Html msg
rightLabeledInput =
    Inputs.rightLabeledInput


{-| Produces a labeled input of a given label type.
This label is visibly hidden, but is still available for screen readers.
E.g., use this input if your design asks that you convey information via placeholders
rather than visible labels.
Requires that you pass an id.
-}
invisibleLabeledInput : Input msg -> String -> Html msg
invisibleLabeledInput =
    Inputs.invisibleLabeledInput


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
