require "test_helper"

class AssertionsPathTest < Test::Unit::TestCase

  include JsonAssert::Assertions

  def test_hash_keys
    assert_json_path %({"one":{"two":{"three":4}}}),  "one/two/three"
  end

  def test_doesnt_match_values
    assert_not_json_path %({"one":{"two":{"three":4}}}), "one/two/three/4"
  end

  def test_array_indexes
    assert_json_path %([1,[1,2,[1,2,3,4]]]), "1/2/3"
  end

  def test_respects_null_array_values
    assert_json_path %([null,[null,null,[null,null,null,null]]]), "1/2/3"
  end

  def test_hash_keys_and_array_indexes
    assert_json_path %({"one":[1,2,{"three":4}]}), "one/2/three"
  end

end
