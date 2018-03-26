# Knife Cloud Sharpener 

This tool generates provisioning commands in the Knife cloud environment, based on rules defined in a convenient yml file. 

The idea behind it is that working software is better than any documentation. But defining your templates in the YML file you not only documenting how to build various types of hosts in your infrastructure, you are also then able to use this configuration/documentation to actually provision or bootstrap these hosts with ease.

## Installation

Add this line to your application's Gemfile:

    gem 'knife-sharpener'

And then execute:

    $ bundle

Or install it into your ruby environment as follows:

    $ gem install knife-sharpener

## Configuration

Sharpener uses a YAML file to define templates of various types of hosts in your application, and
link them with a particular type of ec2 flavors, packages and `security_group_id`.  Please see 'knife ec2' for definition of these terms.

## Usage

```bash
Usage:
  [bundle exec] provisioner command ...

Where the command is one of the following:
  provision, bootstrap
```

### Provisioning Hosts

```bash
Usage: provisioner provision --config <path-to-config>.yml [options]
    -c, --config CONFIG_FILE         Path to the config file (YML) (required)
    -g, --debug                      Log status to STDOUT
        --dry-run                    Dry runs and prints all commands without executing them
    -n, --number NUMBER              Ruby range or a number for the host, ie 3 or 1..3 or [2,4,6]
    -t, --template TEMPLATE          Template name (required)
    -h, --help                       Show this message
```


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

