# Code Maat unofficial Docker image for exploration

A Docker container to run the Code Maat tool provided by Adam Tornhill, along with python and cloc.

[https://github.com/adamtornhill/code-maat](https://github.com/adamtornhill/code-maat)

I created this because I got sick of issues running the combination of tools on my Windows PC (install errors and file encoding issues), so wanted a basic linux based container I could run bash with everything installed.

See Adam Tornhills book, [Code as a crime scene](https://pragprog.com/book/atcrime/your-code-as-a-crime-scene) for examples and details on how to analyse a source repo using these tools.

# Usage

## Build the Docker image

To build a Code Maat image run 
```
docker build -t code-maat-python https://github.com/stevenalexander/code-maat-python.git
````

The Docker image that is created has git, python, cloc and downloads the code-maat Clojure repository and builds and exposes bash as entry point. There is an alias 'maat' for running the code-maat jar.

After the build is completed verify that it works by running:

```
docker run --rm -v /c/Users/USERNAME/MYREPO:/myrepo -i -t code-maat-python
```

You will have a bash console into the container with your repo volume available to get git logs, run 'maat', cloc and python scripts to analyse. On exit the container will be deleted.

## Run Code Maat Docker image

To understand how to use code-maat with the different command line option see [Running Code Maat](https://github.com/adamtornhill/code-maat#running-code-maat)

## Contributions

This docker image uses work provided by [Murphy McMahon](https://github.com/pandeiro) on how to install [Leiningen](http://leiningen.org) to compile the Code Maat Clojure code

This docker image uses work provided by [Peter Norrhall](https://github.com/peternorrhall) for configuring code-maat. The origin repository is [here](https://github.com/peternorrhall/code-maat), and I'd recommend you use that if you want a clean image to run individual code-maat commands. 

## License

Distributed under the Eclipse Public License either version 1.0 or (at
your option) any later version.

