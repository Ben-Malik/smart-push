# Faz commit e push do branch atual no diretório atual.
# Solicita uma mensagem de commit
function push_it_pt() {
  local full_user=$(git config --global user.name)
  local user=${full_user%% *}
  local hour=$(date +%H)
  local greeting=""

  if (( 10#$hour < 12 )); then
    greeting="Bom dia"
  elif (( 10#$hour < 18 )); then
    greeting="Boa tarde"
  else
    greeting="Boa noite"
  fi

  echo ""
  echo ""
  echo "🌞 $greeting, $user!"
  echo "Tudo certo? Pronto para enviar o código? 🚀"
  echo ""
  echo "               ( ("
  echo "                ) )"
  echo "             .........."
  echo "             |      |)))"
  echo "             \\      /"
  echo "              \\____/ ☕ Eu te amo, Java!"
  echo ""
  echo ""

  if ! git rev-parse --is-inside-work-tree &>/dev/null; then
    echo "Ops! Esta pasta não é um repositório Git."
    echo " Dá uma olhada de novo. Tô indo 🙏"
    echo ""
    echo ""
    return 1
  fi

  local branch=$(git rev-parse --abbrev-ref HEAD)

  if [[ -n $(git status --porcelain) ]]; then
    echo "📝 Digite sua mensagem de commit:"
    read commit_msg
    echo ""
    echo "📦 Adicionando e fazendo commit das alterações..."
    echo ""
    echo ""
    git add .
    git commit -m "$commit_msg"
  else
    echo "✅ Nenhuma alteração para commit. Pulando o commit."
  fi

  if git diff --quiet HEAD origin/"$branch"; then
    echo "📭 Nada para fazer push no momento 🫠"
  else
    echo "🌍 Fazendo push para origin/$branch..."
    git push origin "$branch"
  fi

  echo ""
  echo ""

  echo "🎉 Você é incrível, $user! O código chegou às nuvens! ☁️🚀"
  echo "✨ Continue assim, que nunca falte inspiração! ☕ 💻🔥"
  echo ""
  echo ""
  echo "Tô sempre por aqui — pra código, motivação ou só bater um papo."
  echo ""
  echo "Passa aqui quando quiser — tem chá e conversa boa! ☕💬"
  echo ""
  echo ""
}

alias enviar='push_it_pt'