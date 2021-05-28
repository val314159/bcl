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
#print("the public key is", vkey_hex)

walletid = vkey_hex

vkey_hex = signing_key.to_ascii(encoding="hex")
#print("the private key is", vkey_hex)

import time, hashlib, functools
def ripemd160(x = ''):  return hashlib.new('ripemd160', x.encode())

rmd160 = functools.partial(hashlib.new,'ripemd160')
rmd160h = lambda x: rmd160(x.encode()).hexdigest()

def qqq():
    a1, a2, state = [], [], 0
    for line in sys.stdin.readlines():
        if not state:
            ls = line.lstrip()
            if not ls or ls.startswith(';'):
                a1.append(line)
                continue
            state = 1
            pass
        a2.append(line)
        pass
    return a1, a2

a, b = qqq()
b = f'(h "walletid" "{walletid.decode()}")\n{"".join(b)}'
signature = signing_key.sign(b.encode(), encoding='hex')
b = f'(h "signature" "{signature.decode()}")\n{b}'
r, n = '', 0
while not r.startswith('000'):
    n += 1
    x = f'{b}\n(h "nonce" "{n}")\n'
    r = rmd160h(x)
    pass
y = f'{"".join(a)}(h "ripemd160" "{r}")\n{x}'
print(y)
