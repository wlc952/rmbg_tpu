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
    pip3 install https://modelscope.cn/models/wlc952/aigchub_models/resolve/master/tpu_perf-1.2.60-py3-none-manylinux2014_aarch64.whl
fi