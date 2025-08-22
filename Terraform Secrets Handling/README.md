✅ **2. Add a dev profile**

You can add it manually or via CLI:

```
aws configure --profile dev

```

It will ask you for:

- AWS Access Key ID

- AWS Secret Access Key

- Default region

This automatically updates ~/.aws/credentials (and ~/.aws/config if needed).

✅ 3. **Terraform Provider Block**

Your main.tf should look like this:

```
provider "aws" {
  region                  = "ap-south-1"
  shared_credentials_files = ["~/.aws/credentials"]
  profile                 = "dev"
}

```

✅ **4. Test the profile manually**

Before re-running Terraform, test with AWS CLI:

```
aws sts get-caller-identity --profile dev

```
If it works, then Terraform will also work.

**Switch profile in CLI:**

```
aws s3 ls --profile dev
aws s3 ls --profile prod

```

**Set AWS Credentials as Environment Variables**

You can export them directly:

```
export AWS_ACCESS_KEY_ID=YOUR_ACCESS_KEY_ID
export AWS_SECRET_ACCESS_KEY=YOUR_SECRET_ACCESS_KEY
export AWS_DEFAULT_REGION=ap-south-1

```
🧪 **3. Verify Credentials**

Run:

```
aws sts get-caller-identity

```

If successful, you’ll see:

```
{
    "UserId": "...",
    "Account": "...",
    "Arn": "arn:aws:iam::123456789012:user/..."
}


```