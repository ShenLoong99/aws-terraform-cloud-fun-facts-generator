<a id="readme-top"></a>

<div align="center">

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![Unlicense License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]

  <h1>☁️ Cloud Fun Facts Generator</h1>
  <img src="assets/Cloud Fun Facts Webpage.png" alt="Webpage Output" />
  <p>An AI-powered serverless application built with Terraform, AWS Lambda, and Amazon Bedrock.</p>

![AWS](https://img.shields.io/badge/AWS-%23FF9900.svg?style=for-the-badge&logo=amazon-aws&logoColor=white)
![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white)
![Python](https://img.shields.io/badge/python-3670A0?style=for-the-badge&logo=python&logoColor=ffdd54)

<br>

![GitHub Actions](https://img.shields.io/badge/GitHub_Actions-2088FF?style=for-the-badge&logo=github-actions&logoColor=white)<br>
[![Infrastructure CI][ci-shield]][ci-url]
[![Production Deployment][cd-shield]][cd-url]
[![Update Documentation][docs-shield]][docs-url]

<br>

![Last Commit](https://img.shields.io/github/last-commit/ShenLoong99/aws-terraform-cloud-fun-facts-generator?style=for-the-badge)
![Repo Size](https://img.shields.io/github/repo-size/ShenLoong99/aws-terraform-cloud-fun-facts-generator?style=for-the-badge)
![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?style=for-the-badge&logo=pre-commit&logoColor=white)
[![Checkov Security](https://img.shields.io/badge/Checkov-Secured-brightgreen?style=for-the-badge&logo=checkov&logoColor=white)](https://github.com/ShenLoong99/aws-terraform-cloud-fun-facts-generator/actions/workflows/ci.yml)

<a href="#about-the-project"><strong>Explore the docs »</strong></a>

</div>

<details>
  <summary>Table of Contents</summary>
  <ol>
    <li><a href="#about-the-project">About The Project</a></li>
    <li><a href="#built-with">Built With</a></li>
    <li><a href="#use-cases">Use Cases</a></li>
    <li><a href="#architecture">Architecture</a></li>
    <li><a href="#file-structure">File Structure</a></li>
    <li><a href="#technical">Technical Reference</a></li>
    <li><a href="#getting-started">Getting Started</a></li>
    <li><a href="#gitops">GitOps & CI/CD Workflow</a></li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#challenges-faced">Challenges</a></li>
    <li><a href="#cost-optimization">Cost Optimization</a></li>
    <li><a href="#acknowledgements">Acknowledgements</a></li>
  </ol>
</details>

<h2 id="about-the-project">About The Project</h2>
<p>
  A full-stack, AI-enhanced serverless application designed to bridge the gap between isolated tutorials and real-world architecture. This project demonstrates a production-ready flow where Terraform manages a high-performance backend and a secure frontend.
</p>
<p>
    <strong>Notice:</strong> This project has been migrated from a monolithic collection at <a href="https://github.com/ShenLoong99/my-terraform-aws-projects-2025">my-terraform-aws-projects-2025</a> to this dedicated repository for better project isolation and CI/CD management.<br>
    To review the full development lifecycle, including initial architectural decisions and incremental code changes, please refer to the original commit history in the source repository.
  </p>
<div align="right"><a href="#readme-top">↑ Back to Top</a></div>

<h2 id="built-with">Built With</h2>
<p>
  <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/terraform/terraform-original.svg" alt="terraform" width="45" height="45" style="margin: 10px;"/>
  <img src="https://raw.githubusercontent.com/github/explore/80688e429a7d4ef2fca1e82350fe8e3517d3494d/topics/aws/aws.png" alt="aws" width="45" height="45" style="margin: 10px;"/>
  <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/python/python-original.svg" alt="python" width="45" height="45" style="margin: 10px;"/>
  <img src="https://raw.githubusercontent.com/weibeld/aws-icons-svg/main/q1-2022/Architecture-Service-Icons_01312022/Arch_Compute/48/Arch_AWS-Lambda_48.svg" alt="lambda" width="45" height="45" style="margin: 10px;">
  <img src="https://raw.githubusercontent.com/weibeld/aws-icons-svg/main/q1-2022/Architecture-Service-Icons_01312022/Arch_App-Integration/Arch_48/Arch_ Amazon-API-Gateway_48.svg" alt="api-gateway" width="45" height="45" style="margin: 10px;"/>
  <img src="https://raw.githubusercontent.com/weibeld/aws-icons-svg/main/q1-2022/Architecture-Service-Icons_01312022/Arch_Database/48/Arch_Amazon-DynamoDB_48.svg" alt="dynamodb" width="45" height="45" style="margin: 10px;"/>
  <img src="assets/bedrock-color.svg" alt="bedrock" width="45" height="45" style="margin: 10px;">
  <img src="https://raw.githubusercontent.com/weibeld/aws-icons-svg/main/q1-2022/Resource-Icons_01312022/Res_Storage/Res_48_Light/Res_Amazon-Simple-Storage-Service_S3-Standard_48_Light.svg" alt="s3" width="45" height="45" style="margin: 10px;"/>
  <img src="https://raw.githubusercontent.com/weibeld/aws-icons-svg/main/q1-2022/Architecture-Service-Icons_01312022/Arch_Networking-Content-Delivery/48/Arch_Amazon-CloudFront_48.svg" alt="cloudfront" width="45" height="45" style="margin: 10px;"/>
  <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/githubactions/githubactions-original.svg" alt="github-actions" width="45" height="45" style="margin: 10px;"/>
</p>
<ul>
  <li><strong>Terraform Cloud</strong> - Managed IaC and state synchronization</li>
  <li><strong>AWS Lambda (Python 3.13)</strong> - Event-driven compute on ARM64 for cost-efficiency</li>
  <li><strong>AWS API Gateway</strong> - Managed HTTP API with built-in throttling</li>
  <li><strong>Amazon DynamoDB</strong> - On-demand NoSQL database for fact storage</li>
  <li><strong>Amazon Bedrock (Claude 3.5)</strong> - Generative AI for real-time witty fact rewriting</li>
  <li><strong>Amazon S3 & CloudFront</strong> – Secure, global static web hosting</li>
  <li><strong>GitHub Actions</strong> – Orchestrating the "Zero-Secret" deployment pipeline</li>
  <li><strong>OpenID Connect (OIDC)</strong> – Secure, keyless authentication between GitHub and AWS</li>
</ul>
<div align="right"><a href="#readme-top">↑ Back to Top</a></div>

<h2 id="use-cases">Use Cases</h2>
<p>
  This project demonstrates a production-grade serverless workflow, bridging the gap between manual "ClickOps" tutorials and professional Cloud Engineering
</p>
<ul>
  <li><strong>Infrastructure Maturity:</strong> Replaces manual console clicks with Terraform Cloud for automated, reproducible state management.</li>
  <li><strong>Secure Web Hosting:</strong> Uses Amazon S3 & CloudFront (OAC) to deliver high-performance, globally distributed content with zero public bucket access.</li>
  <li><strong>AI-Driven Logic:</strong> Integrates Amazon Bedrock (Claude 3.5) to transform static data into witty, human-like responses in real-time.</li>
  <li><strong>Performance & Cost:</strong> Optimized with AWS Lambda on ARM64 architecture for superior price-performance.</li>
  <li><strong>Production Safeguards:</strong> Features API Gateway Throttling to prevent cost overruns and DynamoDB On-Demand for seamless scaling.</li>
</ul>
<div align="right"><a href="#readme-top">↑ Back to Top</a></div>

<h2 id="architecture">Architecture</h2>
<p align="center">
  <img src="assets/AWS Cloud Fun Facts Generator.jpg" alt="Architecture Diagram" />
</p>
<p>
  The application follows a modern serverless flow:
  <br>
  <code>User Browser</code> ➔ <code>CloudFront</code> ➔ <code>S3 (Frontend)</code>
  <br>
  <code>User Browser</code> ➔ <code>API Gateway</code> ➔ <code>Lambda</code> ➔ <code>DynamoDB (Fetch)</code> ➔ <code>Bedrock AI (Transform)</code>
</p>
<div align="right"><a href="#readme-top">↑ Back to Top</a></div>

<h2 id="file-structure">File Structure</h2>
<pre>.
├── .github/
│   └── workflows/            # CI/CD Pipeline Definitions
│       ├── cd.yml            # Production Deployment (OIDC + S3 Sync)
│       ├── ci.yml            # Terraform PR Insights (Checkov, TFLint, Plan)
│       └── documentation.yml # Automated Documentation Sync via terraform-docs
├── assets/                   # Documentation images and UI design icons
├── frontend/                 # Static website files
│   └── index.html            # Main UI (Dynamically patched with API URL by CD)
├── lambda/                   # Serverless backend logic
│   └── lambda_function.py    # Python source code for Fact Generation
├── scripts/                  # Automation & Validation Scripts
│   ├── health-check.sh       # Post-deployment API verification
│   └── smoke-test-website.sh # Frontend availability verification
├── api_gateway.tf            # AWS API Gateway (HTTP API) configurations
├── cloudfront.tf             # CDN configuration with OAC for S3 security
├── database.tf               # DynamoDB table and seed data locals
├── iam.tf                    # Least-privilege IAM Roles and Policies
├── lambda.tf                 # Lambda function and Archive provider setup
├── main.tf                   # Provider & Random ID configurations
├── outputs.tf                # CloudFront and API Gateway URLs for the user
├── storage.tf                # S3 Bucket and Lifecycle policy definitions
├── providers.tf              # Terraform Cloud backend & version constraints
├── variables.tf              # Configurable project inputs (AWS Region, Tags)
├── .pre-commit-config.yaml   # Local git-hook orchestration
├── .tflint.hcl               # TFLint AWS ruleset configuration
└── README.md                 # Project documentation (Auto-injected by terraform-docs)
</pre>
<div align="right"><a href="#readme-top">↑ Back to Top</a></div>

<h2 id="technical">Technical Reference</h2>
This section is automatically updated with the latest infrastructure details.
<details>
<summary><b>Detailed Infrastructure Specifications</b></summary>

<!-- BEGIN_TF_DOCS -->

## Requirements

| Name                                                                     | Version  |
| ------------------------------------------------------------------------ | -------- |
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | >= 1.5.0 |
| <a name="requirement_archive"></a> [archive](#requirement_archive)       | ~> 2.0   |
| <a name="requirement_aws"></a> [aws](#requirement_aws)                   | ~> 5.0   |
| <a name="requirement_random"></a> [random](#requirement_random)          | ~> 3.0   |

## Modules

| Name                                                        | Source             | Version |
| ----------------------------------------------------------- | ------------------ | ------- |
| <a name="module_api"></a> [api](#module_api)                | ./modules/api      | n/a     |
| <a name="module_cdn"></a> [cdn](#module_cdn)                | ./modules/cdn      | n/a     |
| <a name="module_database"></a> [database](#module_database) | ./modules/database | n/a     |
| <a name="module_iam"></a> [iam](#module_iam)                | ./modules/iam      | n/a     |
| <a name="module_lambda"></a> [lambda](#module_lambda)       | ./modules/lambda   | n/a     |
| <a name="module_storage"></a> [storage](#module_storage)    | ./modules/storage  | n/a     |

## Resources

| Name                                                                                                                                    | Type     |
| --------------------------------------------------------------------------------------------------------------------------------------- | -------- |
| [aws_cloudwatch_log_group.lambda_log](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |

## Inputs

| Name                                                            | Description                    | Type     | Default            | Required |
| --------------------------------------------------------------- | ------------------------------ | -------- | ------------------ | :------: |
| <a name="input_aws_region"></a> [aws_region](#input_aws_region) | AWS region to deploy resources | `string` | `"ap-southeast-1"` |    no    |

## Outputs

| Name                                                                                                              | Description                       |
| ----------------------------------------------------------------------------------------------------------------- | --------------------------------- |
| <a name="output_api_endpoint"></a> [api_endpoint](#output_api_endpoint)                                           | Public API endpoint               |
| <a name="output_aws_region"></a> [aws_region](#output_aws_region)                                                 | AWS region to deploy resources    |
| <a name="output_cloudfront_distribution_id"></a> [cloudfront_distribution_id](#output_cloudfront_distribution_id) | ID of the cloudfront distribution |
| <a name="output_cloudfront_url"></a> [cloudfront_url](#output_cloudfront_url)                                     | URL of website                    |
| <a name="output_s3_bucket_id"></a> [s3_bucket_id](#output_s3_bucket_id)                                           | ID of the S3 bucket               |

<!-- END_TF_DOCS -->
</details>
<div align="right"><a href="#readme-top">↑ Back to Top</a></div>

<h2 id="getting-started">Getting Started</h2>
<h3>Prerequisites</h3>
<ul>
  <li>AWS Account with Bedrock Claude 3.5 model access enabled.</li>
  <li>Terraform CLI (v1.5.0+) installed locally.</li>
  <li>Terraform Cloud account for remote state management.</li>
  <li><strong>Set your AWS Region:</strong> Set to whatever <code>aws_region</code> you want in <code>variables.tf</code>.</li>
</ul>
<p>
  <img src="assets/Terraform Cloud.png" alt="Terraform Cloud" />
</p>

<h3>Terraform Cloud State Management</h3>
<ol>
   <li>Create a new <strong>Workspace</strong> with github version control workflow in Terraform Cloud.</li>
   <li>In the Variables tab, add the following <strong>Terraform Variables:</strong>
   </li>
   <li>
    Add the following <strong>Environment Variables</strong> (AWS Credentials):
    <ul>
      <li><code>AWS_ACCESS_KEY_ID</code></li>
      <li><code>AWS_SECRET_ACCESS_KEY</code></li>
   </ul>
   </li>
    <li>
      Run the command ni Terraform CLI:
      <pre>terraform login</pre>
    </li>
    <li>Create a token and follow the steps in browser to complete the Terraform Cloud Connection.</li>
    <li>
      Add the <code>backend</code> block in <code>terraform</code> code block</code>:
    <pre>backend "remote" {
  hostname     = "app.terraform.io"
  organization = &lt;your-organization-name&gt;
  workspaces {
    name = &lt;your-workspace-name&gt;
  }
}</pre>
   </li>
    <li>
      Run the command in Terraform CLI to migrate the state into Terraform Cloud:
      <pre>terraform init -migrate-state</pre>
    </li>
</ol>

<h3>Installation & Deployment</h3>
<ol>
    <li>
        <strong>Clone the Repository:</strong>
        <pre>git clone https://github.com/ShenLoong99/aws-terraform-cloud-fun-facts-generator.git</pre>
    </li>
    <li>
        <strong>Provision Infrastructure:</strong><br>
        <strong>Terraform Cloud</strong> → <strong>Initialize & Apply:</strong> Push your code to GitHub. Terraform Cloud will automatically detect the change, run a <code>plan</code>, and wait for your approval.
    </li>
    <li>
        <strong>Observe workflow:</strong><br>
        <strong>GitHub (GitOps)</strong> → <strong>Github actions:</strong> Observe the process/workflow of CI/CD in the actions tab in GitHub.
    </li>
</ol>
<div align="right"><a href="#readme-top">↑ Back to Top</a></div>

<h2 id="gitops">GitOps & CI/CD Workflow</h2>
<p>This project uses a fully automated GitOps pipeline to ensure code quality and deployment reliability. The <strong>Pre-commit</strong> framework implements a "Shift-Left" strategy, ensuring that code is formatted, documented, and secure before it ever leaves your machine.</p>

<h3>Workflow Files</h3>
<ol>
  <li>
    <strong>Pre-commit</strong>
    <ul>
      <li><strong>Tool:</strong> Executes <code>terraform fmt</code>, <code>terraform validate</code>, <code>TFLint</code>, <code>terraform_docs</code> and <code>checkov</code> to ensure the code is clean.</li>
      <li><strong>Trigger:</strong> Runs on every <strong>git commit</strong>.</li>
      <li>
        <strong>Outcome:</strong> If any check fails, the commit is blocked. You fix the error, re-add the file, and commit again.
      </li>
    </ul>
  </li>
  <li>
    <strong>Continuous Integration (PR)</strong>
    <ul>
      <li><strong>Tool:</strong> Executes <code>terraform fmt -check</code>, <code>terraform validate</code> and <code>checkov</code>, then do <code>plan</code> and cost estimation and print it on PR.</li>
      <li><strong>Trigger:</strong> Runs on every <strong>Pull Request</strong>.</li>
      <li>
        <strong>Outcome:</strong> This acts as the "Gatekeeper" before code is merged to <code>main</code>.
      </li>
    </ul>
  </li>
  <li>
    <strong>Continuous Delivery (Deployment)</strong>
    <ul>
      <li><strong>Tool:</strong> Terraform Cloud + GitHub Actions OIDC.</li>
      <li><strong>Trigger:</strong> Merges to the <code>main</code> branch.</li>
      <li>
        <strong>Outcome:</strong> The pipeline verifies the infrastructure state and runs a post-deployment health check with(<code>health-check.sh</code> & <code>smoke-test-website.sh</code>).
      </li>
    </ul>
  </li>
  <li>
    <strong>Dynamically update readme documentation</strong>
    <ul>
      <li><strong>Tool:</strong> <code>terraform_docs</code> + GitHub Actions.</li>
      <li><strong>Trigger:</strong> Merges to the <code>main</code> branch.</li>
      <li>
        <strong>Outcome:</strong> The pipeline verifies the infrastructure state from Terraform Cloud, retrieve outputs from Terraform Cloud and update the readme documentation file dynamically.
      </li>
    </ul>
  </li>
</ol>

<h3>Prerequisites for GitOps</h3>
<ul>
  <li><strong>Repository Secret <code>TF_API_TOKEN</code>:</strong> Required for GitHub to communicate with Terraform Cloud.</li>
  <li><strong>Trigger:</strong> A GitHub Actions OIDC role (<code>GitHubActionRole</code>) allows the runner to verify AWS resources without long-lived keys.</li>
</ul>

<h2 id="usage">Usage & Testing</h2>
<p>Once deployment is complete, Terraform provides a few key outputs. Please take note of these 2:</p>
<p>
  <img src="assets/Terraform Output.png" alt="Terraform Output" />
</p>
<ul>
  <li>
    <strong>Web Interface:</strong> Access the live site at the <code>cloudfront_url</code>.<br>
    <img src="assets/Cloud Fun Facts Webpage with result.png" alt="Cloud Fun Facts Webpage with result" />
  </li>
  <li>
    <strong>REST API:</strong> The raw backend directly at the <code>api_endpoint</code>.
  </li>
</ul>
<div align="right"><a href="#readme-top">↑ Back to Top</a></div>

<h2 id="roadmap">Project Roadmap</h2>
<ul>
  <li>[x] <strong>Basic Version:</strong> Core logic with Lambda + API Gateway integration.</li>
  <li>[x] <strong>Database Version:</strong> Persistence layer using DynamoDB to store and scale facts.</li>
  <li>[x] <strong>GenAI Version:</strong> Integration with Amazon Bedrock to make facts witty and engaging.</li>
  <li>[x] <strong>Frontend Distribution:</strong> Static site hosting via S3 with CloudFront (OAC) for global speed and security.</li>
</ul>
<div align="right"><a href="#readme-top">↑ Back to Top</a></div>

<h2 id="challenges-faced">Challenges</h2>
<table>
   <thead>
      <tr>
         <th>Challenge</th>
         <th>Solution</th>
      </tr>
   </thead>
   <tbody>
      <tr>
         <td><strong>Designing a fully serverless architecture</strong></td>
         <td>Adopted AWS Lambda and API Gateway to eliminate server management while ensuring scalability and low operational cost.</code></td>
      </tr>
      <tr>
         <td><strong>Managing infrastructure complexity</strong></td>
         <td>Used <strong>Terraform (Infrastructure as Code)</strong> to define and provision all AWS resources consistently, making the setup reproducible and version-controlled.</td>
      </tr>
      <tr>
         <td><strong>IAM permission scoping issues</strong></td>
         <td>Refined IAM roles and policies using least-privilege principles to allow Lambda access only to required services, improving security and deployment stability.</td>
      </tr>
      <tr>
         <td><strong>Handling API integration and responses</strong></td>
         <td>Standardized API Gateway request/response mapping to ensure clean JSON outputs and predictable client-side consumption.</td>
      </tr>
      <tr>
         <td><strong>Deployment and iteration speed</strong></td>
         <td>Modularized Terraform configurations and Lambda code to allow faster updates without redeploying the entire stack.</td>
      </tr>
      <tr>
         <td><strong>Securely connecting GitHub to AWS</strong></td>
         <td>Implemented OIDC to replace long-lived IAM user keys with short-lived session tokens.</td>
      </tr>
      <tr>
         <td><strong>Hardcoded API Endpoints</strong></td>
         <td>Used a <code>sed</code> injection step in the CI/CD pipeline to dynamically update the frontend with the API URL.</td>
      </tr>
      <tr>
         <td><strong>Broken "BucketNotEmpty" Errors</strong></td>
         <td>Configured <code>force_destroy = true</code> in Terraform to allow for clean automated teardowns during testing.</td>
      </tr>
      <tr>
         <td><strong>Script Failure on Untagged Resources</strong></td>
         <td>Refactored bash discovery scripts with robust loops to safely skip untagged AWS resources.</td>
      </tr>
   </tbody>
</table>
<div align="right"><a href="#readme-top">↑ Back to Top</a></div>

<h2 id="cost-optimization">Cost Optimization (Free Tier)</h2>
<p>This project is architected to run at <strong>$0/month</strong> for standard testing volumes:</p>
<ul>
  <li><strong>Lambda:</strong> Using <strong>ARM64</strong> architecture for better price-performance.</li>
  <li><strong>Storage:</strong> S3 lifecycle rules to automatically clean up old files after 30 days.</li>
  <li><strong>Logging:</strong> 7-day retention on CloudWatch logs to prevent storage costs.</li>
  <li><strong>Throttling:</strong> API limits (100 req/s) to prevent unexpected usage spikes.</li>
</ul>
<div align="right"><a href="#readme-top">↑ Back to Top</a></div>

<h2 id="acknowledgements">Acknowledgements</h2>
<p>
  Special thanks to <strong>Tech with Lucy</strong> for the architectural inspiration and excellent AWS tutorials that helped shape this pipeline.
</p>
<ul>
  <li>
    See her youtube channel here: <a href="https://www.youtube.com/@TechwithLucy" target="_blank">Tech With Lucy</a>
  </li>
  <li>
    Watch her video here: <a href="https://www.youtube.com/watch?v=hiE0El3zs1Y" target="_blank">5 Beginner AWS Cloud Projects To Get You Hired (2025)</a>
  </li>
</ul>
<div align="right"><a href="#readme-top">↑ Back to Top</a></div>

[contributors-shield]: https://img.shields.io/github/contributors/ShenLoong99/aws-terraform-cloud-fun-facts-generator.svg?style=for-the-badge
[contributors-url]: https://github.com/ShenLoong99/aws-terraform-cloud-fun-facts-generator/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/ShenLoong99/aws-terraform-cloud-fun-facts-generator.svg?style=for-the-badge
[forks-url]: https://github.com/ShenLoong99/aws-terraform-cloud-fun-facts-generator/network/members
[stars-shield]: https://img.shields.io/github/stars/ShenLoong99/aws-terraform-cloud-fun-facts-generator.svg?style=for-the-badge
[stars-url]: https://github.com/ShenLoong99/aws-terraform-cloud-fun-facts-generator/stargazers
[issues-shield]: https://img.shields.io/github/issues/ShenLoong99/aws-terraform-cloud-fun-facts-generator.svg?style=for-the-badge
[issues-url]: https://github.com/ShenLoong99/aws-terraform-cloud-fun-facts-generator/issues
[license-shield]: https://img.shields.io/github/license/ShenLoong99/aws-terraform-cloud-fun-facts-generator.svg?style=for-the-badge
[license-url]: https://github.com/ShenLoong99/aws-terraform-cloud-fun-facts-generator/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: {{LINKEDIN_URL}}
[ci-shield]: https://github.com/ShenLoong99/aws-terraform-cloud-fun-facts-generator/actions/workflows/ci.yml/badge.svg
[ci-url]: https://github.com/ShenLoong99/aws-terraform-cloud-fun-facts-generator/actions/workflows/ci.yml
[cd-shield]: https://github.com/ShenLoong99/aws-terraform-cloud-fun-facts-generator/actions/workflows/cd.yml/badge.svg
[cd-url]: https://github.com/ShenLoong99/aws-terraform-cloud-fun-facts-generator/actions/workflows/cd.yml
[docs-shield]: https://github.com/ShenLoong99/aws-terraform-cloud-fun-facts-generator/actions/workflows/documentation.yml/badge.svg
[docs-url]: https://github.com/ShenLoong99/aws-terraform-cloud-fun-facts-generator/actions/workflows/documentation.yml
