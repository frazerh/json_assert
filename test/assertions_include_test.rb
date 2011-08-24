require "test_helper"

class AssertionsIncludeTest < Test::Unit::TestCase
  
  include JsonAssert::Assertions
  
  def test_included_array_elements
    json = %(["one",1,1.0,true,false,null])
    assert_include_json json, %("one")
    assert_include_json json, %(1)
    assert_include_json json, %(1.0)
    assert_include_json json, %(true)
    assert_include_json json, %(false)
    assert_include_json json, %(null)
  end
  
  def test_an_array_included_in_an_array
    json = %([[1,2,3],[4,5,6]])
    assert_include_json(json, %([1,2,3]))
    assert_include_json(json, %([4,5,6]))
  end

  def test_test_a_hash_included_in_an_array
    json = %([{"one":1},{"two":2}])
    assert_include_json json, %({"one":1})
    assert_include_json json, %({"two":2})
  end
  
  def test_an_array_included_in_an_array
     json = %([[1,2,3],[4,5,6]])
     assert_include_json json, %([1,2,3])
     assert_include_json json, %([4,5,6])
   end

   def test_a_hash_included_in_an_array
     json = %([{"one":1},{"two":2}])
     assert_include_json json, %({"one":1})
     assert_include_json json, %({"two":2})
   end

   def test_include_hash_values
     json = %({"string":"one","integer":1,"float":1.0,"true":true,"false":false,"null":null})
     assert_include_json json, %("one")
     assert_include_json json, %(1)
     assert_include_json json, %(1.0)
     assert_include_json json, %(true)
     assert_include_json json, %(false)
     assert_include_json json, %(null)
   end

   def test_a_hash_included_in_a_hash
     json = %({"one":{"two":3},"four":{"five":6}})
     assert_include_json json, %({"two":3})
     assert_include_json json, %({"five":6})
   end

   def test_an_array_included_in_a_hash
     json = %({"one":[2,3],"four":[5,6]})
     assert_include_json json, %([2,3])
     assert_include_json json, %([5,6])
   end

   def test_at_a_path
     assert_include_json %({"one":{"two":[3,4]}}), %([3,4]), :at_path => "one"
   end

   def test_ignores_excluded_keys
     assert_include_json %([{"id":1,"two":3}]), %({"two":3})
   end
  
end