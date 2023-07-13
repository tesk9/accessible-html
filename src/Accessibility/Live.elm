module Accessibility.Live exposing
    ( atomic, busy, polite, assertive
    , off
    , livePolite, liveAssertive
    , relevantAdditions, relevantAdditionsText, relevantAll, relevantRemovals, relevantText
    )

{-| If a screenreader reads some content, and then that content changes, the user may not be aware that anything happened. This is where live regions come in. Live regions (and associated properties) can tell the screenreader what relevant changing information to present to the user, and how urgently the information is needed.


# Live Region Attributes

Learn more about how to use live regions [here](https://www.w3.org/TR/wai-aria-practices-1.1/#liveprops).

@docs atomic, busy, polite, assertive
@docs off
@docs livePolite, liveAssertive


# Properties on Live Attributes

@docs relevantAdditions, relevantAdditionsText, relevantAll, relevantRemovals, relevantText

-}

import Accessibility.Utils exposing (..)
import Html as Html


{-| Supported for all elements.

This property indicates that a region is live, and may change even when the region doesn't have focus. When `True`, all the contents of the element will be presented to the user.

-}
atomic : Bool -> Html.Attribute msg
atomic =
    aria "atomic" << toBoolString


{-| Supported for all elements.

When set to `True`, this is the aria equivalent of a loading spinner--indicates that stuff is changing/is not ready for interaction/reading-off yet.

-}
busy : Bool -> Html.Attribute msg
busy =
    aria "busy" << toBoolString


{-| Supported by all elements.

When the region's contents change, assistive technologies will wait for a good moment to interrupt and do so politely with the update.

-}
polite : Html.Attribute msg
polite =
    aria "live" "polite"


{-| Use Live.off to suppress updates that otherwise would be announced to the user due to the element's role.
-}
off : Html.Attribute msg
off =
    aria "live" "off"


{-| Identical to `polite`. Included for backwards-compatibility. A future version of the library will likely remove this helper.
-}
livePolite : Html.Attribute msg
livePolite =
    polite


{-| Supported by all elements.

Updates to the region will cause the assistive technologies to immediately interrupt the user with the big news.

-}
assertive : Html.Attribute msg
assertive =
    aria "live" "assertive"


{-| Identical to `assertive`. Included for backwards-compatibility. A future version of the library will likely remove this helper.
-}
liveAssertive : Html.Attribute msg
liveAssertive =
    assertive


{-| Supported by live regions.

Keep track of additions to the live region.

-}
relevantAdditions : Html.Attribute msg
relevantAdditions =
    aria "relevant" "additions"


{-| Supported by live regions.

Keep track of node additions to the live region and text additions.

-}
relevantAdditionsText : Html.Attribute msg
relevantAdditionsText =
    aria "relevant" "additions text"


{-| Supported by live regions.

Keep track of everything to occur in the live region. Use sparingly!

-}
relevantAll : Html.Attribute msg
relevantAll =
    aria "relevant" "all"


{-| Supported by live regions.

Keep track of text or node removals. Use sparingly!

-}
relevantRemovals : Html.Attribute msg
relevantRemovals =
    aria "relevant" "removals"


{-| Supported by live regions.

Keep track of text additions to the live region.

-}
relevantText : Html.Attribute msg
relevantText =
    aria "relevant" "text"
