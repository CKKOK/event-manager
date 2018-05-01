#!/bin/bash

redis-cli shutdown
kill -9 $(cat "./tmp/pids/server.pid")
