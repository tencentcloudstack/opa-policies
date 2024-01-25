package terraform_tencentcloud

import data.lib as l

check03 := "TF_TENCENTCLOUD_03"

deny[msg] {
	resource := input.resource_changes[_]
	resource.mode == "managed"
	resource.type == "tencentcloud_security_group_rule"
	l.is_create_or_update(resource.change.actions)
	resource.change.after.cidr_ip == "0.0.0.0/0"

	msg = sprintf("%s: security group(%s) shall not have '0.0.0.0/0' in rules. More info: %s", [check03, resource.address, l.get_url(check03)])
}