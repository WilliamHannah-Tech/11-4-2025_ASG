AUTO SCALING GROUP

launch template
click on instances, and click on the instance
go to actions, image and templates, then create template from instance -Launch Template name and description
launch template name
Template version description
Application and OS Images stay the same, along with instance type, no key pair
Network settings
subnet = Don't include in launch template
availability zone = Don't include in launch template
firewall = select existing security group
common security groups = security group you created
Advanced details
user_data = make sure it is correct and working
Target Groups
click on target groups and click on the orange button
Settings
Target type = Instances
target group name = what you want to name it
protocol = http port = 80 ip address type = IPv4 VPC = created vpc protocol version = HTTP1 Health check let it stay the same
health check protocol = HTTP
Health check path = / Register targets
Available instances don't choose anything click orange next button Review summary of choices and click orange Create target group button
Load Balancers click on load balancers and click on the orange create load balancer click on application load balancer Basic Configuration
load balancer name = name it what you want
Scheme = Internet-facing
Load balancer IP address type = IPv4 Network mapping
vpc = the created vpc
availability zones and subnets = make sure they are the public subnets security groups -security groups = click X on the default, use the created security groups Listeners and routing -Listener HTTP:80 Protocol = HTTP Port = 80 Default action -Routing action = Forward to target groups -target group = the target group you created review the chooses you made then click on the orange create load balancer
Auto Scaling Group -click on autoscaling groups and click create auto scaling group choose launch template -name = what you choose to name it Launch template -select launch template, you can choose the version as well -when done click next Network
chose the vpc you created availability zones and subnet = choose the privates subnets -Availability Zone distribution = Balanced best effort then click orange next button Load balancing
click attach existing load balancer
select the load balancers to attach = choose from application or network load balancer groups Application or network Load Balancer target groups = choose the target group you created VPC Lattice integration options= No VPC Lattice service Health checks additional health check types = Turn on ELastic Load Balancing health checks click on the orange next button group size
scaling
automatic scaling = target tracking scaling policy instance maintenance policy = no policy additional capacity setting = default additional settings = skip click orange next add notifications add tags review -review the summary when done click on orange create auto scaling group button
