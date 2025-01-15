#!/bin/bash

rm -rf serverpersecondloadsimulation-delta
java -jar ~/Downloads/gatling-report-6.1-capsule-fat.jar $(ls ~/BMSTU/sem7/test_git/benchmark/gatling/results/serverpersecondloadsimulation*/simulation.log | tail -n 2) -o serverpersecondloadsimulation-delta

rm -rf serveratonceloadsimulation-delta
java -jar ~/Downloads/gatling-report-6.1-capsule-fat.jar $(ls ~/BMSTU/sem7/test_git/benchmark/gatling/results/serveratonceloadsimulation*/simulation.log | tail -n 2) -o serveratonceloadsimulation-delta
