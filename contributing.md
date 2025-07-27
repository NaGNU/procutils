# Contributing to nasralutils

Thank you for considering contributing to **nasralutils**!  
Please read the following guidelines carefully to ensure a smooth contribution process.

---

## Branches

All development should happen in the `devel` branch.  
Please do not commit directly to `main` or create pull requests targeting `main`.

---

## Commit Messages

- Write commits in **English**.
- Follow the [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/) standard.
  Example:
  ```
  feat(core): add new utility 'foo'
  fix(build): correct typo in Makefile
  ```

---

## Code Style

- All builds and commands **must be done via `Makefile`**, even for languages like Haskell or Python.
- Your Makefile should always contain:
  ```make
  @echo "Build <project-name>..."
  ```
  and
  ```make
  @echo "Clean..."
  ```

- No formatters are required, but keep your code clean, consistent, and readable.

---

## Local Setup

To set up nasralutils locally:
1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/nasralutils.git
   cd nasralutils
   ```
2. Switch to the development branch:
   ```bash
   git checkout devel
   ```
3. Build using:
   ```bash
   make
   ```
4. Clean the project:
   ```bash
   make clean
   ```

---

## Support and Thanks

Thank you for contributing to nasralutils!  
Your help makes this project better.  

---
