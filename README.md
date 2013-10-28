Base images
===========

Project to create images to use in Vagrant and EC2.

## Usage

Check out the latest release: https://github.com/paasta/base-images/releases

## Build dependencies

```
brew tap homebrew/binary
brew install packer

gem install bundler
bundle
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

## Build

First run the packer wrapper script to build the images:

```
./build
```

Use `./build -only=virtualbox` for example to build a single target.

Once satisfied with the AMIs, use the `./ami` script to publish them to all
the regions and make them public.

```
./ami publish <ami_id>
```

You can also destroy old releases, list images in a region or ids across all
regions with the same script. Running `./ami` will show you the options.

NOTES
------

* uuid generation is broken in v0.3.10 causing issues in parallel builds

