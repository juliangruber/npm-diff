
# npm-diff(1)

  Diff two versions of a node module.

  ![screenshot](https://i.cloudup.com/RgiBccKvdt.png)

## Installation

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

  Pipe to [colordiff](http://www.colordiff.org) for colored git like diffs:

```bash
$ npm-diff intersect 0.0.0 0.1.0 | colordiff | less -R
```

If you don't have [colordiff](http://www.colordiff.org), and want to use it:

```bash
$ make colordiff
```

## Sponsors

This module is proudly supported by my [Sponsors](https://github.com/juliangruber/sponsors)!

Do you want to support modules like this to improve their quality, stability and weigh in on new features? Then please consider donating to my [Patreon](https://www.patreon.com/juliangruber). Not sure how much of my modules you're using? Try [feross/thanks](https://github.com/feross/thanks)!

## License

  MIT

