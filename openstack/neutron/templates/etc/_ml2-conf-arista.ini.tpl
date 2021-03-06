# Defines configuration options specific for Arista ML2 Mechanism driver

[ml2_arista]
eapi_host ={{.Values.arista.eapi_host}}
eapi_username = {{.Values.arista.eapi_username}}
eapi_password = {{.Values.arista.eapi_password}}

# use_fqdn =
# sync_interval =

switch_info = {{range $i, $switch := .Values.arista.switches}}{{$switch.host}}:{{$switch.user}}:{{$switch.password}}{{ if lt $i (sub (len $.Values.arista.switches) 1) }},{{end}}{{end}}

region_name = {{.Values.global.region}}

auth_host = {{include "keystone_api_endpoint_host_public" .}}
admin_username = {{ .Values.global.neutron_service_user | default "neutron" }}
admin_password = {{ .Values.global.neutron_service_password }}
admin_tenant_name = {{.Values.global.keystone_service_project | default "service"}}
managed_physnets={{.Values.arista.physnet}}


