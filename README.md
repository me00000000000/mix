<h1 align=center>mix</h1>
<p align=center>Extremely simple tool to encrypt files with AES-CTR+HMAC using Argon2id</p>

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

### mix-paranoid

there is also a maximized Argon2id option, which uses ~10 seconds to derivate the password, but uses the same memory as default mix. there is no "interactive" version fifty-fifgy lite-paranoid, since that wouldn't make sense

#### modes

- **lite** is for cases when you know your password is absolutely secure **(>144 bits)** and you dispense without PBKDF (mainly when using key files)
- **paranoid** is the opposite of lite, for cases when you your password has a tradeoff of memorability and security (which is NOT RECOMMENDED to do, always use >70 bit passwords), but you may also just use it for "paranoia"; if you have 10 seconds, you may as well use them
- **normal** mode is for cases when you know your password is absolutely secure and you dispense without PBKDF is for regular cases, it uses lots of memory and ~5 seconds which are *bastante*

## mix-dump to extract information

if you want to see the nonce or salt of an encrypted file, use

```
$ mix-dump database.csv.mix
Header  mix
Salt    ce bc f0 9f a5 9a 65 61 73 74 65 72 20 65 67 67
IV      ad 42 86 6d 69 78 99 44 c3 16 96 30 3c 5d e2 6e
Cipher  36 bytes
HMAC    32 bytes
Algo    AES-CTR + HMAC
PBKDF   Argon2id
MEMORY  131072 bytes
TIME    4 iterations
PARALL  4 threads
```

## benchmarks (using mix-lite)

| Size  | Avg. time (ms)    |
|-------|-------------------|
| 4 MB  | 74                |
| 8 MB  | 82                |
| 16 MB | 85                |
| 32 MB | 98                |
| 64 MB | 122               |
| 128 MB| 180               |
| 256 MB| 298               |
| 512 MB| 501               |
| 1 GB  | 921               |
| 2 GB  | 1845              |
| 4 GB  | 3401              |
| 8 GB  | 7420              |

<sub>CC BY-SA 4.0</sub>
