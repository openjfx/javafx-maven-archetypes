#!/usr/bin/env bash

# Exit immediately if any command in the script fails
set -e

# Configure GIT
git config --global user.name "Gluon Bot"
git config --global user.email "githubbot@gluonhq.com"

# Decrypt encrypted files
openssl aes-256-cbc -K $encrypted_d5986a9125cf_key -iv $encrypted_d5986a9125cf_iv -in .ci/gpg_keys.tar.enc -out gpg_keys.tar -d
if [[ ! -s gpg_keys.tar ]]
   then echo "Decryption failed."
   exit 1
fi
tar xvf gpg_keys.tar

# Release artifacts
cp .travis.settings.xml $HOME/.m2/settings.xml && mvn deploy -DskipTests=true -B -U -Prelease

# Update version by 1
newVersion=${TRAVIS_TAG%.*}.$((${TRAVIS_TAG##*.} + 1))

# Update project version to next snapshot version
mvn versions:set -DnewVersion=$newVersion-SNAPSHOT -DgenerateBackupPoms=false

git commit pom.xml -m "Prepare development of $newVersion"
git push https://gluon-bot:$GITHUB_PASSWORD@github.com/$TRAVIS_REPO_SLUG HEAD:master