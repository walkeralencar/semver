# SEMVER - Semantic Versioning

Shell script for SEMVER to be used on CI/CD.

1. It retrieves the latest tag from the repository using `git describe`.
2. Verify if semver tag exists at HEAD commit then leave, else continue to generate a new tag
3. Get message and extract the branch name from the current commit
4. Verify the branch name and increment the version accordingly
5. create tag

# How to use

Requirements: have a SEMVER tag at master. ex.: 0.1.0

Define an alias:
```bash
alias semver='docker run --rm -it -u 1000:1000 --name semver -v $(pwd):/code walkeralencar/semver:latest'
```
Run at root of git repo after merge any branch to master:
```bash
semver
```

Samples:
```bash
*   364c071 - (HEAD -> master, tag: 0.2.2, master) Merge branch 'hotfix/improve-readme'
|\  
| * c3ddbf9 - improve readme steps
|/  
*   2923bbd - (tag: 0.2.1) Merge branch 'hotfix/semver-regex'
|\  
| * 1b5ee88 - improve regex for semver tag only
|/  
*   6866f71 - (tag: 0.2.0) Merge branch 'feature/exist-tag'
|\  
| * e52731d - improve output with no verbosity
| * 5145473 - verify if tag exists in current commit
|/  
*   f2ae4e2 - (tag: 0.1.1) Merge branch 'hotfix/version-identifier'
|\  
| * fe24185 - fix: remove v letter from identifier
|/  
*   ce3e379 - (tag: 0.1.0) Merge branch 'feature/start'
|\  
| * 39598ef - retrieve tags and show version
|/  
* cf08020 - (tag: 0.0.0) first commit 
```