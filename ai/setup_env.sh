#!/usr/bin/env bash
# Build and activate the hello_env conda environment.
# Usage: source setup_env.sh

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

module load miniconda3/24.1.2-py310
eval "$(conda shell.bash hook)"

if conda env list | awk '{print $1}' | grep -qx hello_env; then
  echo "Updating existing conda environment: hello_env"
  conda env update -f environment.yml --prune
else
  echo "Creating conda environment: hello_env"
  conda env create -f environment.yml
fi

conda run -n hello_env pip install -r "$SCRIPT_DIR/requirements.txt"

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  echo
  echo "Environment ready. To load Miniconda and activate hello_env, run:"
  echo "  source setup_env.sh"
else
  conda activate hello_env
  echo "Activated hello_env (miniconda3/24.1.2-py310 loaded)."
fi
