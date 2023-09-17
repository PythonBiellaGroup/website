####----Basic configurations----####
.PHONY: pre-commit
install_pre_commit: ## configure and install pre commit tool
	@poetry run pre-commit install

uninstall_pre_commit: ## configure and install pre commit tool
	@poetry run pre-commit uninstall

.PHONY: install
install: ## Install the poetry and python environment
	@echo "🚀 Creating virtual environment using pyenv and poetry"
	@poetry installdocs
	@poetry shell

.PHONY: check_project
check_project: ## Run code quality tools.
	@echo "🚀 Checking Poetry lock file consistency with 'pyproject.toml': Running poetry lock --check"
	@poetry check --lock
	@echo "🚀 Linting code: Running pre-commit"
	@poetry run pre-commit run -a
# echo "🚀 Checking for obsolete dependencies: Running deptry"
# poetry run deptry .

.PHONE: poetry_plugins
poetry_plugins_install: ## Install and configure the poetry plugins
	@echo "Install poetry-plugin-sort"
	@poetry self add poetry-plugin-sort
	@poetry self add poetry-plugin-up

poetry_update: ## Update the poetry environment
	@echo "🚀 Updating virtual environment using poetry"
	@poetry self update

poetry_plugins: ## Launch the poetry plugins
	@echo "Launching poetry-plugin-sort"
	@poetry sort

####----Docs----####
.PHONY: docs
docs_launch: ## Launch mkdocs documentation locally
	@poetry run mkdocs serve

docs_launch_normal: ## Launch mkdocs documentation locally
	mkdocs serve -v --config-file mkdocs.yml

docs_build: ## Build mkdocs for local test
	@poetry run mkdocs build --clean --quiet --config-file mkdocs.insiders.yml

docs_launch_local: ## Launch mkdocs documentation locally with the local building artefacts
	@poetry run mkdocs build --clean --quiet --config-file mkdocs.yml
	@poetry run mkdocs serve -v --dev-addr=0.0.0.0:8000

docs_deploy: ## Deploy mkdocs documentation to github pages
	@poetry run mkdocs build --clean --quiet --config-file mkdocs.insiders.yml
	@poetry run mkdocs gh-deploy --force

docs_public: ## Build mkdocs for official online release
	@poetry run mkdocs build -c -v --site-dir public --quiet --config-file mkdocs.insiders.yml

####----Docker----####
.PHONY: docker
# Remember to login before
# source .env | echo $GHCR_TOKEN | docker login ghcr.io -u $GHCR_USERNAME -p $GHCR_TOKEN
docker_launch: ## Launch the docker compose and containers
	@docker-compose -p pbg up --build -d 

# --build-arg GHCR_USERNAME=${GHCR_USERNAME} --build-arg GHCR_TOKEN=${GHCR_TOKEN}
docker_build: ## Build the docker compose and containers
	@docker-compose -p pbg build 

docker_check: ## Check the logs for the docker containers
	@docker ps -a | grep "pbg"

docker_check_logs: ## Check the logs for the docker containers
	@docker-compose -p pbg logs -f

docker_stop: ## Stop the docker containers
	@docker-compose down

docker_stop_clear: ## Stop the docker containers and clean the volumes
	@docker-compose down -v

docker_clean_volumes: ## Clean the volumes
	@docker volume prune

####----Project----####
.PHONY: poetry_build
package_build: # Build the package
	@poetry build

.PHONY: publish_pypi
pypi: # publish in the public pypy registry
	@python setup.py sdist
	@python setup.py bdist_wheel --universal
	@twine upload dist/*

### Project specific tasks
.PHONY: project
launch_py3: # Launch the main file with python 3
	@export PYTHONPATH=$(pwd) && python3 app/main.py

.PHONY: project
launch_py: # Launch the main file with python
	@export PYTHONPATH=$(pwd) && python app/main.py

.PHONY: help
help: ## Ask for help in the Makefile
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

#### Project clean
.PHONY: project_clean
clean: ## Clean the projects of unwanted cached folders
	@rm -rf **/.ipynb_checkpoints **/.pytest_cache **/__pycache__ **/**/__pycache__ ./notebooks/ipynb_checkpoints .pytest_cache ./dist ./volumes

.PHONY: project_restore
restore: ## Restore the projects to the start (hard clean)
	@rm -rf **/.ipynb_checkpoints **/.pytest_cache **/__pycache__ **/**/__pycache__ ./notebooks/ipynb_checkpoints .pytest_cache ./dist .venv poetry.lock

.secrets_baseline.json:  ## Create secrets baseline
	gitleaks detect --redact --report-path "$@" || true

.DEFAULT_GOAL := help
SHELL := /bin/bash