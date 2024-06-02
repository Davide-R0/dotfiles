# Nerfstudio
## Installation
With conda envoirement:
``` shell 
conda create --name nerfstudio -y python=3.8
conda activate nerfstudio
python -m pip install --upgrade pip
```
### Dependences
If necessary: `pip uninstall torch torchvision functorch tinycudann`

PyTorch and cuda:
`pip install torch==2.1.2+cu118 torchvision==0.16.2+cu118 --extra-index-url https://download.pytorch.org/whl/cu118`

Cuda-toolkit:

`conda install -c "nvidia/label/cuda-11.8.0" cuda-toolkit`

(ci potrebbe mettere un po')

(`conda install nvidia/label/cuda-11.8.0::cuda-toolkit`???)

Tiny-cuda-nn

`pip install ninja git+https://github.com/NVlabs/tiny-cuda-nn/#subdirectory=bindings/torch`

### Install Nerfstudio
`pip install nerfstudio`

Tab completion: `ns-install-cli`

Dev Pack.:
``` shell
pip install -e .[dev]
pip install -e .[docs]
```

