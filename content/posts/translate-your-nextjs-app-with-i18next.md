---
title: 'Translate Your NextJS App with I18next'
description: 'Super-charge your translation and development workflow using NextJS, i18next and git18n.com.'
keywords: 'translation management system, TMS, productivity, NextJS, i18next, i18n'
date: '2022-10-19 00:00:00 +0000'
---

[next-i18next](https://github.com/i18next/next-i18next) market itself as the easiest way to translate your [NextJS](https://nextjs.org/) app. There are properly simpler translations libraries but none as advanced and widespread. [I18next](https://www.i18next.com/) is the market leader with around [3,3 million weekly downloads](https://www.npmjs.com/package/i18next) on NPM. Its primary translation package is `i18next`. It then offers a wide range of framework specific sub packages. This is where `next-i18next` comes in. The official package for integration with NextJS.

One advantage `next-i18next` has over other simpler translation solutions is that you can namespace it so that each page only loads the required translations needed for this page. For apps with many translations and/or languages this is an advantage as it avoids loading all translations and slowing the page.

## Enable build-in NextJS localization configuration

NextJS has build-in localization capabilities. It handles multilingual routes and a hook that returns current locale `const { locale } = useRouter()`. To enable multilingual routing update the configuration in `next-i18next.config.js` (this is a `i18next` specific file that can then be imported into `next.config.js `):

```js
module.exports = {
  // https://www.i18next.com/overview/configuration-options#logging
  debug: process.env.NODE_ENV === 'development',
  i18n: {
    defaultLocale: 'en',
    locales: ['en', 'de'],
  },
  reloadOnPrerender: process.env.NODE_ENV === 'development',
};
```

Now import the `i18n` into `next.config.js` (this is just done to keep all localization configuration in one place):

```js
const { i18n } = require('./next-i18next.config');

module.exports = {
  i18n,
};
```

NextJS will now beside the previous default URL routes have paths with the prefix `/en/` and `/de/`. Routes without either `/en/` or `/de/` will render the `defaultLocale`.

## Install and configure `next-i18next`

Run `yarn add next-i18next` and add the localization files:

```
|-- public
|   `-- locales
|       |-- de
|       |   |-- common.json
|       |   |-- footer.json
|       |   `-- second-page.json
|       `-- en
|           |-- common.json
|           |-- footer.json
|           `-- second-page.json
```

Each language specific folder (`de` or `en`) contains the namespaced files to allow for optimized builds embedded only the required translations. It further makes translations more manageable.

Wrap your app in the higher-order component provided by `next-i18next` to access the localization functionality. Add it to the `pages/_app.js`:

```js
import { appWithTranslation } from 'next-i18next';

const MyApp = ({ Component, pageProps }) => <Component {...pageProps} />;

export default appWithTranslation(MyApp);
```

To improve SEO of your app, you can add localization to the HTML document in `pages/_document.js`:

```js
import Document, { Html, Head, Main, NextScript } from 'next/document';
import i18nextConfig from '../next-i18next.config';

class MyDocument extends Document {
  render() {
    const currentLocale = this.props.__NEXT_DATA__.locale || i18nextConfig.i18n.defaultLocale;

    return (
      <Html lang={currentLocale}>
        <Head />
        <body>
          <Main />
          <NextScript />
        </body>
      </Html>
    );
  }
}

export default MyDocument;
```

## Add translation to pages

In `pages/index.js` you can the translation files used for this page via the `getStaticProps` function provided by `next`:

```js
export const getStaticProps = async ({ locale }) => ({
  props: {
    ...(await serverSideTranslations(locale, ['common', 'footer'])),
  },
});
```

This load 2 translation files, `common.json` and `footer.json`. If a `<Header />` component is added to this specific page, its translations must likewise be added loaded: `serverSideTranslations(locale, ['common', 'footer', 'header'])`.

In the React component, the translation can be used like:

```
import { useTranslation, Trans } from 'next-i18next'

const Homepage = () => {
  const { t } = useTranslation('common')

  return (
    <main>
      <Header heading={t('h1')} title={t('title')} />
      <p>
        <Trans i18nKey='blog.optimized.answer'>
            Then you may have a look at <a href='https://locize.com/blog/next-i18next/'>this blog post</a>.
        </Trans>
      </p>
    </main>
  )
}
```

The `t` function returns the raw translated string, in this case from the `common.json` translation file. The `<Trans />` allows for complex translations containing `HTML` markup. See [full example](https://github.com/lassegit/next-i18next/blob/master/pages/index.js).

## Add another page with translation

Adding another translation follows the same pattern. Let's say you wanted to add a custom 404 page. First add a translation file containing error translations in `public/locales/en/errors.json` containing:

```
{
  "404": {
    "title": "Ups, content not found",
    "help": "Please ensure the url is correct."
  }
}
```

Then add `pages/404.js`:

```js
import React from 'react';
import { useTranslation } from 'next-i18next';
import { serverSideTranslations } from 'next-i18next/serverSideTranslations';

const Custom404 = () => {
  const { t } = useTranslation('errors');

  return (
    <div>
      <h1>{t('404.title')}</h1>
      <p>{t('404.help')}</p>
    </div>
  );
};

export const getStaticProps = async ({ locale }) => ({
  props: {
    ...(await serverSideTranslations(locale, ['errors'])),
  },
});

export default Custom404;
```

Now to add the translation for this, you can either retrieve them from translator and add them manually to the `public/locales/de/errors.json` file or simply use git18n.com. Using [git18n.com](https://git18n.com) the developer can request a translation when the feature is ready and the translator can directly add translations to the pull request via git18n.com.

For the above example is available on: [git18n.com/repos/lassegit/next-i18next/4](https://git18n.com/repos/lassegit/next-i18next/4). The pull request is also on [Github](https://github.com/lassegit/next-i18next/pull/4).

On [git18n.com](https://git18n.com) you can find the pull request and request translation:

![](/pr-404.png)

The translator will retrieve an email containing a link where the translations can be added via [git18n.com](https://git18n.com) and then pushed directly to the pull request (ensuring CI pipeline has the latest translations):

![](/translation-modal-404.png)

This makes it a lot easier for developers, since they don't need to fiddle around with translations. Everything is maintained by [git18n.com](https://git18n.com) (it also removes unused translation keys to make maintenance easier).

For the translators it saves lot of complexity by keeping all translations in one place (no more need to manage spreadsheets besides the translations in code `public/locales/**/*`). And also makes changing and improving translations a lot easier since developers doesn't have to be instructed for every little change. The translators can actually do it themselves.
