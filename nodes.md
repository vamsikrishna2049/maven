In Maven, goals are tasks that can be executed during the build process. Maven uses the concept of plugins to provide these goals. Some common Maven goals include:

1. **clean**: Deletes the `target` directory which contains the compiled bytecode, generated source files, and other build artifacts.

2. **compile**: Compiles the source code of the project.

3. **test**: Runs the unit tests for the project using a suitable unit testing framework.

4. **package**: Packages the compiled code into a distributable format, such as a JAR or WAR file.

5. **install**: Installs the package into the local Maven repository, making it available for other projects locally.

6. **deploy**: Copies the final package to the remote repository for sharing with other developers and projects.

7. **site**: Generates project documentation and reports, usually in HTML format.

These goals are executed using Maven commands in the form of `mvn <goal>` where `<goal>` is replaced with the specific goal you want to execute.
Maven's flexibility allows developers to define custom goals and bind them to different phases of the build lifecycle to fit specific project needs.

mvn validate

mvn clean

mvn test

mvn package

mvn install

mvn deploy

mvn site
