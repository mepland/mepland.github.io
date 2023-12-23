local:
	sudo docker run -p 4000:4000 -v $(shell pwd):/site bretfisher/jekyll-serve

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
