# Changelog

[![SemVer 2.0.0][📌semver-img]][📌semver] [![Keep-A-Changelog 1.0.0][📗keep-changelog-img]][📗keep-changelog]

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog][📗keep-changelog],
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html),
and [yes][📌major-versions-not-sacred], platform and engine support are part of the [public API][📌semver-breaking].
Please file a bug if you notice a violation of semantic versioning.

[📌semver]: https://semver.org/spec/v2.0.0.html
[📌semver-img]: https://img.shields.io/badge/semver-2.0.0-FFDD67.svg?style=flat
[📌semver-breaking]: https://github.com/semver/semver/issues/716#issuecomment-869336139
[📌major-versions-not-sacred]: https://tom.preston-werner.com/2022/05/23/major-version-numbers-are-not-sacred.html
[📗keep-changelog]: https://keepachangelog.com/en/1.0.0/
[📗keep-changelog-img]: https://img.shields.io/badge/keep--a--changelog-1.0.0-FFDD67.svg?style=flat

## [Unreleased]

### Added

- Documentation linting now has its generated `yard-lint` dependency and severity config available in the local bundle.

- kettle-jem-template-20260726-001 - Projects now include YARD lint
  configuration and documentation dependencies so documentation issues fail
  before generated docs are refreshed.

- kettle-jem-template-20260727-001 - Spec harness documentation now lists the
  RSpec helpers provided by `kettle-test`.

### Changed

- kettle-jem-template-20260728-001 - Generated Ruby workflows now use clearer
  setup-ruby-flash planning and can prepare appraisal-only jobs without
  installing the main Gemfile bundle.

### Deprecated

### Removed

### Fixed

- kettle-jem-template-20260726-002 - Generated version files now document their
  version namespace and constants, reducing warning-only YARD lint output.

- kettle-jem-template-20260726-003 - Coverage upload steps now treat Coveralls,
  QLTY, and Codecov as optional, so provider outages do not fail CI when local
  coverage thresholds still pass.
- kettle-jem-template-20260728-002 - Generated RuboCop configs now ignore the
  same `gemfiles/vendor/bundle` tree as `.gitignore`, so vendored dependency
  installs are not reported as project lint debt.
- kettle-jem-template-20260728-003 - Generated dep-heads workflows now run
  TruffleRuby jobs with current RubyGems and Bundler, avoiding setup failures
  before the test suite starts.

- kettle-jem-template-20260728-004 - Generated dep-heads workflows now use the
  setup-ruby Bundler install path for direct appraisal Gemfiles, avoiding rv
  lockfile parser failures on Git and path dependencies.

- kettle-jem-template-20260728-005 - VersionGem bootstrap now creates the
  missing canonical version spec when a project only has shim namespace version
  specs.

### Security

## [4.1.1] - 2026-07-25

- TAG: [v4.1.1][4.1.1t]
- COVERAGE: 97.46% -- 730/749 lines in 28 files
- BRANCH COVERAGE: 86.34% -- 177/205 branches in 28 files
- 20.94% documented

### Changed

- kettle-jem-template-20260716-001 - Shim gemspec manifests now include
  `LICENSE.md` instead of nonexistent `LICENSE.txt`.
- kettle-jem-template-20260716-002 - Generated gemspec manifests now ship fewer
  repository-only files by default to reduce downstream distro packaging churn.
- kettle-jem-template-20260720-001 - Generated READMEs can now render
  template-managed corporate sponsor logos from project or family config.
- kettle-jem-template-20260720-002 - Generated development Gemfiles now use the
  released `tree_sitter_language_pack` gem 1.13.3 or newer by default.
- kettle-jem-template-20260720-003 - Generated StructuredMerge Git diff driver
  config now uses the installed `smorg-rb` Ruby driver name.
- kettle-jem-template-20260720-004 - Generated multi-engine workflow files now
  omit JRuby and TruffleRuby jobs when project config declares MRI-only engines.
- kettle-jem-template-20260720-005 - Generated README Support & Community rows
  now include a RubyForum help badge.
- kettle-jem-template-20260725-001 - Generated JRuby and TruffleRuby workflow
  files now run when pull request head branches start with `feature/release`,
  so release CI monitoring does not report intentionally skipped engine
  workflows as failures.

- kettle-jem-template-20260725-002 - Generated gemspec templates now include
  `anonymous_loader` as a development dependency, and version specs use it to
  execute generated `version.rb` files for coverage without redefining package
  constants. Managed version specs are removed when `version_gem` is disabled
  or incompatible with the project's runtime Ruby floor.

## [4.1.0] - 2026-07-02

