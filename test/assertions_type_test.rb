require "test_helper"

class AssertionsTypeTest < Test::Unit::TestCase

  include JsonAssert::Assertions

  def test_hashes
    assert_json_type %({}), Hash
  end

  def test_arrays
    assert_json_type %([]), Array
  end

  def test_type_at_a_path
    assert_json_type %({"root":[]}), Array, :at_path => "root"
  end

  def test_strings
    assert_json_type %(["json_spec"]), String, :at_path => "0"
  end

  def test_a_valid_json_value_yet_invalid_json_document
    assert_json_type %("json_spec"), String
  end

  def test_empty_strings
    assert_json_type %(""), String
  end

  def test_integers
    assert_json_type %(10), Integer
  end

  def test_floats
    assert_json_type %(10.0), Float
    assert_json_type %(1e+1), Float
  end

  def test_ancestor_classes
    assert_json_type %(10), Numeric
    assert_json_type %(10.0), Numeric
  end

  def provides_a_failure_message_for_assert
    #matcher = assert_json_type(Numeric)
    #matcher.test?(%("foo"))
    #matcher.failure_message_for_should.should == "Expected JSON value type to be Numeric, got String"
  end

  def test_provides_a_failure_message_for_assert_not
    #matcher = assert_json_type(Numeric)
    #matcher.test?(%(10))
    #matcher.failure_message_for_should_not.should == "Expected JSON value type to not be Numeric, got Fixnum"
  end

end
