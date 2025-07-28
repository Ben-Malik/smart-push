# Hace commit y push de la rama actual en el directorio actual.
# Pide un mensaje de commit
function push_it_sp() {
  local full_user=$(git config --global user.name)
  local user=${full_user%% *}
  local hour=$(date +%H)
  local greeting=""

  if (( 10#$hour < 12 )); then
    greeting="Buenos días"
  elif (( 10#$hour < 18 )); then
    greeting="Buenas tardes"
  else
    greeting="Buenas noches"
  fi

  echo ""
  echo ""
  echo "🌞 $greeting, $user!"
  echo "¿Todo bien? ¡Listo para enviar el código! 🚀"
  echo ""
  echo "               ( ("
  echo "                ) )"
  echo "             .........."
  echo "             |      |)))"
  echo "             \\      /"
  echo "              \\____/ ☕ ¡Te amo, Java!"
  echo ""
  echo ""

  if ! git rev-parse --is-inside-work-tree &>/dev/null; then
    echo "¡Ups! Esta carpeta no es un repositorio Git."
    echo " Échale otro vistazo. ¡Me voy! 🙏"
    echo ""
    echo ""
    return 1
  fi

  local branch=$(git rev-parse --abbrev-ref HEAD)

  if [[ -n $(git status --porcelain) ]]; then
    echo "📝 Escribe tu mensaje de commit:"
    read commit_msg
    echo ""
    echo "📦 Añadiendo y haciendo commit de los cambios..."
    echo ""
    echo ""
    git add .
    git commit -m "$commit_msg"
  else
    echo "✅ No hay cambios para hacer commit. Se omite el commit."
  fi

  if git diff --quiet HEAD origin/"$branch"; then
    echo "📭 Nada que hacer push por ahora 🫠"
  else
    echo "🌍 Haciendo push a origin/$branch..."
    git push origin "$branch"
  fi

  echo ""
  echo ""

  echo "🎉 ¡Eres increíble, $user! ¡El código ha llegado a las nubes! ☁️🚀"
  echo "✨ ¡Sigue así, que nunca te falte la inspiración! ☕ 💻🔥"
  echo ""
  echo ""
  echo "Siempre estoy aquí — para código, motivación o simplemente charlar."
  echo ""
  echo "Pasa cuando quieras — ¡hay té y buena conversación! ☕💬"
  echo ""
  echo ""
}

alias subir='push_it_sp'
