aws elb describe-load-balancers | grep DNSName > lb_dns
sed -i 's/,//g' lb_dns
sed -i 's/"//g' lb_dns
export AWS_LB_DNS=$(awk '{print $2}' lb_dns)