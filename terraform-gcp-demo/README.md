## **Terraform GCP**

As you know we are going to provision the virtual machine on Google, so we need to select the provider as google.

```
provider "google" {
     credentials = file("gcp-account.json")
     project     = "gcp-terraform-307119"
     region      = "europe-west4"
     zone        = "europe-west4-a"
}
```

#### **Few points to take care -**

- `gcp-account.json` - It is the JSON key file which we have downloaded in Step 4 . Please save the `gcp-account.json` at the same location where you have created `main.tf`
- `project` - You need to mention the `Project ID` from your google console
- `region && zone` - Select the region and zone which is near from your current location

#### **Add "google_compute_instance" instance**

Since we aim to create a Virtual Machine on Google Cloud Platform, so we need to add `google_compute_instance` configuration.

```
resource "google_compute_instance" "default" {
  name         = "test"
  machine_type = "e2-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  # To keep the setup simple you can set the network_interface to default
  # For Advance network setup refer to Point-7 : Setup Network and Firewall for virtual machine
  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }
}
```

#### **Few points to take care -**
1 **name** - You can keep the name of your virtual instance as per your choice
2 **machine_type** - I have chosen e2-micro but you can choose from - `e2-small`, `e2-medium`, `e2-standard-2` etc.
3 **boot_disk** - Here you need to mention the host OS and I have opted for - `debian-cloud/debian-9`
4 **network_interface** - This configuration is needed for getting the IP address of the virtual machine.

#### **Run - terraform init, terraform plan, terraform apply**

Now we have completed all the pre-requisites needed for provisioning the Virtual Machine(VM) on Google Cloud.
The first command which we are going to run is -

 ##### **terraform init**
The first command we need to run is -
```
terraform init
```

This command is going to download all the required dependencies based on the provider name mentioned in the main.tf. In the current example the provider name is `Google` so it is going to install Google's terraform dependencies onto your laptop.

You should see something similar in your console -

```
Initializing the backend...

Initializing provider plugins...
- Reusing the previous version of hashicorp/google from the dependency lock file
- Installing hashicorp/google v3.59.0...
- Installed hashicorp/google v3.59.0 (signed by HashiCorp)

Terraform has been successfully initialized! 
```

##### **terraform plan**

The second command which we are going to run is -

```
terraform plan
```
This command tells you -

1 How many resources are going to be created
2 How many resources are going to be destroyed
3 How many resources are going to change.

Note - terraform plan never creates the VM on google plan, it just tells you what it is going to perform.

As you know this is our first example so the terraform plan is going to create 1 resource for us.

Here is the output of the command -

```
An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # google_compute_instance.default will be created
  + resource "google_compute_instance" "default" {
      + can_ip_forward       = false
      + cpu_platform         = (known after apply)
      + current_status       = (known after apply)
      + deletion_protection  = false
      + guest_accelerator    = (known after apply)
      + id                   = (known after apply)
      + instance_id          = (known after apply)
      + label_fingerprint    = (known after apply)
      + machine_type         = "e2-micro"
      + metadata_fingerprint = (known after apply)
      + min_cpu_platform     = (known after apply)
      + name                 = "test"
      + project              = (known after apply)
      + self_link            = (known after apply)
      + tags_fingerprint     = (known after apply)
      + zone                 = (known after apply)

      + boot_disk {
          + auto_delete                = true
          + device_name                = (known after apply)
          + disk_encryption_key_sha256 = (known after apply)
          + kms_key_self_link          = (known after apply)
          + mode                       = "READ_WRITE"
          + source                     = (known after apply)

          + initialize_params {
              + image  = "debian-cloud/debian-9"
              + labels = (known after apply)
              + size   = (known after apply)
              + type   = (known after apply)
            }
        }

      + confidential_instance_config {
          + enable_confidential_compute = (known after apply)
        }

      + network_interface {
          + name               = (known after apply)
          + network            = "default"
          + network_ip         = (known after apply)
          + subnetwork         = (known after apply)
```
##### **terraform apply**

The final command which we are going to run is `terraform apply`.

This command is going to install/setup the virtual machine on Google Cloud.

```
terraform apply 
```

After running the above command you should see the following message on your terminal

```
Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

google_compute_instance.default: Creating...
google_compute_instance.default: Still creating... [10s elapsed]
google_compute_instance.default: Creation complete after 15s [id=projects/gcp-terraform-307119/zones/europe-west4-a/instances/test]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
```
If you see a similar message on your terminal which means it is has provisioned the Virtual Machine successfully on Google Cloud.
