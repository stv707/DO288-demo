# Setup DO288 

* DO288 Training have 2 users to login to ocp 
  ```
  admin 
  developer 
  ```

* You can add/edit .bashrc of GLS workstation to alias the oc login command

  ```bash 
  alias ocd='oc login -u developer  -p xxxxxxx https://api.ocp4.example.com:6443'

  alias oca='oc login -u admin  -p xxxxxx https://api.ocp4.example.com:6443'

  ```
  >> Please refer the password in DO288 Student Guide



