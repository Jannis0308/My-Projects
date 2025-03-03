function node() {
    cd "/node"
}
function csharp() {
    cd "/csharp"
}

function java() {
    cd "$REPL_HOME/java"
}

function python() {
    cd "$REPL_HOME/python"
}

function html() {
    cd "$REPL_HOME/html"
}

function cpp() {
    cd "$REPL_HOME/cpp"
}
function go() {
    cd "$REPL_HOME/go"
}

function ruby() {
    cd "$REPL_HOME/ruby"
}

function rust() {
    cd "$REPL_HOME/rust"
}

function php() {
    cd "$REPL_HOME/php"
}
function javascript {
    cd "$REPL_HOME/javascript"
}
function webseiten() {
    cd "$REPL_HOME/webseiten"
}
function chatbot() {
    cd "$REPL_HOME/python/python-chatbot"
}
function http-server() {
    cd "$REPL_HOME/python/http-server"
}
function http-server-tetris() {
    cd "$REPL_HOME/python/http-server/tetris"
}
function http-server-webseite() {
    cd "$REPL_HOME/python/http-server/webseite"
}
function webseiten-test() {
    cd "$REPL_HOME/javascript/webseiten-test"
}
function run-webseiten-test() {
    cd "$REPL_HOME/javascript/webseiten-test"
    run server.js
}
function meine-erste-webseite-mit-gpt() {
    cd "$REPL_HOME/python/http-server/meine-erste-webseite-mit-gpt"
}
function run-meine-erste-webseite-mit-gpt() {
    cd "$REPL_HOME/python/http-server/meine-erste-webseite-hilfe"
    run server.py
}
function meine-erste-webseite() {
    cd "$REPL_HOME/python/http-server/meine-erste-webseite"
}
function run-meine-erste-webseite() {
    cd "$REPL_HOME/python/http-server/meine-erste-webseite"
    run server.py
}
function candy-crusch() {
    cd "$REPL_HOME/python/http-server/candy-crusch"
}
function run-candy-crusch() {
    cd "$REPL_HOME/python/http-server/candy-crusch"
    run server.py
}
function rechner() {
    cd "$REPL_HOME/cpp/rechner"
    run rechner.cpp
}
function run() {
    local script_name=$1
    if [ -z "$script_name" ]; then
        echo "Bitte gib den Namen des Skripts an, das du ausführen möchtest."
        return 1
    fi

    # Extrahiere die Dateierweiterung
    extension="${script_name##*.}"

    case $extension in
        py)
            echo "Python-Skript wird ausgeführt..."
            python3 "$script_name"
            ;;
        js)
            echo "Node.js-Skript wird ausgeführt..."
            node "$script_name"
            ;;
        java)
            echo "Java-Skript wird kompiliert und ausgeführt..."
            javac "$script_name" && java "${script_name%.*}"
            ;;
        cpp)
            echo "C++-Skript wird kompiliert und ausgeführt..."
            g++ "$script_name" -o output && ./output
            ;;
        c)
            echo "C-Skript wird kompiliert und ausgeführt..."
            gcc "$script_name" -o output && ./output
            ;;
        rb)
            echo "Ruby-Skript wird ausgeführt..."
            ruby "$script_name"
            ;;
        sh)
            echo "Shell-Skript wird ausgeführt..."
            bash "$script_name"
            ;;
        php)
            echo "PHP-Skript wird ausgeführt..."
            php "$script_name"
            ;;
        pl)
            echo "Perl-Skript wird ausgeführt..."
            perl "$script_name"
            ;;
        go)
            echo "Go-Skript wird ausgeführt..."
            go run "$script_name"
            ;;
        rs)
            echo "Rust-Skript wird kompiliert und ausgeführt..."
            rustc "$script_name" && ./"${script_name%.*}"
            ;;
        *)
            echo "Unbekannter Dateityp: $extension"
            echo "Unterstützte Dateitypen sind: py, js, java, cpp, c, rb, sh, php, pl, go, rs"
            return 1
            ;;
    esac
}
function create() {
  local name=$1
  if [ -z "$name" ]; then
    echo "Bitte gib einen Dateinamen ein."
    return 1
  fi
  mkdir "$name"
  echo "Verzeichnis '$name' wurde erstellt."
}
function delete() {
  local item_name=$1
  if [ -z "$item_name" ]; then
    echo "Bitte gib den Namen des Verzeichnisses oder der Datei ein, die du löschen möchtest."
    return 1
  fi

  if [ -d "$item_name" ]; then
    # If it's a directory
    rmdir "$item_name"
    echo "Verzeichnis '$item_name' wurde gelöscht."
  elif [ -f "$item_name" ]; then
    # If it's a file
    rm "$item_name"
    echo "Datei '$item_name' wurde gelöscht."
  else
    echo "Der angegebene Name '$item_name' ist weder ein Verzeichnis noch eine Datei."
  fi
}
function duplicate() {
  local source=$1
  local destination=$2
  if [ -z "$source" ] || [ -z "$destination" ]; then
    echo "Bitte gib den Namen der Quelle und des Ziels an."
    return 1
  fi
  if [ -d "$source" ]; then
    # If source is a directory
    cp -r "$source" "$destination"
    echo "Verzeichnis '$source' wurde nach '$destination' kopiert."
  elif [ -f "$source" ]; then
    # If source is a file
    cp "$source" "$destination"
    echo "Datei '$source' wurde nach '$destination' kopiert."
  else
    echo "Der angegebene Name '$source' ist weder ein Verzeichnis noch eine Datei."
  fi
}