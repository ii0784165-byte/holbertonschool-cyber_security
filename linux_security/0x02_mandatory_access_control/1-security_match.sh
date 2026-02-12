#!/bin/bash
apparmor_status | awk '{print $0}'
