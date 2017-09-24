# accessible-html
![](https://travis-ci.org/tesk9/accessible-html.svg?branch=master)

accessible-html makes writing accessible websites easier.

## Elements

### Accessibility

This section of the library focuses on bridging the gap between the HTML spec and the WAI-ARIA (Web Accessibility Initiative -- Accessible Rich Internet Applications) spec. A developer needs to know a lot about each spec and ask multiple questions before even adding simple elements to the wep page. These view functions push the user to write less typo-prone and semantic code.

However, the [principles of accessibility](https://www.w3.org/TR/UNDERSTANDING-WCAG20/intro.html) go beyond correctness and into the realm of good design. For example, there are two `img` tag helpers that ask you as the developer to decide whether the image you want to display for screenviewers is necessary or distracting for screenreaders. Essentailly, does it convey meaning and value, or is it decorative?

```
import Accessibility as Html exposing (Html)
import Html.Attributes as Attributes

view : Html.Html msg
view =
    Html.div []
        [ Html.img "Bear rubbing back on tree" [ Attributes.src "bear.png" ]
        , Html.decorativeImg [ Attributes.src "smiling_family.jpg" ]
        ]

```

## Attributes

These are more advanced helpers that allow you to do some pretty advanced cool stuff! Many of these helpers are not necessary when writing semantically correct HTML5 code, but you will still need some of them on occassion. The import expressions below point out some of the helpers that you are more likely to need:


    import Accessibility.Aria exposing (controls, labelledBy, describedBy)
    import Accessibility.Landmark exposing (search)
    import Accessibility.Live exposing (atomic, busy, liveAssertive, livePolite)
    import Accessibility.Role exposing (presentation)


### Accessibility.Aria

This section includes roles for working with sets, grids, controls, and more. You're most likely to want the helpers for connecting elements to each other, by specifying that one `controls` another, or that a figure has `details` somewhere else.

### Accessibility.Key

When making widgets, you will need to add keyboard shortcuts to make keyboard navigation possible.

For instance, `space` and on `enter` should activate a button,`space` should change a checkbox's state, `escape` should close a modal, and `up`, `down`, `left`, and `right` should navigate focus in a menu.

### Accessibility.Landmark

You're likely to only want `search` from this section unless you're not using HTML5 elements.

### Accessibility.Live

Describe which sections of the page are changing over time, and how aggressively assisstive technologies should notify the user about those changes.

### Accessibility.Role

Much of the time, sticking with HTML5 is better than using these properties. However, the WAI-ARIA spec moves at a different pace than the HTML spec--and user agent technologies are another factor entirely! You are likely to find yourself using a combination of these `Accessibility.Role` attributes.

### Accessibility.Style

This section contains helpers for changing the look of your site without making it unusable.

For instance, if you prefer to use placeholders to convey what sort of values belong in an input, you can use the `invisible` helper to remove the label for screenviewers without removing it for screenreaders.

### Accessibility.Widget

Look here for managing widget state: is a given widget `expanded` or `disabled` or `pressed`?

If you're rolling your own widget, you need to take a peek at this section.
