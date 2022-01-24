# Building Python C and C++ Extensions with setuptools

## Extension Modules

CPython extension module allows adding python functions and types implemented in native code.
An extension module is normally a shared library, for example .so file on Linux,
which follows a predefined API.
The CPython interpreter supports loading the module's library file during runtime.

The CPython interpreter provides a C/C++ API for developing third-party extension modules.
The API allows extending interpreter and interacting with it. 
Via the API it's for example possible to add new python function or call existing ones.

For more information on how to write CPython extension modules, 
see [Extending and Embedding the Python Interpreter](https://docs.python.org/3/extending/) documentation.

## `distutils` deprecation

In order to use an C/C++ extension module it needs to be compiled into a native binary. 
Historically this have been done using `distutils` build-in package.
However, in Python 3.10 release the 
`distutils` have been deprecated, and it's planned to be removed in the future.
See [PEP 632](https://www.python.org/dev/peps/pep-0632/) for background discussion and details for the deprecation.

For many use cases the [setuptools](https://setuptools.pypa.io/en/latest/) package is an
drop-in replacement for `distutils`.
Below is an example on how to build extension module using `setuptools`.

## Building with `setuptools`

Extension modules can be built using setuptools.
It is accomplished by creating a python package,  which will include extension module's binary files.

An entry point for defining contents and meta-data of a python package is a `setup.py` file.
`setup.py` is a normal python script, that can for example look like this:

    from setuptools import setup, Extension
    
    setup(
        name="demo",
        version="1.0",
        description="This is a demo package",
        ext_modules=[Extension("demo", sources=["demo.c"])],
    )

The file above defines a python package named `demo`, which contains one extension module `demo`.
The extension module will be build from the `demo.c` source file.

The package can be build by running `setup.py` script with `build` argument.

    $ python setup.py build

To install the packge, use `install` argument.

    $ python setup.py install

Note that building package is not required before running `install` command.
The `install` command will automagically build the package, if required.

It is also possible to build and install package using `pip` utility by  running:

    $ pip install .

For more details, take a look at 
[example extension module package](https://github.com/elmjag/demo) repository.
