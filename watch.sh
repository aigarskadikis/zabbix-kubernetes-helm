kubectl exec -it $(kubectl get pods | grep -Eo "zabbix-proxy\S+") -- \
watch -n1 'ps auxww | grep -Eo "zabbix_proxy[:].*"'

