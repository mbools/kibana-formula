# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "kibana/map.jinja" import kibana with context %}
include:
  - kibana.service

# We directly serialize the config subtree into the YAML file.
kibana-config:
  file.serialize:
    - name: {{ kibana.configfile }}
    - mode: 644
    - user: root
    - group: root
    - dataset: {{ kibana.config }}
    - formatter: "YAML"
    - watch_in:
      - service:kibana-name
