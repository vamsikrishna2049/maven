**A Build Lifecycle is Made Up of Phases**

There are three built-in build lifecycles: default, clean and site. 

The **default** lifecycle handles your project deployment, 
the **clean** lifecycle handles project cleaning, 
while the **site** lifecycle handles the creation of your project's web site.


**clean**: Deletes the `target` directory which contains the compiled bytecode, generated source files, and other build artifacts.

**Under default lifecycle**

1. **validate** - validate the project is correct and all necessary information is available

2. **compile** - compile the source code of the project

3. **test** - test the compiled source code using a suitable unit testing framework. These tests should not require the code be packaged or deployed
 
4. **package** - It will pack the entire compiled code and package it in its distributable format, such as a JAR/WAR/EAR.

5. **verify** - run any checks on results of integration tests to ensure quality criteria are met

6. **install** - install the package into the local maven repository, for use as a dependency in other projects locally

7. **deploy** - done in the build environment, copies the final package to the remote repository for sharing with other developers and projects.


**site** - Generates project documentation and reports, usually in HTML format. Lifecycle handles the creation of your project's web site.


Ex:
mvn validate

mvn clean

mvn test

mvn package

mvn install

mvn deploy

mvn site
