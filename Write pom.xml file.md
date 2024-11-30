# Example:
```xml
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/maven-v4_0_0.xsd">
    
    <!-- Model Version for Maven -->
    <modelVersion>4.0.0</modelVersion>

    <!-- Group and Artifact Information for Maven -->
    <groupId>com.mt</groupId> <!-- The base package or organization identifier -->
    <artifactId>maven-web-application</artifactId> <!-- The project name or identifier -->
    <packaging>war</packaging> <!-- The packaging type for the project, WAR for web applications -->
    <version>1.0.0-SNAPSHOT</version> <!-- Version of the project -->
    !--<version>1.0.0</version --> <!-- Version of the project -->

    <!-- Name and Description of the Project -->
    <name>maven-web-application</name>
    <description>Maven Web Project for Java Project</description>

    <!-- Organization Information -->
    <organization>
        <name>Practise Domain</name> <!-- The name of the organization -->
        <url>http://practisedomain.cloud</url> <!-- The URL of the organization -->
    </organization>

    <!-- Properties Section -->
    <properties>
        <!-- Project Specific Properties -->
        <jdk.version>1.8</jdk.version> <!-- Java version used for the project -->
        <spring.version>5.1.2.RELEASE</spring.version> <!-- Version of Spring Framework -->
        <junit.version>4.11</junit.version> <!-- Version of JUnit used for testing -->
        <log4j.version>1.2.17</log4j.version> <!-- Version of Log4j logging framework -->
        
        <!-- SonarQube Configuration for Code Quality Analysis -->
        <sonar.host.url>http://18.138.81.149:9000/</sonar.host.url> <!-- SonarQube server URL -->
        <sonar.login>admin</sonar.login> <!-- SonarQube login -->
        <sonar.password>passw0rd</sonar.password> <!-- SonarQube password -->

        <!-- Encoding for Source Files and Report Outputs -->
        <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
        <project.reporting.outputEncoding>UTF-8</project.reporting.outputEncoding>
    </properties>

    <!-- Dependencies Section -->
    <dependencies>
        <!-- JSON Library Dependency -->
        <dependency>
            <groupId>org.json</groupId> <!-- Group ID for JSON library -->
            <artifactId>json</artifactId> <!-- Artifact ID for JSON library -->
            <version>20160212</version> <!-- Version of JSON library -->
        </dependency>

        <!-- JUnit for Unit Testing (Test Scope) -->
        <dependency>
            <groupId>junit</groupId>
            <artifactId>junit</artifactId>
            <version>3.8.1</version> <!-- JUnit version -->
            <scope>test</scope> <!-- Indicates that this dependency is only needed during tests -->
        </dependency>

        <!-- Servlet API (Provided Scope) -->
        <dependency>
            <groupId>javax.servlet</groupId> <!-- Group ID for Servlet API -->
            <artifactId>javax.servlet-api</artifactId> <!-- Artifact ID for Servlet API -->
            <version>3.1.0</version> <!-- Version of the Servlet API -->
            <scope>provided</scope> <!-- Servlet API is already provided by the container (e.g., Tomcat) -->
        </dependency>

        <!-- Mockito for Mocking in Unit Tests (Test Scope) -->
        <dependency>
            <groupId>org.mockito</groupId> <!-- Group ID for Mockito -->
            <artifactId>mockito-core</artifactId> <!-- Artifact ID for Mockito -->
            <version>1.9.5</version> <!-- Version of Mockito -->
            <scope>test</scope> <!-- Mockito is only needed during testing -->
        </dependency>

        <!-- Spring Core Dependency (For Core Spring Framework functionality) -->
        <dependency>
            <groupId>org.springframework</groupId> <!-- Group ID for Spring Framework -->
            <artifactId>spring-core</artifactId> <!-- Artifact ID for Spring Core -->
            <version>${spring.version}</version> <!-- Version defined in the properties section -->
        </dependency>

        <!-- Spring Web Dependency (For web-based functionality in Spring) -->
        <dependency>
            <groupId>org.springframework</groupId>
            <artifactId>spring-web</artifactId>
            <version>${spring.version}</version>
        </dependency>

        <!-- Spring WebMVC Dependency (For Spring MVC Framework) -->
        <dependency>
            <groupId>org.springframework</groupId>
            <artifactId>spring-webmvc</artifactId>
            <version>${spring.version}</version>
        </dependency>

        <!-- Spring Context Dependency (For Spring Context functionality) -->
        <dependency>
            <groupId>org.springframework</groupId>
            <artifactId>spring-context</artifactId>
            <version>${spring.version}</version>
        </dependency>

        <!-- Provided Servlet API (Again, provided by the container) -->
        <dependency>
            <groupId>javax.servlet</groupId>
            <artifactId>javax.servlet-api</artifactId>
            <version>3.1.0</version>
            <scope>provided</scope>
        </dependency>
    </dependencies>

    <!-- Distribution Management (Nexus Repository Configuration) -->
    <distributionManagement>
        <!-- Release Repository Configuration -->
        <repository>
            <id>nexus</id> <!-- Repository ID -->
            <name>Practise Domain Releases Nexus Repository</name> <!-- Repository name -->
            <url>http://13.212.71.229:9980/practisedomain/repository/practisedomain-snapshot/</url> <!-- Repository URL -->
        </repository>

        <!-- Snapshot Repository Configuration (For Development versions) -->
        <snapshotRepository>
            <id>nexus</id>
            <name>Practise Domain Snapshot Nexus Repository</name>
            <url>http://240.212.71.229:9980/practisedomain/repository/practisedomain-release/</url>
        </snapshotRepository>
    </distributionManagement>

    <!-- Build Configuration -->
    <build>
        <!-- Final Name of the Built Artifact (WAR file) -->
        <finalName>maven-web-application</finalName>

        <!-- Plugins used during the build process -->
        <plugins>

            <!-- Maven WAR Plugin for Packaging Web Applications -->
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-war-plugin</artifactId>
                <version>3.3.2</version> <!-- Version of the WAR plugin -->
            </plugin>

            <!-- Maven Compiler Plugin for Compiling Java Code -->
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-compiler-plugin</artifactId>
                <version>3.3</version> <!-- Version of the Compiler plugin -->
                <configuration>
                    <source>${jdk.version}</source> <!-- Specifies the Java version to use for compiling source code -->
                    <target>${jdk.version}</target> <!-- Specifies the Java version to use for compiled bytecode -->
                </configuration>
            </plugin>

            <!-- Jetty Maven Plugin (For Running the Application Locally) -->
            <plugin>
                <groupId>org.eclipse.jetty</groupId>
                <artifactId>jetty-maven-plugin</artifactId>
                <version>9.2.11.v20150529</version> <!-- Jetty version -->
                <configuration>
                    <scanIntervalSeconds>10</scanIntervalSeconds> <!-- Time interval for reloading the application -->
                    <webApp>
                        <contextPath>/maven-web-application</contextPath> <!-- The context path for the application -->
                    </webApp>
                </configuration>
            </plugin>

            <!-- Maven Eclipse Plugin (For Eclipse IDE Integration) -->
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-eclipse-plugin</artifactId>
                <version>2.9</version> <!-- Version of the Eclipse plugin -->
                <configuration>
                    <downloadSources>true</downloadSources> <!-- Downloads sources of dependencies -->
                    <downloadJavadocs>true</downloadJavadocs> <!-- Downloads Javadoc of dependencies -->
                    <wtpversion>2.0</wtpversion> <!-- Version for Web Tools Platform integration -->
                    <wtpContextName>maven-web-application</wtpContextName> <!-- The context name in Eclipse -->
                </configuration>
            </plugin>
        </plugins>
    </build>
</project>
```

