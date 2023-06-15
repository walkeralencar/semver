# SEMVER - Semantic Versioning

Shell script for SEMVER to be used on CI/CD.

1. It retrieves the latest tag from the repository using `git describe`.
2. Verify if semver tag exists at HEAD commit then leave, else continue to generate a new tag
