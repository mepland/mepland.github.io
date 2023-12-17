local:
	sudo docker run -p 4000:4000 -v $(shell pwd):/site bretfisher/jekyll-serve

pre-commit:
	pre-commit run --all-files

pre-commit-this-commit:
	pre-commit run

pre-commit-update:
	pre-commit autoupdate

markdownlint:
	markdownlint --ignore LICENSE.md --dot --fix .
