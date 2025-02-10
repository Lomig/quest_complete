open Pure_html

let render title =
  Templates.Layouts.Main.layout @@ Templates.Pages.Homepage.body title |> to_string
;;
