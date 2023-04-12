test

Dev setup & CI/CD approach agreed  
CI/CD approach agreed
	1. Set clear entry/exist criteria for CI/CD code, build, test, package, release, and deployment phases.
		
	2. Define package management, package structure and push/pull packages
	3. Define automation build, unit testing, code coverage and  technical debt
	4. Define branch policies, branch merge, versioning and code reviews
	5. Define CI/CD tools section criteria for functional/non-functional testing, customization, etc.
	6. Define configuration management, configure stage and prevision stages 
	
	
Weekly KT session with IT infra


	1. Set clear entry/exist criteria for CI/CD code, build, test, package, release, and deployment phases.
		Define and implement a branching strategy for code development, ensuring guidelines for modular code and proper documentation.
		Set up a well-configured build environment and integrate it with your CI/CD pipeline (Azure DevOps).
		Configure a test environment and integrate unit, integration, and functional testing tools into the CI/CD pipeline, with predefined test coverage thresholds.
		Establish a package management strategy, including the selection of packaging tools, package structure, and designated repositories for storage.
		Set up a release management process, including release environment configurations, versioning strategy, and release notes documentation.
		Configure the deployment process, ensuring proper AWS resources are created using Terraform and integrating deployment tools into the CI/CD pipeline.
		Implement monitoring and logging tools to review test results, deployment logs, and other relevant data, enabling continuous improvement of the pipeline and application quality.


	2. Define package management, package structure and push/pull packages
		Select a suitable package management system for your application's language or framework, such as NPM, Maven, or NuGet.
		Set up package repositories for storing your package artifacts, either in public repositories or private ones like AWS CodeArtifact or Azure Artifacts.
		Define your application's dependencies, including their versions, in the respective package configuration file (e.g., package.json, pom.xml, or .csproj).
		Organize your application's source code, build output, and deployable package according to best practices for your language or framework.
		Configure authentication for secure access to your package repository using API tokens, access keys, or other credentials, and store them securely.
		Integrate package push and pull processes into your CI/CD pipeline, ensuring the use of versioning or tagging for control over which version of the application is deployed.
		Establish lifecycle management processes for your packages, including retiring old versions or promoting packages between environments.

	3. Define automation build, unit testing, code coverage and  technical debt
		Choose appropriate build, unit testing, and code coverage tools for your application's language or framework (e.g., Gradle, JUnit, JaCoCo for Java).
		Set up and configure the build tool with a build configuration file, defining tasks like compilation, minification, bundling, and packaging.
		Integrate the build process into your CI/CD pipeline to automatically trigger builds when new code is pushed to the repository.
		Develop unit tests using the chosen testing framework, ensuring tests are independent and focused on specific functionalities.
		Configure the code coverage tool to analyze your codebase and generate reports, setting minimum acceptable coverage thresholds for your application.
		Integrate unit testing and code coverage tools into your CI/CD pipeline, ensuring the pipeline halts if tests fail or coverage falls below the threshold.
		Set up a static code analysis tool for your language or framework (e.g., Checkstyle, ESLint) and integrate it into the CI/CD pipeline to identify and manage technical debt.


	4. Define branch policies, branch merge, versioning and code reviews

		Establish a branching strategy, such as Gitflow or feature branching, to organize development work and maintain a stable main branch.
		Set up branch policies to enforce code quality standards, such as requiring pull requests, successful builds, and a minimum number of code reviewers.
		Configure your version control system (e.g., Git) to enforce these branch policies and ensure that they are applied to all relevant branches.
		Create guidelines for branch merging, including when and how to merge feature branches into the main branch, as well as handling merge conflicts.
		Implement a versioning strategy, such as Semantic Versioning, to assign unique and meaningful version numbers to your application releases.
		Set up a code review process, including assigning code reviewers, establishing review criteria, and requiring approvals before merging code changes.
		Integrate your version control system with your CI/CD pipeline and other tools (e.g., build, testing, and code analysis) to automate and streamline the development process.

	5. Define CI/CD tools section criteria for functional/non-functional testing, customization, etc.
		List functional and non-functional requirements for your CI/CD pipeline, including required testing types (e.g., performance, security, usability), integration capabilities, and customization needs.
		Evaluate potential CI/CD tools (e.g., Azure DevOps, Jenkins, GitLab) based on their support for your application's language or framework, available features, and compatibility with your existing systems.
		Assess the tools' capabilities for functional testing, ensuring that they support your required testing types and provide sufficient automation and reporting features.
		Verify that the tools support non-functional testing, such as performance, security, and accessibility, and offer the necessary integrations or plugins for these tests.
		Check if the tools provide customization options, such as custom scripts, plugins, or extensions, to tailor the CI/CD pipeline according to your project's specific needs.
		Investigate the tools' integration capabilities with other development tools, such as version control systems, code analysis tools, package managers, and monitoring systems, to ensure a seamless workflow.
		Once you've identified the best CI/CD tool based on the above criteria, set it up and configure it according to your project's requirements and established best practices.


	6. Define configuration management, configure stage and prevision stages 
		Choose a configuration management tool or platform that supports your application's infrastructure and deployment needs, such as Terraform, Ansible, or AWS CloudFormation.
		Define the infrastructure and configuration for each stage of your CI/CD pipeline (e.g., build, test, staging, and production), ensuring that the environment configurations are separated and maintainable.
		Create configuration files or scripts (e.g., Terraform or Ansible files) to describe the required infrastructure resources, services, and settings for each stage.
		Integrate the configuration management tool into your CI/CD pipeline, ensuring that the pipeline automatically applies the correct configurations during the appropriate stages (e.g., provision test environment during the test stage).
		Implement a version control system for your configuration files, to track changes and maintain a history of your infrastructure and environment configurations.
		Set up monitoring and logging for each stage, to capture relevant data for troubleshooting and performance analysis, and ensure proper access controls for configuration management.
		Establish a process for regularly reviewing and updating configurations as needed, to maintain the efficiency and security of your pipeline stages and infrastructure.



terraform KT
Introduction to Terraform
	What is Terraform
	Infrastructure as Code (IaC) concepts
	Terraform vs. other IaC tools
Installing Terraform
	Downloading and installing Terraform
	Verifying installation and version management
	Terraform Basics
	Terraform language syntax (HCL)
	Terraform files and directory structure
Terraform commands
	Terraform Providers
	Understanding providers
	Configuring and using popular providers (e.g., AWS, Azure, GCP)
