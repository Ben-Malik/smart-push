// Commits and pushes the current branch at the current directory. 
// Asks for a commit message
function yolla_gitsin() {
  local full_user=$(git config --global user.name)
  local user=${full_user%% *}
  local hour=$(date +%H)
  local greeting=""

  if (( 10#$hour < 12 )); then
    greeting="Günaydın"
  elif (( 10#$hour < 18 )); then
    greeting="Tünaydın"
  else
    greeting="İyi akşamlar"
  fi

  echo ""
  echo ""
  echo "🌞 $greeting, $user!"
  echo "İyi misin? Hazırsan kodları yollayalım! 🚀"
  echo ""
  echo "               ( ("
  echo "                ) )"
  echo "             .........."
  echo "             |      |)))"
  echo "             \\      /"
  echo "              \\____/ ☕ Çok seviyorum seni, Java!"
  echo ""
  echo ""

  if ! git rev-parse --is-inside-work-tree &>/dev/null; then
    echo "Nope!! Bu klasör bir Git deposu değil ki ama."
    echo " Bi daha bak istersen. Hadi kaçtım ben 🙏"  
    echo ""
    echo "" 
    return 1
  fi

  local branch=$(git rev-parse --abbrev-ref HEAD)

  if [[ -n $(git status --porcelain) ]]; then
    echo "📝 Commit mesajını gir:"
    read commit_msg
    echo ""
    echo "📦 Değişiklikler ekleniyor ve commitleniyor..."
    echo ""
    echo "" 
    git add .
    git commit -m "$commit_msg"
  else
    echo "✅ Değişiklik yok. Commit atlanıyor."
  fi

  if git diff --quiet HEAD origin/"$branch"; then
    echo "📭 Şu anda push edilecek bir şey yok gibi 🫠"
  else
    echo "🌍 origin/$branch dalına push yapılıyor..."
    git push origin "$branch"
  fi

  echo ""
  echo ""

  echo "🎉 Harikasın $user! Kodlar gökyüzüne ulaştı! ☁️🚀"
  echo "✨ Devam et, ilhamın hiç bitmesin! ☕ 💻🔥"
  echo ""
  echo ""
  echo "Her zaman buradayım, ister kod, ister motivasyon, ister sadece iki lafın belini kırmak için."
  echo ""
  echo "Ne zaman istersen uğra — çay da var, sohbet de! ☕💬"
  echo ""
  echo "" 
}

alias yolla='yolla_gitsin'
alias gidekmi='yolla_gitsin'
alias gitamk='yolla_gitsin'
alias gitiste='yolla_gitsin'
alias yollaaa='yolla_gitsin'
