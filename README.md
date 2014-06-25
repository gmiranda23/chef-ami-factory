chef-ami-factory
================
This is a demo on how to set up an AMI factory using [Chef](http://www.getchef.com/), [Berkshelf](http://berkshelf.com), and [Packer](http://www.packer.io) to address just-in-time configuration management challenges like auto-scaling.  It is **_not_** a recommended practice to generate static images as a substitute for configuration management.

For guidelines on how to use pre-loaded AMIs with configuration management, check out this [video](http://www.getchef.com/blog/chefconf-talks/cooking-with-chef-and-amazons-cloud-formation-jeremy-przygode/)  on using pre-loaded AMIs with CloudFormation or [slides](http://bit.ly/chef-ami-factory) from the talk for which this demo was written.  Work in this repo is based upon this [tutorial](http://engineering.cotap.com/post/78783269747/hello-world-using-packer-chef-and-berkshelf-on-ec2).

-----
Requirements
============
### Chef & Berkshelf
You must have chef binaries and 'berks' in your $PATH.  The easiest way to get both is to install the [ChefDK](http://www.getchef.com/downloads/chef-dk/mac/).

### Packer
Packer must be installed and in your $PATH.  Instructions available [here](http://www.packer.io/intro/getting-started/setup.html).

### Openssl
This repo includes a helper script to generate AWS API x509 certificates for use with IAM.  In order to use the script, 'openssl' must be in your $PATH.

### Supported Operating Systems
This demo has been tested exclusively on OSX, but it should run on any other platform supported by the required tools.  Please submit comments if you've used this beyond OSX.


How to use this repo
====================
Clone the repo and 'cd' into it.

Generate x509 certificates for AWS if you do not already have these.  Give the 'cert_gen.sh' script an argument of username (arbitrary) you wish to use for these keys.

` ./cert_gen.sh bob` 

The cert_gen.sh script will place them in a .packer dir in your home directory.  In the example above, three new files now exist:

* ~/.packer/bob-certificate.pem
* ~/.packer/bob-key.pem
* ~/.packer/bob-pem-PCKS8-format.pem

Update your ~/.bashrc with these values if you have not already:

    #AWS Settings
    export AWS_ACCESS_KEY_ID=AKIABCDEFGHIJKLMNOP
    export AWS_SECRET_ACCESS_KEY=fweifeoifjwef/thkopyhtkotykhyth
    export AWS_X509_CERT_PATH=~/.packer/bob_certificate.pem
    export AWS_X509_KEY_PATH=~/.packer/bob_key.pem
    export AWS_ACCOUNT_ID='1234-5678-9999'

Reload your .bashrc

`source ~/.bashrc`

Run the ami_factory.sh script

`./ami_factory.sh`

---

Submitting Changes
==================
This tool is meant as a quickstart Chef+Berks+Packer demo.  It is not intended to be a full-fledged AMI generator.  But I'm happy to accept Pull Requests.

1. Fork the repo
2. Make changes
3. Submit a Pull Request

License and Author
==================
- Author: George Miranda (<george.miranda@gmail.com>)

```
Copyright 2014, George Miranda (<george.miranda@gmail.com>)

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
