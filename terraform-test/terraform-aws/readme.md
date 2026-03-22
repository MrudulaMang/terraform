# Terraform AWS Instance

This module create ec2 instance

## Inputs
* project - string type - required . 
  - must provide project name
  - eg, roboshop,expene etc
* environment
  -required
  -string type
  -ex dev , uat, prod, etc
* ami_id
   -reuired
   -string type
* instane_type
  -optional
  - default bvalue is t3.micro
  - user can override
* sg_ids
  - required
  - list(string) 
  - instance security ids
* tagsa 
  - optional
  - lsit type

## Outputs
 * instance_id - id of the instance created
 * public_id - public ip of the instance created
 * private_id - private ip of the instance created