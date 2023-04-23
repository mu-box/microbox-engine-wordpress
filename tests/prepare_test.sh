echo running tests for wordpress
UUID=$(cat /proc/sys/kernel/random/uuid)

pass "unable to start the $VERSION container" docker run --privileged=true -d --name $UUID mubox/build-wordpress sleep 365d

defer docker kill $UUID

pass "create db dir for pkgsrc" docker exec $UUID mkdir -p /data/var/db

pass "create dir for environment variables" docker exec $UUID mkdir -p /data/etc/env.d

pass "Failed to update pkgsrc" docker exec $UUID /data/bin/pkgin up -y

pass "Failed to run prepare script" docker exec $UUID bash -c "cd /opt/engines/wordpress/bin; PATH=/data/sbin:/data/bin:\$PATH ./prepare '$(payload default-prepare)'"
