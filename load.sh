curl http://localhost:8080/import/bootcamp/openshift
curl http://localhost:8080/import/bootcamp/kubernetes
curl http://localhost:8080/import/bootcamp/containers
curl http://localhost:8080/import/bootcamp/nextjs
curl http://localhost:8080/import/bootcamp/quarkus

# start bootcamps
curl -X POST "http://localhost:8080/bootcamp/1/start?email=waelibrahim2000%40hotmail.com&bootcampId=5&cohortName=Begginers1" -H "Content-Type: application/json"
curl -X POST "http://localhost:8080/bootcamp/2/start?email=waelibrahim2000%40hotmail.com&bootcampId=5&cohortName=Begginers2" -H "Content-Type: application/json"
curl -X POST "http://localhost:8080/bootcamp/3/start?email=waelibrahim2000%40hotmail.com&bootcampId=5&cohortName=Begginers3" -H "Content-Type: application/json"
curl -X POST "http://localhost:8080/bootcamp/4/start?email=waelibrahim2000%40hotmail.com&bootcampId=5&cohortName=Begginers4" -H "Content-Type: application/json"
curl -X POST "http://localhost:8080/bootcamp/5/start?email=waelibrahim2000%40hotmail.com&bootcampId=5&cohortName=Begginers5" -H "Content-Type: application/json"


# change status users
curl -X POST "http://localhost:8080/bootcamp/2/status?status=KICKOFF" -H "Content-Type: application/json"
curl -X POST "http://localhost:8080/bootcamp/3/status?status=ORIENTATION" -H "Content-Type: application/json"
curl -X POST "http://localhost:8080/bootcamp/4/status?status=COMPLETED" -H "Content-Type: application/json"


# entroll users
curl -X POST "http://localhost:8080/bootcamp/2/enroll?email=waelibrahim2000%40hotmail.com" -H "Content-Type: application/json"
curl -X POST "http://localhost:8080/bootcamp/3/enroll?email=waelibrahim2000%40hotmail.com" -H "Content-Type: application/json"
curl -X POST "http://localhost:8080/bootcamp/4/enroll?email=waelibrahim2000%40hotmail.com" -H "Content-Type: application/json"
