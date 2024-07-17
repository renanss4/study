# Git - Study

Git is a distributed version control system designed to handle everything from small to very large projects with speed and efficiency. It's widely used for source code management in software development and facilitates collaboration.

## Installation

### Windows
1. Go to the [Git official website](https://git-scm.com/download/win).
2. Download the Windows installer.
3. Run the installer and follow the installation instructions.

### Linux
Git is usually available in the package repositories of most Linux distributions. You can install it using the package manager of your distribution. For example, on Ubuntu, you can install Git by running the following command in the terminal:

```bash
sudo apt-get install git
```

### MacOS
You can install Git using Homebrew. First, install Homebrew if you haven't already, then run:

```bash
brew install git
```

## Basic Commands

### Initializing a Repository

To create a new repository from an existing directory, use:

```bash
git init
```
- This command turns the current directory into a Git repository.

### Cloning a Repository

To clone a repository, use:

```bash
git clone <repository_url>
```
- This command creates a copy of the remote repository on your local machine.

### Checking the Status

To check the status of your files in the working directory and staging area, use:

```bash
git status
```
- This command shows you which files are staged, unstaged, and untracked.

### Staging Changes

To stage changes, use:

```bash
git add <file_or_directory>
```
- This command adds the specified files or directories to the staging area, preparing them to be committed.

### Committing Changes

To commit staged changes, use:

```bash
git commit -m "Your commit message"
```
- This command records the staged changes along with a descriptive message.

### Pushing Changes

To push changes to the remote repository, use:

```bash
git push origin <branch_name>
```
- This command uploads your local commits to the remote repository.

### Pulling Changes

To pull the latest changes from the remote repository, use:

```bash
git pull origin <branch_name>
```
- This command fetches and merges changes from the remote repository into your current branch.

### Creating a Branch

To create a new branch, use:

```bash
git checkout -b <new_branch_name>
```
- This command creates and switches to a new branch.

### Merging Branches

To merge another branch into your current branch, use:

```bash
git merge <branch_name>
```
- This command integrates changes from the specified branch into your current branch.

### Fetching Changes

To fetch changes from the remote repository without merging them, use:

```bash
git fetch origin
```
- This command downloads objects and refs from another repository.

### Resolving Conflicts

When a merge conflict occurs, Git will notify you. To resolve conflicts:

1. Open the conflicting files and resolve the conflicts manually.
2. Stage the resolved files:

```bash
git add <file_with_conflict>
```

3. Commit the resolved changes:

```bash
git commit -m "Resolved merge conflict in <file>"
```

### Overwriting Local Changes

If you need to overwrite local changes with the content from the HEAD, use:

```bash
git checkout -- <file>
```
- This command replaces the changes in your working directory with the latest content in the HEAD.

To discard all local changes and commits, retrieving the latest history from the server, use:

```bash
git fetch origin
git reset --hard origin/master
```

### Tagging

To create a new tag for a release, use:

```bash
git tag <tag_name> <commit_id>
```
- For example, `git tag 1.0.0 1b2e1d63ff` tags the commit with ID `1b2e1d63ff` as `1.0.0`.

To list all tags, use:

```bash
git tag
```

### Connecting to a Remote Repository

If you haven't cloned an existing repository and want to connect your repository to a remote server, use:

```bash
git remote add origin <server>
```
- This command connects your local repository to the remote server.

### Pushing a Branch to the Remote Repository

To push a branch to the remote repository, use:

```bash
git push origin <branch_name>
```

## Workflow

Your local repository consists of three "trees" maintained by Git:

1. **Working Directory:** Contains the actual files.
2. **Index:** Acts as a staging area.
3. **HEAD:** Points to the last commit you've made.

### Basic Workflow

1. **Make changes** in your working directory.
2. **Stage changes** by adding them to the Index using `git add`.
3. **Commit changes** to the repository using `git commit`.
4. **Push changes** to the remote repository using `git push`.

### Branching

Branches allow you to develop features isolated from each other. The `master` branch is the default branch when you create a repository.

- Create a new branch:

```bash
git checkout -b <branch_name>
```

- Switch back to the master branch:

```bash
git checkout master
```

- Delete a branch:

```bash
git branch -d <branch_name>
```

- Push a branch to the remote repository:

```bash
git push origin <branch_name>
```

## Branching and Merging

Here's a basic illustration of how branches work in Git:

```plaintext
* -- * -- * -- * -- * -- * (main)
      \            /
       * -- * -- * (feature)
```

- In this diagram, the `main` branch represents the main line of development.
- The `feature` branch is a separate line of development created from `main`.

## About Git

Git is a powerful tool for managing code changes and collaboration. It allows multiple developers to work on a project simultaneously without overwriting each other's changes. Git's branching model is particularly useful for feature development and experimentation.

## Credits

This documentation was inspired by various resources and tutorials available online, but this [site](https://rogerdudler.github.io/git-guide/index.pt_BR.html) really helped me get an overview as well as the classes I took at my job. Feel free to explore Git further and make the most of its features!

Enjoy your coding journey!