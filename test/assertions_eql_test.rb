require "test_helper"

class AssertionsEqlTest < Test::Unit::TestCase
  
  include JsonAssert::Assertions
  
  def test_identical_json
    assert_json_eql %({"json":"spec"}), %({"json":"spec"})
  end
  
  def test_differently_formatted_json
    assert_json_eql %({"json": "spec"}), %({"json":"spec"})
  end

  def test_out_of_order_hashes
    assert_json_eql %({"laser":"lemon","json":"spec"}), %({"json":"spec","laser":"lemon"})
  end

  def test_does_not_match_out_of_order_arrays
    assert_json_not_eql %(["json","spec"]), %(["spec","json"])
  end

  def test_valid_json_values_yet_invalid_json_documents
    assert_json_eql %("json_spec"), %("json_spec")
  end

  def test_ignores_custom_excluded_hash_keys
    JsonAssert.exclude_keys("ignore")
    assert_json_eql %({"json":"spec","ignore":"please"}), %({"json":"spec"})
  end
  
  def test_excludes_extra_hash_keys_per_matcher
    JsonAssert.excluded_keys = %w(ignore)
    assert_json_eql %({"id":1,"json":"spec","ignore":"please"}), %({"id":2,"json":"spec","ignore":"this"}), :excluding => "id"
  end
  
  def test_excludes_extra_hash_keys_given_as_symbols
    JsonAssert.excluded_keys = []
    assert_json_eql %({"id":1,"json":"spec"}), %({"id":2,"json":"spec"}), :excluding => :id
  end

  def test_excludes_multiple_keys
    JsonAssert.excluded_keys = []
    assert_json_eql %({"id":1,"json":"spec"}), %({"id":2,"json":"different"}), :excluding => [:id, :json]
  end

  def test_includes_globally_excluded_hash_keys_per_matcher
    JsonAssert.excluded_keys = %w(id ignore)
    assert_json_not_eql %({"id":1,"json":"spec","ignore":"please"}), %({"id":2,"json":"spec","ignore":"this"}), :including => "id"
  end

  def test_includes_globally_included_hash_keys_given_as_symbols
    JsonAssert.excluded_keys = %w(id)
    assert_json_not_eql %({"id":1,"json":"spec"}), %({"id":2,"json":"spec"}), :including => :id
  end

  def test_includes_multiple_keys
    JsonAssert.excluded_keys = %w(id json)
    assert_json_eql %({"id":1,"json":"spec"}), %({"id":2,"json":"different"}), :including => [:id, :json]
  end
  
end