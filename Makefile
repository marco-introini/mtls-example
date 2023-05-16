info:
	@echo "mTLS Example version 1.0"

create_certificates:
	@echo "Creating server certificates"
	openssl req -new -newkey rsa:4096 -days 3650 -nodes -x509 -subj \
        "/C=IT/ST=TESTSERVER/L=TESTSERVER/O=TESTSERVER/CN=localhost" \
        -keyout ./certs/ssl.key -out ./certs/ssl.crt
	@echo "Creating client certificates"
	openssl genrsa -out certs/client_key.pem 2048
	openssl req -new -key certs/client_key.pem -out certs/client.csr -subj "/C=IT/ST=Milan/L=Milan/O=TestClient/OU=Test/CN=TestClient"
	openssl x509 -req -in certs/client.csr -CA certs/ssl.crt -CAkey certs/ssl.key -CAcreateserial -out certs/client_cert.pem -days 365

clean:
	rm -f certs/*.crt
	rm -f certs/*.pem
	rm -f certs/*.key
	rm -f certs/*.csr