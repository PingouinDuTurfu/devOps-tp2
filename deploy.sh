#!/bin/bash
# shellcheck disable=SC2164
cd infra
terraform init
terraform apply --auto-approve