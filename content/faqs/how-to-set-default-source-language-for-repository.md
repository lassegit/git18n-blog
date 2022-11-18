---
title: 'How to change the source language for a repository?'
description: 'Easy way to change the default source language for a project.'
keywords: 'translation management system, TMS'
date: '2022-10-16 00:00:00 +0000'
---

By default git18n will use "en" locale as source language, i.e. the mother from
which you translation others from. The source language is the language that the developer
would normally change in the pull request.

You can set a custom source language by adding "git18n.config.json" to the root
of your project containing: `{ "defaultLocale": "de" }`

Checkout an example: [lassegit/react-i18next](https://github.com/lassegit/react-i18next)
