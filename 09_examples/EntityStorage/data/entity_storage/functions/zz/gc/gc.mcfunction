#> entity_storage:zz/gc/gc
# スコアがない場合はガベージコレクトを実行
# @within
#   function entity_storage:zz/gc/schedule

## スケジュールの実行
    $schedule function entity_storage:zz/gc/schedule $(gc_duration)t

## スコアがないことを確認したらガベージコレクトを実行
    $execute if score $(name) estS.id matches 0.. run return 0
    function entity_storage:unregist with storage entity_storage:core macro