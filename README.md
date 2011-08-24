json_assert
========
Easily handle JSON in Test::Unit.  
This is completely copied from the excellent json_spec gem found here https://github.com/collectiveidea/json_spec
I just wanted the same features for a project where rspec was not available

Installation
------------
    gem install json_assert

or with Bundler:

    gem "json_assert"

Documentation
-------------

json_assert defines six new assertions:

* `assert_json_eql`
* `assert_part_json`
* `assert_include_json`
* `assert_json_path`
* `assert_json_type`
* `assert_json_size`

Copyright
---------
Copyright © 2011 Frazer Horn
See [LICENSE](https://github.com/frazerh/json_assert/blob/master/LICENSE.md) for details.