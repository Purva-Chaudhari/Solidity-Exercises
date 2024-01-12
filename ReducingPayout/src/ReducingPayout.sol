// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract ReducingPayout {
    /*
        This exercise assumes you know how block.timestamp works.
        1. This contract has 1 ether in it, each second that goes by, 
           the amount that can be withdrawn by the caller goes from 100% to 0% as 24 hours passes.
        2. Implement your logic in `withdraw` function.
        Hint: 1 second deducts 0.0011574% from the current %.
    */

    // The time 1 ether was sent to this contract
    uint256 public immutable depositedTime;

    constructor() payable {
        depositedTime = block.timestamp;
    }

    function withdraw() public {
        // your code here
        uint256 diff = block.timestamp - depositedTime;
        uint256 amount = 0;
        if (diff < 1 days) {
             amount =  address(this).balance - (address(this).balance*diff * 11574/1000000000);
             //uint256 amount =  address(this).balance - (address(this).balance*diff /(3600*24));  is equivalent but doesn't work for testWithdraw2 due to some decimal adjustments
        }
        
        (bool ok,) = msg.sender.call{value:amount}("");
        require(ok);
    }
}
