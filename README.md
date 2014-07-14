# "CI in a Box"


## Overview

"CI in a Box" is an effort to automate the generation of entire Continuous Integration infrastructure environments.  Thanks to rapid the evolution of cloud computing and open source - many tools have emerged enabling [infrastructure as code](http://devops.com/blogs/meet-infrastructure-code/).  


### Goals

*  Reduce the barrier to entry for Continuous Integration (and ultimately Continuous Delivery)
*  Create a sustainable development environment ("The Factory") suitable for the development of Infrastructure Automation ("The Target CI Environment"")
*  Automate everything that can and should be automated

The techniques embraced here will also find application within the Target CI Environments themselves as well as for setting up developer workstations. These are things we wish to tackle down the road.


### Some Guiding Principles for Contributors

We hope this project expands beyond its initial contributors

* Everything important must be buildable from source
* Minimize the number of *"snowflakes"* you depend on - that is any binary artifact that cannot be re-built from source code we control
* Separate environmental configuration from the rest
* Write tests to validate
* Builds must be immutable - that is, every build should produce a new artifact
    * ...and pretty much everything else from the [Continuous Delivery](http://www.thoughtworks.com/continuous-delivery) book
* Finally, expand this README.md as you learn more and pay it forward


## Site Index

* [Requirements](docs/REQUIREMENTS.md)
* [Getting Started](docs/GETTING_STARTED.md)
* [Providers](docs/PROVIDERS.md)
* [Contribute](CONTRIBUTE.md)
* [License](LICENSE.txt)
	