# Step 1: Define Project Coordinates

```xml
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/maven-v4_0_0.xsd">
    
    <modelVersion>4.0.0</modelVersion>

    <!-- Project coordinates -->
    <groupId>com.example</groupId>       <!-- Group or organization identifier -->
    <artifactId>todo-api</artifactId>    <!-- The name of the project/artifact -->
    <version>1.0.0</version>             <!-- The version of the project -->
    <packaging>war</packaging>           <!-- The type of packaging (JAR, WAR, etc.) -->
    
    <name>Todo API</name>                <!-- Display name of the project -->
</project>
```

# Step 2: Add Dependencies
```xml
<dependencies>
    <!-- Spring Framework dependencies -->
    <dependency>
        <groupId>org.springframework</groupId>
        <artifactId>spring-core</artifactId>
        <version>5.3.10</version> <!-- Use the latest version available -->
    </dependency>

    <!-- JUnit for testing -->
    <dependency>
        <groupId>junit</groupId>
        <artifactId>junit</artifactId>
        <version>4.13.2</version>
        <scope>test</scope> <!-- The dependency will only be used for testing -->
    </dependency>
</dependencies>
``` 

# Step 3: Define Build Configuration (Plugins)
```xml
<build>
    <plugins>
        <!-- Compiler plugin to specify Java version -->
        <plugin>
            <groupId>org.apache.maven.plugins</groupId>
            <artifactId>maven-compiler-plugin</artifactId>
            <version>3.8.1</version>
            <configuration>
                <source>1.8</source>    <!-- Java source version -->
                <target>1.8</target>    <!-- Java target version -->
            </configuration>
        </plugin>

        <!-- Exec plugin to run a main class (optional) -->
        <plugin>
            <groupId>org.codehaus.mojo</groupId>
            <artifactId>exec-maven-plugin</artifactId>
            <version>1.6.0</version>
            <executions>
                <execution>
                    <goals>
                        <goal>java</goal>
                    </goals>
                </execution>
            </executions>
            <configuration>
                <mainClass>com.example.Main</mainClass> <!-- Main class to run -->
            </configuration>
        </plugin>
    </plugins>
</build>
```

# Step 4: Define Properties (Optional)
```xml
<properties>
    <spring.version>5.3.10</spring.version>
    <jersey.version>2.35</jersey.version>
    <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
</properties>
```
