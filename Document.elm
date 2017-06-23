module Document exposing (documentListView, selectDocument, updateContent)

import Element exposing (..)
import Element.Attributes exposing (..)
import Element.Events exposing (onClick)
import Types exposing (..)
import StyleSheet exposing (..)


selectDocument : Model -> Document -> ( Model, Cmd Msg )
selectDocument model document =
    ( { model
        | currentDocument = document
      }
    , Cmd.none
    )


updateContent : Model -> String -> ( Model, Cmd Msg )
updateContent model content =
    let
        old_document =
            model.currentDocument

        new_document =
            { old_document | content = content }

        oldDocumentList =
            model.documentList

        newDocumentList =
            replaceIf (hasId new_document.id) new_document oldDocumentList
    in
        ( { model
            | currentDocument = new_document
            , documentList = newDocumentList
          }
        , Cmd.none
        )


documentListView : Model -> Element Styles variation Msg
documentListView model =
    column TOC
        [ padding 20, spacing 10, width (px 300), height (px 200) ]
        (List.map (viewTitle model.currentDocument) model.documentList)


viewTitle : Document -> Document -> Element Styles variation Msg
viewTitle selectedDocument document =
    el (tocStyle selectedDocument document)
        [ onClick (SelectDocument document)
        ]
        (text document.title)


tocStyle selectedDocument document =
    if selectedDocument == document then
        TOCItemSelected
    else
        TOCItem


replaceIf : (a -> Bool) -> a -> List a -> List a
replaceIf predicate replacement list =
    List.map
        (\item ->
            if predicate item then
                replacement
            else
                item
        )
        list


hasId : Int -> Document -> Bool
hasId id document =
    document.id == id
