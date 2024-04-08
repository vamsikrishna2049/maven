# maven
Maven is an open-source build automation and project management tool widely used for Java applications. 
As a build automation tool, it automates the source code compilation and dependency management, assembles binary codes into packages, and executes test scripts.

**Understanding the problem without Maven**
There are many problems that we face during the project development. They are discussed below:

**1) Adding set of Jars in each project:** 
	In case of struts, spring, hibernate frameworks, we need to add set of jar files in each project. It must include all the dependencies of jars also.
**2) Creating the right project structure:** 
	We must create the right project structure in servlet, struts etc, otherwise it will not be executed.
**3) Building and Deploying the project:** 
	We must have to build and deploy the project so that it may work.

**Build Tools**
------------------
We have different build tools like ANT, Maven, Graddle and so on.

**Why we're usig ANT agnaist Maven?**
 ANT Tool was depricated, due to it won't support versioning. Due to this it was not survived in the market.

**What is the Difference Between Maven and ANT?**
1. Both maven and ANT are build tools works only for java projects.
2. Maven has life cycle. ANT has no life cycle.
3. Maven works on project object model (pom.xml), while ANT has build.xml file.
4. Defaultly maven has junit test cases. while ANT has no checks junit test cases.
5. Maven has number of plugins (these plugins are re-usable and having lot of features). ANT has Scripts and No re-usable.
6. Maven checks the dependencies. ANT has no dependencies.
7. maven is a It is mainly a project management tool, where as ant is mainly a build tool.	

