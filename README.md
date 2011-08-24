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

Contributing
------------
In the spirit of [free software](http://www.fsf.org/licensing/essays/free-sw.html), **everyone** is encouraged to help improve this project.

Here are some ways *you* can contribute:

* using alpha, beta, and prerelease versions
* reporting bugs
* suggesting new features
* writing or editing documentation
* writing specifications
* writing code (**no patch is too small**: fix typos, add comments, clean up inconsistent whitespace)
* refactoring code
* closing [issues](https://github.com/frazerh/json_assert/issues)
* reviewing patches

Submitting an Issue
-------------------
We use the [GitHub issue tracker](https://github.com/frazerh/json_assert/issues) to track bugs
and features. Before submitting a bug report or feature request, check to make sure it hasn't already
been submitted. You can indicate support for an existing issuse by voting it up. When submitting a
bug report, please include a [Gist](https://gist.github.com/) that includes a stack trace and any
details that may be necessary to reproduce the bug, including your gem version, Ruby version, and
operating system. Ideally, a bug report should include a pull request with failing specs.

Submitting a Pull Request
-------------------------
1. Fork the project.
2. Create a topic branch.
3. Implement your feature or bug fix.
4. Add tests for your feature or bug fix.
5. Run `bundle exec rake`. If your changes are not 100% covered and passing, go back to step 4.
6. Commit and push your changes.
7. Submit a pull request. Please do not include changes to the gemspec, version, or history file. (If you want to create your own version for some reason, please do so in a separate commit.)

Copyright
---------
Copyright © 2011 Frazer Horn
See [LICENSE](https://github.com/frazerh/json_assert/blob/master/LICENSE.md) for details.