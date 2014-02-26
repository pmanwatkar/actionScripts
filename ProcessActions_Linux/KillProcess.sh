#!/bin/sh
SERVICE=$1

kill $(pidof $SERVICE)