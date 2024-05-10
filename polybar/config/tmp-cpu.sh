#!/bin/sh

sensors | grep "Composite:" | tr -d '+' | awk '{print $2}'
