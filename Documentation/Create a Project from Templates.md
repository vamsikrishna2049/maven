A **Maven Archetype** is a template of a project which can be used to create new Maven projects. It provides a predefined set of files and configurations that guide the structure of the new project. Archetypes are often used for creating projects with standard structures, such as web applications, libraries, or microservices.

### Key Concepts
- **Archetype Plugin**: This is the plugin that helps in creating new projects from archetypes.
- **Archetype Catalog**: A collection of archetypes that are available for project generation. It can be local or remote (e.g., Maven Central).

### Basic Commands

1. **List Available Archetypes**
   To list available archetypes from the remote repository, you can use the following command:

   ```bash
   mvn archetype:generate -DarchetypeCatalog=remote
   ```

### Common Archetypes
- **maven-archetype-quickstart**: An archetype to generate a sample Maven project. (A basic Java project with a `HelloWorld` class.)
- **maven-archetype-archetype**: An archetype to generate a sample archetype.
- **maven-archetype-j2ee-simple**: An archetype to generate a simplified sample J2EE application.
- **maven-archetype-plugin**: An archetype to generate a sample Maven plugin.
- **maven-archetype-plugin-site**: An archetype to generate a sample Maven plugin site.
- **maven-archetype-portlet**: An archetype to generate a sample JSR-268 Portlet.
- **maven-archetype-simple**:An archetype to generate a simple Maven project.
- **maven-archetype-site**:An archetype to generate a sample Maven site which demonstrates some of the supported document types like APT, Markdown, XDoc, and FML and demonstrates how to i18n your site.
- **maven-archetype-site-simple**: An archetype to generate a sample Maven site.
- **maven-archetype-site-skin**: An archetype to generate a sample Maven Site Skin.
- **maven-archetype-webapp**: An archetype to generate a sample Maven Webapp project.

2. **Creating a New Project from an Archetype**
   To create a new project from an archetype, you use the `mvn archetype:generate` command. Here's the basic syntax:

   ```bash
   mvn archetype:generate -DarchetypeGroupId=org.apache.maven.archetypes -DarchetypeArtifactId=maven-archetype-quickstart -DarchetypeVersion=1.5
   ```
   Maven to create a new project using the maven-archetype-quickstart archetype (version 1.5), which is a basic template for a Java application.

   -DarchetypeGroupId=org.apache.maven.archetypes
   -D: This flag is used to define a system property in Maven.
   archetypeGroupId=org.apache.maven.archetypes: This defines the group ID of the archetype to use. In this case, it's org.apache.maven.archetypes, which is the group ID for Maven's predefined archetypes.

   -archetypeArtifactId=maven-archetype-quickstart: This specifies the artifact ID of the archetype. Here, it is maven-archetype-quickstart, which is a standard archetype used to create a simple Java application project. This archetype typically creates a project with:
   A basic HelloWorld Java class.
   A simple pom.xml file for the project’s configuration.
   A basic src/main/java directory structure.

   -archetypeVersion=1.5: This specifies the version of the archetype you want to use. In this case, it's version 1.5 of the maven-archetype-quickstart. The version ensures that Maven uses a specific release of the archetype template, which may have different configurations or templates compared to other versions.

# Structure:
project
|-- .mvn
|   |-- jvm.config
|   `-- maven.config
|-- pom.xml
`-- src
    |-- main
    |   `-- java
    |       `-- $package
    |           `-- App.java
    `-- test
        `-- java
            `-- $package
                `-- AppTest.java

# Note:
   Maven provides a number of predefined archetypes, such as `maven-archetype-quickstart` (for a simple Java application), `maven-archetype-webapp` (for web applications), and many more.

3. **Using a Specific Version of an Archetype**
   If you want to specify a version of an archetype, you can use the `-DarchetypeVersion` parameter:

   ```bash
   mvn archetype:generate -DgroupId=com.example -DartifactId=myproject -DarchetypeArtifactId=maven-archetype-quickstart -DarchetypeVersion=1.4
   ```

4. **Interactive Mode**
   By default, the `mvn archetype:generate` command runs in interactive mode, where Maven will prompt you for various parameters like `groupId`, `artifactId`, and `version`. If you want to skip this interaction, you can use the `-DinteractiveMode=false` flag.

   Example:
   ```bash
   mvn archetype:generate -DgroupId=com.example -DartifactId=myproject -DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=false
   ```

### Custom Archetypes
You can create your own archetypes to standardize project setups within your organization. The process involves:

1. **Create a Template Project**: Set up a Maven project with all the standard files and structure.
2. **Define the Archetype**: Use the `mvn archetype:create-from-project` command to convert your template project into an archetype.
3. **Deploy the Archetype**: Once created, you can deploy your custom archetype to a local or remote repository (e.g., your company’s Nexus repository).
4. **Use the Archetype**: Finally, use the `mvn archetype:generate` command to generate new projects from your custom archetype.

### Example of Creating a Custom Archetype

1. Create a sample project that will be the base for your archetype.
2. Run the following command to create an archetype from the sample project:

   ```bash
   mvn archetype:create-from-project
   ```

   This will generate an archetype from the structure of the project.

3. The generated archetype will be placed in the `target/generated-sources/archetype` directory. You can then install it into your local repository:

   ```bash
   mvn install
   ```

4. Once installed, you can use this archetype to create new projects.

### Archetype Catalogs

- **Local Catalog**: This is the list of archetypes available in your local Maven repository. It’s typically used when you’ve installed custom archetypes locally.
- **Remote Catalog**: This is a remote catalog of archetypes, typically from repositories like Maven Central or private repositories.

You can specify the catalog using the `-DarchetypeCatalog` flag:

```bash
mvn archetype:generate -DarchetypeCatalog=remote
```

### Example Maven Archetype Documentation
To get more details about Maven archetypes, you can refer to the [official Maven documentation](https://maven.apache.org/archetypes/). It provides detailed instructions on using archetypes, creating them, and customizing them to your needs.
