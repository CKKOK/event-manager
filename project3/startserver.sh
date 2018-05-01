#!/bin/bash

redis-server &
rails s -b 'ssl://0.0.0.0:3000?key=localhost.key&cert=localhost.crt' > server.log &
