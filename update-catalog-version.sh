#!/bin/sh
echo "Update archetype-catalog.xml";
if $2; then
    echo "archetype-catalog.xml not updated. Don't run 'mvn deploy' for snapshot artifact!: $3"
    exit 1;
fi
cat $1/../github-maven-repository/releases/archetype-catalog.xml \
        | sed -e "s/\<version>.*\<\/version>/\<version>$3\<\/version>/g"
echo "archetype-catalog.xml has been updated successfully: $3";