- TAG: [v4.1.0][4.1.0t]
- COVERAGE: 97.46% -- 730/749 lines in 28 files
- BRANCH COVERAGE: 86.34% -- 177/205 branches in 28 files
- 20.94% documented

### Added

- Ruby keyword option support for `logged`, `notified`, `i_logged`, and
  `i_notified`, while preserving legacy last-hash configuration and payload
  handling.

## [4.0.5] - 2026-07-02

- TAG: [v4.0.5][4.0.5t]
- COVERAGE: 97.45% -- 726/745 lines in 28 files
- BRANCH COVERAGE: 86.07% -- 173/201 branches in 28 files
- 20.94% documented

### Added

- Added support for JRuby 10.1 and TruffleRuby 34.0.

### Changed

- Retemplated project metadata and CI/development automation with `kettle-jem` v7.0.0.

### Fixed

- Package configured license files in gem release file lists.

- Avoid runtime warnings from ActiveSupport loading, method decoration, and
  invocation ID formatting, and update the SimpleCov test setup for the current
  filtering API.

## [4.0.4] - 2026-06-14

- TAG: [v4.0.4][4.0.4t]
- COVERAGE: 97.41% -- 716/735 lines in 28 files
- BRANCH COVERAGE: 87.83% -- 166/189 branches in 28 files
- 20.94% documented

### Changed

- Raised generated `version_gem` and `appraisal2` dependency floors to
  `version_gem` >= 1.1.10 and `appraisal2` >= 3.0.9.
- Refreshed generated project metadata, support documentation, workflow pins,
  and dependency floors from the latest `kettle-jem` template, including the
  `yard-fence` 0.9.4 documentation floor and resilient templating bootstrap.
- Updated generated OpenCollective funding metadata to use the
  `galtzo-floss` collective.

### Fixed

- Restored `docs/CNAME` so the generated documentation site keeps its custom domain.
- Fixed the TruffleRuby 23.1 CI setup bundle by applying the same JSON
  constraint before Appraisal runs.

## [4.0.3] - 2026-05-28

- TAG: [v4.0.3][4.0.3t]
- COVERAGE: 97.41% -- 716/735 lines in 28 files
- BRANCH COVERAGE: 87.83% -- 166/189 branches in 28 files
- 20.94% documented

### Added

- `DebugLogging::VERSION` as the traditional top-level version constant, in
  addition to `DebugLogging::Version::VERSION`.
- Ruby 4 compatibility coverage for log output that includes Ruby's updated
  symbol-key `Hash#inspect` formatting.
- RBS signature coverage for the version constants.

### Changed

- Refreshed published README, project metadata, funding links, support links,
  and documentation links.
- Updated repository links for the move to `galtzo-floss/debug_logging`.
- Updated gem packaging metadata so generated docs, signatures, certificates,
  and executable support files are consistently included where applicable.
- Gem signing now skips cleanly when `SKIP_GEM_SIGNING` is set or no matching
  local certificate is present, improving builds for downstream packagers.

### Fixed

- Restored the `colorize` runtime dependency so fresh installs include the
  colorization support used by debug logging output.

- Stabilized logged hash argument and payload rendering across supported Ruby
  versions.

### Removed

- Removed the GPL-licensed `colorize` runtime dependency while preserving the
  existing colorization callback behavior.

## [4.0.2] ([tag][4.0.2t]) - 2024-05-12

- TAG: [v4.0.2][4.0.2t]

### Added

- More documentation

### Changed

- DRY logic for `DebugLogging::ClassLogger` & `DebugLogging::InstanceLogger` via `LambDart`
- Refactored test suite; increased test coverage to 97%
- Refactored ActiveSupport::Notification integration (DRY)

### Fixed

- Add undeclared runtime dependency `version_gem`
- `DebugLogging::Hooks` integration via `extend`
- `DebugLogging::ClassNotifier` support for method signatures with kwargs
- `error_handler_proc` support for method signatures with kwargs

## [4.0.1] ([tag][4.0.1t]) - 2024-03-01

- TAG: [v4.0.1][4.0.1t]

### Added

- Support for all Numeric types to be used as monotonic timestamps for ActiveSupport::Notifications
- `time_formatter_proc` - used to format timestamp added to beginning of log lines
- `add_timestamp` - Add timestamp to front of each log line

### Changed

- `DebugLogging::ArgumentPrinter.debug_time_to_s` => `DebugLogging::ArgumentPrinter.debug_event_time_to_s`

### Fixed

### Removed

## [4.0.0] ([tag][4.0.0t]) - 2024-02-28

- TAG: [v4.0.0][4.0.0t]

