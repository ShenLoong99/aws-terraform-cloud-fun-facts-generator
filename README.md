<a id="readme-top"></a>

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![Unlicense License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]
[![Infrastructure CI][ci-shield]][ci-url]
[![Production Deployment][cd-shield]][cd-url]
[![Update Documentation][docs-shield]][docs-url]

<div>
  <p>
    <strong>Notice:</strong> This project has been migrated from a monolithic collection at <a href="https://github.com/ShenLoong99/my-terraform-aws-projects-2025">my-terraform-aws-projects-2025</a> to this dedicated repository for better project isolation and CI/CD management.<br>
    To review the full development lifecycle, including initial architectural decisions and incremental code changes, please refer to the original commit history in the source repository.
  </p>

  <h1>☁️ Cloud Fun Facts Generator</h1>
    <img src="assets/Cloud Fun Facts Webpage.png" alt="Webpage Output" width="800">
  <p>
    An AI-powered serverless application built with Terraform, AWS Lambda, and Amazon Bedrock.
    <br />
    <a href="#about-the-project"><strong>Explore the docs »</strong></a>
  </p>
</div>

<details>
  <summary>Table of Contents</summary>
  <ol>
    <li><a href="#about-the-project">About The Project</a></li>
    <li><a href="#built-with">Built With</a></li>
    <li><a href="#use-cases">Use Cases</a></li>
    <li><a href="#architecture">Architecture</a></li>
    <li><a href="#file-structure">File Structure</a></li>
    <li><a href="#getting-started">Getting Started</a></li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#challenges-faced">Challenges</a></li>
    <li><a href="#cost-optimization">Cost Optimization</a></li>
  </ol>
</details>

<h2 id="about-the-project">About The Project</h2>
<p>
  A full-stack, AI-enhanced serverless application designed to bridge the gap between isolated tutorials and real-world architecture. This project demonstrates a production-ready flow where Terraform manages a high-performance backend and a secure frontend.
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
  <img src="assets/AWS Cloud Fun Facts Generator.jpg" alt="Architecture Diagram" width="800">
</p>
<p>
  The application follows a modern serverless flow:
  <br>
  <code>User Browser</code> ➔ <code>CloudFront</code> ➔ <code>S3 (Frontend)</code>
  <br>
  <code>User Browser</code> ➔ <code>API Gateway</code> ➔ <code>Lambda</code> ➔ <code>DynamoDB (Fetch)</code> ➔ <code>Bedrock AI (Transform)</code>
</p>
<h3 id="devops-gitops">🚀 DevOps & GitOps Workflow</h3>
<p> This project utilizes a <strong>Zero-Secret</strong> security model. By leveraging GitHub Actions with <strong>OIDC (OpenID Connect)</strong>, the pipeline authenticates with AWS using short-lived tokens, eliminating the need for permanent <code>AWS_ACCESS_KEY_ID</code> stored in GitHub secrets. </p>
<ul>
   <li><strong>Infrastructure as Code (IaC):</strong> Managed by <strong>Terraform Cloud</strong> via a VCS-driven workflow. Every Pull Request triggers a <code>speculative plan</code> with cost estimates.</li>
   <li><strong>Continuous Deployment (CD):</strong> A manual <code>workflow_dispatch</code> pipeline in GitHub Actions handles frontend asset delivery and CloudFront cache invalidation only after infrastructure is verified.</li>
   <li><strong>Automated Resource Discovery:</strong> The pipeline uses <strong>AWS Resource Tagging</strong> to dynamically locate the correct S3 buckets and CloudFront IDs, making the scripts 100% project-agnostic.</li>
   <li><strong>Dynamic Injection:</strong> Since GitHub Actions handles the frontend sync, a <code>sed</code>-based injection process dynamically patches the <code>index.html</code> with the latest API Gateway endpoint during the build phase.</li>
</ul>
<div align="right"><a href="#readme-top">↑ Back to Top</a></div>

<h2 id="file-structure">File Structure</h2>
<pre>.
├── .github/
│   └── workflows/           # CI/CD Pipeline Definitions
│       ├── cd.yml           # Production Deployment (OIDC + S3 Sync)
│       ├── ci.yml           # Terraform PR Insights & Planning
│       └── update-readme.yml # Automated Documentation Sync
├── assets/                  # Documentation images and UI design icons
├── frontend/                # Static website files
│   └── index.html           # Main user interface (Dynamically patched by CD)
├── lambda/                  # Serverless backend logic
│   ├── lambda_function.py   # Python source code for Fact Generation & AI
│   └── lambda_function.zip  # Deployment artifact generated for AWS
├── scripts/                 # Automation & Validation Scripts
│   ├── health-check.sh      # Post-deployment API verification
│   └── pre-commit-check.sh  # Local validation before pushing code
├── main.tf                  # Core Terraform logic (Lambda, DynamoDB, API Gateway)
├── outputs.tf               # CloudFront and API Gateway URLs for the user
├── terraform.tf             # Terraform Cloud backend configuration
├── variable.tf              # Configurable project inputs (AWS Region, Tags)
└── README.md                # Project documentation (Generated from template)
</pre>
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
  <img src="assets/Terraform Cloud.png" alt="Terraform Cloud" width="800"/>
