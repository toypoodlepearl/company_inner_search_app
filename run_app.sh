#!/bin/bash
# Streamlitアプリ起動スクリプト

# プロジェクトディレクトリに移動
cd "$(dirname "$0")"

# 仮想環境を有効化
echo "仮想環境を有効化しています..."
source .venv/bin/activate

# 必要なパッケージがインストールされているかチェック
echo "必要なパッケージの確認..."
if ! pip show streamlit > /dev/null 2>&1; then
    echo "Streamlitをインストールしています..."
    pip install streamlit
fi

# Streamlitアプリを起動
echo "Streamlitアプリを起動しています..."

# ポート8501が使用中の場合は8502、8503を試す
PORT=8501
if lsof -i:$PORT > /dev/null 2>&1; then
    PORT=8502
    if lsof -i:$PORT > /dev/null 2>&1; then
        PORT=8503
    fi
fi

echo "アプリはブラウザで http://localhost:$PORT で確認できます"
streamlit run main.py --server.port $PORT