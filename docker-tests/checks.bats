#! /usr/bin/env bats

# Variable SUT_IP should be set outside this script and should contain the IP
# address of the System Under Test.

# Tests

@test 'Kibana listens on port 6911' {
  run bash -c "curl -qs http://${SUT_IP}:6911/api/status"
  echo "output: "$output
  echo "status: "$status
  [[ "${status}" -eq "0" ]]
  [[ "${output}" == *"\"state\":\"green\""* ]]
}
