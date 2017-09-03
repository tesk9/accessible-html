# accessible-html
![](https://travis-ci.org/tesk9/accessible-html.svg?branch=master)

accessible-html makes writing accessible websites easier.

## Accessibility

This section of the library focuses on bridging the gap between the HTML spec and the WAI-ARIA (Web Accessibility Initiative -- Accessible Rich Internet Applications) spec. A developer needs to know a lot about each spec and ask multiple questions before even adding simple elements to the wep page. These view functions push the user to follow both specifications with less mental work involved.


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

##  Accessibility.Style

This section contains helpers for changing the look of your site without making it unusable.

For instance, if you prefer to use placeholders to convey what sort of values belong in an input, you can use the `invisible` helper to remove the label for screenviewers without removing it for screenreaders.

## Accessibility.Aria, Accessibility.Landmark, Accessibility.Role, Accessibility.Widget

These are more advanced helpers that allow you to do some pretty advanced cool stuff!
