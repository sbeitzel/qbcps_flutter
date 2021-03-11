# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0-nullsafety.0] - 2021.03.11

# Changed

- Modified API for null safety
- Updated Changelog with valid links

## [0.1.1] - 2020.02.11

* Added configuration for continuous integration with FireCI.
* Added method to MapDB to provide a Stream of all the values

## [0.1.0] - 2019.06.17

__BREAKING CHANGE__
* Changed `CircularArray` to be an `Iterable` [issue #7](https://github.com/sbeitzel/qbcps_flutter/issues/7)
* Changed the layout of the files in the project and changed the project to be
pure Dart and not depend on Flutter. [issue #8](https://github.com/sbeitzel/qbcps_flutter/issues/8)

## [0.0.4] - 2019.06.13

* Added delete method to MapDB. [issue #6](https://github.com/sbeitzel/qbcps_flutter/issues/6)
* Updated README. [issue #5](https://github.com/sbeitzel/qbcps_flutter/issues/5)
* Added example code demonstrating MapDB. [issue #2](https://github.com/sbeitzel/qbcps_flutter/issues/2)

## [0.0.3] - 2019.06.04

* Added `CircularArray`
* Added `NotificationManager`

## [0.0.2] - 2019.06.04

* Added documentation comments to `MapDB`.

## [0.0.1] - 2019.06.03

* Initial release, with two classes: `MapDB`, an in-memory database that acts a bit like Firebase,
and `AccumulatorStream`, a stream that performs a transformation on a collection of futures and fires
an event when they're all done.

[1.0.0-nullsafety.0]: https://github.com/sbeitzel/qbcps_flutter/compare/0.1.1...1.0.0-nullsafety.0
[0.1.1]: https://github.com/sbeitzel/qbcps_flutter/compare/0.1.0...0.1.1
[0.1.0]: https://github.com/sbeitzel/qbcps_flutter/compare/0.0.4...0.1.0
[0.0.4]: https://github.com/sbeitzel/qbcps_flutter/compare/0.0.3...0.0.4
[0.0.3]: https://github.com/sbeitzel/qbcps_flutter/compare/0.0.2...0.0.3
[0.0.2]: https://github.com/sbeitzel/qbcps_flutter/compare/0.0.1...0.0.2
[0.0.1]: https://github.com/sbeitzel/qbcps_flutter/releases/tag/0.0.1
