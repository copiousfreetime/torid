# Torid Changelog
## Version 1.4.0 - 2024-03-XX

* Add Torid::ULID to implement the [ulid specification](https://github.com/ulid/spec)

## Version 1.3.0 - 2017-02-17

* Add Torid::UUID#node_id_s to allow access to just the node portion
  of the UUID as a string.

## Version 1.2.4 - 2015-02-18

* Fix a failing test case on jruby. Only affected running tests.

## Version 1.2.3 - 2014-09-13

* Use `captures` instead of named captures.

## Version 1.2.2 - 2014-09-13

* And named captures to the uuid regex.

## Version 1.2.1 - 2014-09-13

* Fix bug where after a fork you could generate the same uuids in different
  processes (copiousfreetime/torid#1)

## Version 1.2.0 - 2014-09-04

* Added equivalence checking

## Version 1.1.0 - 2014-07-17

* Added Torid::UUID.match

## Version 1.0.0

* Initial Release - Yeah!

