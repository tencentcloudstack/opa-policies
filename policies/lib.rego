package lib

get_url(check) = url {
	url := sprintf("https://github.com/tencentcloudstack/opa-policies/wiki/%s", [check])
}

is_create_or_update(change_actions) {
	change_actions[count(change_actions) - 1] == ["create", "update"][_]
}