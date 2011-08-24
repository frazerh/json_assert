require "test_helper"

class AssertionsSizeTest < Test::Unit::TestCase

  include JsonAssert::Assertions

  def test_counts_array_entries
    assert_json_size %([1,2,3]), 3
  end

  def test_counts_null_array_entries
    assert_json_size %([1,null,3]), 3
  end

  def test_counts_hash_key_value_pairs
    assert_json_size %({"one":1,"two":2,"three":3}), 3
  end

  def test_counts_null_hash_values
    assert_json_size %({"one":1,"two":null,"three":3}), 3
  end

  def test_at_a_path
    assert_json_size %({"one":[1,2,3]}), 3, :at_path => "one"
  end

end
