#!/bin/bash
#  This program is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 2 of the License, or
#  (at your option) any later version.

#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.

#  You should have received a copy of the GNU General Public License
#  along with this program.  If not, see <http://www.gnu.org/licenses/>.

# This patch fix the CWE-79 Security Issue
# More information available at this address :
# https://bugzilla.zimbra.com/show_bug.cgi?id=101435

# We first test if the script is run under zimbra user
if [ x`whoami` != "xzimbra" ]; then
  echo "Must be run as user zimbra"
  exit 1
fi

zimbra_version=`zmcontrol -v`
check_zimlet_installation=`zmzimletctl listZimlets | grep com_zimbra_url | uniq`
patch_path="/tmp/Zimbra-Collaboration-CWE-79"

# We first test if the zimlet is installed
if [[ $check_zimlet_installation =~ "com_zimbra_url" ]]
  then
  #Finally we check the version of Zimbra and apply the right config_template.xml
  if [[ $zimbra_version =~ "8.0" ]]; then
    echo "deploying 8.0 patched configuration"
    zmzimletctl configure $patch_path/config_template_80.xml
    echo "flushing Zimlet cache"
    zmprov fc zimlet
    echo "Operation complete"
  elif [[ $zimbra_version =~ "8.5" ]]; then
    echo "deploying 8.5 patched configuration"
    zmzimletctl configure $patch_path/config_template_85.xml
    echo "flushing Zimlet cache"
    zmprov fc zimlet
    echo "Operation complete"
  else
    echo "Unable to determine Zimbra version"
  fi
else
echo " Zimlet not present"
fi
