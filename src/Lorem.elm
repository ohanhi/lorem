module Lorem
    exposing
        ( paragraphs
        , sentence
        , words
        , wrapInHtml
        )

{-| This package provides placeholder text for Elm apps.


# Plain text

@docs words, sentence, paragraphs


# Html

@docs wrapInHtml

-}

import Html exposing (Html)


{-| Gives a list of single words of lorem ipsum.

    >>> words 5

    [ "Lorem", "ipsum", "dolor", "sit", "amet," ]

-}
words : Int -> List String
words n =
    source
        |> String.join " "
        |> String.words
        |> appendUntilAtLeast n
        |> List.take n


{-| Gives a sentence (a long string) of words of lorem ipsum.

    >>> sentence 10

    "Lorem ipsum dolor sit amet, his viris voluptaria ut. Sea"

-}
sentence : Int -> String
sentence n =
    words n
        |> String.join " "


{-| Gives a list of paragraphs of lorem ipsum. They will repeat after a few.

    >>> paragraphs 3

    [ "Lorem ipsum dolor sit amet, his viris voluptaria ut. Sea ad iusto labitur constituam, viris persius nonumes pro at, detraxit expetendis eu sed. Ut perpetua consequat complectitur sea, eam reque graeci et. Dignissim euripidis intellegat sed ex."
    , "Ei legere accumsan sit. Id meis intellegat nec, modo habeo error cum eu. Illud ubique in ius. Meliore nostrum eos an, facilisis reformidans quo in. Ne eruditi assueverit vix, graece eleifend mandamus ut usu. Vis nulla splendide ad."
    , "Officiis tractatos at sed. Vim ad ipsum ceteros. Posse adolescens ei eos, meliore albucius facilisi id vel, et vel tractatos partiendo. Cu has insolens constituam, sint ubique sit te, vim an legimus elaboraret. Omnes possim mei et. Equidem contentiones vituperatoribus ut vel, duis veri platonem vel ei, an integre consequat democritum qui."
    ]

-}
paragraphs : Int -> List String
paragraphs n =
    appendUntilAtLeast n source
        |> List.take n


{-| Gives single words of lorem ipsum wrapped with the given Html node.

    >>> import Html exposing (p, text)

    >>> words 3
    ...     |> wrapInHtml (p [])

    [ p [] [ text "Lorem" ], p [] [ text "ipsum" ], p [] [ text "dolor" ] ]

-}
wrapInHtml : (List (Html msg) -> Html msg) -> List String -> List (Html msg)
wrapInHtml wrapper list =
    list
        |> List.map (\word -> wrapper [ Html.text word ])


appendUntilAtLeast : Int -> List String -> List String
appendUntilAtLeast n stringList =
    if List.length stringList >= n then
        stringList

    else
        appendUntilAtLeast n (source ++ stringList)


source : List String
source =
    [ "Lorem ipsum dolor sit amet, his viris voluptaria ut. Sea ad iusto labitur constituam, viris persius nonumes pro at, detraxit expetendis eu sed. Ut perpetua consequat complectitur sea, eam reque graeci et. Dignissim euripidis intellegat sed ex."
    , "Ei legere accumsan sit. Id meis intellegat nec, modo habeo error cum eu. Illud ubique in ius. Meliore nostrum eos an, facilisis reformidans quo in. Ne eruditi assueverit vix, graece eleifend mandamus ut usu. Vis nulla splendide ad."
    , "Officiis tractatos at sed. Vim ad ipsum ceteros. Posse adolescens ei eos, meliore albucius facilisi id vel, et vel tractatos partiendo. Cu has insolens constituam, sint ubique sit te, vim an legimus elaboraret. Omnes possim mei et. Equidem contentiones vituperatoribus ut vel, duis veri platonem vel ei, an integre consequat democritum qui."
    , "No iudico electram vituperatoribus ius, ex mea laudem iisque. Utroque tacimates qui ne. Est natum similique an. His te nostro disputando, vis debet aeterno ne, ex mea velit mazim."
    , "Suas augue no nam. Ex vel timeam offendit eleifend, ea epicurei insolens mel. Ex aperiam inimicus consequuntur per, reque errem veritus ex sed. Est cu omnis iusto scripserit, ullum timeam percipitur mei eu."
    ]
