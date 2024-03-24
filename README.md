# sphinx-autosummary recursive

Experimenting with sphinx-autosummary to recursively generate documentation
stubs for the python api. 

## Steps undertaken
1. Ditch old docs
2. Create fresh project
3. Install Sphinx to venv
4. Install getML to venv
5. Call `sphinx-quickstart`
6. Add the following directive to generated `index.rst`: 

``` rst
.. autosummary::
   :toctree: api
   :template: module.rst
   :recursive:

   getml
```
7. Add [custom templates](source/templates) to default template dir (`source/_templates`)
8. Add custom `Dockefile` for build that mimics the env created above

## Build docs

``` bash
docker build . --build-arg VERSION=1.5.0 -o build 
```
