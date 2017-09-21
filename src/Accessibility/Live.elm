module Accessibility.Live
    exposing
        ( atomic
        , busy
        , liveAssertive
        , livePolite
        )

{-|


# Live Region Attributes

Learn more about how to use live regions [here](https://www.w3.org/TR/wai-aria-practices-1.1/#liveprops).
@docs atomic, busy, livePolite, liveAssertive

-}

import Accessibility.Utils exposing (..)
import Html


{-| Supported for all elements.

This property indicates that a region is live, and may change even when the
region doesn't have focus. When `True`, all the contents of the element will be
presented to the user.

-}
atomic : Bool -> Html.Attribute msg
atomic =
    aria "atomic" << toBoolString


{-| Supported for all elements.

When set to `True`, this is the aria equivalent of a loading spinner--indicates
that stuff is changing/is not ready for interaction/reading-off yet.

-}
busy : Bool -> Html.Attribute msg
busy =
    aria "busy" << toBoolString


{-| Supported by all elements.

When the region's contents change, assistive technologies will wait for a good
moment to interrupt and do so politely with the update.

-}
livePolite : Html.Attribute msg
livePolite =
    aria "live" "polite"


{-| Supported by all elements.

Updates to the region will cause the assistive technologies to immediately
interrupt the user with the big news.

-}
liveAssertive : Html.Attribute msg
liveAssertive =
    aria "live" "assertive"
