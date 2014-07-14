# Contribute to "CI in a Box"

If you are looking to improve cibox in some manner, you've come to the right place.


## Steps to Contribute

### Getting started

In order to contribute anything, you'll want to follow these steps first:

* Get an account on [Github](https://github.com)
* Then fork the [cibox repository](https://github.com/fastnsilver/cibox) to your own Github account
* If you haven't already, familiarize yourself with the [Requirements](docs/REQUIREMENTS.md) and [Installation](docs/INSTALLATION.md) docs
* Clone the cibox **fork** to your machine:

    ~~~ sh
    $ cd <path_to_workspace>
    $ git clone https://github.com/<your github account>/cibox.git
    $ cd cibox
    ~~~

* Check out a new branch to make your changes on: `git checkout -b <your_new_patch>`


### For adding a new base-vm Definition

If you have a new and amazing "CI in a Box" definition, share your 'definition'. 

* Before saving changes to a 'template', first try your changes in `base-vm/definitions/<mynewos>/`
     * Follow the same naming schema of existing boxes (explained in the [Basics](docs/basics.md) doc)
* Build the box and run the **validation** tests
   

### For adding new Features

* Run any existing tests that are related to your patch
* For bonus points add tests to validate your changes


### To submit your Contribution

* Please commit with descriptive messages
* Submit a pull request on Github from the __your_new_patch__ branch on __your fork__ to the __master__ branch on __fastnsilver/cibox__
* One of the editors will review the change, and either merge it or provide some feedback. Community review is also encouraged.

