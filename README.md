[![Build Status](https://travis-ci.org/open-io/ansible-role-openio-ROLENAME.svg?branch=master)](https://travis-ci.org/open-io/ansible-role-openio-kibana)
# Ansible role `kibana`

An Ansible role for installing and configuring Kibana.

## Requirements

- Ansible 2.5+

## Role Variables


| Variable                              | Default         | Comments (type) |
|:------------------------------------- |:--------------- |:--------------- |
| `openio_kibana_bind_address`          | ``              | ...             |
| `openio_kibana_bind_interface`        | ``              | ...             |
| `openio_kibana_bind_port`             | `5601`          | ...             |
| `openio_kibana_confdir`               | `"/etc/kibana"` | ...             |
| `openio_kibana_elasticsearch_address` | ``              | ...             |
| `openio_kibana_elasticsearch_group`   | ``              | ...             |
| `openio_kibana_elasticsearch_pass`    | `""`            | ...             |
| `openio_kibana_elasticsearch_port`    | `"6400"`        | ...             |
| `openio_kibana_elasticsearch_user`    | `""`            | ...             |
| `openio_kibana_ext_bind_address`      | `""`            | ...             |
| `openio_kibana_provision_only`        | `false`         | ...             |
| `openio_kibana_service_enabled`       | `true`          | ...             |

## Dependencies

No dependencies.

## Example Playbook

```yaml
- hosts: all
  become: true
  vars:
    namespace: TRAVIS
  pre_tasks:
    - name: Add localhost to group 'elasticsearch'
      add_host:
        name: localhost
        groups: elasticsearch
      changed_when: false
  roles:
    - role: repo
      openio_repository_no_log: false
      openio_repository_mirror_host: mirror2.openio.io
    - role: users
    - role: gridinit
      openio_gridinit_namespace: "{{ namespace }}"
      openio_gridinit_per_ns: true
    - role: elasticsearch
      openio_elasticsearch_namespace: "{{ namespace }}"
      openio_elasticsearch_memory: 512M
    - role: role_under_test
```


```ini
[all]
node1 ansible_host=192.168.1.173
```

## Contributing

Issues, feature requests, ideas are appreciated and can be posted in the Issues section.

Pull requests are also very welcome.
The best way to submit a PR is by first creating a fork of this Github project, then creating a topic branch for the suggested change and pushing that branch to your own fork.
Github can then easily create a PR based on that branch.

## License

GNU AFFERO GENERAL PUBLIC LICENSE, Version 3

## Contributors

- [Vladimir DOMBROVSKI](https://github.com/vdombrovski) (maintainer)
- [Cedric DELGEHIER](https://github.com/cdelgehier) (maintainer)
- [Romain ACCIARI](https://github.com/racciari) (maintainer)
- [Vincent LEGOLL](https://github.com/vincent-legoll) (maintainer)
