#!/bin/bash
#search for string fl{something} in every file
grep -R -i  "fl{.*}" / 2>/dev/null #