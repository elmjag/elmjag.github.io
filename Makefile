all:
	pandoc --standalone --metadata title="Building Python C and C++ Extensions with setuptools" setuptools.md > setuptools.html

clean:
	rm setuptools.html
