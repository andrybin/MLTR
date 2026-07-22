#!/usr/bin/env bash

set -euo pipefail

readonly SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
readonly PROJECT_DIR="$(cd -- "${SCRIPT_DIR}/.." && pwd)"
readonly VENV_DIR="${PROJECT_DIR}/.venv"
readonly REQUIREMENTS_FILE="${SCRIPT_DIR}/requirements.txt"

if ! command -v uv >/dev/null 2>&1; then
    echo "uv is required. Install it from https://docs.astral.sh/uv/getting-started/installation/" >&2
    exit 1
fi

if [[ ! -f "${REQUIREMENTS_FILE}" ]]; then
    echo "Requirements file not found: ${REQUIREMENTS_FILE}" >&2
    exit 1
fi

uv venv --python 3.12 "${VENV_DIR}"
uv pip install --python "${VENV_DIR}/bin/python" --requirement "${REQUIREMENTS_FILE}"

echo "Virtual environment created at ${VENV_DIR}"
echo "Activate it with: source ${VENV_DIR}/bin/activate"
