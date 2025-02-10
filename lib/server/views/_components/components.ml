open Containers
open Fun
open Pure_html
module Games = Games

module type COMPONENT = sig
  type data

  val node : data -> node
end

module MakeComponent (C : COMPONENT) = struct
  type data = C.data

  let node data = C.node data
  let html = to_string % node

  let node_with_tag ~(tag : node list -> node) data =
    let inner_node = C.node data in
    tag [ inner_node ]
  ;;

  let html_with_tag ~tag = to_string % node_with_tag ~tag

  let node_list ?tag data_list =
    data_list
    |> List.map (fun data ->
      match tag with
      | Some tag -> node_with_tag ~tag data
      | None -> C.node data)
  ;;

  let html_list ?tag data_list =
    String.concat "\n" @@ List.map to_string @@ node_list ?tag data_list
  ;;
end
