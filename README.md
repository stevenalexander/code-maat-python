# Code Maat inofficial Docker image

A Docker continer to run the Code Maat tool provided by Adam Tornhill. 

[https://github.com/adamtornhill/code-maat](https://github.com/adamtornhill/code-maat)

Using this Docker image you don't need to follow all the steps described by Adam and when you are done just put this image into your trash bin.

# Usage

## Pre-requisite 

In order to build the Docker image you need of course to set up Docker on your local machine.
See [Installing Docker](https://docs.docker.com/engine/installation/)

On the same site you find a lot of 
Since you are here at Github you probably already have git install and all you need is the Dockerfile which can either be pulled from Github

```
git clone https://github.com/peternorrhall/code-maat.git
````

or just download the [Dockerfile](https://raw.githubusercontent.com/peternorrhall/code-maat/master/Dockerfile)  and put into a directory of your choice.

After the build is completed verify that it works

```
$docker run --rm code-maat
```

and verify that the output is the help information on hot to use Code Maat

```
This is Code Maat, a program used to collect statistics from a VCS.
Version: 0.9.2-SNAPSHOT

Usage: program-name -l log-file [options]
...
  -h, --help
Please refer to the manual page for more information.
````

## Build the Docker image

To build a local image pull this project run
```
docker build -t code-maat .
````

The Docker that is created downloads the code-maat Clojure repository and builds and exposes the code-maat jar file as an ENTRYPOINT in the image.

## Generate input data

Code Maat analysis different version control systems (Git, Mercurial, Subversion and Perforce). You need to provide a log file to Code Maat to analyse and this is described under [Generating input data](https://github.com/adamtornhill/code-maat#generating-input-data)

For example to extract data from a Git project since 2015 
```
git log --pretty=format:'[%h] %aN %ad %s' --date=short --numstat --after=2015-01-01 > mygit.log
```

## Run Code Maat Docker image

To understand how to use code-maat with the different command line option see [https://github.com/adamtornhill/code-maat](https://github.com/adamtornhill/code-maat)

```
docker run --rm -v /Users/peter/Documents/code-maat:/codemaat code-maat -l /codemaat/mygit.log -c git -a authors
```

The log file (mygit.log) that you created earlier resides on the local system and in order to allow Code Maat analyse you need to mount the local folder to the container using the `-v` option. In the example above the mygit.log is located in `/Users/peter/Documents/code-maat`. This is linked to the container directory `/codemaat` which is used when the log file is specified for Code Maat with `-l /codemaat/mygit.log`.

>--rm is used to remove the Docker container after the analysis is done


## Contributions

This docker image uses work provided by Murphy MaMahon on how install [Leiningen](http://leiningen.org) in order to compile the Clojure code

## License

Copyright © 2016 Peter Norrhall

Distributed under the Eclipse Public License either version 1.0 or (at
your option) any later version.

