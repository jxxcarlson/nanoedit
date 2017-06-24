-- Read more about this program in the official Elm guide:
-- https://guide.elm-lang.org/architecture/user_input/buttons.html


module Main exposing (..)

import Html exposing (program)
import Html.Attributes as HA
import Html.Events as HE
import Html.Keyed as Keyed
import Element.Events exposing (onClick, onInput)
import Element exposing (..)
import Element.Attributes exposing (..)
import Types exposing (..)
import Document exposing (..)


-- import Style exposing (..)

import StyleSheet exposing (..)


text1 =
    """
You will amaze your friends with the magick tricks to be explained in this short, inexpensive guide.
"""


text2 =
    """
Once upon a time, there lived a brilliant, somewhat surly, yet nevertheless kindly
computer scientist.  His lifelong goal ...
"""


doc1 =
    Document 1 "Basic Magick" text1


doc2 =
    Document 2 "Intro to A+" text2


docs =
    [ doc1, doc2 ]


main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


init : ( Model, Cmd Msg )
init =
    ( Model doc1 docs 0, Cmd.none )


view model =
    root StyleSheet.stylesheet <|
        column None
            [ paddingXY 40 40, spacing 10 ]
            [ documentListView model
            , (el Title [ width (px 400), height (px 40), padding 8 ] (text model.currentDocument.title))
            , row None
                [ spacing 10 ]
                --[ renderInput1 model ]
                [ renderInput2 model ]
            , (el Box [ width (px 400), height (px 100), padding 20 ] (text model.currentDocument.content))
            , (el Box [ width (px 100), height (px 40), padding 12 ]) (text (toString model.counter))
            ]


renderInput1 model =
    textArea InputBox [ width (px 400), height (px 100), padding 20, onInput InputContent ] (model.currentDocument.content)


renderInput2 model =
    html
        (Keyed.node
            "div"
            []
            [ ( toString model.counter
              , Html.textarea
                    [ HA.defaultValue model.currentDocument.content
                    , HE.onInput InputContent
                    , HA.style
                        [ ( "width", "380px" )
                        , ( "height", "80px" )
                        , ( "background-color", "yellow" )
                        , ( "padding", "10px" )
                        ]
                    ]
                    []
              )
            ]
        )


update msg model =
    case msg of
        SelectDocument document ->
            selectDocument model document

        InputContent content ->
            updateContent model content



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
