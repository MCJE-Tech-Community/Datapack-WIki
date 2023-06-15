@echo off

@REM 出力先
IF not exist "benchmark_results" (
    MD benchmark_results
)

IF not exist "temp" (
    MD temp
)

@REM 実行
FOR /D %%i IN (.\world\datapacks\debug\data\debug\functions\*) DO (
    FOR %%j IN (%%i\*.mcfunction) DO (

        RD /S /Q temp
        MD temp

        @REM ベンチマークするファイルを準備
        python .\benchmark_fileset.py %%i %%~nj

        FOR /D %%k IN (.\temp\*) DO (

            @REM ベンチマークされていない場合は開始
            IF exist "%~dp0benchmark_results\%%~ni-%%~nj-%%~nk.json" (
                ECHO %%~ni-%%~nj-%%~nk is passed cuz already checked.
            ) ELSE (

                @REM ファイルをセット
                COPY /Y %%k\mch-config.json .\mch-config.json
                COPY /Y %%k\setup.trial.mcfunction .\world\datapacks\debug\data\debug\functions\setup.trial.mcfunction

                @REM ベンチマークの実行
                java -jar mch.jar

                @REM 結果を保存
                COPY /Y .\mch-results.json .\benchmark_results\%%~ni-%%~nj-%%~nk.json

            )
        )
    )
)

RD /S /Q temp