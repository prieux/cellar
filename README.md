# cellar

Inspired by: http://stackoverflow.com/questions/10814952/temporarily-decrypt-file-in-shell

Various scripts used to manage passwords
* generate-password.sh generate an alpha-numeric password, the password length is set as a parameter
* get-password.sh get a password from an encrypted flat file, using the following format (when decrypted :)!):

```
entry key
  username
  password

another entry
  username
  blahblah
  password

etc.
```
