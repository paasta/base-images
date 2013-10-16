Packer example
==============

```
brew tap homebrew/binary
brew install packer
```

Create a `vars.json` file:
```
{
  "aws_account_id": "...",
  "aws_access_key": "...",
  "aws_secret_key": "...",
  "aws_cert_path":  "cert.pem",
  "aws_key_path":   "key.pem,
  "aws_s3_bucket":  "some-bucket-name"
}
```

Then run the build:
```
packer build -var-file=vars.json -only=virtualbox template.json
```

TODO
----

Fix the amazon-instance build

