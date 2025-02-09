open Containers
module Games = Games

module type COMPONENT = sig
  type data

  val render : data -> string
end

module MakeComponent (C : COMPONENT) = struct
  type data = C.data

  let render data = C.render data

  let render_with_tag ~tag data =
    let inner_html = C.render data in
    Printf.sprintf "<%s>%s</%s>" tag inner_html tag
  ;;

  let render_list ~tag data_list =
    data_list
    |> List.map (fun data ->
      match tag with
      | Some tag -> render_with_tag ~tag data
      | None -> render data)
    |> String.concat "\n"
  ;;
end
