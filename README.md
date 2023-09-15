<!-- omit in toc -->
# Minecraft JE Technical Note
　Minecraftのコマンド、ルートテーブル、などデータパックについてのネタを集めたwikiです。
- 一つのデータパックとして配布するには小さすぎる物やモジュール化が面倒な物だが、ゼロから毎回作るのは微妙にめんどくさいというものを、メモ代わりとして置いておくためのリポジトリです。仕組みを理解してもらえたら、コピペや改造でお好きに利用してください。メモ程度なので説明不足な点や煩雑な書き方になっている部分もあるかもしれませんが悪しからず。また、それぞれ初期設定などのコマンドで重複している点もあるので、多用する場合は適当に変更することをオススメします。  
- 作成は基本的に最新バージョン/最新スナップショットでやっているのでほとんど最新用になります。アップデートに関しては必要があれば随時行うと思いますが、過去verへの対応は各自で行うようお願いします。よほど低いバージョンでなければ応用できるはずです。  
- ある程度データパックの構造や使い方を把握している方向けになるので、どのファイルをどこに置けばいいか等は説明していません。ご了承ください。暇があれば解説するかもしれません。  
- バグや改善案などがあれば好きなだけissueを立ててもらって構いません(あと英単語とか)。時間があれば対処します。

<!-- omit in toc -->
# 解説Wiki
### [技術解説wiki](https://github.com/MCJE-Tech-Shares/Minecraft-JE-Technical-Note/wiki)
github wikiに、ここで掲載している物も含めいろいろと技術的な解説を載せています。  

