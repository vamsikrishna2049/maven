Maven provides a set of commands (or goals) to manage different stages of your project’s lifecycle, from cleaning up previous builds to compiling code and packaging your application. Below is an overview of the most commonly used Maven commands (goals) that you can run from the command line.

### Common Maven Commands (Goals):

1. **`mvn clean`**:
   - **Purpose**: Cleans the project by deleting the `target/` directory (or the directory where compiled files are stored).
   - **Usage**: Removes all the files generated in previous builds, ensuring that the next build is fresh.
   - **Example**: 
     ```bash
     mvn clean
     ```

2. **`mvn compile`**:
   - **Purpose**: Compiles the source code of the project (i.e., the `.java` files in `src/main/java`).
   - **Usage**: This command only compiles the code without packaging or testing.
   - **Example**:
     ```bash
     mvn compile
     ```

3. **`mvn test`**:
   - **Purpose**: Runs the tests defined in your project (usually unit tests). This command will use the Maven Surefire Plugin to run the tests.
   - **Usage**: Useful to check if your tests are passing after code changes.
   - **Example**:
     ```bash
     mvn test
     ```

4. **`mvn package`**:
   - **Purpose**: Packages the compiled code into a distributable format (like a JAR or WAR file, depending on the packaging type specified in `pom.xml`).
   - **Usage**: This command creates the final artifact (JAR, WAR, etc.) for deployment.
   - **Example**:
     ```bash
     mvn package
     ```

5. **`mvn install`**:
   - **Purpose**: Installs the built artifact (JAR, WAR, etc.) into your local Maven repository (typically `~/.m2/repository`).
   - **Usage**: This is helpful when you want to use the generated artifact as a dependency in other projects locally.
   - **Example**:
     ```bash
     mvn install
     ```

6. **`mvn deploy`**:
   - **Purpose**: Deploys the packaged artifact to a remote repository (e.g., Maven Central or a custom repository).
   - **Usage**: This command is often used for CI/CD pipelines, where the artifact needs to be uploaded to a repository.
   - **Example**:
     ```bash
     mvn deploy
     ```

7. **`mvn validate`**:
   - **Purpose**: Validates that the project is correctly configured. This command checks that all necessary information is provided (e.g., correct versions, dependencies, etc.).
   - **Usage**: Useful to verify the correctness of the `pom.xml` before starting a build.
   - **Example**:
     ```bash
     mvn validate
     ```

8. **`mvn site`**:
   - **Purpose**: Generates the project’s site documentation based on the information in the `pom.xml` and other resources.
   - **Usage**: This command generates HTML documentation about the project.
   - **Example**:
     ```bash
     mvn site
     ```

9. **`mvn clean install`**:
   - **Purpose**: Performs both the `clean` and `install` phases in a single command. First, it cleans up the project and then installs the artifact to the local repository.
   - **Usage**: This is commonly used when you want to ensure a fresh build and make the artifact available locally.
   - **Example**:
     ```bash
     mvn clean install
     ```

10. **`mvn clean package`**:
    - **Purpose**: Cleans the project and then packages the artifact (such as a WAR or JAR file).
    - **Usage**: This command ensures that you're working with a fresh build and then generates the packaged artifact.
    - **Example**:
      ```bash
      mvn clean package
      ```

11. **`mvn dependency:tree`**:
    - **Purpose**: Displays the project’s dependency tree, which shows the hierarchy of dependencies and their versions.
    - **Usage**: Useful to debug dependency-related issues, like conflicts.
    - **Example**:
      ```bash
      mvn dependency:tree
      ```

12. **`mvn exec:java`**:
    - **Purpose**: Runs a Java program from the project’s main class using the `exec-maven-plugin`.
    - **Usage**: This command is useful to run a specific class (for example, a `main()` method in your project).
    - **Example**:
      ```bash
      mvn exec:java -Dexec.mainClass="com.example.Main"
      ```

13. **`mvn clean verify`**:
    - **Purpose**: Cleans the project and then verifies that the project is valid, including running tests and checks.
    - **Usage**: This command is used for CI environments to ensure the project is correctly built and validated.
    - **Example**:
      ```bash
      mvn clean verify
      ```

14. **`mvn help:effective-pom`**:
    - **Purpose**: Displays the "effective" `pom.xml`, which includes all inherited configurations, plugin versions, and property values from parent POMs.
    - **Usage**: This is helpful to debug the actual effective configuration used by Maven.
    - **Example**:
      ```bash
      mvn help:effective-pom
      ```

15. **`mvn clean install -DskipTests`**:
    - **Purpose**: Skips running tests during the `install` phase. This can speed up the build process when you're confident that the tests are working fine and don't need to be re-executed.
    - **Usage**: Often used in CI/CD pipelines for faster builds.
    - **Example**:
      ```bash
      mvn clean install -DskipTests
      ```

### Maven Lifecycle Phases:

Maven operates based on a lifecycle, and these goals correspond to different phases within that lifecycle. Some key phases include:
1. **`validate`** - Validate the project is correct and all necessary information is available.
2. **`compile`** - Compile the source code.
3. **`test`** - Run tests.
4. **`package`** - Package the compiled code into a distributable format.
5. **`verify`** - Run checks to verify the validity of the project.
6. **`install`** - Install the artifact into the local repository.
7. **`deploy`** - Deploy the artifact to a remote repository.

Each phase in the lifecycle can invoke multiple goals, and you can invoke any goal independently. For example, running `mvn package` will automatically invoke all previous phases like `validate`, `compile`, and `test` before packaging the project.

To see a full list of Maven goals, you can run:

```bash
mvn help:describe -Dgoal=<goal-name>
```

Replace `<goal-name>` with the name of the goal you want to learn more about. For example:
```bash
mvn help:describe -Dgoal=install
```
