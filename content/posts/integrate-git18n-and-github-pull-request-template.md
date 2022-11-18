---
title: 'Link Your Translation Management Tool to the Pull Request Template and Make Life Easier for Developers'
description: 'Integrate Your Translation Management System with Github by Just copy/pasting 1 Line of Text and Make Your Developers Happy'
keywords: 'translation management system, TMS, productivity, Github, pull request template'
date: '2022-10-18 00:00:00 +0000'
---

To make life easier for developers you can add a link to the translation management tool on your pull request. This allows developers to easily reach the translation management tool and either add translation themselves or request a translation from an assigned translator.

To do this, add a pull request template file to: `.github/pull_request_template.md`. Navigate to [git18n.com](https://git18n.com/) and find your repository URL and add it (example):

```
### Description

### Proposed Changes
  -
  -
  -

### Checklist
- [ ] [Have you added or requested translation?](https://git18n.com/repos/REPO-OWNER/REPO-NAME)
```

With dummy content this could render to:

### Description

Add new 404 page.

### Proposed Changes

- update `devDependencies`
- update `tsconfig`
- Add custom 404 page with source translation

### Checklist

- [ ] [Have you added or requested translation?](https://git18n.com/repos/lassegit/next-i18next) _(You need to be signed in to git18n.com to view)_

Of course this can tailored to fit your project. Here is a collection of different pull request template (and issues) for inspiration: [github.com/stevemao/github-issue-templates](https://github.com/stevemao/github-issue-templates).
