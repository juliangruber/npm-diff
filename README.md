
# npm-diff(1)

  `diff` the contents of two versions of a node module.

## Installation

```bash
$ make install
```

## Usage

```bash
$ npm-diff intersect 0.0.1 0.0.2

diff --recursive --unified --exclude test --exclude Makefile 0.0.1/component.json 0.0.2/component.json
--- 0.0.1/component.json  2013-04-16 08:24:40.000000000 +0200
+++ 0.0.2/component.json  2013-04-16 08:26:44.000000000 +0200
@@ -2,7 +2,7 @@
   "name": "intersect",
   "repo": "juliangruber/intersect",
   "description": "Find the intersection of two arrays.",
-  "version": "0.0.1",
+  "version": "0.0.2",
   "keywords": [
     "intersect",
     "array"
diff --recursive --unified --exclude test --exclude Makefile 0.0.1/index.js 0.0.2/index.js
--- 0.0.1/index.js  2013-04-11 09:50:29.000000000 +0200
+++ 0.0.2/index.js  2013-04-16 08:26:23.000000000 +0200
@@ -7,3 +7,10 @@
   }
   return res;
 }
+
+function indexOf(arr, el) {
+  for (var i = 0; i < arr.length; i++) {
+    if (arr[i] === el) return i;
+  }
+  return -1;
+}
diff --recursive --unified --exclude test --exclude Makefile 0.0.1/package.json 0.0.2/package.json
--- 0.0.1/package.json  2013-04-16 08:24:37.000000000 +0200
+++ 0.0.2/package.json  2013-04-16 08:31:25.000000000 +0200
@@ -1,7 +1,7 @@
 {
   "name": "intersect",
   "description": "Find the intersection of two arrays",
-  "version": "0.0.1",
+  "version": "0.0.2",
   "repository": {
     "type": "git",
     "url": "git://github.com/juliangruber/intersect.git"
```

## More useful output

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

