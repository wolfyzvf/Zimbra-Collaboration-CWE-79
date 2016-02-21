# Description
  This patch fix the CWE-79 Security Issue  
  More information available at this address :  
  https://bugzilla.zimbra.com/show_bug.cgi?id=101435  

# Installation
1. first clone the project into the /tmp folder

    git clone https://github.com/wolfyzvf/Zimbra-Collaboration-CWE-79 /tmp/Zimbra-Collaboration-CWE-79

2. Then apply the patch as a Zimbra user

    chmod +x /tmp/Zimbra-Collaboration-CWE-79/install.sh  
    su - zimbra  
    /tmp/Zimbra-Collaboration-CWE-79/install.sh  

# License
This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
