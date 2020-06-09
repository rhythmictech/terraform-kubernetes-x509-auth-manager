apiVersion: certificates.k8s.io/v1beta1
kind: CertificateSigningRequest
metadata:
  name: ${name}
spec:
  groups:
  - system:authenticated
  - ${namespace}
  request: ${base64_csr}
  usages:
  - digital signature
  - key encipherment
  - client auth
