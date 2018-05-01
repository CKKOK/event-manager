#!/bin/bash

redis-server &
rails s -b 'ssl://localhost:3000?key=./localhost.key&cert=./localhost.crt' &
