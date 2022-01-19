


#variable "vpc" {}





variable "region" {
     default = "ap-southeast-2"
}




variable "instanceTenancy" {
    default = "default"
}
variable "dnsSupport" {
    default = true
}
variable "dnsHostNames" {
    default = true
}


variable "vpc1" {
    default = {
    VPCname = "VPC_Internet"
    vpcCIDR = "10.0.0.0/16"
    az                = ["ap-southeast-2a","ap-southeast-2b"]
    az_index          = ["0","1"]
    public_subnetCIDR = ["10.0.1.0/28","10.0.3.0/28"]
    public_subnet_az  = ["ap-southeast-2a","ap-southeast-2b"]
    public_subnetName = ["Subnet_Pub_VPC_Internet_ap-southeast-2a_Egress-Ingress","Subnet_Pub_VPC_Internet_ap-southeast-2b_Egress-Ingress"]

    private_subnetCIDR = ["10.0.2.0/28","10.0.4.0/28"]
    private_subnet_az  = ["ap-southeast-2a","ap-southeast-2b"]
    private_subnetName = ["Subnet_Private_VPC_Internet_ap-southeast-2a_TGW-Attachment","Subnet_Private_VPC_Internet_ap-southeast-2b_TGW-Attachment"]
    
    igwName = "igw_VPC_Internet"
        
    public_route_table_name =["RT_Public_Internet_VPC"]
    private_route_table_name=["RT_Private_Internet_VPC"]
    

  }
}
