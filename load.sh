curl http://localhost:8080/import/bootcamp/openshift
curl http://localhost:8080/import/bootcamp/kubernetes
curl http://localhost:8080/import/bootcamp/containers
curl http://localhost:8080/import/bootcamp/nextjs
curl http://localhost:8080/import/bootcamp/quarkus

# start bootcamps
# curl -X POST "http://localhost:8080/bootcamp/1/start?email=waelibrahim2000%40hotmail.com&bootcampId=5&cohortName=Begginers1" -H "Content-Type: application/json"
# curl -X POST "http://localhost:8080/bootcamp/2/start?email=waelibrahim2000%40hotmail.com&bootcampId=5&cohortName=Begginers2" -H "Content-Type: application/json"
# curl -X POST "http://localhost:8080/bootcamp/3/start?email=waelibrahim2000%40hotmail.com&bootcampId=5&cohortName=Begginers3" -H "Content-Type: application/json"
# curl -X POST "http://localhost:8080/bootcamp/4/start?email=waelibrahim2000%40hotmail.com&bootcampId=5&cohortName=Begginers4" -H "Content-Type: application/json"
# curl -X POST "http://localhost:8080/bootcamp/5/start?email=waelibrahim2000%40hotmail.com&bootcampId=5&cohortName=Begginers5" -H "Content-Type: application/json"


# change status users
# curl -X POST "http://localhost:8080/bootcamp/5/status?status=KICKOFF" -H "Content-Type: application/json"
# # curl -X POST "http://localhost:8080/bootcamp/3/status?status=ORIENTATION" -H "Content-Type: application/json"
# curl -X POST "http://localhost:8080/bootcamp/4/status?status=COMPLETED" -H "Content-Type: application/json"


# entroll users
##  curl -X POST "http://localhost:8080/bootcamp/2/enroll?email=waelibrahim2000%40hotmail.com" -H "Content-Type: application/json"
# curl -X POST "http://localhost:8080/bootcamp/3/enroll?email=waelibrahim2000%40hotmail.com" -H "Content-Type: application/json"
# curl -X POST "http://localhost:8080/bootcamp/4/enroll?email=waelibrahim2000%40hotmail.com" -H "Content-Type: application/json"



#!/usr/bin/env bash

BASE_URL="http://localhost:8080"
EMAIL="waelibrahim2000@hotmail.com"
COHORT_PREFIX="Begginers Bootcamp"
Ezz_EMAIL="ezz@hotmail.com"
YASSINE_EMAIL="yassine@hotmail.com"

# 1️⃣ GET all bootcamps
bootcamps=$(curl -s "${BASE_URL}/bootcamp")

# 2️⃣ Loop through response
echo "$bootcamps" | jq -c '.[]' | while read -r bootcamp; do
    id=$(echo "$bootcamp" | jq -r '.id')
    name=$(echo "$bootcamp" | jq -r '.name')

    echo "➡️ Starting bootcamp: $name ($id)"

    # URL encode cohort name (spaces, dots, etc.)
    cohortName=$(printf "%s %s" "$COHORT_PREFIX" "$name" | jq -sRr @uri)

    # 3️⃣ POST /start
    start_response=$(curl -s -X POST \
        "${BASE_URL}/bootcamp/${id}/start?email=${EMAIL}&cohortName=${cohortName}")

    # 4️⃣ Extract cohort ID from response
    cohort_id=$(echo "$start_response" | jq -r '.id')

    if [[ "$cohort_id" == "null" || -z "$cohort_id" ]]; then
        echo "❌ Failed to start bootcamp $name"
        continue
    fi

    echo "   ✅ Cohort started: $cohort_id"

    # 5️⃣ POST /enroll
    enroll_response=$(curl -s -X POST \
        "${BASE_URL}/bootcamp/${cohort_id}/enroll?email=${EMAIL}")

    # 5️⃣ POST /enroll
    enroll_response=$(curl -s -X POST \
        "${BASE_URL}/bootcamp/${cohort_id}/enroll?email=${Ezz_EMAIL}")
    # 5️⃣ POST /enroll
    enroll_response=$(curl -s -X POST \
        "${BASE_URL}/bootcamp/${cohort_id}/enroll?email=${YASSINE_EMAIL}")

    # 6️⃣ Bootcamp progress 
    

    echo "   🎯 Enrolled in cohort $cohort_id"
    echo
done

