## Torid

* [Homepage](https://github.com/copiousfreetime/torid/)
* [Github Project](https://github.com/copiousfreetime/torid)
* email jeremy at copiousfreetime dot org

## DESCRIPTION

Temporally Ordered IDs. Generate universally unique identifiers (UUID)
that sort lexically in time order.

Torid exists to solve the problem of generating UUIDs that when ordered
lexically, they are also ordered temporally. I needed a way to generate ids for
events that are entering a system with the following criteria:

1. Fast ID generation
2. No central coordinating server/system
3. No local storage
4. Library code, that is multiple apps on the same machine can use the same code
   and they will not generate duplicate ids
5. Eventually stored in a UUID field in a database. So 128bit ids are totally
   fine.

The IDs that Torid generates are 128bit IDs made up of 2, 64bit parts.

* 64bit microsecond level UNIX timestamp
* 64bit hash of the system hostname, process id and a random value.

## EXAMPLES

```ruby
require 'torid'

uuid = Torid.uuid
uuid.to_s         # => "0004fda4-318e-f380-5a45-5321cd065b02"
uuid.bytes        # => "\x00\x04\xFD\xA41\x8E\xF3\x80ZES!\xCD\x06[\x02"
```

## CREDITS / RESOURCES

The vast majority of the credit and research stems from:

* [jondot's](https://github.com/jondot) blog post on [Fast ID Generation](http://blog.paracode.com/2012/04/16/fast-id-generation-part-1/) served to solidify my thoughts on the criteria I needed in an ID generation system. 
* This let me to [Boundary's Flake](http://boundary.com/blog/2012/01/12/flake-a-decentralized-k-ordered-unique-id-generator-in-erlang/)
* [James Golick's](https://github.com/jamesgolick) [lexical_uuid](https://github.com/jamesgolick/lexical_uuid), which if I had found a day earlier, I might be using instead of creating this.

You could consider Torid to be a reimplementation of lexical_uuid. It definately steals some code from it and [simple_uuid](https://github.com/cassandra-rb/simple_uuid)

Blog posts around ID generation:

* [Wikipedia UUID](http://en.wikipedia.org/wiki/Universally_unique_identifier)
* [RFC 4122](http://tools.ietf.org/html/rfc4122)
* [Fast ID Generation Part I](http://blog.paracode.com/2012/04/16/fast-id-generation-part-1/)
* [Boundary's Flake Project](http://boundary.com/blog/2012/01/12/flake-a-decentralized-k-ordered-unique-id-generator-in-erlang/)
* [Flickr's Ticket Server](http://code.flickr.net/2010/02/08/ticket-servers-distributed-unique-primary-keys-on-the-cheap/)
* [Twitter Snowflake](https://blog.twitter.com/2010/announcing-snowflake)
* [Sharding & ID's at Instagram](http://instagram-engineering.tumblr.com/post/10853187575/sharding-ids-at-instagram)

Libraries implementing similar approaches:

* [simple_uuid](https://github.com/cassandra-rb/simple_uuid)
* [uuid](https://github.com/assaf/uuid)
* [flake](http://github.com/boundary/flake)
* [BSON Object ID](https://github.com/mongodb/bson-ruby/blob/master/lib/bson/object_id.rb) and in [C](https://github.com/mongodb/bson-ruby/blob/master/ext/bson/native.c)
* [ffi-uuid](https://github.com/mmullis/ffi-uuid)
* [lexical_uuid](https://github.com/jamesgolick/lexical_uuid)

## ISC LICENSE

http://opensource.org/licenses/isc-license.txt

Copyright (c) 2014 Jeremy Hinegardner

Permission to use, copy, modify, and/or distribute this software for any
purpose with or without fee is hereby granted, provided that the above
copyright notice
and this permission notice appear in all copies.

THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

