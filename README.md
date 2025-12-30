<a id="readme-top"></a>

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![Unlicense License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]

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
    <li><a href="#cost-optimization">Cost Optimization</a></li>
    <li><a href="#contact">Contact</a></li>
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
</p>
<ul>
  <li><strong>Terraform Cloud</strong> - Managed IaC and state synchronization</li>
  <li><strong>AWS Lambda (Python 3.13)</strong> - Event-driven compute on ARM64 for cost-efficiency</li>
  <li><strong>AWS API Gateway</strong> - Managed HTTP API with built-in throttling</li>
  <li><strong>Amazon DynamoDB</strong> - On-demand NoSQL database for fact storage</li>
  <li><strong>Amazon Bedrock (Claude 3.5)</strong> - Generative AI for real-time witty fact rewriting</li>
  <li><strong>Amazon S3 & CloudFront</strong> – Secure, global static web hosting</li>
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
<div align="right"><a href="#readme-top">↑ Back to Top</a></div>

<h2 id="file-structure">File Structure</h2>
<pre>
    .
  ├── assets/                  # Documentation images and UI design icons
  ├── frontend/                # Static website files
  │   └── index.html           # Main user interface hosted on S3
  ├── lambda/                  # Serverless backend logic
  │   ├── lambda_function.py   # Python source code for Fact Generation & AI
  │   └── lambda_function.zip  # Deployment artifact generated for AWS
  ├── main.tf                  # Core Terraform logic (Lambda, DynamoDB, API Gateway)
  ├── outputs.tf               # CloudFront and API Gateway URLs for the user
  ├── terraform.tf             # Terraform Cloud backend configuration
  ├── variable.tf              # Configurable project inputs (AWS Region, Tags)
  ├── .terraform.lock.hcl      # Provider version locking
  └── README.md                # Project documentation
</pre>
<div align="right"><a href="#readme-top">↑ Back to Top</a></div>

<h2 id="getting-started">Getting Started</h2>
<h3>Prerequisites</h3>
<ul>
  <li>AWS Account with Bedrock Claude 3.5 model access enabled.</li>
  <li>Terraform CLI (v1.5.0+) installed locally.</li>
  <li>Terraform Cloud account for remote state management.</li>
</ul>
<p>
  <img src="assets/Terraform Cloud.png" alt="Terraform Cloud" width="800">
</p>

<h3>Installation</h3>
<ol>
  <li>Clone the repo</li>
  <li>Initialize Terraform: <code>terraform init</code></li>
  <li>Deploy to AWS: <code>terraform apply</code></li>
</ol>
<div align="right"><a href="#readme-top">↑ Back to Top</a></div>

<h2 id="usage">Usage & Testing</h2>
<p>Once deployment is complete, Terraform provides two key outputs:</p>
<p>
  <img src="assets/Terraform Output.png" alt="Terraform Output" width="800">
</p>
<ul>
  <li><strong>Web Interface:</strong> Access the live site at the <code>cloudfront_url</code> (e.g., <code>https://d11a5c37xehwja.cloudfront.net</code>).</li>
  <li><strong>REST API:</strong> Test the raw backend directly at the <code>api_invoke_url</code>:
    <br><code>curl https://g1kcof6nl1.execute-api.ap-southeast-1.amazonaws.com/funfact</code>
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

<h2 id="cost-optimization">Cost Optimization (Free Tier)</h2>
<p>This project is architected to run at <strong>$0/month</strong> for standard testing volumes:</p>
<ul>
  <li><strong>Lambda:</strong> Using <strong>ARM64</strong> architecture for better price-performance.</li>
  <li><strong>Storage:</strong> S3 lifecycle rules to automatically clean up old files after 30 days.</li>
  <li><strong>Logging:</strong> 7-day retention on CloudWatch logs to prevent storage costs.</li>
  <li><strong>Throttling:</strong> API limits (100 req/s) to prevent unexpected usage spikes.</li>
</ul>
<div align="right"><a href="#readme-top">↑ Back to Top</a></div>

<h2 id="contact">Contact</h2>
<p>Tan Si Kai - <a href="https://linkedin.com/in/si-kai-tan">LinkedIn</a></p>
<p>Project Link: <a href="https://github.com/ShenLoong99/my-terraform-aws-projects-2025/tree/main/AWS-Cloud-Fun-Facts-Generator">Cloud Fun Facts</a></p>
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
[linkedin-url]: https://linkedin.com/in/https://linkedin.com/in/si-kai-tan