module Accessibility.Aria exposing
    ( activeDescendant, controls, owns
    , label, labelledBy, labeledBy, details, describedBy, longDescription, brailleLabel
    , keyShortcuts, roleDescription
    , flowTo
    , placeholder
    , colCount, colIndex, colSpan, rowCount, rowIndex, rowSpan
    , setSize, posInSet
    , currentItem, currentPage, currentStep, currentLocation, currentDate, currentTime
    , required
    , invalid, invalidGrammar, invalidSpelling
    , errorMessage
    , pressed
    , multiLine
    , checked, selected, indeterminate
    , autoCompleteInline, autoCompleteList, autoCompleteBoth
    , expanded, hidden, readOnly, disabled
    , modal
    , hasMenuPopUp, hasListBoxPopUp, hasTreePopUp, hasGridPopUp, hasDialogPopUp
    , orientationHorizontal, orientationVertical, valueMin, valueMax, valueNow, valueText
    , sortAscending, sortDescending, sortCustom, sortNone
    , multiSelectable
    , level
    )

{-| Learn more about about W3C's Web Accessibility Initiative's Accessible Rich Internet Applications standards ("WAI-ARIA") at [w3.org](https://www.w3.org/WAI/standards-guidelines/aria/).

Please keep in mind that ARIA attributes are best used sparingly -- your users are better off with semantic HTML than they are with divs with many ARIA attributes. See [No ARIA is better than BAD ARIA](https://www.w3.org/TR/wai-aria-practices-1.1/#no_aria_better_bad_aria) from the WAI-ARIA Authoring Practices guide.

@docs activeDescendant, controls, owns


### Providing More Info

  - Learn the challenges non-text content can cause your users in [Understanding Success Criterion 1.1.1: Non-text Content](https://www.w3.org/WAI/WCAG21/Understanding/non-text-content.html)
  - Learn how to define relationships between elements in [Understanding Success Criterion 1.3.1: Info and Relationships](https://www.w3.org/WAI/WCAG21/Understanding/info-and-relationships)
  - Learn how a user agent will determine the accessible name and description of an element in [Accessible Name and Description Computation 1.1](https://www.w3.org/TR/accname-1.1/)

@docs label, labelledBy, labeledBy, details, describedBy, longDescription, brailleLabel
@docs keyShortcuts, roleDescription


### Navigation and Flow

  - Audio-users experience all content linearly, since a screen reader will only read one word at a time. Learn about ordering content effectively with this constraint in mind in [Understanding Success Criterion 1.3.2: Meaningful Sequence](https://www.w3.org/WAI/WCAG21/Understanding/meaningful-sequence)
  - Now that your content is ordered, consider how much of it, like the content in the header) is annoying to hear over & over again as you switch between pages! Learn about how skip links and landmarks can make your site more usable in [Understanding Success Criterion 2.4.1: Bypass Blocks](https://www.w3.org/WAI/WCAG21/Understanding/bypass-blocks)

@docs flowTo

Looking for tab order? Please see `tabbable` in `Accessibility.Key`.

Please also remember to use a descriptive title for your pages ([Understanding Success Criterion 2.4.2: Page Titled](https://www.w3.org/WAI/WCAG21/Understanding/page-titled)). Note that you'll only use Elm to set the page title if you're using [`Browser.document`](https://package.elm-lang.org/packages/elm/browser/latest/Browser#document) to start your Elm app.


### Textbox Related

@docs placeholder


### Table Related

  - Learn more about leveraging semantic native HTML elements to make accessible tables with various headings in [the Tables Concepts Web Accessibility Tutorial](https://www.w3.org/WAI/tutorials/tables/). If you've never heard of the `scope` or `headers` HTML attributes, this is the tutorial for you!
  - Learn more about implementing a non-native HTML table in the [table section of the WAI-ARIA Authoring Practices](https://www.w3.org/TR/wai-aria-practices/#table). Prefer to use the native HTML table whenever possible!

@docs colCount, colIndex, colSpan, rowCount, rowIndex, rowSpan


### Set Related

@docs setSize, posInSet


### Current

@docs currentItem, currentPage, currentStep, currentLocation, currentDate, currentTime


### Inputs and Validation

  - Learn more about making forms and inputs understandable in [Understanding Guideline 3.3: Input Assistance](https://www.w3.org/WAI/WCAG21/Understanding/input-assistance)
  - Users need to understand what to do when their submissions aren't valid. Read [Understanding Success Criterion 3.3.1: Error Identification](https://www.w3.org/WAI/WCAG21/Understanding/error-identification) to better understand user requirements. You'll also find links to sufficient techniques for meeting this requirement.

@docs required
@docs invalid, invalidGrammar, invalidSpelling
@docs errorMessage

@docs pressed
@docs multiLine
@docs checked, selected, indeterminate


#### Auto-complete behavior:

See [the autocomplete spec](https://www.w3.org/TR/wai-aria-1.1/#aria-autocomplete).

@docs autoCompleteInline, autoCompleteList, autoCompleteBoth


### Interactability

@docs expanded, hidden, readOnly, disabled


### Pop-Ups

@docs modal

Pop-ups are supported for all elements (but not meant for use on tooltips).

The pop-up itself needs to have a containing element with one of these roles: `menu`, `listbox`, `tree`, `grid`, or `dialog`, and the pop-up value must match. That is, use `hasMenuPopUp` if the pop-up container has a role of `menu`.

See [the spec](https://www.w3.org/TR/wai-aria-1.1/#aria-haspopup).

@docs hasMenuPopUp, hasListBoxPopUp, hasTreePopUp, hasGridPopUp, hasDialogPopUp


### Orientation and Range Widgets

@docs orientationHorizontal, orientationVertical, valueMin, valueMax, valueNow, valueText


### Table Sort-by-column

@docs sortAscending, sortDescending, sortCustom, sortNone


### Misc

@docs multiSelectable


### Page Hierarchy

@docs level

-}

import Accessibility.Utils exposing (..)
import Html
import Html.Attributes exposing (..)
import Json.Encode


{-| Convenience alias for `labelledBy`.
-}
labeledBy : String -> Html.Attribute msg
labeledBy =
    labelledBy


{-| Creates an [`aria-labelledby`](https://www.w3.org/TR/wai-aria-1.1/#aria-labelledby) attribute.

Pass the unique string id of the labelling element. Only use this property if the label is _visible_ (if the label is _not_ visible, prefer `Accessibility.Aria.label`).

-}
labelledBy : String -> Html.Attribute msg
labelledBy =
    attribute "aria-labelledby"


{-| Creates the longDesc attribute with the given url, which should point to a text description of the content. This attribute is only supported on img tags.

    import Accessibility exposing (Html, img)
    import Accessibility.Aria exposing (longDescription)

    view : Html msg
    view =
        img
            "Growth Chart in Some Sweet Unit (Quarter 4)"
            [ longDescription "/quarter_4_summary#Growth" ]

Note that this is a deprecated HTML property, not an ARIA property. See [MDN documentation on HTMLImageElement.longDesc
](https://developer.mozilla.org/en-US/docs/Web/API/HTMLImageElement/longDesc) for general documentation and [Using longdesc (Technique H45)](https://www.w3.org/WAI/WCAG21/Techniques/html/H45) for accessibility documentation.

-}
longDescription : String -> Html.Attribute msg
longDescription =
    attribute "longdesc"


{-| Creates an [`aria-activedescendant`](https://www.w3.org/TR/wai-aria-1.1/#aria-activedescendant) attribute.

Identifies the currently-active element in order to provide an alternative way of managing focus.

Supported in container-y roles: `application`, `composite`, `group`, `textbox`, `comboBox`, `grid`, `listBox`, `menu`, `menuBar`, `radioGroup`, `row`, `searchBox`, `select`, `spinButton`, `tabList`, `toolBar`, `tree`, and `treeGrid`.

-}
activeDescendant : String -> Html.Attribute msg
activeDescendant =
    aria "activedescendant"


{-| Creates an [`aria-colcount`](https://www.w3.org/TR/wai-aria-1.1/#aria-colcount) attribute.

Describe the number of columns in a grid in which not all of the columns are currently in the DOM. (If all columns are already rendering, don't use this attribute.)

`-1` indicates total column number is unknown.

Supported by elements with roles `table`, `grid`, and `treegrid`.

-}
colCount : Int -> Html.Attribute msg
colCount =
    aria "colcount" << String.fromInt


{-| Creates an [`aria-colindex`](https://www.w3.org/TR/wai-aria-1.1/#aria-colindex) attribute.

Indexing begins from 1, NOT 0. Plus, the colIndex should not be greater than the `colCount`!
If a cell stretches across multiple columns, use the starting column index and `colSpan`.

The simplest rule is to put the `colIndex` on every child of a `row`.

Please note that if all of the columns of the table/grid are already present in the DOM, you do not need to use this property.

Supported by elements with roles `cell`, `row`, `columnHeader`, `gridCell`, and `rowHeader`.

-}
colIndex : Int -> Html.Attribute msg
colIndex =
    aria "colindex" << String.fromInt


{-| Creates an [`aria-colspan`](https://www.w3.org/TR/wai-aria-1.1/#aria-colspan) attribute.

Indicate how many columns-wide a cell is.

Please use the [HTML attribute colspan](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/td#attr-colspan) instead of `aria-colspan` for native HTML tables.

Supported by elements with roles `cell`, `columnHeader`, `gridCell`, and `rowHeader`.

-}
colSpan : Int -> Html.Attribute msg
colSpan =
    aria "colspan" << String.fromInt


{-| Creates an [`aria-rowcount`](https://www.w3.org/TR/wai-aria-1.1/#aria-rowcount) attribute.

Analagous to `colcount`.

-}
rowCount : Int -> Html.Attribute msg
rowCount =
    aria "rowcount" << String.fromInt


{-| Creates an [`aria-rowindex`](https://www.w3.org/TR/wai-aria-1.1/#aria-rowindex) attribute.

Analagous to `colIndex`.

-}
rowIndex : Int -> Html.Attribute msg
rowIndex =
    aria "rowindex" << String.fromInt


{-| Creates an [`aria-rowspan`](https://www.w3.org/TR/wai-aria-1.1/#aria-rowspan) attribute.

Analagous to `colSpan`.

-}
rowSpan : Int -> Html.Attribute msg
rowSpan =
    aria "rowspan" << String.fromInt


{-| Creates an [`aria-posinset`](https://www.w3.org/TR/wai-aria-1.1/#aria-posinset) attribute.

Only necessary when not all of the items in the set are in the DOM. Use with `setSize`.

Supported by elements that might appear in a list: `article`, `listItem`, `menuItem`, `option`, `radio`, `tab`, `menuitemcheckbox`, `menuitemradio`, and `treeItem`.

-}
posInSet : Int -> Html.Attribute msg
posInSet =
    aria "posinset" << String.fromInt


{-| Creates an [`aria-setsize`](https://www.w3.org/TR/wai-aria-1.1/#aria-setsize) attribute.

`setSize` indicates the total number of items in a set where not all the items are currently present in the DOM.

Warning! The `setSize` is added to every set _item_, not to the element containing the set.

The ARIA docs include this example, which I've converted to Elm and shorted a bit:

    import Accessibility exposing (..)
    import Accessibility.Aria as Aria
    import Accessibility.Role as Role
    import Html.Attributes exposing (id)

    view : List (Html msg)
    view =
        [ h2 [ id "label_fruit" ] [ text "Available Fruit" ]
        , ul [ Role.listBox, Aria.labelledBy "label_fruit" ]
            [ li
                [ Role.option
                , Aria.setSize 16
                , Aria.posInSet 5
                ]
                [ text "apples" ]
            , li
                [ Role.option
                , Aria.setSize 16 -- <- Note the set size appears on the element, not on the container
                , Aria.posInSet 6
                ]
                [ text "bananas" ]
            ]
        ]

Supported by elements that might appear in a list: `article`, `listItem`, `menuItem`, `option`, `radio`, `tab`, `menuitemcheckbox`, `menuitemradio`, and `treeItem`.

-}
setSize : Int -> Html.Attribute msg
setSize =
    aria "setsize" << String.fromInt


{-| Creates [`aria-controls`](https://www.w3.org/TR/wai-aria-1.1/#aria-controls) attribute.

Pass a list of ids for the elements that are being controlled by the current element.

Supported by all elements.

-}
controls : List String -> Html.Attribute msg
controls =
    aria "controls" << toListString


{-| Creates [`aria-owns`](https://www.w3.org/TR/wai-aria-1.1/#aria-owns) attribute.

Pass a list of ids for the elements that ought to be considered direct children of the current element. If possible, it's better to rely on the actual DOM structure, instead of using `aria-owns`.

A child should only have one parent. So an element's id should only be referenced by one `aria-owns` at a time.

Not supported by VoiceOver as of October 2022. Please see [a11ysupport.io](https://a11ysupport.io/tech/aria/aria-owns_attribute) for more recent support testing.

Supported by all elements.

-}
owns : List String -> Html.Attribute msg
owns =
    aria "owns" << toListString


{-| Creates an [`aria-current`](https://www.w3.org/TR/wai-aria-1.1/#aria-current) attribute, as `aria-current=page`.

Indicate that a link in a nav or list is the current location.

Supported by all elements.

-}
currentPage : Html.Attribute msg
currentPage =
    aria "current" "page"


{-| Creates an [`aria-current`](https://www.w3.org/TR/wai-aria-1.1/#aria-current) attribute, as `aria-current=step`.

Indicate which step in a step-based flow is the current one.

Supported by all elements.

-}
currentStep : Html.Attribute msg
currentStep =
    aria "current" "step"


{-| Supported by all elements.
-}
currentLocation : Html.Attribute msg
currentLocation =
    aria "current" "location"


{-| Creates an [`aria-current`](https://www.w3.org/TR/wai-aria-1.1/#aria-current) attribute, as `aria-current=date`.

As in a calendar.

Supported by all elements.

-}
currentDate : Html.Attribute msg
currentDate =
    aria "current" "date"


{-| Creates an [`aria-current`](https://www.w3.org/TR/wai-aria-1.1/#aria-current) attribute, as `aria-current=time`.

As in a timepicker.

Supported by all elements.

-}
currentTime : Html.Attribute msg
currentTime =
    aria "current" "time"


{-| Creates an [`aria-current`](https://www.w3.org/TR/wai-aria-1.1/#aria-current) attribute, either `aria-current=true` or `aria-current=false`.

Only 1 element in a set should be marked as the current item.

Please double-check that you don't want `Accessibility.Aria.selected` instead.

Supported by all elements.

-}
currentItem : Bool -> Html.Attribute msg
currentItem =
    aria "current" << toBoolString


{-| Supported by all elements. Pass it a list of ids of elements that describe the given element.

Pass in ids of elements that describe the current element to create an [aria-describedby association](https://www.w3.org/TR/wai-aria-1.1/#aria-describedby).

You may wish to review the documentation for `labelledBy` and `details` as well -- which property you should use will depend on your specific UX requirements.

-}
describedBy : List String -> Html.Attribute msg
describedBy =
    aria "describedby" << toListString


{-| Supported by all elements.

Refer to a single extended description section--maybe a couple of paragraphs
and a chart. Pass in the HTML id of an element with details about the current element to create an [aria-details association](https://www.w3.org/TR/wai-aria-1.1/#aria-details).

The Editor's Draft for ARIA 1.3 allows multiple idrefs instead of just 1, but the current published ARIA spec only supports a singular idref.

-}
details : String -> Html.Attribute msg
details =
    aria "details"


{-| Create an [`aria-errormessage`](https://www.w3.org/TR/wai-aria-1.1/#aria-errormessage) element.

Reference the element that has error details. e.g., if you've got an input field that's invalid, add `errorMessage` to the input with the id of whatever element is telling the user in what way their submission is wrong.

    import Accessibility
    import Accessibility.Aria as Aria
    import Html.Attributes exposing (id)

    view : List (Html msg)
    view =
        [ labelBefore [] (text "Input content:") <|
            inputText "some-content"
                [ Aria.invalid True
                , Aria.errorMessage "error-message-id"
                ]
        , span [ id "error-message-id" ] [ text "Better content required" ]
        ]

You must also use `Accessibility.Aria.invalid` when using `errorMessage`.

Supported by all elements.

-}
errorMessage : String -> Html.Attribute msg
errorMessage =
    aria "errormessage"


{-| Creates an [`aria-flowto`](https://www.w3.org/TR/wai-aria-1.1/#aria-flowto) attribute.

Provide an alternative document reading order and offer navigation to the
elements referenced in the passed-in list of ids.

Supported by all elements.

-}
flowTo : List String -> Html.Attribute msg
flowTo =
    aria "flowto" << toListString


{-| Supported by all elements. Pass in a list of keyboard shortcuts to use the [ aria-keyshortcuts property](https://www.w3.org/TR/wai-aria-1.1/#aria-keyshortcuts).

    keyShortcuts [ "Alt+Shift+P", "Control+F" ]

Note that this property only indicates to users that certain keyboard shortcuts _exist_ -- this property does not change the behavior of the element to which it is attached. Please also note that it's nice to make the existence of keyboard shortcuts known to all users, not only to screen reader users!

Learn more about the purpose of from The WAI-ARIA Authoring Practices guide's [Keyboard Shortcuts](https://www.w3.org/TR/wai-aria-practices-1.1/#kbd_shortcuts) section.

Please be aware that providing single-character keyboard shortcuts may make using your site _less_ accessible for some users. Read [Understanding Success Criterion 2.1.4: Character Key Shortcuts](https://www.w3.org/WAI/WCAG21/Understanding/character-key-shortcuts) to learn more.

-}
keyShortcuts : List String -> Html.Attribute msg
keyShortcuts =
    aria "keyshortcuts" << toListString


{-| Supported by `textbox` and `searchbox`.

Provide a hint about an expected value.

Creates an [aria-placeholder](https://www.w3.org/TR/wai-aria-1.1/#aria-placeholder) property.

Generally, you should use `Html.Attributes.placeholder` instead of using `aria-placeholder`. The only time that you should add an `aria-placeholder` attribute is if you're rolling your own widget that's required you to explicitly set a wai-aria role. See some guidance around "implicit" aria semantics [here](https://www.w3.org/TR/html-aria/).

-}
placeholder : String -> Html.Attribute msg
placeholder =
    aria "placeholder"


{-| Supported by all elements.

Provide human-readable description of the role of an element. Should be used
alongside an actual role--this is supplementary information.

Creates an [aria-roledescription property](https://www.w3.org/TR/wai-aria-1.1/#aria-roledescription).

-}
roleDescription : String -> Html.Attribute msg
roleDescription =
    aria "roledescription"


{-| Creates an [`aria-autocomplete="inline"`](https://www.w3.org/TR/wai-aria-1.1/#aria-autocomplete) attribute.

Use when there's a suggestion for completing the field that shows up in the line that the user is completing. Be sure to indicate that the auto-completed text is selected.

Available on `comboBox` or `textbox`.

-}
autoCompleteInline : Html.Attribute msg
autoCompleteInline =
    aria "autocomplete" "inline"


{-| Creates an [`aria-autocomplete="list"`](https://www.w3.org/TR/wai-aria-1.1/#aria-autocomplete) attribute.

Use when there's a suggestion for completing the field that shows up as a list of options from which the user can pick.

Be sure to indicate that the auto-completed text is selected.

Available on `comboBox` or `textbox`.

-}
autoCompleteList : Html.Attribute msg
autoCompleteList =
    aria "autocomplete" "list"


{-| Creates an [`aria-autocomplete="both"`](https://www.w3.org/TR/wai-aria-1.1/#aria-autocomplete) attribute.

Use when there's a suggestion for completing the field when there's both inline autocomplete and list autocomplete occurring at once.

Be sure to indicate that the auto-completed text is selected.

Available on `comboBox` or `textbox`.

-}
autoCompleteBoth : Html.Attribute msg
autoCompleteBoth =
    aria "autocomplete" "both"


{-| Creates an [`aria-checked`](https://www.w3.org/TR/wai-aria-1.1/#aria-checked) attribute.

Check boxes can be checked (`Just True`), unchecked (`Just False`), or indeterminate (`Nothing`).

Available on `checkbox`, `option`, `radio`, `switch`

-}
checked : Maybe Bool -> Html.Attribute msg
checked =
    aria "checked" << toTriStateString


{-| Creates an [`aria-indeterminate`](https://www.w3.org/TR/wai-aria-1.1/#aria-indeterminate) attribute.

Sets the indeterminate value to be true.

-}
indeterminate : Html.Attribute msg
indeterminate =
    property "indeterminate" (Json.Encode.bool True)


{-| Creates an [`aria-disabled`](https://www.w3.org/TR/wai-aria-1.1/#aria-disabled) attribute.

In deciding whether to use `Accessibility.Aria.disabled` or `Html.Attributes.disabled`, it may be helpful to read through the [Focusablity of disabled controls](https://www.w3.org/TR/wai-aria-practices-1.1/#kbd_disabled_controls) section of the WAI-ARIA Practices recommendations.

In essence, you may want to use `Accessibility.Aria.disabled` instead of `Html.Attributes.disabled` if you want users to be aware of disabled elements, and you don't mind that users will need to navigate through these disabled elements.

Supported for all elements. Elements are not disabled (they are enabled) by default.

-}
disabled : Bool -> Html.Attribute msg
disabled =
    aria "disabled" << toBoolString


{-| Creates an [`aria-expanded`](https://www.w3.org/TR/wai-aria-1.1/#aria-expanded) attribute.

This attribute can be applied to either an element that is itself expanded/collapsed, OR to an elment it controls that is either expanded/collapsed. In the latter case, use a `controls` attribute as well to clarify the relationship.

Available on `button`, `comboBox`, `document`, `link`, `section`, `sectionHead`, and `window`.

-}
expanded : Bool -> Html.Attribute msg
expanded =
    aria "expanded" << toBoolString


{-| Creates an [`aria-haspopup="menu"`](https://www.w3.org/TR/wai-aria-1.1/#aria-haspopup) attribute.

Indicate that interaction with this element can trigger a `menu` pop-up.

Be careful while managing focus and triggering.

-}
hasMenuPopUp : Html.Attribute msg
hasMenuPopUp =
    aria "haspopup" "menu"


{-| Creates an [`aria-haspopup="listbox"`](https://www.w3.org/TR/wai-aria-1.1/#aria-haspopup) attribute.

Indicate that interaction with this element can trigger a `listBox` pop-up.

Be careful while managing focus and triggering.

-}
hasListBoxPopUp : Html.Attribute msg
hasListBoxPopUp =
    aria "haspopup" "listbox"


{-| Creates an [`aria-haspopup="tree"`](https://www.w3.org/TR/wai-aria-1.1/#aria-haspopup) attribute.

Indicate that interaction with this element can trigger a `tree` pop-up.

Be careful while managing focus and triggering.

-}
hasTreePopUp : Html.Attribute msg
hasTreePopUp =
    aria "haspopup" "tree"


{-| Creates an [`aria-haspopup="grid"`](https://www.w3.org/TR/wai-aria-1.1/#aria-haspopup) attribute.

Indicate that interaction with this element can trigger a `grid` pop-up.

Be careful while managing focus and triggering.

-}
hasGridPopUp : Html.Attribute msg
hasGridPopUp =
    aria "haspopup" "grid"


{-| Creates an [`aria-haspopup="dialog"`](https://www.w3.org/TR/wai-aria-1.1/#aria-haspopup) attribute.

Indicate that interaction with this element can trigger a `dialog` pop-up.

Be careful while managing focus and triggering.

-}
hasDialogPopUp : Html.Attribute msg
hasDialogPopUp =
    aria "haspopup" "dialog"


{-| Creates an [`aria-hidden`](https://www.w3.org/TR/wai-aria-1.1/#aria-hidden) attribute.
-}
hidden : Bool -> Html.Attribute msg
hidden =
    aria "hidden" << toBoolString


{-| Creates an [`aria-invalid`](https://www.w3.org/TR/wai-aria-1.1/#aria-invalid) attribute.

Learn more about [Using Aria-Invalid to Indicate an Error Field](https://www.w3.org/WAI/WCAG21/Techniques/aria/ARIA21).

You may want to use `Accessibility.Aria.errorMessage` or `Accessibility.Aria.describedBy` to indicate what's invalid about the user's submission.

For invalid grammar or spelling specifically, use `invalidGrammar` and `invalidSpelling` respectively.

Supported for all elements.

-}
invalid : Bool -> Html.Attribute msg
invalid =
    aria "invalid" << toBoolString


{-| Creates an [`aria-invalid="grammar"`](https://www.w3.org/TR/wai-aria-1.1/#aria-invalid) attribute.

Supported for all elements.

-}
invalidGrammar : Html.Attribute msg
invalidGrammar =
    aria "invalid" "grammar"


{-| Creates an [`aria-invalid="spelling"`](https://www.w3.org/TR/wai-aria-1.1/#aria-invalid) attribute.

Supported for all elements.

-}
invalidSpelling : Html.Attribute msg
invalidSpelling =
    aria "invalid" "spelling"


{-| Add [`aria="braillelabel"`](https://w3c.github.io/aria/#aria-braillelabel) to the attributes of an element.

Please note that this ARIA property is part of the Editor's Draft for ARIA 1.3 -- it's not an official part of a published spec yet.

-}
brailleLabel : String -> Html.Attribute msg
brailleLabel =
    aria "braillelabel"


{-| Creates an [`aria-label`](https://www.w3.org/TR/wai-aria-1.1/#aria-label) attribute.

Supported for all elements.

-}
label : String -> Html.Attribute msg
label =
    aria "label"


{-| Creates an [`aria-level`](https://www.w3.org/TR/wai-aria-1.1/#aria-level) attribute.

This attribute is about hierarchy--how many "levels" deep is an element?

    h7 attributes =
        div (heading :: level 7 :: attributes)

Supported for `grid`, `heading`, `listItem`, `row`, and `tabList`.

-}
level : Int -> Html.Attribute msg
level =
    aria "level" << String.fromInt


{-| Creates an [`aria-modal`](https://www.w3.org/TR/wai-aria-1.1/#aria-modal) attribute.

Indicate that a modal is showing and the rest of the page contents are not interactable.

    import Accessibility exposing (div, h2, p, text)
    import Accessibility.Aria exposing (labelledBy, modal)
    import Accessibility.Role exposing (dialog)
    import Html.Attributes exposing (id)

    modal : Html msg
    modal =
        div [ dialog, modal, labelledBy "header-id" ]
            [ h2 [ id "header-id" ] [ text "Modal Header" ]
            , p [] [ text "Wow, such modal contents!" ]
            ]

-}
modal : Bool -> Html.Attribute msg
modal =
    aria "modal" << toBoolString


{-| Creates an [`aria-multiline`](https://www.w3.org/TR/wai-aria-1.1/#aria-multiline) attribute.

Indicate whether the `textbox` is for multi-line inputs or single-line inputs.

Be careful of default keyboard behavior when coupling this property with text inputs, which by default submit their form group on enter.

Supported for `textbox` only.

-}
multiLine : Bool -> Html.Attribute msg
multiLine =
    aria "multiline" << toBoolString


{-| Creates an [`aria-multiselectable`](https://www.w3.org/TR/wai-aria-1.1/#aria-multiselectable) attribute.

When true, users are not restricted to selecting only one selectable descendant at a time.

Supported on `grid`, `listBox`, `tabList`, `tree`.

-}
multiSelectable : Bool -> Html.Attribute msg
multiSelectable =
    aria "multiselectable" << toBoolString


{-| Creates an [`aria-orientation="horizontal`](https://www.w3.org/TR/wai-aria-1.1/#aria-orientation) attribute.

Supported on roles with some sense of inherent orientation: `progressBar`, `scrollbar`, `select`, `separator`, `slider`, `tabList`, `toolBar`

Careful: default behavior is inconsistent across those roles.

-}
orientationHorizontal : Html.Attribute msg
orientationHorizontal =
    --TODO: should the non-default behavior be explicit from the role perspective?
    aria "orientation" "horizontal"


{-| Creates an [`aria-orientation="vertical"`](https://www.w3.org/TR/wai-aria-1.1/#aria-orientation="vertical") attribute.

Supported on roles with some sense of inherent orientation: `progressBar`, `scrollbar`, `select`, `separator`, `slider`, `tabList`, `toolBar`

Careful: default behavior is inconsistent across those roles.

-}
orientationVertical : Html.Attribute msg
orientationVertical =
    --TODO: should the non-default behavior be explicit from the role perspective?
    aria "orientation" "vertical"


{-| Creates an [`aria-pressed`](https://www.w3.org/TR/wai-aria-1.1/#aria-pressed) attribute.

Use `pressed` when describing a toggle button--a button that can be "toggled" between an on state and an off state (or an on state, an indeterminate state, and an off state).

Please check out these [examples](https://www.w3.org/TR/2016/WD-wai-aria-practices-1.1-20160317/examples/button/button.html) as well.

    button
        [ pressed <| Just True ]
        [ text "This button should be styled for site viewers such that it's clear it's pressed!" ]

Supported on `button`.

-}
pressed : Maybe Bool -> Html.Attribute msg
pressed =
    --TODO: Move to be a button role option?
    aria "pressed" << toTriStateString


{-| Creates an [`aria-readonly`](https://www.w3.org/TR/wai-aria-1.1/#aria-readonly) attribute.

Indicates read-only status of a widget, although normal navigation rules and copying behavior should apply. (Read: `readOnly` elements are navigable but unchangeable, and `disabled` elements are neither navigable nor unchangebale).

Supported on `checkBox`, `comboBox`, `grid`, `gridCell`, `listBox`, `radioGroup`, `slider`, `spinButton`, and `textBox`.

-}
readOnly : Bool -> Html.Attribute msg
readOnly =
    aria "readonly" << toBoolString


{-| Creates an [`aria-required`](https://www.w3.org/TR/wai-aria-1.1/#aria-required) attribute.

Indicate whether user input is or is not required on a field for valid form submission.

Supported by `comboBox`, `gridCell`, `listBox`, `radioGroup`, `spinButton`, `textBox`, `tree`

-}
required : Bool -> Html.Attribute msg
required =
    aria "required" << toBoolString


{-| Creates an [`aria-selected`](https://www.w3.org/TR/wai-aria-1.1/#aria-selected) attribute.

Indicate whether an element (in a single- or multi-selectable widget) is or is not selected.

Supported by `gridCell`, `option`, `row`, `tab`.

-}
selected : Bool -> Html.Attribute msg
selected =
    aria "selected" << toBoolString


{-| Creates an [`aria-sort="ascending"`](https://www.w3.org/TR/wai-aria-1.1/#aria-sort) attribute.

Table is sorted by this column's values in ascending order. Only one column in a table should be sorting the values in table.

Supported by `columnHeader` and `rowHeader`, but only where those roles are used on table or grid headers.

-}
sortAscending : Html.Attribute msg
sortAscending =
    aria "sort" "ascending"


{-| Creates an [`aria-sort="descending"`](https://www.w3.org/TR/wai-aria-1.1/#aria-sort) attribute.

Table is sorted by this column's values in descending order. Only one column in a table should be sorting the values in table.

Supported by `columnHeader` and `rowHeader`, but only where those roles are used on table or grid headers.

-}
sortDescending : Html.Attribute msg
sortDescending =
    aria "sort" "descending"


{-| Creates an [`aria-sort="other"`](https://www.w3.org/TR/wai-aria-1.1/#aria-sort) attribute.

Table is sorted by this column's values, but the algorithm for that sorting is custom (not ascending or descending). Only one column in a table should be sorting the values in table.

Supported by `columnHeader` and `rowHeader`, but only where those roles are used on table or grid headers.

-}
sortCustom : Html.Attribute msg
sortCustom =
    aria "sort" "other"


{-| Creates an [`aria-sort="none"`](https://www.w3.org/TR/wai-aria-1.1/#aria-sort) attribute.

Table is not sorted by this column's values.

Supported by `columnHeader` and `rowHeader`, but only where those roles are used on table or grid headers.

-}
sortNone : Html.Attribute msg
sortNone =
    aria "sort" "none"


{-| Creates an [`aria-valuemax`](https://www.w3.org/TR/wai-aria-1.1/#aria-valuemax) attribute.

Set the max allowed value for a range widget.

Supported by `progressBar`, `scrollbar`, `separator`, `slider`, and `spinButton`.

-}
valueMax : Float -> Html.Attribute msg
valueMax =
    aria "valuemax" << String.fromFloat


{-| Creates an [`aria-valuemin`](https://www.w3.org/TR/wai-aria-1.1/#aria-valuemin) attribute.

Set the min allowed value for a range widget.

Supported by `progressBar`, `scrollbar`, `separator`, `slider`, and `spinButton`.

-}
valueMin : Float -> Html.Attribute msg
valueMin =
    aria "valuemin" << String.fromFloat


{-| Creates an [`aria-valuenow`](https://www.w3.org/TR/wai-aria-1.1/#aria-valuenow) attribute.

Set the current value for a range widget. Don't use this property for indeterminate states.

Supported by `progressBar`, `scrollbar`, `separator`, `slider`, and `spinButton`.

-}
valueNow : Float -> Html.Attribute msg
valueNow =
    aria "valuenow" << String.fromFloat


{-| Creates an [`aria-valuetext`](https://www.w3.org/TR/wai-aria-1.1/#aria-valuetext) attribute.

This property takes precedence over `valueNow`, and should show a human-readable version of the current value. However, `valueNow` should always be used.

Supported by `progressBar`, `scrollbar`, `separator`, `slider`, and `spinButton`.

-}
valueText : String -> Html.Attribute msg
valueText =
    aria "valuetext"
