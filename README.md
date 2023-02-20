# MC-Command-Note
　メモ用に比較的小規模なコマンドネタをまとめたものです。  
　一つのデータパックとして配布するには小さすぎる物やモジュール化が面倒な物などを、個人的なメモ代わりとして置いておくためのリポジトリです。仕組みを理解してもらえたら、コピペや改造でお好きに利用してください。メモ程度なので説明不足な点や煩雑な書き方になっている部分もあるかもしれませんが悪しからず。また、それぞれ初期設定などのコマンドで重複している点もあるので、多用する場合は適当に変更することをオススメします。  
　作成は基本的に最新バージョン/最新スナップショットでやっているのでほとんど最新用になります。アップデートに関しては必要があれば随時行うと思いますが、過去verへの対応は各自で行うようお願いします。よほど低いバージョンでなければ応用できるはずです。  
　ある程度データパックの構造や使い方を把握している方向けになるので、どのファイルをどこに置けばいいか等は説明していません。ご了承ください。暇があれば解説するかもしれません。  
　バグや改善案などがあれば好きなだけissueを立ててもらって構いません(あと英単語とか)。時間があれば対処します。

## 目次/summary
1. [**家具/装飾**](#1)  
 1.11. [block_displayで作成したイス 1](#1.11)  
 1.21. [block_displayで作成した窓枠 1](#1.21)  
2. [**検知/探査**](#2)  
 2.11. [殴った/クリックしたエンティティ探査(進捗+二分探査)](#2.11)  
 2.12. [殴った/クリックしたエンティティ探査(進捗+execute on)](#2.12)  
 2.21. [角をすり抜けない視線先ブロック探査(execute増幅)](#2.21)  
 2.22. [角をすり抜けない視線先ブロック探査(functionループ)](#2.22)  
 2.23. [ヒットボックス準拠の視線先エンティティ探査(execute増幅)](#2.23)  
 2.24. [ヒットボックス準拠の視線先エンティティ探査(functionループ)](#2.24)  
 2.25. [ブロック探査とエンティティ探査を組み合わせた視線先探査(functionループ)](#2.25)  
 2.31. [text_displayと視点探査を活用したディスプレイ(billboard:fix)](#2.31)  
 2.32. [text_displayと視点探査を活用したディスプレイ(billboard:center)](#2.32)  
3. [**システム**](#3)  
 3.11 [ルートテーブルを使ったブロック名取得](#3.11)  
 3.12 [interactionエンティティを使った着席システム](#3.12)
4. [**演出アニメーション**](#4)  
 4.11 [block_displayを使った衝撃の演出](#4.11)
 
 
<a id="1"></a>
## 1. 装飾品/decorations  
<a id="1.11"></a>
### 1.11 block_displayで作成したイス 1 / chair01  
**■[説明/Description]**  
block_displayで作成した、コロコロ付きの丸椅子。  

**■[使い方/How to use]**  
設置用ファンクション`chair01_put.mcfunction`をデータパック内の好きな位置に置き、好きな位置と角度から実行すればその位置と角度で召喚される。原点は下面の中央。  

▼設置用ファンクションの実行例  
`execute positioned ~ ~ ~ rotated ~ 0 run function ****:****/chair01_put`  

![chair01](https://user-images.githubusercontent.com/60039093/219947694-d13ef55d-5a56-4f8b-9991-5054d16d3470.png)  
▲イス1の写真


---
<a id="1.21"></a>
### 1.21 block_displayで作成した窓枠 1 / window01  
**■[説明/Description]**  
block_displayで作成した、木でできた窓枠とその周辺。  

**■[使い方/How to use]**  
設置用ファンクション`window01_put.mcfunction`をデータパック内の好きな位置に置き、好きな位置と角度から実行すればその位置と角度で召喚される。原点は窓下面の中央。  

▼設置用ファンクションの実行例  
`execute positioned ~ ~1.5 ~3.5 rotated ~ 0 run function ****:****/window01_put`  

![window01](https://user-images.githubusercontent.com/60039093/219947547-3c49a034-b5e1-4d20-b5e5-86f2f21c9ae9.png)  
▲窓枠1の写真 (左が設置前/右が設置後)  


***

<a id="2"></a>
## 2. 検知・探査/Detection&Exploretion  
<a id="2.11"></a>
### 2.11 殴った/クリックしたエンティティ探査(進捗+二分探査) / entity_association01  
**■[説明/Description]**  
準備中  

**■[使い方/How to use]**  


---
<a id="2.12"></a>
### 2.12 殴った/クリックしたエンティティ探査(進捗+execute on) / entity_association02  
**■[説明/Description]**  
準備中  

**■[使い方/How to use]**  


---
<a id="2.21"></a>
### 2.21 角をすり抜けない視線先ブロック探査(execute増幅) / looked_block_exploration01  
**■[説明/Description]**  
準備中  

**■[使い方/How to use]**  


---
<a id="2.22"></a>
### 2.22 角をすり抜けない視線先ブロック探査(functionループ) / looked_block_exploration02  
**■[説明/Description]**  
準備中  

**■[使い方/How to use]**  


---
<a id="2.23"></a>
### 2.23 ヒットボックス準拠の視線先エンティティ探査(execute増幅) / looked_entity_exploration01  
**■[説明/Description]**  
準備中  

**■[使い方/How to use]**  


---
<a id="2.24"></a>
### 2.24 ヒットボックス準拠の視線先エンティティ探査(functionループ) / looked_entity_exploration02  
**■[説明/Description]**  
準備中  

**■[使い方/How to use]**  


---
<a id="2.25"></a>
### 2.25 ブロック探査とエンティティ探査を組み合わせた視線先探査(functionループ) / exploration  
**■[説明/Description]**  
準備中  

**■[使い方/How to use]**  


---
<a id="2.31"></a>
### 2.31 text_displayと視点探査を活用したディスプレイ(billboard:fix) / display01  
**■[説明/Description]**  
text_displayで作った固定されたディスプレイと、それを利用したディスプレイシステムの一例。  
とりあえず視点算出とホバーイベントの実装のみ。  
クリックイベントや演出の強化は実装予定。

**■[使い方/How to use]**  
`031_display01/`内の3つのファンクションをデータパック内の好きな位置に置き、以下の手順で実行する。  
1. 初期設定 : `init.mcfunction`を実行してスコア等を設定。  
2. ディスプレイ設置 : `set.mcfunction`を好きな位置と向きで実行するとその位置と向きで設置される。  
3. 常時実行 : `tick.mcfunction`を、ディスプレイの基準エンティティ(tag=display01_00)を実行者として常時実行させる。  

▼設置用ファンクションの実行例  
1. `function ****:****/031_display01/init`  
2. `execute positioned ~ ~1 ~ rotated ~45 ~10 run function ****:****/031_display01/set`  
3. `execute as @e[tag=display01_00] if entity @p[distance=..10] run function ****:****/031_display01/tick`  

![display01](https://user-images.githubusercontent.com/60039093/220151026-478e45b6-e8ac-4aee-a6a3-56cf1e99b4d0.gif)  
▲動作の様子  

---
<a id="2.32"></a>
### 2.32 text_displayと視点探査を活用したディスプレイ(billboard:center) / display02  
**■[説明/Description]**  
準備中  

**■[使い方/How to use]**  


---

<a id="3"></a>
## 3. システム  
<a id="3.1"></a>

<a id="4"></a>
## 4. 演出アニメーション  

