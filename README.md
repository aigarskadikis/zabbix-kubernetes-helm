# Zabbix Helm Chart


Replace version, reinstall proxy, regenerate token

```bash
sed -i 's|alpine-7.0.*$|alpine-7.0.9|g' values.yaml
helm uninstall my-release && helm install my-release -f values.yaml ./
kubectl get secret zabbix-service-account -n default -o jsonpath={.data.token} | base64 -d
```

Enter proxy container

```bash
kubectl exec -it $(kubectl get pods | grep -Eo "zabbix-proxy\S+") -- /bin/bash
```

List version of current proxy

```bash
kubectl exec -it $(kubectl get pods | grep -Eo "zabbix-proxy\S+") -- zabbix_proxy -V
```

Follow logs of pod

```bash
kubectl get pods | grep -Eo "zabbix-proxy\S+" | xargs kubectl logs -f
```

Restart/delete pod

```bash
kubectl get pods | grep -Eo "zabbix-proxy\S+" | xargs kubectl delete pod
```

List full proxy pod name
```bash
kubectl get pods | grep -Eo "zabbix-proxy\S+"
```
