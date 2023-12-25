local:
	docker run -p 4000:4000 -v $(shell pwd):/site bretfisher/jekyll-serve

gen-local:
	docker run -v $(shell pwd):/site -it --entrypoint /bin/sh bretfisher/jekyll -c "bundle install --retry 1 --jobs 20 && bundle exec jekyll build"

pre-commit:
	pre-commit run --all-files

pre-commit-this-commit:
	pre-commit run

pre-commit-update:
	pre-commit autoupdate

detect-secrets:
	pre-commit run detect-secrets --all-files # pragma: allowlist secret

yamllint:
	pre-commit run yamllint --all-files

bklint:
	pre-commit run blocklint --all-files

markdownlint:
	markdownlint --config .dev_config/.markdownlint.yaml --ignore LICENSE.md --dot --fix .

standard:
	standard --fix

html5validator:
	if [ ! -d "./_site" ]; then $(MAKE) gen-local; fi
	html5validator --config .dev_config/.html5validator.yaml

prettier:
	prettier --ignore-path .dev_config/.prettierignore --ignore-path .gitignore --no-config --print-width 100 --single-attribute-per-line --write .

# detect-secrets ~ pragma: allowlist
# yamllint ~ yamllint
# blocklint ~ blocklint: pragma
# markdownlint ~ <!-- markdownlint-disable -->
# standard ~ eslint
find_noqa_comments:
	@grep -rIn 'yamllint' $(shell git ls-files '*.yaml')
	@grep -rIn 'pragma\|blocklint:' $(shell git ls-files '*')
	@grep -rIn 'markdownlint-' $(shell git ls-files '*.md')
	@grep -rIn 'eslint' $(shell git ls-files '*.js')
