# VSCode extensions list

extensions=(
    "biomejs.biome"
    "bradlc.vscode-tailwindcss"
    "catppuccin.catppuccin-vsc-icons"
    "christian-kohler.npm-intellisense"
    "dbaeumer.vscode-eslint"
    "enkia.tokyo-night"
    "github.copilot"
    "github.copilot-chat"
    "naumovs.color-highlight"
    "oven.bun-vscode"
    "yoavbls.pretty-ts-errors"
    "yzhang.markdown-all-in-one"
)

for extension in "${extensions[@]}"; do
	code --install-extension "${extension}"
done
