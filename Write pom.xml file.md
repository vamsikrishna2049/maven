# Example:
```xml
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/maven-v4_0_0.xsd">

    <modelVersion>4.0.0</modelVersion>

    <!-- Project Coordinates -->
    <groupId>com.practisedomain</groupId>
    <artifactId>practisedomain</artifactId>
    <version>1.0.0</version>
    <packaging>war</packaging>
    <description>Example AWS project</description>
    <name>Practisedomain AWS Project</name>

    <!-- Project Properties -->
    <properties>
        <jdk.version>1.8</jdk.version>
        <spring.version>5.3.8</spring.version>
    </properties>

    <!-- Organization Details -->
    <organization>
        <name>Practisedomain</name>
        <url>http://www.practisedomain.cloud</url>
    </organization>

    <!-- Project Dependencies -->
    <dependencies>
        <!-- Spring Core Dependency -->
        <dependency>
            <groupId>org.springframework</groupId>
            <artifactId>spring-core</artifactId>
            <version>${spring.version}</version>
        </dependency>

        <!-- Spring Web Dependency -->
        <dependency>
            <groupId>org.springframework</groupId>
            <artifactId>spring-web</artifactId>
            <version>${spring.version}</version>
        </dependency>

        <!-- Spring WebMVC Dependency -->
        <dependency>
            <groupId>org.springframework</groupId>
            <artifactId>spring-webmvc</artifactId>
            <version>${spring.version}</version>
        </dependency>

        <!-- Spring Context Dependency -->
        <dependency>
            <groupId>org.springframework</groupId>
            <artifactId>spring-context</artifactId>
            <version>${spring.version}</version>
        </dependency>

        <!-- Example Dependency (JUnit for testing) -->
        <dependency>
            <groupId>junit</groupId>
            <artifactId>junit</artifactId>
            <version>4.13.1</version>
            <scope>test</scope>
        </dependency>
    </dependencies>

    <!-- Distribution Management -->
    <distributionManagement>
        <!-- For Releases -->
        <repository>
            <id>Nexus Repository</id>
            <name>Releases Nexus Repository</name>
            <url>http://13.212.71.229:9980/practisedomain/repository/aws-project-release/</url>
        </repository>

        <!-- For Snapshots -->
        <snapshotRepository>
            <id>Nexus Repository</id>
            <name>Snapshots Nexus Repository</name>
            <url>http://13.212.71.229:9980/practisedomain/repository/aws-project-snapshot/</url>
        </snapshotRepository>
    </distributionManagement>

    <!-- Build Configuration -->
    <build>
        <finalName>practisedomain</finalName>  <!-- Specify the final name of the WAR file -->

        <plugins>
            <!-- Compiler Plugin -->
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-compiler-plugin</artifactId>
                <version>3.8.1</version>
                <configuration>
                    <source>${jdk.version}</source>
                    <target>${jdk.version}</target>
                </configuration>
            </plugin>

            <!-- WAR Plugin -->
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-war-plugin</artifactId>
                <version>3.3.1</version>
            </plugin>

            <!-- Jetty Plugin for running the web app locally -->
            <plugin>
                <groupId>org.eclipse.jetty</groupId>
                <artifactId>jetty-maven-plugin</artifactId>
                <version>9.2.11.v20150529</version>
                <configuration>
                    <scanIntervalSeconds>10</scanIntervalSeconds>
                    <webApp>
                        <contextPath>/practisedomain</contextPath>  <!-- Set context path -->
                    </webApp>
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
