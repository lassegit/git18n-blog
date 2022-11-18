---
title: 'How To Add git18n.config.json File to Your Github Repository?'
description: 'git18n.com offers a simple translation management system that saves times and effort'
keywords: 'translation management system, TMS, setup, how to'
date: '2022-11-02 00:00:00 +0000'
---

To be able to find copywriting and translation files in your Github repository, you need to add a `git18n.config.json` file to the root of your repository:

```json
{
  "defaultLocale": "", // E.g. "en"
  "locales": [], // E.g. ["en", "de"]
  "path": "" // E.g. "src/locales/**/*.json" or "src/locales/*.json"
}
```

##### Example 1: Single directory for all translation files

```json
{
  "defaultLocale": "en",
  "locales": ["en", "de"],
  "path": "path/to/locales/*.json"
}
```

This will find 2 files: `path/to/locales/en.json` and `path/to/locales/de.json`.

##### Example 2: Namespaced translation files

```json
{
  "defaultLocale": "en",
  "locales": ["en", "de"],
  "path": "path/to/locales/**/*.json" // Note the double asterisk ** matches the language code
}
```

This will load files from the following folders: `path/to/locales/en/*.json` and `path/to/locales/de/*.json`.

##### Example 3: Only copywriting

If you only have copywriting files, you can use the following config:

```json
{
  "defaultLocale": "en",
  "locales": ["en"],
  "path": "path/to/locales/copywriting/*.json"
}
```
