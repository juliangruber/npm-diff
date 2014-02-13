
# npm-diff(1)

  Get changes between two versions of a node module.

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

  `npm-diff(1)` outputs regular `diff(1)` content so it plays nice with other tooling.

## Tips

  Page big diffs:

```bash
$ npm-diff intersect 0.0.0 0.1.0 | less
``` 

  Pipe to [colordiff](http://www.colordiff.org) for colored git like diffs:

```bash
$ npm-diff intersect 0.0.0 0.1.0 | colordiff | less -R
```

## License

  MIT

