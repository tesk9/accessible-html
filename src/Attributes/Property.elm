module Attributes.Role
    exposing
        ( State(..)
        )

{-| Learn more about roles on the [w3 website](https://www.w3.org/TR/wai-aria/roles).

@docs State
-}


type State
    = Global GloballyAvailable


{-| These properties are available on ALL elements.
See [the documentation](https://www.w3.org/TR/wai-aria/states_and_properties#global_states_header) on global states and properties to learn more.
-}
type GloballyAvailable
    = Atomic
    | Controls
    | DescribedBy
    | DropEffect
    | FlowTo
    | HasPopUp
    | Label
    | LabelledBy
    | Live
    | Owns
    | Relevant


{-| These states are available on elements with a widget role thrown on.
Think `alert`, `option`, and `textBox`, not `tabList` nor `radioGroup`.

See [this list](https://www.w3.org/TR/wai-aria/roles#widget_roles) of widget roles if you're not sure.
-}
type WidgetAvailable
    = Autocomplete
    | Haspopup
    | Level
    | Multiline
    | Multiselectable
    | Orientation
    | Readonly
    | Required
    | Sort
    | Valuemax
    | Valuemin
    | Valuenow
    | Valuetext
