open Pure_html
open HTML
module Assets = Client.Assets

let body_classes =
  "grid h-screen overflow-hidden grid-cols-[auto_minmax(0,1fr)] \
   grid-rows-[minmax(0,1fr)_auto] bg-gray-900 text-white"
;;

let layout ?(page_title = "QuestComplete") data =
  html
    [ lang "fr" ]
    [ head
        []
        [ meta [ charset "UTF-8" ]
        ; meta [ name "viewport"; content "width=device-width, initial-scale=1.0" ]
        ; title [] "%s" page_title
        ; link [ rel "stylesheet"; href "%s" (Assets.path "application.css") ]
        ; Assets.PureHTML.importmap_tag
        ; Assets.PureHTML.js_entrypoint_tag
        ]
    ; body
        [ class_ "%s" body_classes ]
        [ header [ class_ "min-h-0 min-w-0" ] []
        ; main [ class_ "min-h-0 min-w-0 overflow-y-auto" ] data
        ; footer [ class_ "min-h-0 min-w-0" ] []
        ]
    ]
;;
