# デバッグ予定のメモ

エンティティ
- セレクタの引数の組み合わせでの違い セレクタの重さや法則を調べる
  - tag,type,distance,dxdydz,limit,team,scores,name
  - tag,tag+type,type+tag
  - tag+distance,distance+tag
  - tag+dxdydz,dxdydz+tag
  - tag+limit,limit+tag
- UUIDでのアクセス
  - 一番軽いセレクタ,UUID
- execute onでのグループ化
  - スコアでのグループ化,on passengers
  - スコアでの紐づけ,on origin
- スコアのチェック
  - if score @sとif entity @s[scores={A=a}]
  - スコア複数のとき predicateも
  - 失敗,成功
- Tagのつけ消し
  - /tagの付与,NBTでのタグの書き換え,スコアの書き換え
  - /tagの付与+削除,スコアの1/0
- Name付エンティティをキルしたときのログ
  - Name無しのkill,Name付きのkill,Name無しのHealthキル,Name付きのHealthキル
- テレポートの負荷
  - tp,teleport,Pos書き換え
- エンティティのNBT書き換え　(Posとか参照するときに一旦storageに移すやつも)
  - ゾンビ,村人,クリーパー,アーマースタンド,AEC,額縁,Display,marker,storage
  - Rotationの書き換え,storage経由での書き換え
  - Posの書き換え,storage経由での書き換え
  - 5個くらいの書き換え,storage経由
- markerをはじめとしたエンティティの召喚/削除
  - ゾンビ,村人,クリーパー,アーマースタンド,AEC,額縁,Display,marker
- セレクタで直接検索,ifで対象を絞って実行
  - コマンドの失敗とifの失敗どっちが軽いか

スコアボード/ストレージ
- スコアボードの演算
  - +, -, *, /, %, <, >, <>
  - add, remove, set
- store resultとscoreboard operation
  - 2つ以上のスコアに同じ数値を入れる時
- ダミープレイヤー増加によるscoreboard各種の負荷差
  - ダミープレイヤー 0,1,10,100,1000,10000 でadd, remove, set, +, -, *, /, %, <, >, <>
- storageを使った数値管理
  - storage 0.9999, score ++1
- storageの書き換え、操作 ([0]と[-1]、prependとappend)
  - set. prepend, append, merge, from,

分岐
- execute if の大量分岐
  - if 1,2,16,128,1024,8192
  - 成功 0,1,10,100 /128
  - functionでn分木にしたとき
- returnコマンド ifの分岐とどっちが軽い？
  - returnで足きり,ifで除外 1,10,100
- store ~ run functionの重さ
  - function内でscoreboard set 1~ ,1,10,100,1000, store無し
- predicateを使った条件取り
  - 何がいいか？

アルゴリズム
- 距離取得 二分探査とexecute幾何学
- 二進数damageとn分木damage
- 視線上ブロック/エンティティ探査
- 1ブロック内の当たり判定探査


デバック不可能？
- on passengersの存在
- セレクタの違い
  - @r と @a[sort=random]
  - @p と @a[sort=nearest,limit=1]

延期
- transformationを使った計算
  - スコアでの計算とtransformationを使った計算の負荷比較
  - 桁数はどうしても制限あり


やり直し
102
106
