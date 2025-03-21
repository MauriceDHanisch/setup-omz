# setup-omz

Install Oh My Zsh with a single command.

## Installation

```bash
conda install -c mhanisch setup-omz
```

## Usage

```bash
setup-omz
```

# Build the package and deploy it to Anaconda Cloud

```bash
conda build conda-recipe/
anaconda upload /home/maurice/clear/envs/omz/conda-bld/noarch/setup-omz-0.1.0-py_1.conda
```
Note: the .conda file location is printed by conda build after the build process.