### Added

- Class method DSL:
    - `logged`
- Instance method DSL:
    - `i_logged`

### Changed

- Class method DSL renamed:
  - `notifies` => `notified`
- Instance method DSL renamed:
  - `i_notifies` => `i_notified`
- Disambiguated class method log output send message separator:
  - `.` => `::`, because `.` is ambiguous; same call syntax used for instance method calls

### Fixed

- Per method config for every decorated method

### Removed

- Support for `include DebugLogging::InstanceLogger.new(...)`
- Support for `include DebugLogging::InstanceNotifier.new(...)`

## [3.1.9] ([tag][3.1.9t]) - 2023-10-31

- TAG: [v3.1.9][3.1.9t]

### Fixed

- Maximum Ruby version is 2.7. Versions 3.x are not compatible with Ruby >= 3

## [3.1.8] ([tag][3.1.8t]) - 2020-12-19

- TAG: [v3.1.8][3.1.8t]

## [3.1.7] ([tag][3.1.7t]) - 2020-12-19

- TAG: [v3.1.7][3.1.7t]

## [3.1.6] ([tag][3.1.6t]) - tagged, but unreleased

- TAG: [v3.1.6][3.1.6t]

## [3.1.5] ([tag][3.1.5t]) - 2020-12-18

- TAG: [v3.1.5][3.1.5t]

## [3.1.4] ([tag][3.1.4t]) - 2020-12-18

- TAG: [v3.1.4][3.1.4t]

## [3.1.3] ([tag][3.1.3t]) - 2020-12-18

- TAG: [v3.1.3][3.1.3t]

## [3.1.2] ([tag][3.1.2t]) - 2020-12-10

- TAG: [v3.1.2][3.1.2t]

## [3.1.1] ([tag][3.1.1t]) - 2020-12-09

- TAG: [v3.1.1][3.1.1t]

## [3.1.0] ([tag][3.1.0t]) - 2020-10-24

- TAG: [v3.1.0][3.1.0t]

## [3.0.0] ([tag][3.0.0t]) - 2020-10-07

- TAG: [v3.0.0][3.0.0t]

## [2.0.0] ([tag][2.0.0t]) - 2020-10-06

- TAG: [v2.0.0][2.0.0t]

## [1.0.17] ([tag][1.0.17t]) - 2018-09-10

- TAG: [v1.0.17][1.0.17t]

## [1.0.16] ([tag][1.0.16t]) - 2018-01-16

- TAG: [v1.0.16][1.0.16t]

## [1.0.15] ([tag][1.0.15t]) - 2017-10-17

- TAG: [v1.0.15][1.0.15t]

## [1.0.14] ([tag][1.0.14t]) - 2017-10-09

- TAG: [v1.0.14][1.0.14t]

## [1.0.13] ([tag][1.0.13t]) - 2017-10-08

- TAG: [v1.0.13][1.0.13t]

## [1.0.12] ([tag][1.0.12t]) - 2017-10-08

- TAG: [v1.0.12][1.0.12t]

## [1.0.11] ([tag][1.0.11t]) - 2017-10-06

- TAG: [v1.0.11][1.0.11t]

## [1.0.10] ([tag][1.0.10t]) - 2017-09-26

- TAG: [v1.0.10][1.0.10t]

## [1.0.9] ([tag][1.0.9t]) - 2017-09-06

- TAG: [v1.0.9][1.0.9t]

## [1.0.8] ([tag][1.0.8t]) - 2017-09-06

- TAG: [v1.0.8][1.0.8t]

## [1.0.7] ([tag][1.0.7t]) - 2017-09-06

- TAG: [v1.0.7][1.0.7t]

## [1.0.6] ([tag][1.0.6t]) - 2017-09-05

- TAG: [v1.0.6][1.0.6t]

## [1.0.5] ([tag][1.0.5t]) - 2017-03-31

- TAG: [v1.0.5][1.0.5t]

## [1.0.4] ([tag][1.0.4t]) - 2017-03-31

- TAG: [v1.0.4][1.0.4t]

## [1.0.3] ([tag][1.0.3t]) - 2017-03-31

- TAG: [v1.0.3][1.0.3t]

## [1.0.2] ([tag][1.0.2t]) - 2017-03-30

- TAG: [v1.0.2][1.0.2t]

## [1.0.1] ([tag][1.0.1t]) - 2017-03-29

- TAG: [v1.0.1][1.0.1t]

## [1.0.0] ([tag][1.0.0t]) - 2017-03-26

- TAG: [v1.0.0][1.0.0t]

## [0.1.0] ([tag][0.1.0t]) - 2017-03-25

