FROM condaforge/mambaforge:latest
LABEL io.github.snakemake.containerized="true"
LABEL io.github.snakemake.conda_env_hash="8f210dca51dc6e69c402ac5652fbda9d6d9a96502a55c66630de1401ca87fe2a"

# Step 1: Retrieve conda environments

# Conda environment:
#   source: workflow/envs/matplotlib_env.yaml
#   prefix: /conda-envs/ae761f54ae78988ba67db7145830d6e4
#   name: matplotlib_env
#   channels:
#     - bioconda
#     - conda-forge
#     - defaults
#   dependencies:
#     - blas=1.0
#     - ca-certificates=2021.1.19
#     - certifi=2020.12.5
#     - cycler=0.10.0
#     - freetype=2.10.4
#     - intel-openmp=2019.4
#     - jpeg=9b
#     - kiwisolver=1.3.1
#     - lcms2=2.11
#     - libcxx=10.0.0
#     - libffi=3.3
#     - libpng=1.6.37
#     - libtiff=4.1.0
#     - lz4-c=1.9.3
#     - matplotlib=3.3.4
#     - matplotlib-base=3.3.4
#     - mkl=2019.4
#     - mkl-service=2.3.0
#     - mkl_fft=1.3.0
#     - ncurses=6.2
#     - numpy=1.19.2
#     - numpy-base=1.19.2
#     - olefile=0.46
#     - openssl=1.1.1k
#     - pillow=8.2.0
#     - pip=21.0.1
#     - pyparsing=2.4.7
#     - python=3.8.8
#     - python-dateutil=2.8.1
#     - readline=8.1
#     - setuptools=52.0.0
#     - six=1.15.0
#     - sqlite=3.35.3
#     - tk=8.6.10
#     - tornado=6.1
#     - wheel=0.36.2
#     - xz=5.2.5
#     - zlib=1.2.11
#     - zstd=1.4.9
#   prefix: /Users/sreichl/miniconda3/envs/matplotlib_env
RUN mkdir -p /conda-envs/ae761f54ae78988ba67db7145830d6e4
COPY workflow/envs/matplotlib_env.yaml /conda-envs/ae761f54ae78988ba67db7145830d6e4/environment.yaml

# Step 2: Generate conda environments

RUN mamba env create --prefix /conda-envs/ae761f54ae78988ba67db7145830d6e4 --file /conda-envs/ae761f54ae78988ba67db7145830d6e4/environment.yaml && \
    mamba clean --all -y
