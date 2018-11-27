#!/usr/bin/env python3
import yaml, os
from pprint import pprint
from jinja2 import Environment, FileSystemLoader

with open("vmlist.yaml") as fh:
    data = yaml.safe_load(fh)

# Capture our current directory
# THIS_DIR = os.path.dirname(os.path.abspath(__file__))
THIS_DIR = os.getcwd()
j2_env = Environment(loader=FileSystemLoader(THIS_DIR), trim_blocks=True)
tpl = j2_env.get_template('vmlist.j2')
tf_out = "" # Builds output as a big string!

# Loops on VMs from yaml, and render them one by one
# appending result to tf_out
for vm in data['vmlist']:
    tf_out += tpl.render({**data['snippets'], **vm}) + "\n"

with open('vms.tf', 'w') as tfo:
    tfo.write(tf_out)
