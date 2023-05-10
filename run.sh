#!/bin/sh

gunicorn -w 2 'app:app' -b 0.0.0.0:8000