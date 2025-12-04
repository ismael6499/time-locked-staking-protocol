# 🥩 Staking App: Time-Based DeFi Protocol & Advanced Foundry Testing

A decentralized finance protocol implementing time-locked staking mechanics with ETH rewards, featuring a robust test suite designed for 100% code coverage.

## 🚀 Engineering Context

As a **Java Software Engineer**, I am accustomed to managing scheduled tasks and time-sensitive logic using centralized libraries like `Quartz` or system-level `Cron` jobs.

In this project, I engineered a decentralized alternative using the EVM's native timekeeping (`block.timestamp`). The goal was to create a trustless mechanism for asset locking and reward distribution that relies entirely on on-chain state, removing the need for external oracles or off-chain schedulers.

## 💡 Project Overview

**Staking App** allows users to deposit a fixed amount of `STK` tokens to earn `ETH` rewards after a specific maturity period (e.g., 7 days). The architecture focuses on security patterns standard in high-value DeFi protocols.

### 🔍 Key Technical Features:

* **DeFi Architecture & Security:**
    * **SafeERC20 Implementation:** Integrated OpenZeppelin's `SafeERC20` wrapper to handle non-standard ERC-20 tokens that might not return a boolean on transfer, preventing silent failures.
    * **Reentrancy Protection:** Applied `ReentrancyGuard` to the `claimRewards` function, a critical security measure when the contract sends ETH to unknown addresses.
    * **Inter-Contract Communication:** The system decouples the token logic (`StakingToken`) from the staking mechanics (`StakingApp`), interacting strictly via the `IERC20` interface.

* **Advanced Foundry Testing Strategy:**
    * **100% Line Coverage:** I engineered a malicious mock contract (`RejectEther`) specifically to force-fail external calls. This allowed me to test the `TransferFailed` custom error and verify the robustness of the `receive()` fallback logic, covering edge cases often ignored in standard tests.
    * **Fuzzing & Cheatcodes:** Leveraged Foundry's `vm.warp()` to simulate time travel (validating lock-up periods without waiting real-time) and `vm.prank()` to simulate multi-user scenarios.

## 🛠️ Stack & Tools

* **Framework:** Foundry.
    * *Selected for its ability to write tests in Solidity and its powerful Fuzzing engine.*
* **Language:** Solidity 0.8.24.
* **Libraries:** OpenZeppelin (`Ownable`, `ReentrancyGuard`, `SafeERC20`).
* **Concepts:** Time manipulation, State Machines, Property-Based Testing.

---

*This project is part of my specialized portfolio in Blockchain Architecture.*