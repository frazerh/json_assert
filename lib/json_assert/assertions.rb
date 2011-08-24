require "json"
require 'active_support/core_ext/hash/diff'

module JsonAssert
  module Assertions

    include JsonAssert::Helpers
    include JsonAssert::Exclusion

    def assert_json_eql(actual_json, expected_json, options={})
      parse_options(options)
      actual, expected = scrub(actual_json, @path), [scrub(expected_json)]
      msg = build_message(message, "<?> expected to be equal to\n<?>.", expected.inspect, actual.inspect)
      assert_block(msg) { actual == expected.first }
    end

    def assert_json_not_eql(actual_json, expected_json, options={})
      parse_options(options)
      @actual, @expected = scrub(actual_json, @path), [scrub(expected_json)]
      msg = build_message(message, "<?> expected not to be equal to\n<?>.", @expected.to_s, @actual.to_s)
      assert_block(msg) { @actual != @expected.first }
    end

    def assert_include_json(actual_json, expected_json, options={})
      parse_options(options)
      actual = parse_json(actual_json, @path)
      expected = exclude_keys(parse_json(expected_json))
      msg = build_message(message, "<?> expected to include\n<?>.", expected.to_s, actual.to_s)
      assert_block(msg) {
        case actual
        when Hash then actual.values.map{|v| exclude_keys(v) }.include?(expected)
        when Array then actual.map{|e| exclude_keys(e) }.include?(expected)
        else false
        end
      }
    end

    def assert_json_path(json, path)
      msg = "path was not found for #{path}"
      assert_block(msg) do
        begin
          parse_json(json, path)
          true
        rescue JsonAssert::MissingPathError
          false
        end
      end
    end
    
    def assert_not_json_path(json, path)
      msg = "path was unexpectedly found for #{path}"
      assert_block(msg) do
        begin
          parse_json(json, path)
          false
        rescue JsonAssert::MissingPathError
          true
        end
      end
    end

    def assert_json_type(json, klass, options={})
      parse_options(options)
      actual = parse_json(json, @path)
      msg = build_message(message, "<?> expected to be a\n<?>.", actual.to_s, klass.to_s)
      assert_block(msg) { actual.is_a?(klass) }
    end

    def assert_json_size(json, expected_size, options={})
      parse_options(options)
      @json = json
      size = actual_size
      msg = build_message(message, "expected size was <?> but it was <?>.", expected_size.to_s, size.to_s)
      assert_block(msg) { size == expected_size }
    end

    private

      def parse_options(options)
        options.each{|k,v| self.send(k.to_s, v) }
      end

      def scrub(json, path = nil)
        generate_normalized_json(exclude_keys(parse_json(json, path))).chomp + "\n"
      end

      def excluding(*keys)
        excluded_keys.merge(keys.flatten.map{|k| k.to_s })
      end

      def including(*keys)
        excluded_keys.subtract(keys.map{|k| k.to_s })
      end

      def at_path(path)
        @path = path
      end

      def actual_size
        ruby = parse_json(@json, @path)
        ruby.is_a?(Enumerable) ? ruby.size : 1
      end

  end
end
