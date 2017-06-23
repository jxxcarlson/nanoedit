module StyleSheet exposing (..)

import Color
import Element exposing (..)
import Element.Attributes exposing (..)
import Html
import Style exposing (..)
import Style.Border as Border
import Style.Color as Color
import Style.Font as Font
import Style.Transition as Transition


{-| A synonym for creating tuples. This will be included in the standard library soon.
1 => 2 == (1, 2)
-}
(=>) =
    (,)


{-| The type we use for identifiers for our styles.
-}
type Styles
    = None
    | Box
    | InputBox
    | Title
    | TOC
    | TOCItem
    | TOCItemSelected


stylesheet : StyleSheet Styles variation
stylesheet =
    Style.stylesheet
        [ style None
            [ Font.typeface [ "helvetica", "arial", "sans-serif" ]
            , Color.background Color.white
            ]
        , style Box [ Color.background Color.lightGray ]
        , style InputBox [ Color.background Color.lightYellow ]
        , style Title [ Font.size 20, Color.background Color.lightGray ]
        , style TOC
            [ Color.background Color.charcoal ]
        , style TOCItem
            [ Color.text Color.white ]
        , style TOCItemSelected
            [ Color.text Color.lightYellow ]
        ]
