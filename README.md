# elm-html-a11y

![](https://travis-ci.org/tesk9/elm-html-a11y.svg?branch=master)

elm-html-a11y is a library that makes writing accessible websites easier by enforcing required fields (e.g., inputs should have labels, so the input helpers from this package require labels).


```
import Html.A11y exposing (leftLabeledInput, radioInput)

view : Html msg
view =
    leftLabeledInput
        { label = text "Radio Label"
        , typeAndValue = radioInput "group-name" "Starting value" False
        , attributes = []
        }
```

To see examples, please check out the [examples repo](https://github.com/tesk9/elm-html-a11y-examples).
