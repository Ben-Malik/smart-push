# Commit en push de huidige branch in de huidige directory.
# Vraagt om een commitbericht
function push_it() {
  local full_user=$(git config --global user.name)
  local user=${full_user%% *}
  local hour=$(date +%H)
  local greeting=""

  if (( 10#$hour < 12 )); then
    greeting="Goedemorgen"
  elif (( 10#$hour < 18 )); then
    greeting="Goedemiddag"
  else
    greeting="Goedenavond"
  fi

  echo ""
  echo ""
  echo "🌞 $greeting, $user!"
  echo "Alles goed? Klaar om de code te versturen? 🚀"
  echo ""
  echo "               ( ("
  echo "                ) )"
  echo "             .........."
  echo "             |      |)))"
  echo "             \\      /"
  echo "              \\____/ ☕ Ik hou van je, Java!"
  echo ""
  echo ""

  if ! git rev-parse --is-inside-work-tree &>/dev/null; then
    echo "Nope!! Deze map is geen Git-repository."
    echo " Kijk nog eens goed. Ik ben weg 🙏"  
    echo ""
    echo "" 
    return 1
  fi

  local branch=$(git rev-parse --abbrev-ref HEAD)

  if [[ -n $(git status --porcelain) ]]; then
    echo "📝 Voer je commitbericht in:"
    read commit_msg
    echo ""
    echo "📦 Wijzigingen worden gestaged en gecommit..."
    echo ""
    echo "" 
    git add .
    git commit -m "$commit_msg"
  else
    echo "✅ Geen wijzigingen om te committen. Commit wordt overgeslagen."
  fi

  if git diff --quiet HEAD origin/"$branch"; then
    echo "📭 Niets om te pushen op dit moment 🫠"
  else
    echo "🌍 Pushen naar origin/$branch..."
    git push origin "$branch"
  fi

  echo ""
  echo ""

  echo "🎉 Je bent geweldig, $user! De code is naar de wolken gestuurd! ☁️🚀"
  echo "✨ Ga zo door, laat je inspiratie nooit opdrogen! ☕ 💻🔥"
  echo ""
  echo ""
  echo "Ik ben er altijd — voor code, motivatie of gewoon een praatje."
  echo ""
  echo "Kom gerust langs — er is thee en een goed gesprek! ☕💬"
  echo ""
  echo "" 
}

alias ga_maar='push_it'
