#!/bin/bash

set -e

if [ -z "$JDK8" ] || ! [ -f "$JDK8/bin/java" ]; then
  echo Specify JDK8 property to point to JDK 8 installation: $JDK8
  exit 1
fi

if [ -z "$JDK11" ] || ! [ -f "$JDK11/bin/java" ]; then
  echo Specify JDK11 property to point to JDK 11 installation: $JDK11
  exit 2
fi

ARCH_VERSION=$(mvn help:evaluate -Dexpression=project.version -q -DforceStdout)

echo "Removing local catalog for javafx archetypes version: $ARCH_VERSION"
rm -rf $HOME/.m2/repository/org/openjfx/*archetype*/$ARCH_VERSION

JAVA_HOME=$JDK8 mvn -q install
echo "Installation of local catalog for javafx archetypes $ARCH_VERSION successful."
rm -rf target
mkdir -p target
cd target

function setupExit() {
    sed -i -e 's/stage.show();/stage.show();System.exit(0);/g' $1
}

function generate8() {
    if [ -z "$1" ]; then
       echo Expecting argument: $1
       exit 3
    fi
    echo Generating with javafx-version=$1
    mvn -q archetype:generate \
        -DarchetypeCatalog=local \
        -DinteractiveMode=false \
        -DarchetypeGroupId=org.openjfx \
        -DarchetypeArtifactId=javafx-archetype-simple \
        -DarchetypeVersion=$ARCH_VERSION \
        -DgroupId=org.openjfx.demo \
        -DartifactId=test$1 \
        -Dversion=1.0-SNAPSHOT \
        -Djavafx-version=$1
    setupExit test$1/src/main/java/org/openjfx/demo/App.java

    echo "  Launching on JDK8"
    JAVA_HOME=$JDK8 mvn -q -f test8/ clean package javafx:run
    echo "  Launching on JDK11"
    JAVA_HOME=$JDK11 mvn -q -f test8/ clean package javafx:run
}

generate8 8
generate8 1.8

function generate11() {
    echo Generating with javafx-version=11
    mvn -q archetype:generate \
        -DarchetypeCatalog=local \
        -DinteractiveMode=false \
            -DarchetypeGroupId=org.openjfx \
        -DarchetypeArtifactId=javafx-archetype-simple \
        -DarchetypeVersion=$ARCH_VERSION \
        -DgroupId=org.openjfx.demo \
        -DartifactId=test11 \
        -Dversion=1.0-SNAPSHOT \
        -Djavafx-version=11
        setupExit test11/src/main/java/org/openjfx/demo/App.java

    echo "  Launching on JDK8 and expecting failure"
    (JAVA_HOME=$JDK8 mvn -q -f test11 clean package javafx:run && exit 3) || echo Previous failure is expected
    echo "  Launching on JDK11"
    JAVA_HOME=$JDK11 mvn -q -f test11 clean package javafx:run
}

generate11