<!-- omit in toc -->
# 配布物
- [検知](#検知)
  - [殴った/クリックしたエンティティ探査(進捗+execute on)](#殴ったクリックしたエンティティ探査進捗execute-on)
  - [殴った/クリックしたエンティティ探査(進捗+二分探査)](#殴ったクリックしたエンティティ探査進捗二分探査)
  - [角をすり抜けない視線先ブロック探査](#角をすり抜けない視線先ブロック探査)
  - [かなり正確な視線先ブロック探査](#かなり正確な視線先ブロック探査)
  - [ヒットボックス準拠の視線先エンティティ探査(functionループ)](#ヒットボックス準拠の視線先エンティティ探査functionループ)
  - [ブロック探査とエンティティ探査を組み合わせた視線先探査(functionループ)](#ブロック探査とエンティティ探査を組み合わせた視線先探査functionループ)
  - [text\_displayと視点探査を活用したディスプレイ](#text_displayと視点探査を活用したディスプレイ)
- [計算](#計算)
  - [花/竹の位置計算](#花竹の位置計算)
- [装飾品](#装飾品)
  - [block\_displayで作成したイス1](#block_displayで作成したイス1)
  - [block\_displayで作成した窓枠1](#block_displayで作成した窓枠1)
- [制作例](#制作例)
  - [マクロを使ったエンティティ用個別ストレージ](#マクロを使ったエンティティ用個別ストレージ)

# 検知
　検知や探査といったゲーム制作などで便利そうなコマンドのメモです。  
 
## 殴った/クリックしたエンティティ探査(進捗+execute on)  

![entity_association01](https://user-images.githubusercontent.com/60039093/221373412-b2dc3cf9-f5dd-4d84-8101-bcc03f14704a.gif)  
▲動作の様子  

### 説明
プレイヤーがエンティティを殴った時の進捗(player_hurt_entity)や右クリックしたときの進捗(player_interacted_with_entity)によって実行されるファンクションから対象のエンティティを探すコマンドの例。execute on attacker/on targetの利用により簡潔にできるようになった。  
**モブ攻撃/interaction左クリック/interaction右クリック**の3つで可能。  
- モブ以外の攻撃先/左クリック先検知と、interaction以外(村人や額縁など)の右クリック先の探査はできない。  
- 薙ぎ払い攻撃をしたときに、どの敵が直接攻撃された敵で、どの敵が薙ぎ払いに巻き込まれた敵かを区別することなどはできない。  
- execute onの判定は数秒残るようなので、一度プレイヤーに殴られたモブが、プレイヤーが別のモブを殴るときと同時に別の方法でダメージを受けたとき(落下など)は誤作動を起こす可能性がある。あんまり起きないとは思うけど。  

### 使い方
`entity_association01`を`data/`直下などに入れ初期設定:`init.mcfunction`を実行したら、あとは適当にモブを殴ったりinteractionを右/左クリックしたりするとエンティティの位置でパーティクルが出る。  
`attack_mob.mcfunction`,`attack_interaction.mcfunction`,`interact_interaction.mcfunction`の中をいじれば実行コマンドを変えられる。  

(2023/02/23):追加  

[▲戻る](#配布物)  

## 殴った/クリックしたエンティティ探査(進捗+二分探査)

![entity_association02](https://user-images.githubusercontent.com/60039093/221374453-572432cb-5b36-41fe-a900-1c52278f1967.gif)  
▲動作の様子  

### 説明
プレイヤーがエンティティを殴った時の進捗(player_hurt_entity)や右クリックしたときの進捗(player_interacted_with_entity)によって実行されるファンクションから対象のエンティティを探すコマンドの例。idを二分探査してエンティティを見つける。前項のやり方では検知できないエンティティなどの右クリ検知がかなり正確に可能。  
**モブとinteractionへの攻撃/アクション可能エンティティ(村人,額縁,アマスタ,interaction等)への左クリック**の2つで可能。  
- 各進捗が反応しないエンティティは探査できない。  
- 薙ぎ払い攻撃をしたときに直接攻撃された敵→巻き込まれた敵の順で実行される  
- 仕組み上誤検知は起こらない  
- コマンド実行数がやや多め  
- id付与をあらかじめしなくてはいけない  

Chen氏の改良案をもとにrequirments周りを改良してます。~~ありがとにゃん。~~ ありがとうございます！

### 原理
事前に二進数化したidが付与されたエンティティを、ビット毎に用意されたcriteriaで解除状況と比較して探査を行う。  

### 使い方 
`entity_association02`フォルダを`data/`直下などに入れ、初期設定:`init.mcfunction`を実行しid付与:`id.mcfunction`を対象にしたいエンティティを実行者にして実行する。  
`attack.mcfunction`,`interaction.mcfunction`の中をいじれば実行コマンドを変えられる。階層やフォルダ名を変えると変更点が多くなるので注意。  

▼id付与ファンクションの実行例  
 `execute as @e[type=!player,distance=..10] run function entity_association02:id`  

(2023/02/23):追加  

[▲戻る](#配布物)  

## 角をすり抜けない視線先ブロック探査

![block_exploration](https://user-images.githubusercontent.com/60039093/221375086-7ee6e56d-e221-496c-97b4-f775cfbd23a6.gif)  
▲動作の様子  

### 説明
角をすり抜けない視線先ブロック探査。直線状に探査点を増やすやり方だとどうしてもすり抜けてしまった角をすり抜けないように探査できる。functionループで探査することは変わらないが、視線上だけではない計8方向に手を伸ばしてチェックすることで角抜けがなくなる。また粗い探査→ブロックがありそうだったら細かい探査というやり方ができるので、コマンド数を削減できる。しかしブロックの判定が0.01m程大きくなるので、どちらを使うかは用途次第。  

### 使い方 
`block_exploration01`フォルダを`data/`直下などに入れ、初期設定:`init.mcfunction`を実行したら常時実行:`root.mcfunction`を視線探査の起点にしたいエンティティを実行者として常時実行する。
`point.mcfunction`の中身が探査終了点で実行されるので、好きなように書き換えて使用可能。  

▼常時実行ファンクションの実行例  
`execute as @p at @s run function block_exploration01:root` 

(2023/02/26):追加  
(2023/03/05):番号を変更  

[▲戻る](#配布物)  

## かなり正確な視線先ブロック探査

 ![block_exploration02](https://user-images.githubusercontent.com/60039093/222947963-6a2089ba-d656-4bb0-b943-ed5d6a5bbfcf.gif)  
▲動作の様子(青いパーティクルがプレイヤーが見ている面)  

### 説明
かなり正確になった視線先ブロック探査。基本的なループの原理は前項と同じだが、3エンティティを追加し、functionループ中の探査点角度に依存した探査点の増加と、視線がどのブロック面内を見ているかどうかの判定をexecute幾何学などを利用して行っている。これらによってかなり正確になり、前項にあった当たり判定の増加のような挙動はほぼなくなる。ただ、エンティティ3体を使用しており前項よりは負荷がわずかに高いので、なにを使うかは用途次第。

### 使い方 
`block_exploration02`フォルダを`data/`直下などに入れ、初期設定:`init.mcfunction`を実行したら常時実行:`root.mcfunction`を視線探査の起点にしたいエンティティを実行者として常時実行する。
`point.mcfunction`の中身が探査終了点で実行されるので、好きなように書き換えて使用可能。  

▼常時実行ファンクションの実行例  
`execute as @p at @s run function block_exploration02:root` 

(2023/03/05):追加  

[▲戻る](#配布物)  

## ヒットボックス準拠の視線先エンティティ探査(functionループ)  

![entity_exploration](https://user-images.githubusercontent.com/60039093/221410523-58b62fe0-f262-49cb-a4d7-7e7d4920d991.gif)  
▲動作の様子  

### 説明
誤差の少ない視線先エンティティ探査。直線状に探査点を増やすやり方だとすり抜けてしまったり、execute幾何学を使うやり方だと形状によってうまく探査できないが、四角形の判定を用いてfunctionループ探査をすることで誤差を少なくして探査できる。こちらも判定は0.01m程大きくなるので、どちらを使うかは用途次第。functionループなので、前項のブロック探査と組み合わせることが可能(後述)。  

### 使い方 
`entity_exploration`フォルダを`data/`直下などに入れ、初期設定:`init.mcfunction`を実行したら常時実行:`root.mcfunction`を視線探査の起点にしたいエンティティを実行者として常時実行する。
`targets.mcfunction`の中身が探査終了点で実行されるので、好きなように書き換えて使用可能。対象になるエンティティには`targets`というタグが付与(複数になる可能あり)され、そのfunction内で参照可能。  

▼常時実行ファンクションの実行例  
`execute as @p at @s run function entity_exploration:root` 

(2023/02/26):追加  
(2023/03/05):番号を変更  

[▲戻る](#配布物)  

## ブロック探査とエンティティ探査を組み合わせた視線先探査(functionループ)

![exploration](https://user-images.githubusercontent.com/60039093/221410895-47fb3ff7-5cb2-4786-95f5-4eb6f4241e79.gif)  
▲動作の様子  

### 説明
前項2つのブロック探査とエンティティ探査を組み合わせたコマンド。これによって、ブロックが手前にあったらエンティティが探査されないような、より直感的なシステムが作成可能。  

### 使い方 
`exploration`フォルダを`data/`直下などに入れ、初期設定:`init.mcfunction`を実行したら常時実行:`root.mcfunction`を視線探査の起点にしたいエンティティを実行者として常時実行する。
`targets.mcfunction`の中身がエンティティ探査終了点で実行され、`point.mcfunction`の中身がブロック探査終了点で実行されるので、好きなように書き換えて使用可能。対象になるエンティティには`targets`というタグが付与(複数になる可能あり)され、そのfunction内で参照可能。  

▼常時実行ファンクションの実行例  
`execute as @p at @s run function exploration:root` 

(2023/02/26):追加  
(2023/03/05):番号を変更  

[▲戻る](#配布物)  

## text_displayと視点探査を活用したディスプレイ

![display01](https://user-images.githubusercontent.com/60039093/220151026-478e45b6-e8ac-4aee-a6a3-56cf1e99b4d0.gif)  
▲動作の様子(billboard:fixed)  

### 説明
text_displayで作ったディスプレイと、それを利用したディスプレイシステムの一例。  
`billboard:fix`と`billboard:center`の二つのモードで利用可能。
とりあえず視点算出とホバーイベントの実装のみ。  
クリックイベントや演出の強化は実装予定。  

### 原理
二分探査でディスプレイ面とプレイヤーの視線との交点を探査し、ベクトルと回転行列の概念を用いて面上における視点の座標を計算する。軽量化を心がけてはいるけどやや重いかも。  
ボタンの位置と座標を用いて各種イベントを実行できる。　

### 使い方 
`display/`内の3つのファンクションをデータパック内の好きな位置に置き、以下の手順で実行する。  
1. 初期設定 : `init.mcfunction`を実行してスコア等を設定。  
2. ディスプレイ設置 : `set_fixed.mcfunction`か`set_center.mcfunction`を好きな位置と向きで実行するとその位置と向きで設置される。  
3. 常時実行 : `tick.mcfunction`を、ディスプレイの基準エンティティ(tag=display_00)を実行者として常時実行させる。  

▼設置用ファンクションの実行例  
1. `function ****:****/display/init`  
2. `execute positioned ~ ~1 ~ rotated ~45 ~10 run function ****:****/display/set`  
3. `execute as @e[tag=display_00] if entity @p[distance=..10] run function ****:****/display/tick`  

(2023/02/21):追加  

[▲戻る](#配布物)  


# 計算
　計算関連っぽいコマンドなどをまとめています。  
 
## 花/竹の位置計算

![flower_position](https://user-images.githubusercontent.com/60039093/228248411-1e3e359c-fa30-4cb4-83a1-6a01d66767b8.gif)  
▲動作の様子  

### 説明
花や竹などは1ブロック内のどの位置に設置されるかというのがx座標とz座標をもとにした疑似乱数によって決まっています。ソースコードを覗くとその計算式を見る事ができるので(intsucさんが見つけ出してくれました。感謝。[twitter](https://twitter.com/intsuc/status/1632959490386706437?s=20))、それをもとにマイクラ上で計算するfunction。複雑な計算ではないが排他的論理和の計算だけちょっと面倒かもしれない。

### 使い方 
`flower_position`フォルダを`data/`直下などに入れ、初期設定:`init.mcfunction`を実行したら常時実行:`get.mcfunction`を調べたい座標で実行する。応用時は適時中を書き換えてもらった方がいい。

(2023/03/28):追加  
(2023/03/30):コマンド数の削減  

[▲戻る](#配布物)  


# 装飾品 
　ブロックディスプレイ等で作れる装飾品の一例です。  
  
## block_displayで作成したイス1

![chair01](https://user-images.githubusercontent.com/60039093/219947694-d13ef55d-5a56-4f8b-9991-5054d16d3470.png)  
▲イス1の写真  

### 説明
block_displayで作成した、コロコロ付きの丸椅子。  

### 使い方 
設置用ファンクション`chair01_put.mcfunction`をデータパック内の好きな位置に置き、好きな位置と角度から実行すればその位置と角度で召喚される。原点は下面の中央。  

▼設置用ファンクションの実行例  
`execute positioned ~ ~ ~ rotated ~ 0 run function ****:****/chair01_put`  

(2023/02/21):追加  

[▲戻る](#配布物)  

## block_displayで作成した窓枠1

![window01](https://user-images.githubusercontent.com/60039093/219947547-3c49a034-b5e1-4d20-b5e5-86f2f21c9ae9.png)  
▲窓枠1の写真 (左が設置前/右が設置後)  

### 説明
block_displayで作成した、木でできた窓枠とその周辺。  

### 使い方 
設置用ファンクション`window01_put.mcfunction`をデータパック内の好きな位置に置き、好きな位置と角度から実行すればその位置と角度で召喚される。原点は窓下面の中央。  

▼設置用ファンクションの実行例  
`execute positioned ~ ~1.5 ~3.5 rotated ~ 0 run function ****:****/window01_put`  

(2023/02/21):追加  

[▲戻る](#配布物)


# 制作例 
　コマンドを利用して作るデータパック

## マクロを使ったエンティティ用個別ストレージ

### 説明
1.20.2で追加されたマクロを利用して作成した、エンティティ毎にストレージで好きなデータを保存できる個別ストレージ。リストに対して`[$(index)]`のようにアクセスしてデータをコピーしてくる方法で、データの量によってはコピーのコストが大きくなるため注意。

### 使い方 
**初期設定 :**  
[09_examples/EntityStorage](https://github.com/MCJE-Tech-Community/Datapack-WIki/tree/main/09_examples/EntityStorage)にある`EntityStorage`を`datapacks`直下に入れるか、`EntityStorage/data/entity_storage`フォルダを好きなデータパックの`data/`直下に入れ、`entity_storage:zzz/init`を実行する。  

**登録 :**  
`entity_storage:regist`を実行すると、実行者にidとしてスコアボード`estS.id`にidが与えられ、個別ストレージの方にもデータの格納先が準備される。  
`entity_storage:regist {id:<id>}`を実行すると該当idのデータを削除する。

**データのコピー、変更 :**  
個別データは`entity_storage: data[<id>]`に格納され、以下のマクロに適切な変数を渡せばコピーやマージができる。  

▼`entity_storage:copy`  
```mcfunction
$data modify $(type) $(target) $(path) set from entity_storage: data[($id)].$(from)
```  
▼`entity_storage:merge`  
```mcfunction
$data modify storage entity_storage: data[($id)].$(to) merge value ($(data))
```  
個別ストレージからデータを取り出したり変更したりするときに利用できる。  
初期値として、該当エンティティの文字列uuid(`str_uuid`)と名前(`score_name`)が保存されている。(後者はガベージコレクタで利用する)  

**ガベージコレクタ :**  
`schedule`コマンドにより一定時間の間隔でエンティティの存在をスコアを用いた方法で1体ずつ確認し、削除されていた場合はデータなどを消すという機能がある。`entity_storage: gc_duration`で走査tickの間隔を設定できる(デフォルトは2000tick,100秒)。1回につき1体分しか確認しないので割とゆっくり行われる。

▼ファンクションの実行例
```mcfunction
# 個別データ/idの登録
execute as <entity> run function entity_storage:regist

# データのコピー
function entity_storage:copy {id:"0",type:"storage",target:"namespace:",path:"hoge",from:"fuga"}

# データのマージ
function entity_storage:merge {id:"0",to:"fuga",data:{a:1b,str:"hoge"}}

# ガベージコレクタの設定変更
data modify storage entity_storage: gc_duration set value 200
```  
 
(2023/09/15):シンプルな形に変更  
(2023/09/14):ミス/誤字を修正  
(2023/09/13):追加  

[▲戻る](#配布物)
