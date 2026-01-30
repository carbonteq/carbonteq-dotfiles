set -Eeuo pipefail
trap 'echo -e "\n❌ ERROR: Command failed at line $LINENO"; exit 1' ERR

log()   { echo -e "\n🔹 \033[1;34m$1\033[0m"; }
ok()    { echo -e "✅ \033[1;32m$1\033[0m"; }
warn()  { echo -e "⚠️  \033[1;33m$1\033[0m"; }
# Bold Yellow for skipping
skip()  { echo -e "⏭️  \033[1;33m$1 already installed, skipping...\033[0m"; }

command_exists() { command -v "$1" >/dev/null 2>&1; }