# Simple JavaFX Maven Archetype

The project is a Maven archetype for creating a simple JavaFX application.

### Prerequisites

* JDK 17
* Maven 3

### Create a project from a local repository

Once you have installed the archetype locally, you can use it to create a new project using:

```
mvn archetype:generate \
        -DarchetypeGroupId=org.openjfx \
        -DarchetypeArtifactId=javafx-archetype-simple \
        -DarchetypeVersion=0.0.8 \
        -DgroupId=groupid \
        -DartifactId=artifactId \
        -Dversion=version
```

The following properties can be customized while creating the project:

| Property                    | Default Value |
| --------------------------- | ------------- |
| javafx-version              | 17            |
| javafx-maven-plugin-version | 0.0.8         |
| add-debug-configuration     | N             |

For example:

```
mvn archetype:generate \
        -DarchetypeGroupId=org.openjfx \
        -DarchetypeArtifactId=javafx-archetype-fxml \
        -DarchetypeVersion=0.0.8 \
        -DgroupId=groupid \
        -DartifactId=artifactId \
        -Dversion=version \
        -Djavafx-version=17-ea+14 \
        -Dadd-debug-configuration=Y
```
