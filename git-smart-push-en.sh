# Commits and pushes the current branch at the current directory. 
# Asks for a commit message
function push_it() {
  local full_user=$(git config --global user.name)
  local user=${full_user%% *}
  local hour=$(date +%H)
  local greeting=""

  if (( 10#$hour < 12 )); then
    greeting="Good morning"
  elif (( 10#$hour < 18 )); then
    greeting="Good afternoon"
  else
    greeting="Good evening"
  fi

  echo ""
  echo ""
  echo "🌞 $greeting, $user!"
  echo "Hope you're doing well! Ready to send the code? 🚀"
  echo ""
  echo "               ( ("
  echo "                ) )"
  echo "             .........."
  echo "             |      |)))"
  echo "             \\      /"
  echo "              \\____/ ☕ I love you, Java!"
  echo ""
  echo ""

  if ! git rev-parse --is-inside-work-tree &>/dev/null; then
    echo "Nope!! This folder is not a Git repository."
    echo " Maybe check again. I'm out 🙏"  
    echo ""
    echo "" 
    return 1
  fi

  local branch=$(git rev-parse --abbrev-ref HEAD)

  if [[ -n $(git status --porcelain) ]]; then
    echo "📝 Enter your commit message:"
    read commit_msg
    echo ""
    echo "📦 Staging and committing changes..."
    echo ""
    echo "" 
    git add .
    git commit -m "$commit_msg"
  else
    echo "✅ No changes to commit. Skipping commit."
  fi

  if git diff --quiet HEAD origin/"$branch"; then
    echo "📭 Nothing to push right now 🫠"
  else
    echo "🌍 Pushing to origin/$branch..."
    git push origin "$branch"
  fi

  echo ""
  echo ""

  echo "🎉 You're awesome, $user! Code has reached the sky! ☁️🚀"
  echo "✨ Keep going, may your inspiration never run dry! ☕ 💻🔥"
  echo ""
  echo ""
  echo "I'm always here — for code, motivation, or just a chat."
  echo ""
  echo "Drop by anytime — there's tea and talk! ☕💬"
  echo ""
  echo "" 
}

alias yolla='push_it'
