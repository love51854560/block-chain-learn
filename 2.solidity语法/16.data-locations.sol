pragma solidity ^0.8.24;
/*
Variables are declared as either `storage`, `memory` or `calldata` to explicitly specify the location of the data.

- `storage` variable is a state variable (store on blockchain)
- `memory` variable is in memory and it exists while a function is being called
- `calldata` special data location that contains function arguments
*/
contract DataLocations {
    uint256[] public arr;
    mapping(uint256 => address) map;

    struct MyStruct {
        uint256 foo;
    }

    mapping(uint256 => MyStruct) myStructs;

    function _f(
        uint256[] storage _arr,
        mapping(uint256 => address) storage _map,
        MyStruct storage _myStruct
    ) internal {
        // do something with storage variables
    }

    function f() public {
        // call _f with state variables
        _f(arr, map, myStructs[1]);

        // get a struct from a mapping
        MyStruct storage myStruct = myStructs[1];

        // create a struct in memory
        MyStruct memory myMemStruct = MyStruct(0);
    }

    // You can return memory variables
    function g(uint256[] memory _arr) public returns (uint256[] memory) {
        // do something with memory array
        uint256[] memory result = new uint256[](3);
        result[0] = 1;
        result[1] = 2;
        result[2] = 3;
        return result;
    }

    function h(uint256[] calldata _arr) external {
        // do something with calldata array
    }
}
