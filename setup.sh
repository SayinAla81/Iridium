echo "Starting ssh and ftp services on target servers..."
echo ----------------------------------------------------------
temp=$(docker exec -it ser1 rc-service sshd start)
temp=$(docker exec -it ser1 rc-service vsftpd start)
temp=$(docker exec -it ser2 rc-service sshd start)
temp=$(docker exec -it ser3 rc-service vsftpd start)
temp=$(docker exec -it ser1 rc-service crond start)
temp=$(docker exec -it ser2 rc-service crond start)
temp=$(docker exec -it ser3 rc-service crond start)