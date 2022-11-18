---
title: 'How does git18n autodetect language files in the Github repository?'
description: 'git18n does a lot of stuff under the hood to make using it as simple as possible'
keywords: 'translation management system, TMS, how it works, github'
date: '2022-10-15 00:00:00 +0000'
---

One of the advantages of git18n is that it automatically detects changed locale files on the
pull requests. This makes it easy to use. We detect the following files and file patterns:

Single directory non-namespaced files:

```
path/to/locales/
  - en.json
  - de.json
  - es.json
  - zh.json
```

Multi-directory namespaced files:

```
path/to/locales/en/
  - frontPage.json
  - aboutPage.json
  - authPage.json
  - errors.json

path/to/locales/de/
  - frontPage.json
  - aboutPage.json
  - authPage.json
  - errors.json

path/to/locales/es/
  - frontPage.json
  - aboutPage.json
  - authPage.json
  - errors.json

path/to/locales/zh/
  - frontPage.json
  - aboutPage.json
  - authPage.json
  - errors.json
```

Shortly explained, we match all `json` files containing ISO language code in either
the path or name.
