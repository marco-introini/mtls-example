# mTLS Example

Complete article: https://dev.to/marcointroini/debug-mtls-using-wireshark-7ll

## Prerequisites

- docker desktop
- curl
- openssl

# Server

Before we must create server and client certificates:

```bash
make create_certificates
```

This will create server (ssl.*) and client certificates inside the certs directory
Then it's enough to run

```bash
docker-compose up
```

# Client

```bash
openssl s_client -connect localhost:443 -status -msg -key certs/client_key.pem -cert certs/client_cert.pem -CAfile certs/ssl.crt -state
```

```bash
curl --location 'https://localhost/server.php' \
--key "./certs/client_key.pem" \
-E "./certs/client_cert.pem" \
--cacert "./certs/ssl.crt" 
```