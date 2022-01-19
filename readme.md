# This repo has 3 porject in it.

1. infrastructure - contains basic terraform code to vpc resources with module.in order to use this code download/clone the infrastructure and setup aws configure command to setup your credential as default profile

2. automation - contains sample jenkinsfile to create CI/CD pipeline with jenkins and deploy the infrastructure  from project 1. terraform code available in the git will be referenced in the jenkins pipeline & deployed through jenkins.

3. coding - contains the ansible script to install oracle on the unix server.first you have to download the required software and place it in intended directoty and make necessary change in the response file.

