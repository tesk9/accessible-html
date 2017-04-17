# elm-html-a11y
![](https://travis-ci.org/tesk9/elm-html-a11y.svg?branch=master)

elm-html-a11y makes writing accessible websites easier.

## Html.A11y

This section of the library focuses on bridging the gap between the HTML spec and the WAI-ARIA (Web Accessibility Initiative -- Accessible Rich Internet Applications) spec. A developer needs to know a lot about each spec and ask multiple questions before even adding simple elements to the wep page. These view functions push the user to follow both specifications with less mental work involved.


```
import Html exposing (div, Html)
import Html.A11y exposing (..)
import Html.Attributes exposing (src)

view : Html msg
view =
    div []
        [ img "Bear rubbing back on tree" [ src "bear.png" ]
        , decorativeImg [ src "smiling_family.jpg" ]
        ]

```

## Attributes

Attributes defines aria/role helpers.

It's not recommended to expose every function in this section--some, (`hidden`, `selected`, etc.) may shadow other functions inconveniently.

```
import Html exposing (Html, input)
import Html.Attributes exposing (src)
import Html.Attributes.A11y as A11yAttributes

view : Html msg
view =
    input [ A11yAttributes.search ] []
```

## Examples

Check out the [examples repo](https://github.com/tesk9/elm-html-a11y-examples) for more.