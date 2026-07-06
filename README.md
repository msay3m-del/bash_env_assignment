# bash_tutorial

**BSGP 7030 · Assignment 1 — Git Repo + First Software Environment**

A minimal multi-language Hello World project for Bash, Python, and R, built twice: once by hand (`manual/`) and once with AI assistance (`ai/`). Both versions include conda environment definitions and setup scripts tuned for the [Ohio Supercomputer Center (OSC)](https://www.osc.edu/) Ascend cluster.

**Repository:** [github.com/msay3m-del/bash_env_assignment](https://github.com/msay3m-del/bash_env_assignment)

---

## Overview

This repo demonstrates the bare-metal workflow the course emphasizes: shell scripts, conda environments, Jupyter notebooks, git, and GitHub — plus a side-by-side comparison of manual vs AI-assisted scaffolding.

| Part | Folder | Description |
|------|--------|-------------|
| **A — Manual** | [`manual/`](manual/) | Typed by hand with no AI tools. Includes Hello World scripts, three Jupyter notebooks, and a full JupyterLab + kernel setup. |
| **B — AI-assisted** | [`ai/`](ai/) | Generated with Cursor from a one-paragraph prompt, then iterated after runtime errors. Minimal env with pinned versions. |
| **C — Reflection** | [`REFLECTION.md`](REFLECTION.md) | Comparison of both approaches, prompts used, and what broke on a real cluster shell. |

---

## Project structure

```
bash_tutorial/
├── README.md                 ← you are here
├── REFLECTION.md             ← assignment reflection (Part C)
├── manual/                   ← Part A (hand-typed)
│   ├── hello_bash.sh
│   ├── hello_Py.py
│   ├── hello_R.r
│   ├── hello_bash.ipynb
│   ├── hello_Py.ipynb
│   ├── hello-R.ipynb
│   ├── environment.yml
│   └── setup_env.sh
└── ai/                       ← Part B (AI-assisted)
    ├── hello.sh
    ├── hello.py
    ├── hello.R
    ├── environment.yml
    ├── requirements.txt
    └── setup_env.sh
```

---

## Quick start

Both tracks target OSC's Miniconda module. Run commands from inside the folder you want to use.

### Manual track — JupyterLab + kernels

Best for working in notebooks with registered Python and R kernels.

```bash
cd manual
bash setup_env.sh
```

This script will:

1. Load `miniconda3/24.1.2-py310`
2. Create the `7030_class_1` conda environment
3. Register Python and R Jupyter kernels
4. Launch JupyterLab on port **2000**

Run the hello scripts directly:

```bash
bash hello_bash.sh
python hello_Py.py
Rscript hello_R.r
```

Or open the `.ipynb` notebooks in JupyterLab.

### AI track — minimal pinned environment

Best for a lightweight, reproducible hello-world env with explicit version pins.

```bash
cd ai
source setup_env.sh    # build/update env AND activate in current shell
```

Or build without activating:

```bash
cd ai
bash setup_env.sh      # creates/updates hello_env; activation does not persist
```

Run the hello scripts:

```bash
./hello.sh
python hello.py
Rscript hello.R
```

---

## Environment comparison

| | Manual (`7030_class_1`) | AI (`hello_env`) |
|---|---|---|
| **Python** | 3.10 | 3.11.11 |
| **R** | `r-base` (unpinned) | 4.4.2 |
| **JupyterLab** | yes | no |
| **Kernels** | Python + IRkernel | no |
| **Version pinning** | loose | explicit |
| **Primary use** | Course notebooks on OSC | Minimal script runner |

See [`REFLECTION.md`](REFLECTION.md) for a detailed breakdown of trade-offs and what the AI got wrong on the first run.

---

## Requirements

- Access to OSC Ascend (or a machine with Lmod + Miniconda)
- Module: `miniconda3/24.1.2-py310`
- Git + GitHub account (for cloning and submission)

```bash
git clone https://github.com/msay3m-del/bash_env_assignment.git
cd bash_env_assignment
```

---

## What each language prints

All six scripts/notebooks produce the same output:

```
Hello World
```

---

## Author

**Mohammad Sayem** — BSGP 7030, Assignment 1

- GitHub: [msay3m-del/bash_env_assignment](https://github.com/msay3m-del/bash_env_assignment)
- Reflection and AI prompt log: [`REFLECTION.md`](REFLECTION.md)
