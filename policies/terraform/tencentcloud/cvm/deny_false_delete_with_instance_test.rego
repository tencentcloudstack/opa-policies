package terraform_tencentcloud

import data.testing as t

test_deny_false_delete_with_instance_exception {
	input := {{
		"format_version": "0.2",
		"terraform_version": "1.0.10",
		"planned_values": {"root_module": {"resources": [{
			"address": "tencentcloud_instance.foo",
			"mode": "managed",
			"type": "tencentcloud_instance",
			"name": "foo",
			"provider_name": "registry.terraform.io/tencentcloudstack/tencentcloud",
			"schema_version": 0,
			"values": {"data_disks": [{
				"data_disk_size": 50,
				"data_disk_snapshot_id": null,
				"data_disk_type": "CLOUD_PREMIUM",
				"delete_with_instance": true,
				"encrypt": false,
				"throughput_performance": 0,
			}]},
		}]}},
	}}

	t.no_errors(deny_false_delete_with_instance) with input as input
}

test_deny_false_delete_with_instance {
	input := {
		"format_version": "0.2",
		"terraform_version": "1.0.10",
		"planned_values": {"root_module": {"resources": [{
			"address": "tencentcloud_instance.foo",
			"mode": "managed",
			"type": "tencentcloud_instance",
			"name": "foo",
			"provider_name": "registry.terraform.io/tencentcloudstack/tencentcloud",
			"schema_version": 0,
			"values": {"data_disks": [{
				"data_disk_size": 50,
				"data_disk_snapshot_id": null,
				"data_disk_type": "CLOUD_PREMIUM",
				"delete_with_instance": false,
				"encrypt": false,
				"throughput_performance": 0,
			}]},
		}]}},
	}

	t.error_count(deny_false_delete_with_instance, 1) with input as input
}

test_deny_false_delete_with_instance_all {
	input := {
		"format_version": "0.2",
		"terraform_version": "1.0.10",
		"planned_values": {"root_module": {"resources": [{
			"address": "tencentcloud_instance.foo",
			"mode": "managed",
			"type": "tencentcloud_instance",
			"name": "foo",
			"provider_name": "registry.terraform.io/tencentcloudstack/tencentcloud",
			"schema_version": 0,
			"values": {"data_disks": [
				{
					"data_disk_size": 50,
					"data_disk_snapshot_id": null,
					"data_disk_type": "CLOUD_PREMIUM",
					"delete_with_instance": true,
					"encrypt": false,
					"throughput_performance": 0,
				},
				{
					"data_disk_size": 50,
					"data_disk_snapshot_id": null,
					"data_disk_type": "CLOUD_PREMIUM",
					"delete_with_instance": false,
					"encrypt": false,
					"throughput_performance": 0,
				},
			]},
		}]}},
	}

	t.error_count(deny_false_delete_with_instance, 1) with input as input
}
