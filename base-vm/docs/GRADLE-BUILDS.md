# Gradle Builds

"CI in a Box" offers an alternative mechanism for creating base VMs.

[Gradle](http://www.gradle.org/docs/current/userguide/overview.html) is a build automation Domain Specific Language ([DSL](http://www.gradle.org/docs/current/dsl/)). 
We employ the DSL to declare tasks that wrap calls to parameterized Veewee and Vagrant commands.  


## Quick Start

### Windows

Open a `cmd.exe` shell and place yourself within the `cibox` directory:

    cd base-vm

Execute the Gradle Wrapper:

    gradlew


### Linux or Mac OS X

Open a `Terminal` shell and place yourself within the `cibox` directory:

	cd base-vm

Verify that gradlew has execution priveleges:

    ls -la

If not, then:

    chmod +x gradlew

Execute the Gradle Wrapper:

    ./gradlew


Having followed the instructions above:

* Gradle binaries and any dependencies are downloaded and installed
* An attempt will be made to execute a build of a base-vm using the default tasks

You should see a message like:

    You must provide a box name to build.

        Use 'gradle list' to list available boxes.

        Use 'gradle -Pbox=<box name>' to build, register, and export it for downstream use


So, if you wanted to build a CentOS 7 base VM, execute:

    gradle -Pbox=centos7-server-x64-base


## Additional Resources

* [Gradle Command Line Tutorial](http://www.gradle.org/docs/current/userguide/tutorial_gradle_command_line.html)