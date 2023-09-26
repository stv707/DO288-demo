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

* You can further edit the .bashrc to overwrite the Prompt to display info for OCP Project and Git Dir

  ```bash 
  openshift_user() {
    oc whoami 2>/dev/null
   }

  openshift_namespace() {
    oc project -q 2>/dev/null
   }

  git_info() {
    local git_url
    git_url=$(git config --get remote.origin.url 2>/dev/null)
    local git_branch
    git_branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
    if [ "$git_url" ] && [ "$git_branch" ]; then
        echo "${git_url} (${git_branch})"
    else
        echo "Not a git repo"
    fi
   }

   PS1='\[\033[01;32m\]┌──OpenShift U:$(openshift_user) Project:$(openshift_namespace)\n\[\033[00m\]'
   PS1+='\[\033[01;31m\]└─Git: $(git_info)\n\[\033[00m\]'
   PS1+='\[\033[01;37m\]┌──(\u@\h)-[\w]\n$\[\033[00m\] '
  ```