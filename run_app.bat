@echo off
REM Streamlitアプリ起動スクリプト（Windows用）

REM プロジェクトディレクトリに移動
cd /d "%~dp0"

REM 仮想環境を有効化
echo 仮想環境を有効化しています...
call .venv\Scripts\activate.bat

REM 必要なパッケージがインストールされているかチェック
echo 必要なパッケージの確認...
pip show streamlit >nul 2>&1
if errorlevel 1 (
    echo Streamlitをインストールしています...
    pip install streamlit
)

REM Streamlitアプリを起動
echo Streamlitアプリを起動しています...
echo アプリはブラウザで http://localhost:8501 で確認できます
streamlit run main.py

pause