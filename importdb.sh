#/bin/bash
echo "Enter DB name: "
read db
echo "Enter DB you are importing name: "
read importdb
a=$(basename "$PWD")
docker exec -i "$a"_db_1 mysql -uroot -proot $n < $importdb;
