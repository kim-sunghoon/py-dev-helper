# py-dev-helper
you need to change `project_dir` in Makefile
## how to use 
``` sh
$ make set ==> just one time for setting linter tools and .gitmessage template and git precommit hooks
$ make quality ==> just check syntax and if reformatting is possible.
$ make style ==> Apply black and isort (depends on `pyproject.toml`) and score with flake8 (depends on `setupt.cfg`)

```
