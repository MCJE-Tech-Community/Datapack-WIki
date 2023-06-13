@echo off

@REM 出力先
IF not exist "benchmark_results" (
    MD benchmark_results
)

@REM 実行
FOR /D %%i IN (.\world\datapacks\debug\data\debug\functions\*) DO (
    FOR /D %%j IN (%%i\*) DO (
        @REM ベンチマークするファイルをセット
        python .\benchmark_fileset.py %%j

        @REM ベンチマークされていない場合は開始
        IF exist "%~dp0benchmark_results\%%~ni.%%~nj.json" (
            ECHO %%~ni.%%~nj is passed cuz already checked.
        ) ELSE (
            @REM ベンチマークの実行
            java -jar mch.jar

            @REM 結果を保存
            COPY /Y .\mch-results.json .\benchmark_results\%%~ni.%%~nj.json
        )
    )
)