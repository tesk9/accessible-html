module Attributes.State
    exposing
        ( State(..)
        )

{-| Learn more about aria states on the [w3 website](https://www.w3.org/TR/wai-aria/states_and_properties).

@docs state
-}


type State
    = Global GloballyAvailable
    | Widget WidgetAvailable


{-| These states are available on ALL elements.
See [the documentation](https://www.w3.org/TR/wai-aria/states_and_properties#global_states_header) on global states and properties to learn more.
-}
type GloballyAvailable
    = Busy
    | Disabled
    | Grabbed
    | Hidden
    | Invalid


{-| These states are available on elements with a widget role thrown on.
Think `alert`, `option`, and `textBox`, not `tabList` nor `radioGroup`.

See [this list](https://www.w3.org/TR/wai-aria/roles#widget_roles) of widget roles if you're not sure.
-}
type WidgetAvailable
    = Checked
    | Expanded
    | Pressed
    | Selected
