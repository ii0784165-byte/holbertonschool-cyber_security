#!/bin/bash
lynis audit system --quiet --logfile /tmp/lynis_report.log | grep -i "vulnerability" /tmp/lynis_report.log
