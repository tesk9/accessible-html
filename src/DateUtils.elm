module DateUtils exposing (..)

import Time exposing (Month(..))


toMonthNumber : Month -> Int
toMonthNumber month_ =
    case month_ of
        Jan ->
            1

        Feb ->
            2

        Mar ->
            3

        Apr ->
            4

        May ->
            5

        Jun ->
            6

        Jul ->
            7

        Aug ->
            8

        Sep ->
            9

        Oct ->
            10

        Nov ->
            11

        Dec ->
            12


padNumberToDoubleDigit : Int -> String
padNumberToDoubleDigit =
    String.fromInt >> String.padLeft 2 '0'
