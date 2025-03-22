<h1 align=center>mix</h1>
<p align=center>Extremely simple tool to encrypt files with AES-GCM and Argon2id</p>

```
  -f, --force           force overwrite of output file
  -p, --preserve        preserve original timestamps
  -o, --stdout          output the result to STDOUT instead of a file
  -P, --password-stdin  read a password from STDIN
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

### unix-style piping

```
$ echo password | mix -P database.csv
```

this works, but avoid typing the password with echo, or other users in the system may see it in a list of running processes

also, you can encrypt the contents from STDIN without the -P option:

```
$ echo 'example,database,123' | mix -o > output.mix
Enter password:
Confirm password:
```

always remembe to use -o when using STDIN contents, otherwise it cannot output to a file, because there's no origin file (to add or remove with the .mix extension)

### mix-lite with key files

a completely secure alternative is catting a secure key into mix-lite (for example, use `openssl rand 20 | base32 > key` - raw bytes aren't supported), and then

```
$ cat key | mix-lite -P database.csv
```

now, you have an securely encrypted file `database.csv.mix`. if you store the `key` file, then you can use this for things like cloud backups

*note: using mix-lite in this example, because PBKDF is pointless and time-wasting if the password (key file) has over 160 bits of security*

mix-lite uses virtually zero PBKDF and takes only ~60ms to encrypt data. it uses Argon2id with minimal settings, for simplicity

