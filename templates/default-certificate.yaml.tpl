apiVersion: cert-manager.io/v1alpha3
kind: Certificate
metadata:
  name: default
  namespace: ${namespace}
spec:
  secretName: default-certificate
  issuerRef:
    name: letsencrypt-production
    kind: ClusterIssuer
  dnsNames:
    - '${common_name}'
