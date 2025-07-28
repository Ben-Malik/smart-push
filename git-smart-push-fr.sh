# Fait un commit et pousse la branche actuelle dans le répertoire courant.
# Demande un message de commit
function push_it() {
  local full_user=$(git config --global user.name)
  local user=${full_user%% *}
  local hour=$(date +%H)
  local greeting=""

  if (( 10#$hour < 12 )); then
    greeting="Bonjour"
  elif (( 10#$hour < 18 )); then
    greeting="Bon après-midi"
  else
    greeting="Bonsoir"
  fi

  echo ""
  echo ""
  echo "🌞 $greeting, $user !"
  echo "J’espère que tu vas bien ! Prêt à envoyer le code ? 🚀"
  echo ""
  echo "               ( ("
  echo "                ) )"
  echo "             .........."
  echo "             |      |)))"
  echo "             \\      /"
  echo "              \\____/ ☕ Je t’aime, Java !"
  echo ""
  echo ""

  if ! git rev-parse --is-inside-work-tree &>/dev/null; then
    echo "Nope !! Ce dossier n’est pas un dépôt Git."
    echo " Vérifie encore une fois. Je file 🙏"  
    echo ""
    echo "" 
    return 1
  fi

  local branch=$(git rev-parse --abbrev-ref HEAD)

  if [[ -n $(git status --porcelain) ]]; then
    echo "📝 Entre ton message de commit :"
    read commit_msg
    echo ""
    echo "📦 Ajout et commit des modifications..."
    echo ""
    echo "" 
    git add .
    git commit -m "$commit_msg"
  else
    echo "✅ Aucun changement à commit. Commit ignoré."
  fi

  if git diff --quiet HEAD origin/"$branch"; then
    echo "📭 Rien à pousser pour le moment 🫠"
  else
    echo "🌍 Poussée vers origin/$branch en cours..."
    git push origin "$branch"
  fi

  echo ""
  echo ""

  echo "🎉 Tu es génial, $user ! Le code est dans les nuages ! ☁️🚀"
  echo "✨ Continue comme ça, que ton inspiration ne s’épuise jamais ! ☕ 💻🔥"
  echo ""
  echo ""
  echo "Je suis toujours là — pour du code, de la motivation ou juste discuter."
  echo ""
  echo "Passe quand tu veux — il y a du thé et de la conversation ! ☕💬"
  echo ""
  echo "" 
}

alias Vas-y='push_it'
