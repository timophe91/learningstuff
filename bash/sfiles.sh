#!/bin/bash
#search for string fl{something} in every file
grep -R  "fl{.*}" / 2>/dev/null #