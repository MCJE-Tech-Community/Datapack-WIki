#> entity_storage:copy
# データを取得する
# @public
# in:
#   id -> 取得先のid
#   type -> コピー先 entity/storage/block
#   targe -> コピー先 エンティティセレクタ/名前空間/ブロック座標
#   path -> コピー先 パス
#   from -> コピー元のパス

## コピー
    $data modify $(type) $(target) $(path) set from entity_storage: data[($id)].$(from)