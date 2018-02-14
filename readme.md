# Introduction to Python and Jupyter Notebook

## Requirements

To contribute to this repository, especially on `.ipynb` files, we require you to clean all outputs everytime before pushing. This can be done by selecting on `Cell > All Output > Clear`. If you find this is tedious and hard to do manually, we suggest you to follow [this guide](http://timstaley.co.uk/posts/making-git-and-jupyter-notebooks-play-nice/) to make it automatic or you can follow short summary below.

### Adding filter to *.ipynb

- Install [jq](https://stedolan.github.io/jq/)
- Add this block to `~/.gitconfig`

```conf
[core]
attributesfile = ~/.gitattributes_global

[filter "nbstrip_full"]
clean = "jq --indent 1 \
        '(.cells[] | select(has(\"outputs\")) | .outputs) = []  \
        | (.cells[] | select(has(\"execution_count\")) | .execution_count) = null  \
        | .metadata = {\"language_info\": {\"name\": \"python\", \"pygments_lexer\": \"ipython3\"}} \
        | .cells[].metadata = {} \
        '"
smudge = cat
required = true
```

- Add this line to `~/.gitattributes_global`

```conf
*.ipynb filter=nbstrip_full
```