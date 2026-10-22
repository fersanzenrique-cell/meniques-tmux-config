# ── tmux ─────────────────────────────────────────────────────────

# Muestra qué cambia ~/.tmux.conf respecto a los valores por defecto
tmux-cambios() (
  export TMUX_CAMBIOS=1   # evita que se carguen los plugins en los servidores temporales

  dump() {
    local sock=$1; shift
    tmux -L "$sock" "$@" new-session -d -s x \; \
      show-options -s \; show-options -g \; show-options -gw \; list-keys 2>/dev/null | sort
    tmux -L "$sock" kill-server 2>/dev/null
  }

  def=$(mktemp); cur=$(mktemp)
  dump tmux-defaults -f /dev/null > "$def"
  dump tmux-current  -f "$HOME/.tmux.conf" > "$cur"

  echo "Opciones y atajos CAMBIADOS o AÑADIDOS:"
  comm -13 "$def" "$cur" | sed 's/^/  + /'
  echo
  echo "Atajos o valores por defecto ELIMINADOS o sustituidos:"
  comm -23 "$def" "$cur" | sed 's/^/  - /'

  rm -f "$def" "$cur"
)

# Abre o crea una sesión: tm [nombre]  (por defecto "main")
tm() {
  local name="${1:-main}"

  # Instala TPM la primera vez
  if [ ! -d "$HOME/.tmux/plugins/tpm" ] && command -v git >/dev/null; then
    echo "Instalando TPM..."
    git clone --depth 1 https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm" \
      && "$HOME/.tmux/plugins/tpm/bin/install_plugins"
  fi

  # Si ya estás dentro de tmux, cambia de sesión en vez de anidar
  if [ -n "$TMUX" ]; then
    tmux has-session -t "=$name" 2>/dev/null || tmux new-session -d -s "$name"
    tmux switch-client -t "=$name"
    return
  fi

  # Si el servidor no estaba arrancado, enseña los cambios de configuración
  if ! tmux has-session 2>/dev/null; then
    echo "── Cambios de ~/.tmux.conf respecto a los valores por defecto ──"
    tmux-cambios
    echo "─────────────────────────────────────────────────────────────────"
  fi

  tmux new-session -A -s "$name"
}
