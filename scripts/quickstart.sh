#!/usr/bin/env bash

NVIM_VERSION="0.10.1"
NODEJS_VERSION="20.14.0"
RIPGREP_VERSION="14.1.0"
LAZYGIT_VERSION="0.43.0"

ARCH=$(uname -m)
CURRENT_SHELL=$(basename "$SHELL")
OS_TYPE=$(uname -s)
PKG_DIR="${HOME}/.local"
NVIM_DIR="${HOME}/.config/nvim"

mkdir -p "${PKG_DIR}"/{source,packages,bin}

check_env() {
  echo "Detected CPU architecture: ${ARCH}"
  echo "Detected shell: ${CURRENT_SHELL}"
  echo "Detected OS: ${OS_TYPE}"

  case "$CURRENT_SHELL" in
  bash)
    PROFILE_FILE="${HOME}/.bashrc"
    ;;
  zsh)
    PROFILE_FILE="${HOME}/.zshrc"
    ;;
  *)
    echo "Unsupported shell: $CURRENT_SHELL"
    exit 1
    ;;
  esac

  if [[ "$OS_TYPE" == "Linux" && "$ARCH" == "x86_64" ]]; then
    NVIM_NAME="nvim-linux64"
    PIPGREP_NAME="ripgrep-${RIPGREP_VERSION}-${ARCH}-unknown-linux-musl"
    LAZYGIT_NAME="lazygit_${LAZYGIT_VERSION}_${OS_TYPE}_32-bit"
  elif [[ "$OS_TYPE" == "Darwin" && "$ARCH" == "x86_64" ]]; then
    NVIM_NAME="nvim-macos-${ARCH}"
    PIPGREP_NAME="ripgrep-${RIPGREP_VERSION}-${ARCH}-apple-darwin"
    LAZYGIT_NAME="lazygit_${LAZYGIT_VERSION}_${OS_TYPE}_${ARCH}"
  elif [[ "$OS_TYPE" == "Darwin" && "$ARCH" == "arm64" ]]; then
    NVIM_NAME="nvim-macos-${ARCH}"
    PIPGREP_NAME="ripgrep-${RIPGREP_VERSION}-aarch64-apple-darwin"
    LAZYGIT_NAME="lazygit_${LAZYGIT_VERSION}_${OS_TYPE}_${ARCH}"
  fi
}

install_node() {
  local version="${1}"
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
  export NVM_DIR="${HOME}/.nvm" && source "${NVM_DIR}/nvm.sh"
  nvm install "${version}"
}

install_nvim() {
  local name="${NVIM_NAME}"
  local version="v${NVIM_VERSION}"
  local github="https://github.com/neovim/neovim"
  local source_file="${PKG_DIR}/source/${name}.tar.gz"
  local package_path="${PKG_DIR}/packages/${name}_${version}"
  [ ! -d "$package_path" ] && mkdir -p "$package_path"

  curl -sLo "${source_file}" "${github}/releases/download/${version}/${name}.tar.gz"
  tar zxf "${source_file}" -C "${package_path}"
  [ ! -d "${PKG_DIR}/nvim" ] && ln -s "${package_path}/${name}" "${PKG_DIR}/nvim"

  if ! grep -q "${PKG_DIR}/nvim" <<<"$PATH"; then
    echo "export PATH=\$PATH:${PKG_DIR}/nvim/bin" >>"$PROFILE_FILE"
    echo "Binary path \"${PKG_DIR}/nvim\" added to \$PATH."
  else
    echo "Binary path \"${PKG_DIR}/nvim\" already exists in \$PATH."
  fi
}

install_ripgrep() {
  local name="${PIPGREP_NAME}"
  local version="${RIPGREP_VERSION}"
  local github="https://github.com/BurntSushi/ripgrep"
  local source_file="${PKG_DIR}/source/${name}.tar.gz"
  local package_path="${PKG_DIR}/packages/${name}_${version}"
  [ ! -d "$package_path" ] && mkdir -p "$package_path"

  curl -sLo "${source_file}" "${github}/releases/download/${version}/${name}.tar.gz"
  tar zxf "${source_file}" -C "${package_path}"
  ln -sf "${package_path}/${name}/rg" "${PKG_DIR}/bin/rg"
}

install_lazygit() {
  local name="${LAZYGIT_NAME}"
  local version="v${LAZYGIT_VERSION}"
  local github="https://github.com/jesseduffield/lazygit"
  local source_file="${PKG_DIR}/source/${name}.tar.gz"
  local package_path="${PKG_DIR}/packages/${name}_${version}"
  [ ! -d "$package_path" ] && mkdir -p "$package_path"

  curl -sLo "${source_file}" "${github}/releases/download/${version}/${name}.tar.gz"
  tar zxf "${source_file}" -C "${package_path}"
  ln -sf "${package_path}/lazygit" "${PKG_DIR}/bin/lazygit"
}

############
### Main ###
############

check_env
command -v node >/dev/null 2>&1 || install_node "$NODEJS_VERSION"
command -v nvim >/dev/null 2>&1 || install_nvim
command -v rg >/dev/null 2>&1 || install_ripgrep
command -v lazygit >/dev/null 2>&1 || install_lazygit

if ! grep -q "${PKG_DIR}/bin" <<<"$PATH"; then
  echo "export PATH=\$PATH:${PKG_DIR}/bin" >>"$PROFILE_FILE"
  echo "Binary path \"${PKG_DIR}/bin\" added to \$PATH."
else
  echo "Binary path \"${PKG_DIR}/bin\" already exists in \$PATH."
fi

if [ -d "$NVIM_DIR" ]; then
  mv "$NVIM_DIR" "${NVIM_DIR}.bk$(date +"%Y%m%d-%H%M%S")" && git clone https://github.com/genecywang/nvim-setup.git "$NVIM_DIR"
else
  git clone https://github.com/genecywang/nvim-setup.git "$NVIM_DIR"
fi
