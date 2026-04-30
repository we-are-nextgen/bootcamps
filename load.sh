
# start bootcamps
# curl -k -X POST "http://localhost:8080/bootcamp/1/start?email=waelibrahim2000%40hotmail.com&bootcampId=5&cohortName=Begginers1" -H "Content-Type: application/json"
# curl -k -X POST "http://localhost:8080/bootcamp/2/start?email=waelibrahim2000%40hotmail.com&bootcampId=5&cohortName=Begginers2" -H "Content-Type: application/json"
# curl -k -X POST "http://localhost:8080/bootcamp/3/start?email=waelibrahim2000%40hotmail.com&bootcampId=5&cohortName=Begginers3" -H "Content-Type: application/json"
# curl -k -X POST "http://localhost:8080/bootcamp/4/start?email=waelibrahim2000%40hotmail.com&bootcampId=5&cohortName=Begginers4" -H "Content-Type: application/json"
# curl -k -X POST "http://localhost:8080/bootcamp/5/start?email=waelibrahim2000%40hotmail.com&bootcampId=5&cohortName=Begginers5" -H "Content-Type: application/json"


# change status users
# curl -k -X POST "http://localhost:8080/bootcamp/5/status?status=KICKOFF" -H "Content-Type: application/json"
# # curl -k -X POST "http://localhost:8080/bootcamp/3/status?status=ORIENTATION" -H "Content-Type: application/json"
# curl -k -X POST "http://localhost:8080/bootcamp/4/status?status=COMPLETED" -H "Content-Type: application/json"


# entroll users
##  curl -k -X POST "http://localhost:8080/bootcamp/2/enroll?email=waelibrahim2000%40hotmail.com" -H "Content-Type: application/json"
# curl -k -X POST "http://localhost:8080/bootcamp/3/enroll?email=waelibrahim2000%40hotmail.com" -H "Content-Type: application/json"
# curl -k -X POST "http://localhost:8080/bootcamp/4/enroll?email=waelibrahim2000%40hotmail.com" -H "Content-Type: application/json"



#!/usr/bin/env bash

BASE_URL="http://localhost:8080"
#BASE_URL="https://nextgen-api.smart-nextgen.com"
EMAIL="waelibrahim2000@hotmail.com"
COHORT_PREFIX="Beginners Bootcamp"
Ezz_EMAIL="ezz@hotmail.com"
YASSINE_EMAIL="yassine@hotmail.com"

curl -k -s "${BASE_URL}/import/bootcamp/openshift"
curl -k -s "${BASE_URL}/import/bootcamp/kubernetes"
curl -k -s "${BASE_URL}/import/bootcamp/containers"
curl -k -s "${BASE_URL}/import/bootcamp/nextjs"
curl -k -s "${BASE_URL}/import/bootcamp/quarkus"


counter=1

# 1️⃣ GET all bootcamps
bootcamps=$(curl -k -s "${BASE_URL}/bootcamp")

# 2️⃣ Loop through response
echo "$bootcamps" | jq -c '.[]' | while read -r bootcamp; do
    id=$(echo "$bootcamp" | jq -r '.id')
    name=$(echo "$bootcamp" | jq -r '.name')

    echo "➡️ Starting bootcamp: $name ($id)"

    # URL encode cohort name (spaces, dots, etc.)
    cohortName=$(printf "%s %s" "$COHORT_PREFIX" "$name" | jq -sRr @uri)

    # 3️⃣ POST /start
    start_response=$(curl -k -s -X POST \
        "${BASE_URL}/bootcamp/${id}/start?email=${EMAIL}&cohortName=${cohortName}")

    # 4️⃣ Extract cohort ID from response
    cohort_id=$(echo "$start_response" | jq -r '.id')

    if [[ "$cohort_id" == "null" || -z "$cohort_id" ]]; then
        echo "❌ Failed to start bootcamp $name"
        continue
    fi


    if (( counter < 4 )); then
    echo "   ✅ Cohort started: $cohort_id"
    # 5️⃣ POST /enroll
    enroll_response=$(curl -k -s -X POST \
        "${BASE_URL}/bootcamp/${cohort_id}/enroll?email=${EMAIL}")

    # 5️⃣ POST /enroll
    enroll_response=$(curl -k -s -X POST \
        "${BASE_URL}/bootcamp/${cohort_id}/enroll?email=${Ezz_EMAIL}")
    # 5️⃣ POST /enroll
    enroll_response=$(curl -k -s -X POST \
        "${BASE_URL}/bootcamp/${cohort_id}/enroll?email=${YASSINE_EMAIL}")

    # 6️⃣ Bootcamp progress 
    fi

    ((counter++))

    echo "   🎯 Enrolled in cohort $cohort_id"
    echo
done

