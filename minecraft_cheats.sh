#!/usr/bin/env bash
# minecraft_cheats.sh — «читы для майнкрафта» :)
# На деле — шоу XAN DILL3R с тихим выключением в финале.

IMG="$HOME/Pictures/scary.png"

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

# --- 0. Картинка-скример (если есть) ---
show_image() {
    if [ -f "$IMG" ] && command -v chafa >/dev/null 2>&1; then
        clear
        chafa --fill "$IMG"
        sleep 1
        clear
    elif [ -f "$IMG" ] && command -v eog >/dev/null 2>&1; then
        eog --fullscreen "$IMG" & sleep 1; kill %1 2>/dev/null
    fi
}

# --- 1. Мини-баннер XAN DILL3R ---
xan_banner() {
    clear
    local art='X  A  N     D  I  L  L  3  R'
    local colors=("\033[1;31m" "\033[1;33m" "\033[1;32m" "\033[1;36m" "\033[1;35m" "\033[1;37m")
    local round c
    for round in {0..3}; do
        c=${colors[round]}
        clear
        echo ""
        echo -e "$c        $art$NC"
        echo -e "\033[1;37m     >>> ACCESS GRANTED :: ROOT SHELL :: XAN DILL3R <<<\033[0m"
        sleep 0.08
    done
    echo -e "\033[0;32m[+] CONNECTION ESTABLISHED. HACKING IN PROGRESS...\033[0m"
    sleep 0.5
}

# --- 2. Матричный дождь ---
matrix_rain() {
    local chars="0123456789ABCDEF"
    local cols
    cols=$(tput cols)
    local lines
    lines=$(tput lines)
    local drops=()
    local i t row
    for ((i=0; i<cols; i++)); do drops[$i]=$((RANDOM % lines)); done
    for ((t=0; t<27; t++)); do
        for ((i=0; i<cols; i++)); do
            row=${drops[$i]}
            if [ $row -lt $lines ]; then
                printf "\033[%s;%sH${GREEN}%s${NC}" "$row" "$i" "${chars:RANDOM%16:1}"
            fi
            if [ $((RANDOM % 4)) -eq 0 ]; then
                drops[$i]=$(((row + 1) % lines))
            fi
        done
        sleep 0.01
    done
    clear
}

# --- 3. «Логи взлома» ---
fake_logs() {
    echo -e "${CYAN}[*] Bypassing firewall... done (it had the default password, lol)${NC}"
    sleep 0.2
    echo -e "${CYAN}[*] Elevating privileges... root acquired. Nice security btw.${NC}"
    sleep 0.2

    local files=("/etc/passwd" "/etc/shadow" "$HOME/.bashrc" "$HOME/.ssh/id_rsa" "$HOME/.gnupg" "$HOME/.config/google-chrome/Default/Login Data" "/var/log/secure")
    local actions=("EXFILTRATING" "DECRYPTING" "DUMPING" "HIJACKING" "CRACKING" "SNIFFING")
    local comments=("easy." "no encryption? seriously?" "lol plaintext" "weak hash detected" "this one was fun" "too easy, try harder")
    local f a c size p b
    for f in "${files[@]}"; do
        a=${actions[RANDOM % 6]}
        c=${comments[RANDOM % 6]}
        size=$((RANDOM % 9000 + 500))
        echo -e "${RED}[!] ${a} ${NC}${YELLOW}${f}${NC} ${RED}... ${size}KB OK -- ${c}${NC}"
        sleep "0.0$((RANDOM % 3 + 1))"
        for ((p=0; p<=100; p+=20)); do
            printf "\r    ${CYAN}["
            for ((b=0; b<10; b++)); do
                if [ $b -lt $((p/10)) ]; then printf "█"; else printf "░"; fi
            done
            printf "] %s%%${NC}   " "$p"
            sleep 0.03
        done
        echo ""
    done
}

# --- 4. «Сбор паролей» ---
fake_passwords() {
    echo -e "${RED}[+] DUMPING CREDENTIALS...${NC}"
    sleep 0.22
    local i pass
    for i in {1..15}; do
        pass=$(tr -dc 'A-Za-z0-9' < /dev/urandom | head -c 12)
        echo -e "    ${YELLOW}user_$((RANDOM % 50))${NC}${RED} : $pass : 91.$((RANDOM % 255)).$((RANDOM % 255)).$((RANDOM % 255))${NC}"
        sleep 0.03
    done
    echo ""
    echo -e "${RED}[+] ALL DATA SENT TO XAN DILL3R C2 SERVER (0xDEADBEEF)${NC}"
    sleep 0.35
}

# --- 5. Глитч перед финалом ---
glitch() {
    local t r
    for t in {1..13}; do
        for r in {1..8}; do
            printf "\033[4%s;9%sm %s \033[0m" "$((RANDOM % 2))" "$((RANDOM % 8))" "$(printf '%*s' $((RANDOM % 20 + 5)) '')"
        done
        printf "\n"
        sleep 0.01
    done
    sleep 0.1
}

# --- 6. Насмешливый ASCII перед выключением ---
final_taunt() {
    clear
    cat << 'EOF'

        _
      _( )_
     ( o.o)
      > ^ <

    LOL. GOTCHA.
    SYSTEM POWERING OFF...

EOF
    sleep 1.2
}

# --- 7. Тихое выключение ---
real_shutdown() {
    sleep 0.3
    sudo systemctl poweroff -i
}

# --- Порядок «атаки» ---
show_image
xan_banner
matrix_rain
fake_logs
fake_passwords
glitch
final_taunt
real_shutdown

