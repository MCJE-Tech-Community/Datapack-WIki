#> entity_storage:merge
# データを変更する
# @public
# in:
#   id -> 取得先のid
#   to -> マージ先のデータのパス
#   data -> マージするデータ コンパウンド限定

## コピー
    $data modify storage entity_storage: data[($id)].$(to) merge value ($(data))