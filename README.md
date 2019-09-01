# Bitlib 0️⃣1️⃣0️⃣1️⃣
A simple OCaml library for bit/byte operations. The purpose of this library is to provide aid to users writing binary files, NOT perform bitwise operations on objects in memory.


## Example

        // Write a short int (2 bytes) to a binary file
        let bits = to_bits 512 in
        let padded = pad 16 bits in
        let bytes = to_bytes padded 2 in
        write_binary_file bytes "output.byte"


# API

## **to_bits** _i_
Converts an integer, `i`, to a list of bits.

#### Signature
        val to_bits : int -> int list

#### Example

        to_bits 5 => [1;0;1]

#

## **pad** _padding bits_
Ensures `bits` is of length `padding`, left-padding the list with 0's as needed.

#### Signature
        val pad : int -> int list -> int list

#### Example
        padding 8 [1;0;1] => [0;0;0;0;0;1;0;1]

#

## **to_bytes** _bits n_
Writes the bit sequence, `bits`, as a byte sequence of length `n`. This function assumes bytes are 8 bits.

#### Signature
        val to_bytes: int list -> int -> int list

#### Example
        to_bytes (padding 32 (to_bits 256)) 4 => [0;0;1;0]

#

## **little_endian_of_int** _i bytes_
Converts an integer, `i`, to a list of bytes, `bytes` long, in little endian order.

#### Signature
        val little_endian_of_int : int -> int -> int list

#### Example
        little_endian_of_int 5 2 => [0;5]

#

## **big_endian_of_int** _i bytes_
Converts an integer, `i`, to a list of bytes, `bytes` long, in big endian order.

#### Signature
        val big_endian_of_int : int -> int -> int list

#### Example
        big_endian_of_int 5 2 => [5;0]

#

## **write_binary_file** _bytes filename_
Creates a binary file named `filename` and writes the content of `bytes` to the file.

#### Signature
        val write_binary_file : int list -> string -> unit

#### Example
        write_binary_file [0;5] "output.byte"

<br/>

# Contributing
Contributions to `bitlib` are greatly appreciated! ❤️

Please try to keep its implementation unassuming and configurable. 🙂
