# Change log

## master (unreleased)

### New Features

* Add `yamllint` check in CI
* Add `ruby-3.3` to CI
* Add `dependabot check` for `GitHub Actions`
* Add `ruby-3.4` to CI

### Changes

* Check `dependabot` at 8:00 Moscow time daily
* Fix `rubocop-1.28.1` code issues
* Remove `ruby-3.1` from CI
* Run CI on production helpcenter, not a dev one
* Fix `rubocop-1.72.0` cop `Style/RedundantParentheses`

### Fixes

* Run `rubocop` in CI through `bundle exec`
