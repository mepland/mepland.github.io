pre-commit:
	pre-commit run --all-files

pre-commit-this-commit:
	pre-commit run

pre-commit-update:
	pre-commit autoupdate

serve-local:
	docker run -p 4000:4000 -v $(shell pwd):/site bretfisher/jekyll-serve

generate-local:
	docker run -v $(shell pwd):/site -it --entrypoint /bin/sh bretfisher/jekyll -c "bundle install --retry 1 --jobs 20 && bundle exec jekyll build"


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
	if [ ! -d "./_site" ]; then $(MAKE) generate-local; fi
	html5validator --config .dev_config/.html5validator.yaml

fmt_prettier:
	prettier --ignore-path .dev_config/.prettierignore --ignore-path .gitignore --config .dev_config/.prettierrc.yaml --write .

# detect-secrets ~ pragma: allowlist
# yamllint ~ yamllint
# blocklint ~ blocklint: pragma
# markdownlint ~ <!-- markdownlint-disable -->
# standard ~ eslint
# prettier ~ <!-- prettier-ignore -->
find_noqa_comments:
	@grep -rIn 'yamllint' $(shell git ls-files '*.yaml' '*.yml')
	@grep -rIn 'pragma\|blocklint:' $(shell git ls-files '*')
	@grep -rIn 'markdownlint-' $(shell git ls-files '*.md')
	@grep -rIn 'eslint' $(shell git ls-files '*.js')
	@grep -rIn 'prettier-ignore' $(shell git ls-files '*.html' '*.scss' '*.css')
