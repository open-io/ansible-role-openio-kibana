#! /usr/bin/env bats

# Variable SUT_IP should be set outside this script and should contain the IP
# address of the System Under Test.

# Tests

@test 'Kibana listens 5601' {
  run bash -c "curl http://${SUT_IP}:5601"
  echo "output: "$output
  echo "status: "$status
  [[ "${status}" -eq "0" ]]
}
