# PRIMARY
docker exec -it mongo1 bash
mongo
rs.initiate(
  {
    _id : 'rs0',
    members: [
      { _id : 0, host : "mongo1:27017" },
      { _id : 1, host : "mongo2:27017" },
      { _id : 2, host : "mongo3:27017" }
    ]
  }
)
use test
for(let i = 0; i < 1000; i++){
    db.users.insert({username: 'username' + i, password: 'password' + i})
}
db.users.find()
db.users.count()
exit
exit

# SECONDARY 1:
docker exec -it mongo2 bash
mongo
rs.secondaryOk()
use test
db.users.find()
db.users.count()

# SECONDARY 2:
docker exec -it mongo3 bash
mongo
rs.secondaryOk()
use test
db.users.find()
db.users.count()