// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import '@openzeppelin/contracts/token/ERC20/ERC20.sol';
import '@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol';
import '@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol';
import '@openzeppelin/contracts/token/ERC20/extensions/ERC20Votes.sol';

/**
 * @title LaikaAI
 * @dev Extends ERC20, ERC20Burnable, ERC20Permit, ERC20Votes contracts from OpenZeppelin.
 * @notice This contract implements a basic ERC20 token with burn, permit, and voting capabilities.
 */
contract LaikaAI is ERC20, ERC20Burnable, ERC20Permit, ERC20Votes {
    uint256 public immutable INITIAL_SUPPLY;

    /**
     * @dev Constructor that initializes the LaikaAI token with an initial supply and transfers it to the deployer.
     * @param initialSupply The initial supply of LaikaAI tokens.
     */
    constructor(
        uint256 initialSupply
    ) ERC20('Laika AI', 'LKI') ERC20Permit('Laika AI') {
        INITIAL_SUPPLY = initialSupply;
        _mint(msg.sender, initialSupply);
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
}
