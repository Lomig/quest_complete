let imports =
  [ "@hotwired/stimulus", "https://cdn.skypack.dev/@hotwired/stimulus@v3.2.2"
  ; "@hotwired/stimulus-loading", "/static/pinned/stimulus-loading@v0.0.1.js"
  ]
;;

module AssetConfig = struct
  let asset_map = RealityAssets.fingerprint ()
  let importmaps = RealityAssets.generate_importmap imports
  let js_entrypoint = "application"
end

include RealityAssets.Make (AssetConfig)
