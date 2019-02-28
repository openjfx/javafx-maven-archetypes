# Maven Archetypes for various JavaFX projects

The project contains multiple Maven archetypes for creating different types of JavaFX applications.

### Prerequisites

* JDK 11
* Maven 3

### Install archetype locally

To install all the archetypes in your local repository execute the following commands:

```
git clone https://github.com/openjfx/javafx-maven-archetypes.git
cd javafx-maven-archetypes
mvn clean install
```

This will install all the javafx archetypes in your local repository.

If you wish to install just one of the archetypes, you can add the name of the project by using `-pl`:

```
mvn clean install -pl javafx-archetype-simple
```

For more information on how to create a project from a local repository, please refer to
individual module's README.