- TAG: [v0.1.0][0.1.0t]

- Initial release

[Unreleased]: https://github.com/galtzo-floss/debug_logging/compare/v4.1.1...HEAD
[4.1.1]: https://github.com/galtzo-floss/debug_logging/compare/v4.1.0...v4.1.1
[4.1.1t]: https://github.com/galtzo-floss/debug_logging/releases/tag/v4.1.1
[4.1.0]: https://github.com/galtzo-floss/debug_logging/compare/v4.0.5...v4.1.0
[4.1.0t]: https://github.com/galtzo-floss/debug_logging/releases/tag/v4.1.0
[4.0.5]: https://github.com/galtzo-floss/debug_logging/compare/v4.0.4...v4.0.5
[4.0.5t]: https://github.com/galtzo-floss/debug_logging/releases/tag/v4.0.5
[4.0.4]: https://github.com/galtzo-floss/debug_logging/compare/v4.0.3...v4.0.4
[4.0.4t]: https://github.com/galtzo-floss/debug_logging/releases/tag/v4.0.4
[4.0.3]: https://github.com/galtzo-floss/debug_logging/compare/v4.0.2...v4.0.3
[4.0.3t]: https://github.com/galtzo-floss/debug_logging/releases/tag/v4.0.3
[4.0.2]: https://gitlab.com/galtzo-floss/debug_logging/-/compare/v4.0.1...v4.0.2
[4.0.2t]: https://github.com/galtzo-floss/debug_logging/releases/tag/v4.0.2
[4.0.1]: https://gitlab.com/galtzo-floss/debug_logging/-/compare/v4.0.0...v4.0.1
[4.0.1t]: https://github.com/galtzo-floss/debug_logging/releases/tag/v4.0.1
[4.0.0]: https://gitlab.com/galtzo-floss/debug_logging/-/compare/v3.1.9...v4.0.0
[4.0.0t]: https://github.com/galtzo-floss/debug_logging/releases/tag/v4.0.0
[3.1.9]: https://gitlab.com/galtzo-floss/debug_logging/-/compare/v3.1.8...v3.1.9
[3.1.9t]: https://github.com/galtzo-floss/debug_logging/releases/tag/v3.1.9
[3.1.8]: https://gitlab.com/galtzo-floss/debug_logging/-/compare/v3.1.7...v3.1.8
[3.1.8t]: https://github.com/galtzo-floss/debug_logging/releases/tag/v3.1.8
[3.1.7]: https://gitlab.com/galtzo-floss/debug_logging/-/compare/v3.1.6...v3.1.7
[3.1.7t]: https://github.com/galtzo-floss/debug_logging/releases/tag/v3.1.7
[3.1.6]: https://gitlab.com/galtzo-floss/debug_logging/-/compare/v3.1.5...v3.1.6
[3.1.6t]: https://github.com/galtzo-floss/debug_logging/releases/tag/v3.1.6
[3.1.5]: https://gitlab.com/galtzo-floss/debug_logging/-/compare/v3.1.4...v3.1.5
[3.1.5t]: https://github.com/galtzo-floss/debug_logging/releases/tag/v3.1.5
[3.1.4]: https://gitlab.com/galtzo-floss/debug_logging/-/compare/v3.1.3...v3.1.4
[3.1.4t]: https://github.com/galtzo-floss/debug_logging/releases/tag/v3.1.4
[3.1.3]: https://gitlab.com/galtzo-floss/debug_logging/-/compare/v3.1.2...v3.1.3
[3.1.3t]: https://github.com/galtzo-floss/debug_logging/releases/tag/v3.1.3
[3.1.2]: https://gitlab.com/galtzo-floss/debug_logging/-/compare/v3.1.1...v3.1.2
[3.1.2t]: https://github.com/galtzo-floss/debug_logging/releases/tag/v3.1.2
[3.1.1]: https://gitlab.com/galtzo-floss/debug_logging/-/compare/v3.1.0...v3.1.1
[3.1.1t]: https://github.com/galtzo-floss/debug_logging/releases/tag/v3.1.1
[3.1.0]: https://gitlab.com/galtzo-floss/debug_logging/-/compare/v3.0.0...v3.1.0
[3.1.0t]: https://github.com/galtzo-floss/debug_logging/releases/tag/v3.1.0
[3.0.0]: https://gitlab.com/galtzo-floss/debug_logging/-/compare/v2.0.0...v3.0.0
[3.0.0t]: https://github.com/galtzo-floss/debug_logging/releases/tag/v3.0.0
[2.0.0]: https://gitlab.com/galtzo-floss/debug_logging/-/compare/v1.0.17...v2.0.0
[2.0.0t]: https://github.com/galtzo-floss/debug_logging/releases/tag/v2.0.0
[1.0.17]: https://gitlab.com/galtzo-floss/debug_logging/-/compare/v1.0.16...v1.0.17
[1.0.17t]: https://github.com/galtzo-floss/debug_logging/releases/tag/v1.0.17
[1.0.16]: https://gitlab.com/galtzo-floss/debug_logging/-/compare/v1.0.15...v1.0.16
[1.0.16t]: https://github.com/galtzo-floss/debug_logging/releases/tag/v1.0.16
[1.0.15]: https://gitlab.com/galtzo-floss/debug_logging/-/compare/v1.0.14...v1.0.15
[1.0.15t]: https://github.com/galtzo-floss/debug_logging/releases/tag/v1.0.15
[1.0.14]: https://gitlab.com/galtzo-floss/debug_logging/-/compare/v1.0.13...v1.0.14
[1.0.14t]: https://github.com/galtzo-floss/debug_logging/releases/tag/v1.0.14
[1.0.13]: https://gitlab.com/galtzo-floss/debug_logging/-/compare/v1.0.12...v1.0.13
[1.0.13t]: https://github.com/galtzo-floss/debug_logging/releases/tag/v1.0.13
[1.0.12]: https://gitlab.com/galtzo-floss/debug_logging/-/compare/v1.0.11...v1.0.12
[1.0.12t]: https://github.com/galtzo-floss/debug_logging/releases/tag/v1.0.12
[1.0.11]: https://gitlab.com/galtzo-floss/debug_logging/-/compare/v1.0.10...v1.0.11
[1.0.11t]: https://github.com/galtzo-floss/debug_logging/releases/tag/v1.0.11
[1.0.10]: https://gitlab.com/galtzo-floss/debug_logging/-/compare/v1.0.9...v1.0.10
[1.0.10t]: https://github.com/galtzo-floss/debug_logging/releases/tag/v1.0.10
[1.0.9]: https://gitlab.com/galtzo-floss/debug_logging/-/compare/v1.0.8...v1.0.9
[1.0.9t]: https://github.com/galtzo-floss/debug_logging/releases/tag/v1.0.9
[1.0.8]: https://gitlab.com/galtzo-floss/debug_logging/-/compare/v1.0.7...v1.0.8
[1.0.8t]: https://github.com/galtzo-floss/debug_logging/releases/tag/v1.0.8
[1.0.7]: https://gitlab.com/galtzo-floss/debug_logging/-/compare/v1.0.6...v1.0.7
[1.0.7t]: https://github.com/galtzo-floss/debug_logging/releases/tag/v1.0.7
[1.0.6]: https://gitlab.com/galtzo-floss/debug_logging/-/compare/v1.0.5...v1.0.6
[1.0.6t]: https://github.com/galtzo-floss/debug_logging/releases/tag/v1.0.6
[1.0.5]: https://gitlab.com/galtzo-floss/debug_logging/-/compare/v1.0.4...v1.0.5
[1.0.5t]: https://github.com/galtzo-floss/debug_logging/releases/tag/v1.0.5
[1.0.4]: https://gitlab.com/galtzo-floss/debug_logging/-/compare/v1.0.3...v1.0.4
[1.0.4t]: https://github.com/galtzo-floss/debug_logging/releases/tag/v1.0.4
[1.0.3]: https://gitlab.com/galtzo-floss/debug_logging/-/compare/v1.0.2...v1.0.3
[1.0.3t]: https://github.com/galtzo-floss/debug_logging/releases/tag/v1.0.3
[1.0.2]: https://gitlab.com/galtzo-floss/debug_logging/-/compare/v1.0.1...v1.0.2
[1.0.2t]: https://github.com/galtzo-floss/debug_logging/releases/tag/v1.0.2
[1.0.1]: https://gitlab.com/galtzo-floss/debug_logging/-/compare/v1.0.0...v1.0.1
[1.0.1t]: https://github.com/galtzo-floss/debug_logging/releases/tag/v1.0.1
[1.0.0]: https://gitlab.com/galtzo-floss/debug_logging/-/compare/v0.1.0...v1.0.0
[1.0.0t]: https://github.com/galtzo-floss/debug_logging/releases/tag/v1.0.0
[0.1.0]: https://github.com/galtzo-floss/debug_logging/compare/f648ea6832aa85232d320b4c4acc4a84e44a83d3...v0.1.0
[0.1.0t]: https://github.com/galtzo-floss/debug_logging/releases/tag/v0.1.0