</p>

<h3>Terraform State Management</h3>
<p>Select one:</p>
<ol>
   <li>Terraform Cloud</li>
   <li>Terraform Local CLI</li>
</ol>

<h4>Terraform Cloud Configuration</h4>
<p>If you choose Terraform Cloud, please follow the steps below:</p>
<ol>
   <li>Create a new <strong>Workspace</strong> in Terraform Cloud.</li>
   <li>
    Add the following <strong>Environment Variables</strong> (AWS Credentials):
    <ul>
      <li><code>AWS_ACCESS_KEY_ID</code></li>
      <li><code>AWS_SECRET_ACCESS_KEY</code></li>
   </ul>
   </li>
</ol>

<h4>Terraform Local CLI Configuration</h4>
<p>If you choose Terraform Local CLI, please follow the steps below:</p>
<ol>
   <li>
      Comment the <code>backend</code> block in <code>terraform.tf</code>:
      <pre># backend "remote" {
#   hostname     = "app.terraform.io"
#   organization = "my-terraform-aws-projects-2025"
#   workspaces {
#     name = "AWS-Cloud-Fun-Facts-Generator"
#   }
# }</pre>
   </li>
   <li>
    Add the following <strong>Environment Variables</strong> (AWS Credentials):
    <pre>git bash command:
export AWS_ACCESS_KEY_ID=&lt;your-aws-access-key-id&gt;
export AWS_SECRET_ACCESS_KEY=&lt;your-aws-secret-access-key&gt;</li>
</ol>

<h3>Installation</h3>
<ol>
  <li>Clone the repo</li>
  <li><strong>Terraform Cloud</strong> → <strong>Initialize & Apply:</strong> Push your code to GitHub. Terraform Cloud will automatically detect the change, run a <code>plan</code>, and wait for your approval.</li>
   <li><strong>Terraform CLI</strong> → <strong>Initialize & Apply:</strong> Run <code>terraform init</code> → <code>terraform plan</code> → <code>terraform apply</code>, and wait for your approval.</li>
</ol>
<div align="right"><a href="#readme-top">↑ Back to Top</a></div>

<h2 id="usage">Usage & Testing</h2>
<p>Once deployment is complete, Terraform provides two key outputs:</p>
<p>
  <img src="assets/Terraform Output.png" alt="Terraform Output" width="800">
</p>
<ul>
  <li><strong>Web Interface:</strong> Access the live site at the <code>cloudfront_url</code> (e.g., <code>https://d11a5c37xehwja.cloudfront.net</code>).</li>
  <li><strong>REST API:</strong> Test the raw backend directly at the <code>api_invoke_url</code>: (e.g., <code>curl https://g1kcof6nl1.execute-api.ap-southeast-1.amazonaws.com/funfact</code>)
  </li>
</ul>

<h3 id="quality-gates">🛡️ Quality Gates & Automation</h3>
<ul>
   <li><strong>PR Insights:</strong> Automated Terraform Plan comments are posted directly to Pull Requests, providing visibility into infrastructure changes before merge.</li>
   <li><strong>Deployment Health Checks:</strong> A post-deployment bash script automatically tests the <code>/funfact</code> API endpoint to ensure the system is healthy before finalizing the run.</li>
   <li><strong>Cost Governance:</strong> Terraform Cloud provides real-time cost estimates for every infrastructure change to prevent unexpected cloud bills.</li>
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
[linkedin-url]: 
[ci-shield]: https://github.com/{{GITHUB_USER}}/ShenLoong99/aws-terraform-cloud-fun-facts-generator/actions/workflows/ci.yml/badge.svg
[ci-url]: https://github.com/{{GITHUB_USER}}/ShenLoong99/aws-terraform-cloud-fun-facts-generator/actions/workflows/ci.yml
[cd-shield]: https://github.com/{{GITHUB_USER}}/ShenLoong99/aws-terraform-cloud-fun-facts-generator/actions/workflows/cd.yml/badge.svg
[cd-url]: https://github.com/{{GITHUB_USER}}/ShenLoong99/aws-terraform-cloud-fun-facts-generator/actions/workflows/cd.yml
[docs-shield]: https://github.com/{{GITHUB_USER}}/ShenLoong99/aws-terraform-cloud-fun-facts-generator/actions/workflows/update-readme.yml/badge.svg
[docs-url]: https://github.com/{{GITHUB_USER}}/ShenLoong99/aws-terraform-cloud-fun-facts-generator/actions/workflows/update-readme.yml