module Types exposing (..)


type alias Document =
    { id : Int, title : String, content : String }


type alias Model =
    { currentDocument : Document
    , documentList : List Document
    , counter : Int
    }


type Msg
    = SelectDocument Document
    | InputContent String
