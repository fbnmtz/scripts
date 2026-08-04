#!/bin/bash

# Garante que a pasta pictures exista antes de mover as screenshots para dentro dela
mkdir -p "$HOME/pictures"

# Função para mover/renomear de forma segura
ajustar_pasta() {
    local antiga="$1"
    local nova="$2"

    if [ -d "$HOME/$antiga" ]; then
        echo "Movendo/Renomeando: $antiga -> $nova"
        mv "$HOME/$antiga" "$HOME/$nova"
    else
        echo "Criando pasta nova: $nova"
        mkdir -p "$HOME/$nova"
    fi
}

# Lista de mapeamento: "Nome Antigo" "Nome Novo"
ajustar_pasta "Área de trabalho" "desktop"
ajustar_pasta "Área de Trabalho" "desktop" # Garante caso o "T" estivesse maiúsculo
ajustar_pasta "Downloads"         "downloads"
ajustar_pasta "Modelos"           "templates"
ajustar_pasta "Público"           "public"
ajustar_pasta "Documentos"        "documents"
ajustar_pasta "Músicas"           "music"
ajustar_pasta "Imagens"           "pictures"
ajustar_pasta "Vídeos"            "videos"
ajustar_pasta "Projetos"          "projects"
ajustar_pasta "Screenshots"       "pictures/screenshots"

# Atualiza o sistema com as novas configurações do XDG
echo "Atualizando diretórios do XDG..."
xdg-user-dirs-update

echo "Pronto! Tudo organizado."