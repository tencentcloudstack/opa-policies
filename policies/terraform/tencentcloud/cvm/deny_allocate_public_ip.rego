package terraform_tencentcloud

import data.lib as l

check02 := "TF_TENCENTCLOUD_02"

deny[msg] {
	resource := input.resource_changes[_]
	resource.mode == "managed"
	resource.type == "tencentcloud_instance"
	l.is_create_or_update(resource.change.actions)
	resource.change.after.allocate_public_ip == true

	msg = sprintf("%s: cvm(%s) allocate_public_ip equal true. More info: %s", [check02, resource.address, l.get_url(check02)])
}