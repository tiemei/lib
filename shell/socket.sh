#!/bin/bash

exec 6<>/dev/tcp/127.0.0.1/8899

while 1;
do
  echo "test" >&6
  read input
done

exec 6>&-
