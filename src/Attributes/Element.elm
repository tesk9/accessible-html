module Attributes.Element
    exposing
        ( alert
        , alertdialog
        , article
        , button
        , checkbox
        , columnheader
        , combobox
        , definition
        , dialog
        , directory
        , document
        , grid
        , gridcell
        , img
        , link
        , list
        , listbox
        , listitem
        , log
        , marquee
        , math
        , menu
        , menubar
        , menuitem
        , menuitemcheckbox
        , menuitemradio
        , note
        , option
        , progressbar
        , radio
        , row
        , rowgroup
        , rowheader
        , scrollbar
        , separator
        , slider
        , spinbutton
        , status
        , tab
        , tablist
        , tabpanel
        , textbox
        , timer
        , toolbar
        , tooltip
        , tree
        , treegrid
        , treeitem
        )

import Attributes.Role exposing (..)
import Html


alert : Html.Attribute msg
alert =
    role Alert


alertdialog : Html.Attribute msg
alertdialog =
    role Alertdialog


article : Html.Attribute msg
article =
    role Article


button : Html.Attribute msg
button =
    role Button


checkbox : Html.Attribute msg
checkbox =
    role Checkbox


columnheader : Html.Attribute msg
columnheader =
    role Columnheader


combobox : Html.Attribute msg
combobox =
    role Combobox


definition : Html.Attribute msg
definition =
    role Definition


dialog : Html.Attribute msg
dialog =
    role Dialog


directory : Html.Attribute msg
directory =
    role Directory


document : Html.Attribute msg
document =
    role Document


grid : Html.Attribute msg
grid =
    role Grid


gridcell : Html.Attribute msg
gridcell =
    role Gridcell


img : Html.Attribute msg
img =
    role Img


link : Html.Attribute msg
link =
    role Link


list : Html.Attribute msg
list =
    role List


listbox : Html.Attribute msg
listbox =
    role Listbox


listitem : Html.Attribute msg
listitem =
    role Listitem


log : Html.Attribute msg
log =
    role Log


marquee : Html.Attribute msg
marquee =
    role Marquee


math : Html.Attribute msg
math =
    role Math


menu : Html.Attribute msg
menu =
    role Menu


menubar : Html.Attribute msg
menubar =
    role Menubar


menuitem : Html.Attribute msg
menuitem =
    role Menuitem


menuitemcheckbox : Html.Attribute msg
menuitemcheckbox =
    role Menuitemcheckbox


menuitemradio : Html.Attribute msg
menuitemradio =
    role Menuitemradio


note : Html.Attribute msg
note =
    role Note


option : Html.Attribute msg
option =
    role Option


progressbar : Html.Attribute msg
progressbar =
    role Progressbar


radio : Html.Attribute msg
radio =
    role Radio


row : Html.Attribute msg
row =
    role Row


rowgroup : Html.Attribute msg
rowgroup =
    role Rowgroup


rowheader : Html.Attribute msg
rowheader =
    role Rowheader


scrollbar : Html.Attribute msg
scrollbar =
    role Scrollbar


separator : Html.Attribute msg
separator =
    role Separator


slider : Html.Attribute msg
slider =
    role Slider


spinbutton : Html.Attribute msg
spinbutton =
    role Spinbutton


status : Html.Attribute msg
status =
    role Status


tab : Html.Attribute msg
tab =
    role Tab


tablist : Html.Attribute msg
tablist =
    role Tablist


tabpanel : Html.Attribute msg
tabpanel =
    role Tabpanel


textbox : Html.Attribute msg
textbox =
    role Textbox


timer : Html.Attribute msg
timer =
    role Timer


toolbar : Html.Attribute msg
toolbar =
    role Toolbar


tooltip : Html.Attribute msg
tooltip =
    role Tooltip


tree : Html.Attribute msg
tree =
    role Tree


treegrid : Html.Attribute msg
treegrid =
    role Treegrid


treeitem : Html.Attribute msg
treeitem =
    role Treeitem
