#!/bin/sh

HERE=$( cd $(dirname $0); pwd )

which git >/dev/null 2>&1 || exit

cd $HERE

rm -rf roles/common roles/i2b2-vm-shrine roles/shrine

git clone https://open.med.harvard.edu/stash/scm/iteam/ansible-role-common.git roles/common
git clone https://open.med.harvard.edu/stash/scm/iteam/ansible-role-i2b2-vm-shrine.git roles/i2b2-vm-shrine
git clone https://open.med.harvard.edu/stash/scm/iteam/ansible-role-shrine.git roles/shrine
cd roles/shrine && git checkout develop
