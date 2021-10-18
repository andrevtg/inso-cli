#!/bin/bash

docker run --rm -v $(pwd):/app/src andrevtg/inso inso $@
