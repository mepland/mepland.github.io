# Matthew Epland's Portfolio Page

Adapted from [`cvless`](https://github.com/piazzai/cvless).

[![JavaScript Style Guide](https://img.shields.io/badge/code_style-standard-brightgreen.svg?style=flat)](https://standardjs.com)
[![Code Style: prettier](https://img.shields.io/badge/code_style-prettier-ff69b4.svg?style=flat)](https://github.com/prettier/prettier)

## Usage

Configuration primarily occurs in four files.
First, `_config.yml`, which contains site variables such as title, tagline, url,
and repository address, as well as the author's name and email address for inclusion in blog posts.
You can also specify the path to an avatar for inclusion in the home (optional).

Second, you should update icon links in `_includes/particles-home.html`
and add/remove icons as needed.
You might want to add icons that are not included in the theme by default.
For more information on how to do this,
see [this post](https://cvless.netlify.app/2022/08/01/on-the-use-of-icons).

Third, you should customize the file `_includes/contact.html`
by inputting your contact details and adding/removing lines as needed.
This information is prepended to your CV.

Fourth, you might want to edit the style variables specified in `_sass/_variables.scss`.
These allow you to customize the theme's color scheme and typefaces.

In addition to these files, you can customize favicons in the `assets` folder.
For that, [favicon.io](https://favicon.io) is an excellent tool.
You can also change the particles.js configurations in `assets/json`.
The [library homepage](https://vincentgarreau.com/particles.js)
features an interactive tool from which you can export a new configuration.

## Local Development

This repo includes a docker-compose file that
allows you to quickly setup a container running Jekyll.
If you don't already have Docker and docker-compose installed,
you can install them using the following guides from Docker:
[Docker](https://docs.docker.com/get-docker),
[docker-compose](https://docs.docker.com/compose/install)

You can run the container without docker-compose using the following command on Mac/Linux:

```bash
docker run -p 4000:4000 -v $(pwd):/site bretfisher/jekyll-serve
```

To start the container with docker-compose simply run:

```bash
docker-compose up
```

### [Running Docker without `sudo`](https://www.digitalocean.com/community/questions/how-to-fix-docker-got-permission-denied-while-trying-to-connect-to-the-docker-daemon-socket)
You need to create the `docker` group, if it does not exist,
and add your user to it:

```bash
sudo groupadd docker
sudo usermod -aG docker ${USER}
```

### Using the Makefile
A [`Makefile`](Makefile) is provided for convenience,
allowing you to run the docker container with `make serve-local`,
which serves the page to a local IP address,
or `make generate-local` which just builds the `_site` directory,
as well run CI and linting tools,
e.g. `make markdownlint`, `make pre-commit`.

#### Setting up JavaScript-based Linters
Markdown is linted using [`markdownlint-cli`](https://github.com/igorshubovych/markdownlint-cli),
JavaScript by [`standard`](https://github.com/standard/standard),
and HTML, SCSS, and CSS by [`prettier`](https://prettier.io).
To avoid setting up a `package.json` file,
you can install these JavaScript-based linters globally with:

```bash
sudo npm install -g markdownlint-cli standard prettier
```

#### Installing `pre-commit` and `html5validator`
You can install [`pre-commit`](https://pre-commit.com) and
[`html5validator`](https://github.com/svenkreiss/html5validator) globally with:

```bash
pip install pre-commit html5validator
```
