# EcoYield
<br>
Curso Web 3.0 - Fase Capacitação
<br>
<br>
Projeto Web3 - Desenvolvimento de Protocolo Web3 Completo com Deploy em Testnet
<br>
<br>
📝 EcoYield Protocol
O EcoYield é um ecossistema DeFi (Finanças Descentralizadas) e Web3 construído em Solidity. O protocolo integra staking de tokens, governança on-chain e identidade digital via NFTs para incentivar a participação ativa e sustentável em comunidades descentralizadas.
<br>
<br>
🚀 Visão Geral
O projeto consiste numa arquitetura modular de quatro contratos inteligentes interconectados que permitem aos utilizadores:

Ganhos Passivos: Bloquear tokens $ECO para gerar rendimentos baseados no tempo (staking).

Governança Ativa: Propor e votar em mudanças no protocolo com peso proporcional à posse de tokens.

Reputação Web3: Emitir Badges (NFTs) exclusivos para comprovar a sua participação no ecossistema.

<br>
🏗️ Arquitetura Técnica
O protocolo é dividido em camadas de responsabilidade:

EcoToken.sol ($ECO): Token ERC20 com suporte a ERC20Votes e ERC20Permit. É a unidade de valor e o combustível da governação.

EcoStaking.sol: O motor financeiro. Gere depósitos, calcula recompensas por bloco e utiliza proteção contra reentrada (ReentrancyGuard).

EcoGovernance.sol: Sistema de votação democrática que utiliza snapshots de blocos passados para prevenir ataques de Flash Loans.

EcoBadge.sol: Contrato ERC721 (NFT) que lida com a emissão de certificados digitais de participação.

<br>
🛡️ Segurança e Auditoria
O projeto foi desenvolvido seguindo as melhores práticas de segurança:

OpenZeppelin: Uso de bibliotecas padrão da indústria para ERC20, ERC721 e Controlo de Acesso.

Prevenção de Reentrada: Implementação de nonReentrant em funções críticas de movimentação de fundos.

Checkpoints de Voto: Uso de getPastVotes para garantir que o peso do voto seja baseado no histórico real do utilizador.

Solidity 0.8.20: Proteção nativa contra overflow e underflow aritmético.

<br>
💻 Como Executar o Projeto
Pré-requisitos

Uma carteira Web3 (ex: MetaMask).

Acesso a uma Testnet (ex: Sepolia).

<br>
📊 Roadmap
[ ] Implementação de taxas de staking dinâmicas via DAO.

[ ] Dashboard analítico de rendimentos.

[ ] Integração com Oráculos para preços em tempo real.

