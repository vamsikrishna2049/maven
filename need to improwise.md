# Maven Lifecycle Documentation
Apache Maven is a build automation tool used primarily for Java projects. It simplifies project build, dependency management, and project configuration. 
One of Maven's core features is its **lifecycle**, a predefined set of phases that handle the build, cleaning, and documentation generation processes.

Maven provides three primary lifecycles:
1. default – Responsible for project build and deployment.
2. clean – Responsible for cleaning the project (removing previous build artifacts).
3. site – Responsible for generating project documentation.

### Maven Phases
Each lifecycle is divided into phases, and each phase corresponds to a specific goal or task, such as compiling code, running tests, packaging the code, or cleaning the project.

## 1. Default Lifecycle
The **default lifecycle** is the most important lifecycle in Maven. It handles the main tasks related to building and deploying your project.

### Phases in the Default Lifecycle

| **Phase**   | **Description**                                                                                           |
|-------------|-----------------------------------------------------------------------------------------------------------|
| `validate`  | Validates the project's structure and configuration.                                                      |
| `compile`   | Compiles the source code of the project.                                                                   |
| `test`      | Runs tests using a testing framework like JUnit or TestNG.                                                 |
| `package`   | Packages the compiled code into a distributable format, such as a JAR, WAR, or EAR.                       |
| `verify`    | Verifies the packaged code to ensure it meets quality and validity checks.                                 |
| `install`   | Installs the packaged artifact into the local Maven repository (`~/.m2/repository`) for use by other projects.|
| `deploy`    | Deploys the packaged artifact to a remote repository for sharing with other developers or projects.        |

### Example Command
When you run the following command:
```xml
mvn clean install
```

It will execute all the phases in the **clean** lifecycle followed by all the phases in the **default** lifecycle, as follows:
1. **clean lifecycle**:
   - `pre-clean`
   - `clean`
   - `post-clean`

2. **default lifecycle**:
   - `validate`
   - `compile`
   - `test`
   - `package`
   - `verify`
   - `install`

---

## 2. Clean Lifecycle
The **clean lifecycle** handles tasks related to cleaning up the project, primarily by removing files created by previous builds (like the `target/` directory).

### Phases in the Clean Lifecycle
| **Phase**     | **Description**                                         |
|---------------|---------------------------------------------------------|
| `pre-clean`   | Executes processes before the clean phase.              |
| `clean`       | Removes the `target/` directory and other generated files. |
| `post-clean`  | Executes processes after the clean phase.               |

### Example Command
```xml
mvn clean
```

This will execute the following phases in order:
1. `pre-clean`
2. `clean`
3. `post-clean`

---

## 3. Site Lifecycle
The **site lifecycle** is responsible for generating the project's documentation and deploying it to a server.

### Phases in the Site Lifecycle
| **Phase**     | **Description**                                         |
|---------------|---------------------------------------------------------|
| `pre-site`    | Executes processes before the site generation.         |
| `site`        | Generates the project’s site documentation.            |
| `post-site`   | Executes processes after the site has been generated.  |
| `site-deploy` | Deploys the generated site to a remote server or repository. |

### Example Command
```xml
mvn site
```

This will execute the following phases in order:
1. `pre-site`
2. `site`
3. `post-site`

---

## Understanding Phase Execution
- When you run a command like `mvn clean install`, Maven executes the phases of the **clean** lifecycle first (if specified), followed by the phases of the **default** lifecycle.
- If you run a command like `mvn compile`, only the `validate` and `compile` phases are executed in sequence, skipping the later phases (e.g., `test`, `package`).
- Phases are executed in their defined order. If you run a phase like `install`, Maven will automatically execute all the previous phases (e.g., `validate`, `compile`, `test`, `package`, `verify`) before `install`.


## Phase Dependency and Execution Order
Maven’s lifecycle phases follow a logical order, where each phase depends on the one before it. This ensures that tasks are performed in the correct sequence. For example:
- **`mvn install`** will first run all the phases from `validate` to `package`, and then run `install`.
- **`mvn clean`** will remove all generated files from the previous build, ensuring the build starts from a clean slate.
- **`mvn deploy`** will execute the `install` phase first (to make sure the artifact is available locally) and then deploy it to the remote repository.

## Customizing Maven Lifecycle
While Maven comes with predefined lifecycles, you can customize it by creating your own goals and binding them to specific phases of the lifecycle. This can be done using plugins.
For example, the **Maven Compiler Plugin** compiles the code during the `compile` phase, and the **Maven Surefire Plugin** runs unit tests during the `test` phase. You can configure these plugins in your `pom.xml` file to specify additional behavior.

```xml
<plugins>
    <plugin>
        <groupId>org.apache.maven.plugins</groupId>
        <artifactId>maven-compiler-plugin</artifactId>
        <version>3.8.1</version>
        <configuration>
            <source>1.8</source>
            <target>1.8</target>
        </configuration>
    </plugin>
</plugins>
```

---

## Summary of Key Lifecycles and Phases
### Default Lifecycle Phases
- `validate` → `compile` → `test` → `package` → `verify` → `install` → `deploy`

### Clean Lifecycle Phases
- `pre-clean` → `clean` → `post-clean`

### Site Lifecycle Phases
- `pre-site` → `site` → `post-site` → `site-deploy`

## Conclusion
The Maven lifecycle is a fundamental aspect of the Maven build system, providing a structured way to manage your project’s build, clean, and documentation generation processes. Understanding these lifecycles and phases is key to automating and customizing the build process, allowing for efficient and repeatable builds.
By knowing the predefined lifecycles and how Maven handles phase execution, you can optimize your workflow and ensure that your projects follow best practices in terms of build automation.
