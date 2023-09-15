#> entity_storage:zz/define
# スコアボード等の定義のみ
# @within
#   function entity_storage:zz/init

## Scoreboard objective
    #> Local
    # @within entity_storage:**
        scoreboard objectives add estS.id dummy "ID"
        
## Score Holder
    #> Local
    # @within entity_storage:**
        #define score_holder estH. 汎用
        #define score_holder estH.new 最新値
            execute unless score estH.new estS.id matches 0.. run scoreboard players set estH.new estS.id -1
        #define score_holder estH.call.now call 現在値
        #define score_holder estH.copy.now copy 現在値
        #define score_holder estH.gc ガベージコレクタ用

## Tags
    #> Local
    # @within display_ui:**
        #define tag estT. データ保存済みかどうか
        #define tag estT.temp 一時的

## Storage
    #> Api
    # @public
        #define storage entity_storage:
    #> Core
    # @within entity_storage:**
        #define storage entity_storage:core

## Entity
    #> Local
    # @within entity_storage:**
        #define entity 4fe002bb-0-3-0-100000001 TextDisplay1