package lib

get_url(check) = url {
	url := sprintf("https://github.com/tencentcloudstack/opa-policies/wiki/%s", [check])
}