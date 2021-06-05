# Run only web 
- `docker-compose.yml` file: `docker-compose up -d`
- run db, db manager: `db.yml` file: `docker-compose -f db.yml up -d`

# Run all in one command
- using `all-in-one.yml` file: `docker-compose -f db.yml up -d`

# Make data folder:
```shell
    sudo mkdir /appdata
    sudo chmod 777 /appdata
```