// SPDX-License-Identifier: Elastic-2.0

/*
 * Copyright 2022 Elasticsearch B.V. and/or licensed to Elasticsearch B.V. under
 * one or more contributor license agreements. Licensed under the Elastic
 * License 2.0; you may not use this file except in compliance with the Elastic
 * License 2.0.
 */

#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>

#include "common.h"

int main()
{
    const int new_gid = 5;
    CHECK(setgid(new_gid), -1);

    char pid_info[8192];
    gen_pid_info_json(pid_info, sizeof(pid_info));
    printf("{ \"pid_info\": %s }\n", pid_info);
    return 0;
}
