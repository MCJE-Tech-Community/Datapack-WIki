## ベンチマークの追加方法

1. <samp>11_benchmark/actions/world/datapacks</samp>下にデータパックを追加
2. <samp>pack.mcmeta</samp>の`pack.mch`を`true`にする
    ```json
    {
      "pack": {
        "description": "",
        "pack_format": 15,
        "mch": true
      }
    }
    ```

## ベンチマークの実行方法

1. [ベンチマーク](https://github.com/MCJE-Tech-Shares/Datapack-WIki/actions/workflows/benchmark.yml)にアクセス
2. <kbd>Run workflow ▾</kbd>を開き、フォームを入力
3. <kbd>Run workflow</kbd>を押す
