// SPDX-License-Identifier:MIT
import {BoxV1Contract} from "../src/BoxV1.sol";
import {BoxV2Contract} from "../src/BoxV2.sol";
import {DeployBox} from "../script/DeployBox.s.sol";
import {UpgradeBox} from "../script/UpgradeBox.s.sol";
import {Test, console} from "forge-std/Test.sol";

pragma solidity 0.8.21;

contract TestDeployAndUpgrade is Test {
    DeployBox deployer;
    UpgradeBox upgrader;
    address private OWNER = makeAddr("owner");

    address public proxy;

    function setUp() public {
        deployer = new DeployBox();
        upgrader = new UpgradeBox();
        proxy = deployer.run();
    }

    function testProxyStartsAsBoxV1() public {
        vm.expectRevert();
        BoxV2Contract(proxy).setNumber(7);
    }

    function testUpgrade() public {
        BoxV2Contract box2 = new BoxV2Contract();
        upgrader.upgradeBox(proxy, address(box2));
        uint256 expectedValue = 2;
        assertEq(BoxV2Contract(proxy).version(), expectedValue);
        BoxV2Contract(proxy).setNumber(69);
        assertEq(69, BoxV2Contract(proxy).getNumber());
    }
}
