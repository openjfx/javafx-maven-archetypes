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
        -DgroupId=groupid \
        -DartifactId=artifactId \
        -Dversion=1.0-SNAPSHOT
```

The following properties can be customized while creating the project:

| Property                    | Default Value |
| --------------------------- | ------------- |
| javafx-version              | 14            |
| javafx-maven-plugin-version | 0.0.5         |
