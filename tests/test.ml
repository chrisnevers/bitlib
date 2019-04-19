
open OUnit
open Bitlib

let to_bits_test = fun () ->
  assert_equal [1;0;1] (to_bits 5)

let pad_test = fun () ->
  assert_equal [0;0;0;0;0;1;0;1] (pad 8 (to_bits 5))

let to_bytes_test = fun () ->
  let bits = pad 32 (to_bits 5) in
  let res = to_bytes bits 4 in
  assert_equal [0;0;0;5] res;
  let bits = pad 32 (to_bits 256) in
  let res = to_bytes bits 4 in
  assert_equal [0;0;1;0] res

let little_endian_of_int_test = fun () ->
  assert_equal [0;0;1;1] (little_endian_of_int 257 4);
  assert_equal [0;5] (little_endian_of_int 5 2)

let big_endian_of_int_test = fun () ->
  assert_equal [1;2;0;0] (big_endian_of_int 513 4);
  assert_equal [5;0] (big_endian_of_int 5 2)

let suite =
  "Tests" >:::
  [
    "to_bits test" >:: to_bits_test;
    "pad test" >:: pad_test;
    "to_bytes test" >:: to_bytes_test;
    "little_endian_of_int test" >:: little_endian_of_int_test;
  ]

let _ = run_test_tt_main suite

