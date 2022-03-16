# Create the secret

```bash
openssl genrsa -out https.key 2048
openssl req -new -x509 \
  -key https.key -out https.cert \
  -days 3650 -subj \
  /CN=www.web-example.com
echo bar > foo
k create secret generic fortune-https \
  --from-file=https.key \
  --from-file=https.cert \
  --from-file=foo
```

