#!/bin/bash

# SPDX-License-Identifier: LicenseRef-Elastic-License-2.0

# Copyright 2021 Elasticsearch B.V. and/or licensed to Elasticsearch B.V. under one
# or more contributor license agreements. Licensed under the Elastic License 2.0;
# you may not use this file except in compliance with the Elastic License 2.0.


set -u

cat contrib/patch/elftoolchain.patch | patch -p0 -r - --forward -d contrib

set -euv
export MAKEFLAGS="" && export MFLAGS="" && \
    WITH_TESTS=no WITH_BUILD_TOOLS=no WITH_ADDITIONAL_DOCUMENTATION=no WITH_PE=no WITH_ISA=no   \
    bmake -C contrib/elftoolchain clean
rm -rf contrib/elftoolchain/build
