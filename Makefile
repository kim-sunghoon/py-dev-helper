clean: clean-pyc clean-test
quality: check-quality
style: set-style
set: set-stype-dep set-git


project_dir="YOUR_PROJECT_DIR"

##### basic #####
set-git:
	git config --local commit.template .gitmessage
	cd git_hooks && sh install_hooks.sh

set-style-dep:
	pip install isort==5.9.3 black==21.7b0 flake8==3.9.2

set-style:
	black --config pyproject.toml ${project_dir}/.
	isort --settings-path pyproject.toml ${project_dir}/.
	flake8 ${project_dir}/.

check-quality:
	black --config pyproject.toml --check ${project_dir}/.
	isort --settings-path pyproject.toml --check-only ${project_dir}/.
	flake8 ${project_dir}/.

#####  clean  #####
clean-pyc:
	find . -name '*.pyc' -exec rm -f {} +
	find . -name '*.pyo' -exec rm -f {} +
	find . -name '*~' -exec rm -f {} +
	find . -name '__pycache__' -exec rm -fr {} +

clean-test:
	rm -f .coverage
	rm -f .coverage.*
	rm -rf .pytest_cache
	rm -rf .mypy_cache

