---
title: 'A Better Translation Workflow for App Development'
description: 'Improve translation workflow by enabling translators to add translations directly into the code via git18n.com. Zero config required.'
keywords: 'translation management system, TMS, productivity, github'
date: '2022-10-12 00:00:00 +0000'
---

> TL;DR: Improve translation workflow by enabling translators to add translations directly into the code via [git18n.com](/). Zero config required.

In my experience many tech companies waste unnecessary time and effort. The main issue is often that the translation and developer workflow aren't integrated. Rather the translation workflow is prerequisite for development and hence blocks the whole process if it isn't ready. As a separate issue, translations are often stored in complex spreadsheets like:

![Complex spreadsheet with translations](/translation-sheet.png)

This is sub-optimal, not only for the developers and designers who have to wait for translation to be done to proceed, but also for the translators who have to maintain a spreadsheet with translations. This isn't just extra work, but an unnecessary layer that makes translations changes unwanted.

## A better approach

Ideally translation should be a simple and easy step, that encourages change and continuous improvement to the benefit of the overall wording and conciseness. The better workflow should allow designers to design, developers to develop and translators to translate without unnecessarily hold each other up.

As you might have guessed, this is exactly what [git18n.com](/) offers, by integrating translation into the development workflow via Github pull requests. Translation is merely a step occurring when the code is ready:

```
Design -> Development (*) -> Deploy
# (* request translation when code is ready)
```

In practical terms this means, designers will work in the source language (often English). There is no need to have designs in multiple languages. Developers will likewise only touch the source language and focus on developing features, instead of copy pasting translations around. The developer will, when the code is ready, via [git18n.com](/) simply request a translation for a particular pull request.

The translators will be notified via email and will have a link directly showing missing translations:

![Simple translation modal for German](/404-translations.png)

The translator can add the any translations, push the translations directly into the pull request and approve the pull request. Then the developer will know that the translations are done and it will be integrated into any CI pipeline.

Beyond this, [git18n.com](/) also maintains your translations files, by removing unused translation keys from non-source languages. Normally a herculean task.

This flow not only saves time and effort, but also makes it a lot easier to change translations and improve the overall communication.

[Checkout the screenshot tour](/screenshots) to see just how easy using [git18n.com](/) is.
