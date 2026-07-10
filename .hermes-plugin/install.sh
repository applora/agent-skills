#!/usr/bin/env bash
# Installs the Applora Shopify App Store market research skill for Hermes Agent.
# Usage:
#   curl -fsSL https://raw.githubusercontent.com/applora/agent-skills/main/.hermes-plugin/install.sh -o /tmp/applora-hermes-install.sh
#   bash /tmp/applora-hermes-install.sh
set -euo pipefail

REPO_URL="https://github.com/applora/agent-skills"
SKILL_DIR="skills/shopify-app-store-market-research"
DEST="${HOME}/.hermes/skills/applora"

echo "Installing Applora's Shopify App Store market research skill into ${DEST} ..."
mkdir -p "$(dirname "${DEST}")"
rm -rf "${DEST}"

TMP_DIR="$(mktemp -d)"
trap 'rm -rf "${TMP_DIR}"' EXIT

git clone --depth 1 "${REPO_URL}" "${TMP_DIR}/agent-skills" >/dev/null 2>&1
cp -R "${TMP_DIR}/agent-skills/${SKILL_DIR}" "${DEST}"

echo "Done. If your Hermes version doesn't auto-discover skills from ~/.hermes/skills/,"
echo "see https://hermes-agent.nousresearch.com/docs/user-guide/features/plugins for where"
echo "your version expects them, and move ${DEST} there."
