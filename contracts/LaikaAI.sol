// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import '@openzeppelin/contracts/token/ERC20/ERC20.sol';
import '@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol';
import '@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol';
import '@openzeppelin/contracts/token/ERC20/extensions/ERC20Votes.sol';
import '@openzeppelin/contracts/access/Ownable.sol';

/**
 * @title LaikaAI
 * @dev Extends ERC20, ERC20Burnable, ERC20Permit, ERC20Votes, and Ownable contracts from OpenZeppelin.
 */
contract LaikaAI is ERC20, ERC20Burnable, ERC20Permit, ERC20Votes, Ownable {
    uint256 private constant INITIAL_SUPPLY = 1_000_000_000 * 10 ** decimals();

    /**
     * @dev Constructor that initializes the LaikaAI token with an initial supply and transfers it to the deployer.
     * @param initialOwner The address that will become the initial owner of all LaikaAI tokens.
     */
    constructor(
        address initialOwner
    ) ERC20('Laika AI', 'LKI') ERC20Permit('Laika AI') Ownable(initialOwner) {
        _mint(msg.sender, INITIAL_SUPPLY);
    }

    /**
     * @dev Overrides the _update function to ensure compatibility with ERC20Votes.
     * @param from The address from which tokens are transferred.
     * @param to The address to which tokens are transferred.
     * @param value The amount of tokens transferred.
     */
    function _update(
        address from,
        address to,
        uint256 value
    ) internal override(ERC20, ERC20Votes) {
        super._update(from, to, value);
    }

    /**
     * @dev Overrides the nonces function to return the nonce for permit signature verification.
     * @param owner The address for which the nonce is queried.
     * @return The current nonce associated with the owner address.
     */
    function nonces(
        address owner
    ) public view override(ERC20Permit, Nonces) returns (uint256) {
        return super.nonces(owner);
    }
}
