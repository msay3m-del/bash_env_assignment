First of all, I want to mention that for the manual portion, I did it according to what was shown in the demo class (without the requirements.txt) and for the AI portion, I followed the instructions on carmen (AI prompt from carmen:  "I need a minimal Python+R+Bash project that prints Hello World from each language. Generate hello.sh, hello.py, hello.R, an environment.yml, a requirements.txt, and a setup_env.sh that builds the env. Pin reasonable versions."). I used Cursor to complete the ai portion.

Which env file is more correct, yours, or the AI's? What's actually different?
I think both environments are correct based on the functionality requirements. The manual environment contains Jupyter and the required python and R kernels, which the ai environment does not as it is not mentioned in the carmen prompt. Ai named the environment hello_env, used python 3.11.11 and r base 4.4.2, whereas in the manual environment the name was bsgp7030_class_1, python 3.10 was used and no specific version of r base was pinned. I compared the manual and ai version using the ai and it mentioned that it had added "error handling (set -euo pipefail), `SCRIPT_DIR` so the script works regardless of cwd, create-or-update logic (`conda env create` vs `conda env update --prune`), distinction between `source setup_env.sh` (activates in current shell) and `bash setup_env.sh` (build only) and a (minimal) requirements.txt" in it's environment setup script. Overall, both the environments performed their task well, the manual environment capable of running Jupyterlab notebooks alongside the three scripts and the ai environment designed to run just the three scripts.

What did the AI add that you forgot? What did the AI invent (hallucinated package, wrong version, nonexistent flag)?
The ai added an empty requirements.txt file just to satisfy the prompt. I didn't add the requirements.txt in the manual folder as it was mentioned to be optional in the demo class. As mentioned previously, in the ai environment script, ai added error handling (set -euo pipefail), SCRIPT_DIR, create-or-update logic (`conda env create` vs `conda env update --prune`) without being asked to do so. Ai also installed pip 24.3.1 in the environment although it was not mentioned in the prompt.

Did the AI's setup_env.sh actually run end-to-end on a clean shell?
After the first prompt, running the ai/setup_env.sh returned "404 pip error" and ai resolved it when asked to do so (prompt: running the ai/setup_env.sh is giving the following error: 
Pip subprocess error:
  ERROR: 404 Client Error: FileNotFoundError for url:
  file:///requirements.txt

Ai Response: The failure came from Conda’s -r file:requirements.txt entry in
  environment.yml. On this system it resolved to file:///requirements.txt
  (root of the filesystem) instead of the project file.

  Fix: Removed the pip block from environment.yml and moved pip install into
  setup_env.sh, using an absolute path:

  conda run -n hello_env pip install -r "$SCRIPT_DIR/requirements.txt")

After the second run of setup_env.sh, the script was asking me to do module load before activating the ai environment (hello_env). I asked it to put 'module load miniconda3/24.1.2-py310' inside the setup_env.sh so that I don't have to run it afterwards. I got the following in response from cursor:

Run it with source (not ./):

  cd /users/PAS3421/sayem2/bash_tutorial/ai
  source setup_env.sh

  That will:
  1. Load Miniconda
  2. Create or update hello_env
  3. Activate hello_env in your current shell

  If you run ./setup_env.sh instead, it still builds the env but activation
  won't stick in your shell — the script will tell you to use source 
  setup_env.sh

Finally, it ran end-to-end on a clean shell once I ran 'source setup_env.sh'. Another thing I want to mention is that in the ai environment.yml, there was no bioconda under channels and the versions of python and r-base was explicitly mentioned. 

Time to complete A vs. B (rough estimate is fine).
The manual portion took around two hours as I was getting acquainted with the environment and github for the very first time. The ai portion also took around two hours to completely solve all the problems. Overall, I found doing the manual portion easier just by following the instructions provided in carmen and following the demo class recording.
