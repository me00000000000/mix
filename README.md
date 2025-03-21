<h1 align=center>mix</h1>
<p align=center>Extremely simple tool to encrypt files with AES-GCM and Argon2id</p>

```
  -f, --force     force overwrite of output file
  -p, --preserve  preserve original timestamps
```

## example usage

encryption

```
$ mix database.csv
Enter password:
Confirm password:
Encryption successful. Output written to database.csv.mix
```

decryption

```
$ mix database.csv.mix
Enter password:
Decryption successful. Output written to database.csv
```

**mix** detects if a file is encrypted by its magic number `0x116d6978`, which indicates if a file is encrypted, so it doesn't require redundant -e and -d options, it just takes one only argument, which is the file to encrypt/decrypt
