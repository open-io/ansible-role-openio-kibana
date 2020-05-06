[![Build Status](https://travis-ci.org/open-io/ansible-role-openio-kibana.svg?branch=master)](https://travis-ci.org/open-io/ansible-role-openio-kibana)
# Ansible role `kibana`

An Ansible role for install kibana. Specifically, the responsibilities of this role are to:

- install and configure kibana

## Requirements

- Ansible 2.9+

## Role Variables

| Variable   | Default | Comments (type)  |
| :---       | :---    | :---             |
| `openio_kibana_namespace` | `"{{ namespace \| d('OPENIO') }}"` | OpenIO Namespace |
| `openio_kibana_maintenance_mode` | `"{{ openio_maintenance_mode \| d(false) }}"` | Maintenance mode |
| `openio_kibana_bind_address` | `"{{ openio_mgmt_bind_address \| d(ansible_default_ipv4.address) }}"` | Binding IP address |
| `openio_kibana_bind_port` | `6911` | HTTP Binding port |
| `openio_kibana_url` | `"http://{{ openio_kibana_bind_address }}:{{ openio_kibana_bind_port}}"` | URL to access kibana |
| `openio_kibana_elasticsearch_group` | `elasticsearch` | Elasticsearch group in the inventory |
| `openio_kibana_elasticsearch_port` | `6904` | Default port to connect to elasticsearch |


## Dependencies
- https://github.com/open-io/ansible-role-openio-service

## Example Playbook

```yaml
- hosts: all
  gather_facts: true
  become: true

  tasks:
    - include_role:
        name: kibana
```

## Contributing

Issues, feature requests, ideas are appreciated and can be posted in the Issues section.

Pull requests are also very welcome.
The best way to submit a PR is by first creating a fork of this Github project, then creating a topic branch for the suggested change and pushing that branch to your own fork.
Github can then easily create a PR based on that branch.

## License
Copyright (C) 2015-2020 OpenIO SAS
