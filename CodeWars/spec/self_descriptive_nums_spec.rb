require 'self_descriptive_num'

describe("Basic tests") do
    assert_equals(self_descriptive(21200), true)
    assert_equals(self_descriptive(3211000), true)
    assert_equals(self_descriptive(42101000), true)
    assert_equals(self_descriptive(21230), false)
    assert_equals(self_descriptive(11200), false)
    assert_equals(self_descriptive(1210), true)
    assert_equals(self_descriptive(51120111), false)
    assert_equals(self_descriptive(2020), true)
    assert_equals(self_descriptive(11201), false)
    assert_equals(self_descriptive(6210001000), true)
end