**Note:**	
	For every project, only one pom.xml. (It must be mentioned as **pom.xml** only). This pom.xml will be written by Developers. we will edit this pom.xml file at properties(sonar url) and distribution management(Nexus repository) sections.
 	We have 2 different pom.xml files (one will be visible{Developer's pom.xml} and other one will not visible{super pom/parent pom}).
	The "super POM" (Project Object Model) in Apache Maven is a concept that serves as the default POM for all Maven projects. It's not specifically created when Maven installs, but it exists inherently within Maven's structure. All Maven projects implicitly inherit from the super POM

**Input:**
----------
**pom.xml (Project Object Model.xml)**
This file contains essential project information, defines project dependencies, specifies the build process, and configures plugins.

**Project Information:** 
groupId				->	CLient Name/Project Name		->	amazon
artifactId			->	Feature Name				->	amazon pay
version				->	three fields(major.minor.hotfix/bug)	->	1.0.5
and packaging type 		->	war/jar/ear(Only one need to mention)	->	jar
all these are uniquely identify the project and its artifacts.

**Dependencies:** Dependencies required by the project, including external libraries and frameworks.

**Build Configuration:** Maven uses the pom.xml file to define the project's build lifecycle and process. 
This includes configurations for compiling source code, running tests, packaging the project into various formats (e.g., JAR, WAR), and executing other build-related tasks.

**Plugin Configuration:** Plugins extend Maven's functionality and provide additional capabilities for the build process. 
The pom.xml file specifies which plugins are used and how they should be configured. Plugins can perform tasks such as code generation, code analysis, deployment, and more.

**Output:**
As per the pom.xml file configuration, it will generate the 
	Java projects into a JAR file
	Web applications into a WAR file
	Enterprise applications into a EAR files
	Archives like tar/zip
	Test Reports (XML, HTML, or plain text)		etc..

**Note:**
	Generated Output file will be created inside the target folder.
	Default home directory on maven
		cd /usr/share/apache-maven/

**Maven Repository**
A maven repository is a directory of packaged JAR file with pom.xml file. 
Maven searches for dependencies in the repositories. 

There are 3 types of maven repository:
1. Local Repository	-> installing from online to your system
2. Central Repository	-> Organization level (infy/ibm/tcs) - web access
3. Remote Repository	-> Our local machine

**Maven searches for the dependencies in the following order:**
Local repository then Central repository then Remote repository.
![image](https://github.com/vamsikrishna2049/maven/assets/118727057/3d727ea1-c235-4c44-98d0-1fe6ab9aabff)

**maven repositories**
If dependency is not found in these repositories, maven stops processing and throws an error.

**1) Maven Local Repository**
Maven local repository is located in your local system. It is created by the maven when you run any maven command.

By default, maven local repository is **%USER_HOME%/.m2 directory**. For example: **C:\Users\SSS IT\.m2**.
![image](https://github.com/vamsikrishna2049/maven/assets/118727057/91e8208d-c0f0-40b5-a0c0-046ba19a15c9)

**maven local repository**
Update location of Local Repository
We can change the location of maven local repository by changing the **settings.xml** file. It is located in **MAVEN_HOME/conf/settings.xml**, for example: **E:\apache-maven-3.1.1\conf\settings.xml**.

<settings>
    <localRepository>C:\M2</localRepository>
</settings>

**2) Maven Central Repository**
Whenever you run a build job, maven first tries to find dependency from the local repository. 
If it is not there, then, by default, maven will trigger the download from this central repository location.
Maven central repository is located on the web. It has been created by the apache maven community itself.
Maven central repository is located at https://repo1.maven.org/maven2/

**Note:**
	To override this default location, you can make changes to your settings.xml file to use one or more mirrors.
	You do not need to make any special configuration to allow access to the central repository, except network proxy settings if you are behind any firewall.

**3) Maven Remote Repository**
Apart from the central repository, you may have needed artifacts deployed in other remote locations. 
For example, in your corporate office, there may be projects or modules specific to the organization only. In this case, the organization can create a remote repository and deploy the private artifacts.
This remote repository will be accessible only inside the organization.

These Maven remote repository work exactly the same way as Maven’s central repository. 
Whenever an artifact is needed from these repositories, it is first downloaded to the developer’s local repository and then it is used.

<repositories>
   <repository>
       <id>org.source.repo</id>
       <url>https://maven.orgName.com/maven2/</url>
   </repository>
</repositories>

**Note:**
	You can search any repository from Maven official website mvnrepository.com.


**Maven Build Life Cycle**
A Build Lifecycle is a well-defined sequence of phases, which define the order in which the goals are to be executed. Here phase represents a stage in life cycle.
As an example, a typical Maven Build Lifecycle consists of the following sequence of phases.

**Maven life cycle**
3 Stages
	1. Default
	2. Clean
	3. Site

**1. Default** handles project build and deployment
	 validate, compile, test(junit), package(war/ear/jar), verify, install, deploy
	In Default Cycle, entire source(GITHUB) will be taken and compile the code. 

**2. Clean** handles project cleaning
	preclean, clean, post clean
	preclean: In this stage, maven will check any existing package files are available or not
	clean: If any packages are available then it will clean here.
	post clean: Newly Generated package file will be placed here.		
   
**3. Site** handles the creation of project site documentation
	pre-site, site, post-site, site-deploy
	pre-site: 
	site:
	post-site:
	site-deploy: Generated pacakage file will be placed in tomcat server.


**Phase			Handles				Description**
prepare-resources	resource copying		Resource copying can be customized in this phase.
validate		Validating the information	Validates if the project is correct and if all necessary information is available.
compile			compilation			Source code compilation is done in this phase.
Test			Testing				Tests the compiled source code suitable for testing framework.
package			packaging			This phase creates the JAR/WAR package as mentioned in the packaging in POM.xml.
install			installation			This phase installs the package in local/remote maven repository.
Deploy			Deploying			Copies the final package to the remote repository.


**mvn clean package:**
  It will build the package as per the pom.xml file
  Build sucess/ Failure



**maven commands**
In pwd, pom.xml must be there inorder to execute the maven commands.
mvn compile
mvn compile verify clean


**What is differences between snapshots and releases?**
**Release:**
In side the pom.xml file, we will mention the versionID
Ex:
	1.0.5 It will be going to release
Release maintains the versions.

**snapshots**
In side the pom.xml file, we will mention the versionID
Ex:
	1.0.5-SNAPSHOT (as itis) - under development process.
Snapshots won't maintain any versions.




 
