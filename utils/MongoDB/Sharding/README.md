## Config
rs.initiate( {
   _id : "rsConfig",
   members: [
      { _id: 0, host: "mongoConfig_primary:27017" },
      { _id: 1, host: "mongoConfig_secondary1:27017" },
      { _id: 2, host: "mongoConfig_secondary2:27017" }
   ]
})

# Sharding 1
rs.initiate( {
   _id : "rs1",
   members: [
      { _id: 0, host: "mongo1_primary:27017" },
      { _id: 1, host: "mongo1_secondary1:27017" },
      { _id: 2, host: "mongo1_secondary2:27017" }
   ]
})

# Sharding 2
rs.initiate( {
   _id : "rs2",
   members: [
      { _id: 0, host: "mongo2_primary:27017" },
      { _id: 1, host: "mongo2_secondary1:27017" },
      { _id: 2, host: "mongo2_secondary2:27017" }
   ]
})



## Mongos
use admin
db.runCommand( { addshard : "rs1/mongo1_primary:27017" } );
db.runCommand( { addshard : "rs2/mongo2_primary:27017" } );

db.runCommand( { enableSharding: "test" } );
db.runCommand( { shardCollection: "test.users", key: { username:1 } } );

###
use test
for(let i = 0; i < 1000; i++){
    db.users.insert({username: 'username' + i, password: 'password' + i})
}
db.users.getShardingDistribution()