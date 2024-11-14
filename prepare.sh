#!/bin/bash
# 确保脚本在出错时终止执行
set -e

# 安装Python依赖
echo "Installing Python dependencies..."
pip3 install --upgrade pip -i https://pypi.tuna.tsinghua.edu.cn/simple
pip3 install -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple 

## 安装tpu_perf
if ! python3 -c "import tpu_perf" &> /dev/null; then
    echo "tpu_perf could not be found, installing..."
    # 检查系统架构并安装相应的包
    ARCH=$(uname -m)
    if [ "$ARCH" == "x86_64" ]; then
        pip3 install https://modelscope.cn/models/wlc952/aigchub_models/resolve/master/tpu_perf-1.2.60-py3-none-manylinux2014_x86_64.whl
    elif [ "$ARCH" == "aarch64" ]; then
        pip3 install https://modelscope.cn/models/wlc952/aigchub_models/resolve/master/tpu_perf-1.2.60-py3-none-manylinux2014_aarch64.whl
    else
        echo "不支持的系统架构: $ARCH"
        exit 1
    fi
fi
