import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

export default buildModule("TheWeb3FirstModule", (m) => {
  const theWeb3First = m.contract("TheWeb3First");
  return { theWeb3First };
});
