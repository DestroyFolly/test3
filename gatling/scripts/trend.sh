#!/bin/bash

rm -rf serverpersecondloadsimulation-trend
java -jar ~/Downloads/gatling-report-6.1-capsule-fat.jar $(ls ~/BMSTU/sem7/test_git/benchmark/gatling/results/serverpersecondloadsimulation*/simulation.log) -o serverpersecondloadsimulation-trend

rm -rf serveratonceloadsimulation-trend
java -jar ~/Downloads/gatling-report-6.1-capsule-fat.jar $(ls ~/BMSTU/sem7/test_git/benchmark/gatling/results/serveratonceloadsimulation*/simulation.log) -o serveratonceloadsimulation-trend
