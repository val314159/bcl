#!/usr/bin/env python3
import os, sys, ed25519

signing_key, verifying_key = ed25519.create_keypair()
open("my-secret-key", "wb").write(signing_key.to_bytes())
open("my-secret-seed","wb").write(signing_key.to_seed())

keydata = open("my-secret-key","rb").read()
signing_key2 = ed25519.SigningKey(keydata)
assert signing_key == signing_key2

verifying_key2 = signing_key2.get_verifying_key()
assert verifying_key == verifying_key2

seed = open("my-secret-seed","rb").read()
signing_key3 = ed25519.SigningKey(seed)
assert signing_key == signing_key3

verifying_key3 = signing_key3.get_verifying_key()
assert verifying_key == verifying_key3

vkey_hex = verifying_key.to_ascii(encoding="hex")
print("the public key is", vkey_hex)

vkey_hex = signing_key.to_ascii(encoding="hex")
print("the private key is", vkey_hex)

b = "Hello, world!"
print("the signature is", signing_key.sign(b.encode(), encoding='hex'))
open("my-secret-sign","wb").write(signing_key.sign(b.encode()))
