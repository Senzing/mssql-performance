# template-repository

This repository contains exemplar artifacts (files) for Senzing repositories.

GitHub provides support for these artifacts.  As an example, click on the following links on this GitHub repository:

- "Insights" tab > "[Community](https://github.com/senzing/template-repository/community)" on left-hand navigation bar

## Files

Senzing community files:

1. [CHANGELOG.md](#changelogmd)
1. [CODE_OF_CONDUCT.md](#code_of_conductmd)
1. [CONTRIBUTING.md](#contributingmd)
1. [docs/](#docs)
1. .github/
    1. [CODEOWNERS](#githubcodeowners)
    1. [dependabot.yml](#githubdependabotyml)
    1. ISSUE_TEMPLATE/
        1. [bug_report.md](#githubissue_templatebug_reportmd)
        1. [documentation_request.md](#githubissue_templatedocumentation_requestmd)
        1. [feature_request.md](#githubissue_templatefeature_requestmd)
    1. [senzing-corporate-contributor-license-agreement.pdf](#githubsenzing-corporate-contributor-license-agreementpdf)
    1. [senzing-individual-contributor-license-agreement.pdf](#githubsenzing-individual-contributor-license-agreementpdf)
    1. workflows/
        1. [add-dependabot-request-to-project](githubworkflowsadd-dependabot-request-to-project)
        1. [add-issue-to-project](#githubworkflowsadd-issue-to-project)
        1. [add-triage-label.yaml](#githubworkflowsadd-triage-labelyaml)
        1. [identify-customer.yaml](#githubworkflowsidentify-customeryaml)
1. [LICENSE](#license)
1. [PULL_REQUEST_TEMPLATE.md](#pull_request_templatemd)
1. [README.md](#readmemd)

## README.md

Although the file you are reading is a `README.md` file, this isn't the style of `README.md` for most projects.
Depending upon the type of repository, the following `README.md` templates may be more appropriate:

1. [README.md](.github/README_TEMPLATE/demonstration/README.md) template for demonstrations. Examples:
    1. [template-docker/README.md](https://github.com/Senzing/template-docker/blob/main/README.md)
    1. [template-go/README.md](https://github.com/Senzing/template-go/blob/main/README.md)
    1. [template-python/README.md](https://github.com/Senzing/template-python/blob/main/README.md)

## CHANGELOG.md

The contents of
[CHANGELOG.md](CHANGELOG.md)
are meant to be consumed by users of the repository.
As such, they need to know what changes affect them as users.
In general, changes that do not effect users should not be captured in CHANGELOG.md.
For this reason, automatic generation of CHANGELOG.md entries is discouraged.

The format of `CHANGELOG.md` is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
[markdownlint](https://dlaa.me/markdownlint/).
Also, projects adhere to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## CODE_OF_CONDUCT.md

The
[CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md)
file describes the social conventions among contributors to the repository.

> A *code of conduct* defines standards for how to engage in a community. It signals an inclusive environment that respects all contributions. It also outlines procedures for addressing problems between members of your project's community. For more information on why a code of conduct defines standards and expectations for how to engage in a community, see the [Open Source Guide](https://opensource.guide/code-of-conduct/).
>
> -- <cite>GitHub's [Adding a code of conduct to your project](https://help.github.com/articles/adding-a-code-of-conduct-to-your-project/)</cite>

The [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md) file in this repository is based on GitHub's "[Contributor Covenant](https://www.contributor-covenant.org/version/1/4/code-of-conduct.html)".

### How to create CODE_OF_CONDUCT.md

1. Option #1: Using GitHub's "Wizard"
    1. [github.com](https://github.com/) > (choose repository) > Insights > Community > Code of conduct > "Add" button > "Contributor Covenant"
1. Option #2: Manual file creation
    1. See GitHub's [Adding a code of conduct to your project](https://help.github.com/articles/adding-a-code-of-conduct-to-your-project/)
    1. Alternative `CODE_OF_CONDUCT.md` content:
        1. [Apache Software Foundation Code of Conduct](https://www.apache.org/foundation/policies/conduct.html)

## CONTRIBUTING.md

The
[CONTRIBUTING.md](CONTRIBUTING.md)
file describes the process for contributing to the repository.

> To help your project contributors do good work, you can add a file with contribution guidelines to your project repository's root. When someone opens a pull request or creates an issue, they will see a link to that file.
>
> -- <cite>GitHub's [Setting guidelines for repository contributors](https://help.github.com/articles/setting-guidelines-for-repository-contributors/)</cite>

The [CONTRIBUTING.md](CONTRIBUTING.md) file in this repository is an example that needs to be modified to represent the requirements of the actual repository.

### How to create CONTRIBUTING.md

1. Option #1: Using GitHub's "Wizard"
    1. [github.com](https://github.com/) > (choose repository) > Insights > Community > Contributing > "Add" button
1. Option #2: Manual file creation
    1. See GitHub's [Setting guidelines for repository contributors](https://help.github.com/articles/setting-guidelines-for-repository-contributors/)

## docs

The
[docs/](docs)
subdirectory may be published as
[GitHub Pages](https://pages.github.com/).
They become visible at
[hub.senzing.com](https://hub.senzing.com/).
URLs have the format:

```console
https://hub.senzing.com/<repository-name>
```

Example:
[hub.senzing.com/sdk-components-ng](https://hub.senzing.com/sdk-components-ng/)

## .github

### .github/CODEOWNERS

The
[CODEOWNERS](.github/CODEOWNERS)
file implements GitHub's
[code owners](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/about-code-owners).
The teams that may appear in a `CODEOWNERS` file can be seen at
[github.com/orgs/Senzing/teams](https://github.com/orgs/Senzing/teams).

### .github/dependabot.yml

The
[dependabot.yml](.github/dependabot.yml) file is configuration for
[GitHub's dependabot](https://docs.github.com/en/code-security/dependabot).

### .github/ISSUE_TEMPLATE

#### .github/ISSUE_TEMPLATE/bug_report.md

A template presented to the Contributor when creating an issue that reports a bug.

The [bug_report.md](.github/ISSUE_TEMPLATE/bug_report.md) file in this repository
is an example that can be modified.

##### How to create .github/ISSUE_TEMPLATE/bug_report.md

1. Option #1: Using GitHub's "Wizard"
    1. [github.com](https://github.com/) > (choose repository) > Insights > Community > Issue templates > "Add" button > Add template: Bug report

#### .github/ISSUE_TEMPLATE/documentation_request.md

A template presented to the Contributor when creating an issue that requests change to the documentation.

The [documentation_request.md](.github/ISSUE_TEMPLATE/documentation_request.md) file in this repository
is an example that can be modified.

#### .github/ISSUE_TEMPLATE/feature_request.md

A template presented to the Contributor when creating an issue that requests a feature.

The [feature_request.md](.github/ISSUE_TEMPLATE/feature_request.md) file in this repository
is an example that can be modified.

##### How to create .github/ISSUE_TEMPLATE/feature_request.md

1. Option #1: Using GitHub's "Wizard"
    1. [github.com](https://github.com/) > (choose repository) > Insights > Community > Issue templates > "Add" button > Add template: Feature request

### .github/senzing-corporate-contributor-license-agreement.pdf

The Senzing, INC. Software Grant and Corporate Contributor License Agreement (CCLA),
[corporate-contributor-license-agreement.pdf](.github/senzing-corporate-contributor-license-agreement.pdf),
is the standard agreement for a corporation's contribution to a Senzing repository.

#### How to create .github/senzing-corporate-contributor-license-agreement.pdf

1. Make a `.github` directory in the repository
1. Copy [senzing-corporate-contributor-license-agreement.pdf](.github/senzing-corporate-contributor-license-agreement.pdf) into the new `.github` directory
1. *DO NOT* modify the contents of [senzing-corporate-contributor-license-agreement.pdf](.github/senzing-corporate-contributor-license-agreement.pdf) without legal approval.
1. Reference `senzing-corporate-contributor-license-agreement.pdf` in [CONTRIBUTING.md](#contributingmd)

### .github/senzing-individual-contributor-license-agreement.pdf

The Individual Contributor License Agreement (ICLA),
[senzing-individual-contributor-license-agreement.pdf](.github/senzing-individual-contributor-license-agreement.pdf),
is the standard agreement for an individual's contribution to a Senzing repository.
*Note:* if an individual is contributing on behalf of a company, the
[senzing-corporate-contributor-license-agreement.pdf](#githubsenzing-corporate-contributor-license-agreementpdf)
must also be submitted and accepted.

#### How to create .github/senzing-individual-contributor-license-agreement.pdf

1. Make a `.github` directory in the repository
1. Copy [senzing-individual-contributor-license-agreement.pdf](.github/senzing-individual-contributor-license-agreement.pdf) into the new `.github` directory
1. *DO NOT* modify the contents of [senzing-individual-contributor-license-agreement.pdf](.github/senzing-individual-contributor-license-agreement.pdf) without legal approval.
1. Reference `senzing-individual-contributor-license-agreement.pdf` in [CONTRIBUTING.md](#contributingmd)

### .github/workflows

#### .github/workflows/add-dependabot-request-to-project

There are a number of
[add-dependabot-request-to-project-*](.github/workflows/)
files.
These
[GitHub Actions](https://docs.github.com/en/actions)
inspect Dependabot Pull Request to determine which
project board they should be assigned to.

Each variant corresponds to a different Projects board.

- **t-ast:** <https://github.com/orgs/Senzing/projects/6>
- **t-comm:** <https://github.com/orgs/Senzing/projects/2>
- **t-g2-python:** <https://github.com/orgs/Senzing/projects/8>
- **t-gdev:** <https://github.com/orgs/Senzing/projects/9>

#### .github/workflows/add-issue-to-project

There are a number of
[add-issue-to-project-*](.github/workflows/)
files.
These
[GitHub Actions](https://docs.github.com/en/actions)
inspect issues to determine which project board they should be assigned to.

Each variant corresponds to a different Projects board.

- **t-ast:** <https://github.com/orgs/Senzing/projects/6>
- **t-comm:** <https://github.com/orgs/Senzing/projects/2>
- **t-g2-python:** <https://github.com/orgs/Senzing/projects/8>
- **t-gdev:** <https://github.com/orgs/Senzing/projects/9>

#### .github/workflows/add-triage-label.yaml

The
[add-triage-label.yaml](.github/workflows/add-triage-label.yaml)
file is a
[GitHub Action](https://docs.github.com/en/actions)
that adds a `triage` label to every new issue.

#### .github/workflows/identify-customer.yaml

The
[identify-customer.yaml](.github/workflows/identify-customer.yaml)
file is a
[GitHub Action](https://docs.github.com/en/actions)
that determines if the issue created by a GitHub user that is not a member of Senzing.

## LICENSE

The `LICENSE` file describes the terms and conditions under which the code in the repository can be used.
The recommended license file is
"[Apache License 2.0](https://www.apache.org/licenses/LICENSE-2.0.html)".
A comparison of licenses can be found at
[choosealicense.com](https://choosealicense.com/licenses/).

The [LICENSE](LICENSE) file in this repository is based on
"[Apache License 2.0](https://www.apache.org/licenses/LICENSE-2.0.html)".

### How to create LICENSE

1. Option #1: Using GitHub's "Wizard"
    1. When [creating a new repository](https://github.com/new), in the "Add a license:" drop-down, choose "Apache License 2.0"
1. Option #2: Manual file creation
    1. See GitHub's [Adding a license to a repository](https://help.github.com/articles/adding-a-license-to-a-repository/)

## PULL_REQUEST_TEMPLATE.md

The `PULL_REQUEST_TEMPLATE.md` file asks a pull requester for information about the pull request.

> When you add a pull request template to your repository, project contributors will automatically see the template's contents in the pull request body.
>
> -- <cite>GitHub's [Creating a pull request template for your repository](https://help.github.com/articles/creating-a-pull-request-template-for-your-repository/)</cite>

The [PULL_REQUEST_TEMPLATE.md](PULL_REQUEST_TEMPLATE.md) file in this repository
is an example that can be modified.

### How to create PULL_REQUEST_TEMPLATE.md

1. Option #1: Using GitHub's "Wizard"
    1. [github.com](https://github.com/) > (choose repository) > Insights > Community > Pull request template > "Add" button
1. Option #2: Manual file creation
    1. See GitHub's [Creating a pull request template for your repository](https://help.github.com/articles/creating-a-pull-request-template-for-your-repository/)
