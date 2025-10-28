// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Faucet {
    mapping(address=>uint256) public last;
    event Drip(address indexed to, uint256 when);

    function drip() external {
        require(block.timestamp - last[msg.sender] >= 1 hours, "too soon");
        last[msg.sender] = block.timestamp;
        emit Drip(msg.sender, block.timestamp);
        // Gerçek token transferi burada olurdu.
    }
}
