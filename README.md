## TencentCloud OPA Ploicies

### Terraform checks
| ID                                                                                              | Severity | Name                                       |
| ----------------------------------------------------------------------------------------------- | -------- | ------------------------------------------ |
| [TF_TENCENTCLOUD_01](https://github.com/tencentcloudstack/opa-policies/wiki/TF_TENCENTCLOUD_01) | DENY     | CVM data disks is not delete with instance |
| [TF_TENCENTCLOUD_02](https://github.com/tencentcloudstack/opa-policies/wiki/TF_TENCENTCLOUD_02) | DENY     | The CVM allocates a public IP address      |
| [TF_TENCENTCLOUD_03](https://github.com/tencentcloudstack/opa-policies/wiki/TF_TENCENTCLOUD_03) | DENY     | Security group cird uses 0.0.0.0/0         |


### Test
`cd policies && opa test policies`