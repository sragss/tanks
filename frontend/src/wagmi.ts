import { getDefaultConfig } from "connectkit";
import { foundry, goerli } from "viem/chains";
import { createConfig } from "wagmi";
const walletConnectProjectId = process.env.NEXT_PUBLIC_WALLET_CONNECT_APP!;
const alchemyId = process.env.NEXT_PUBLIC_ALCHEMY_ID!;

export const config = createConfig(
  getDefaultConfig({
    autoConnect: true,
    appName: "Tank Trust Tactics",
    walletConnectProjectId,
    alchemyId: alchemyId,
    chains: [foundry],
  })
);
