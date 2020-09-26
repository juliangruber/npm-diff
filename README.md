
# npm-diff(1)

  Diff two versions of a node module.

  ![screenshot](https://i.cloudup.com/RgiBccKvdt.png)

## Installation

Either preinstall using one of the methods described below, or use `npx`
to install/run `npm-diff` on demand:

```bash
npx npm-diff
```

### Globally installed as npm module

```bash
npm install npm-diff -g
```

### Manual install

Clone this repository and run:

```bash
$ make install
```

## Usage

```bash
$ npm-diff
Usage: npm-diff <module> <versionA> <versionB>
```

  __npm-diff(1)__ outputs regular __diff(1)__ content so it plays nice with other tooling.

## Tips

  Page big diffs:

```bash
$ npm-diff intersect 0.0.0 0.1.0 | less
``` 

  If [colordiff](http://www.colordiff.org) is installed, the output will be colored.
## Sponsors

This module is proudly supported by my [Sponsors](https://github.com/juliangruber/sponsors)!

Do you want to support modules like this to improve their quality, stability and weigh in on new features? Then please consider donating to my [Patreon](https://www.patreon.com/juliangruber). Not sure how much of my modules you're using? Try [feross/thanks](https://github.com/feross/thanks)!

## License

  MIT

