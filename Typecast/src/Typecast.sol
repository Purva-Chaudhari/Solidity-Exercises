// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;
import "forge-std/console.sol";
contract Typecast {
    /**
     * the goal of this exercise is to pass if msg.value is equal to the address of this contract or revert otherwise
     */

    function typeCast() external payable {
        // your code here
        
        console.log("Message val : ", msg.value);
        console.log("address converted to uint : ", uint256(uint160(address(this))));
        console.log("uint converted to address : ",address(uint160(msg.value)));
        console.log("Address val : ", address(this));
        require (msg.value == uint256(uint160(address(this))), "Does not match");
        //require (address(this) == address(uint160(msg.value)));
        
    }
}
