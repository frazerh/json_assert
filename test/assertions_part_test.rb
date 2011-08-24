require "test_helper"

class AssertionsEqlTest < Test::Unit::TestCase

  include JsonAssert::Assertions

  def test_simple_json
    assert_part_json %({"json":"assert","some":"other"}), %({"json":"assert"})
  end

  def test_nested_json
    assert_part_json %({"test":{"assert":"this"},"some":"other"}), %({"assert":"this"})
  end

  def test_multiple_json
    assert_part_json %({"test":"x", "assert":"this","some":"other","beta":7}), %({"assert":"this", "beta":7})
  end

  def test_not_part_of_json
    assert_not_part_json %({"json":"assert","some":"other"}), %({"sdsdsd":"sdsd"})
  end

  # TODO: What about arrays

end
