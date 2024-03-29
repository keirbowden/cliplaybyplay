#!/bin/bash
#
# Salesforce CLI Play by Play
#
# Script to spin up a scratch org, install a package, deploy code, assign permission
# set and execute tests.
#
# You will need to be logged into your dev hub to use this script

echo "Creating scratch org"
sfdx force:org:create -s -d 30 -a scriptpbp -f ./config/project-scratch-def.json -w 10

echo "Installing managed package"
sfdx force:package:install -p 04t4J000000ddjm -k clipbp -w 10

echo "Deploying codebase"
sfdx force:source:push

echo "Assigning permission set"
sfdx force:user:permset:assign -n Expense_Reports

echo "Running tests"
sfdx force:apex:test:run -l RunLocalTests -w 2

echo "All done"
