# Simple JavaFX Maven Archetype

The project is a Maven archetype for creating a simple JavaFX application.

### Prerequisites

* JDK 11
* Maven 3

### Create a project from a local repository

Once you have installed the archetype locally, you can use it to create a new project using:

```
mvn archetype:generate \
        -DarchetypeGroupId=org.openjfx \
        -DarchetypeArtifactId=javafx-archetype-simple \
        -DarchetypeVersion=0.0.1 \
        -DgroupId=groupid \
        -DartifactId=artifactId \
        -Dversion=version
```