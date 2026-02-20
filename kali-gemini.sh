#!/bin/bash
# 🔥 Kali Gemini Assistant - الإصدار النهائي

# الألوان للتنسيق
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
NC='\033[0m' # No Color

# الشعار
show_banner() {
    clear
    echo -e "${RED}"
    echo "██████  ███████  ██████  █████  ███████ ███████"
    echo "░░██████░░███░░░ ███░░░███░░███  ░░███   ░███   "
    echo " ░███░███░███   ░████ ░░░ ░███   ░███   ░███   "
    echo " ░███░░███░███   ░████████ ░███   ░███   ░███   "
    echo " ░███ ░░██████   ░░░░░░███ ░███   ░███   ░███   "
    echo " ░███  ░░██████  ███████   ░░████████    ░░     "
    echo " ░░░    ░░░░░░  ░░░░░░░     ░░░░░░░░      ░░    "
    echo -e "${NC}"
    echo -e "${GREEN}══════════════════════════════════════════════${NC}"
    echo -e "${YELLOW}     Kali Linux AI Assistant - Gemini Edition${NC}"
    echo -e "${GREEN}══════════════════════════════════════════════${NC}"
    echo ""
}

# القائمة الرئيسية
show_menu() {
    echo -e "${CYAN}══════════════════════════════════════════════${NC}"
    echo -e "${WHITE}            القائمة الرئيسية${NC}"
    echo -e "${CYAN}══════════════════════════════════════════════${NC}"
    echo -e "${YELLOW}1.${NC} 🛡️  أدوات جمع المعلومات (Reconnaissance)"
    echo -e "${YELLOW}2.${NC} 🔍 أدوات فحص الثغرات (Vulnerability Analysis)"
    echo -e "${YELLOW}3.${NC} 💻 أدوات الاستغلال (Exploitation Tools)"
    echo -e "${YELLOW}4.${NC} 🔑 أدوات كسر الشفرات (Password Attacks)"
    echo -e "${YELLOW}5.${NC} 🌐 أدوات الويب (Web Applications)"
    echo -e "${YELLOW}6.${NC} 📡 أدوات الشبكات (Networking Tools)"
    echo -e "${YELLOW}7.${NC} 📝 كتابة سكريبتات مخصصة"
    echo -e "${YELLOW}8.${NC} 💬 محادثة حرة مع Gemini"
    echo -e "${YELLOW}9.${NC} ⚙️  إعدادات متقدمة"
    echo -e "${YELLOW}0.${NC} ❌ خروج"
    echo -e "${CYAN}══════════════════════════════════════════════${NC}"
    echo -n -e "${GREEN}اختر رقم: ${NC}"
}

# أوامر مختصرة مدمجة
run_recon() {
    echo -e "\n${BLUE}🛡️  أدوات جمع المعلومات المتوفرة:${NC}"
    echo "1. Nmap - مسح الشبكة"
    echo "2. Recon-ng - إطار عمل متكامل"
    echo "3. theHarvester - جمع معلومات"
    echo "4. Maltego - تحليل العلاقات"
    echo "5. Shodan - البحث في الأجهزة"
    echo "6. العودة"
    
    read -p "اختر أداة: " tool_choice
    
    case $tool_choice in
        1) 
            echo -e "\n${YELLOW}أمثلة Nmap:${NC}"
            gemini-cli "أعطني 5 أوامر Nmap مهمة مع شرح كل أمر"
            ;;
        2)
            echo -e "\n${YELLOW}شرح Recon-ng:${NC}"
            gemini-cli "كيف أستخدم Recon-ng في Kali؟ أعطني خطوات عملية"
            ;;
        3)
            echo -e "\n${YELLOW}theHarvester:${NC}"
            gemini-cli "أعطني أمثلة عملية لاستخدام theHarvester لجمع معلومات عن موقع"
            ;;
        4)
            echo -e "\n${YELLOW}Maltego:${NC}"
            gemini-cli "ما هي استخدامات Maltego في جمع المعلومات؟"
            ;;
        5)
            echo -e "\n${YELLOW}Shodan:${NC}"
            gemini-cli "كيف أستخدم Shodan في Kali للبحث عن الأجهزة المتصلة؟"
            ;;
        6) return ;;
        *) echo "اختيار غير صحيح" ;;
    esac
}

# سؤال سريع محسن
quick_ask() {
    while true; do
        echo -e "\n${GREEN}📝 اكتب سؤالك (أو أحد الأوامر التالية):${NC}"
        echo -e "${YELLOW}   'رجوع' - العودة للقائمة الرئيسية"
        echo -e "   'save' - حفظ آخر إجابة"
        echo -e "   'copy' - نسخ آخر إجابة للحافظة"
        echo -e "   'run' - تنفيذ أمر مقترح${NC}"
        echo -n -e "\n${CYAN}❯ ${NC}"
        
        read question
        
        # أوامر التحكم
        case $question in
            رجوع|r|back|b)
                break
                ;;
            save)
                if [ -n "$last_answer" ]; then
                    echo "$last_answer" > ~/Kali-Gemini/saved_answers.txt
                    echo -e "${GREEN}✅ تم حفظ الإجابة في ~/Kali-Gemini/saved_answers.txt${NC}"
                else
                    echo -e "${RED}⚠️ لا توجد إجابة للحفظ${NC}"
                fi
                continue
                ;;
            copy)
                if [ -n "$last_answer" ]; then
                    echo "$last_answer" | xclip -selection clipboard 2>/dev/null || \
                    echo "$last_answer" | xsel --clipboard 2>/dev/null
                    echo -e "${GREEN}✅ تم نسخ الإجابة للحافظة${NC}"
                else
                    echo -e "${RED}⚠️ لا توجد إجابة للنسخ${NC}"
                fi
                continue
                ;;
            run)
                if [ -n "$last_command" ]; then
                    echo -e "${YELLOW}🔧 تنفيذ: $last_command${NC}"
                    echo -n "هل أنت متأكد؟ (y/n): "
                    read confirm
                    if [ "$confirm" = "y" ]; then
                        eval "$last_command"
                    fi
                else
                    echo -e "${RED}⚠️ لا يوجد أمر للتنفيذ${NC}"
                fi
                continue
                ;;
        esac
        
        # استخراج الأوامر من الإجابة السابقة (للمساعدة في ميزة run)
        if [ -n "$last_answer" ]; then
            last_command=$(echo "$last_answer" | grep -E '^(nmap|msfconsole|sqlmap|hydra|john|aircrack-ng|wireshark|tcpdump|python|bash|sudo|cd|ls|cat|grep|chmod|./)' | head -1)
        fi
        
        if [ -n "$question" ]; then
            echo -e "\n${YELLOW}🤔 جاري البحث...${NC}\n"
            
            # تخزين الوقت للقياس
            start_time=$(date +%s)
            
            # تنفيذ السؤال مع معالجة أفضل للخطأ
            if answer=$(gemini-cli "$question" 2>&1); then
                echo -e "${GREEN}📢 الإجابة:${NC}\n"
                echo "$answer"
                
                # حفظ الإجابة الأخيرة
                last_answer="$answer"
                
                # حساب وقت الإجابة
                end_time=$(date +%s)
                duration=$((end_time - start_time))
                echo -e "\n${BLUE}⏱️  الوقت: ${duration} ثانية${NC}"
                
                # استخراج أوامر من الإجابة
                commands=$(echo "$answer" | grep -E '^(nmap|msfconsole|sqlmap|hydra|john|aircrack-ng|wireshark|tcpdump|python|bash|sudo|cd|ls|cat|grep|chmod|./)' | head -3)
                if [ -n "$commands" ]; then
                    echo -e "${YELLOW}💻 أوامر مقترحة:${NC}"
                    echo "$commands"
                    echo -e "\n${CYAN}💡 اكتب 'run' لتنفيذ أول أمر${NC}"
                fi
            else
                echo -e "${RED}❌ خطأ:${NC}"
                echo "$answer"
            fi
        fi
    done
}

# إنشاء اختصارات للأدوات
create_shortcuts() {
    echo -e "\n${BLUE}⚡ إنشاء اختصارات سريعة:${NC}"
    
    # اختصار لـ Nmap
    cat > /tmp/gmap.sh << 'EOF'
#!/bin/bash
echo "🔍 مسح Nmap سريع للهدف: $1"
nmap -sV -sC -O "$1"
EOF
    sudo mv /tmp/gmap.sh /usr/local/bin/gmap 2>/dev/null
    sudo chmod +x /usr/local/bin/gmap 2>/dev/null
    
    # اختصار لطلب المساعدة من Gemini
    cat > /tmp/ghelp << 'EOF'
#!/bin/bash
gemini-cli "كيف أستخدم $1 في Kali Linux؟ أعطني أمثلة"
EOF
    sudo mv /tmp/ghelp /usr/local/bin/ghelp 2>/dev/null
    sudo chmod +x /usr/local/bin/ghelp 2>/dev/null
    
    echo -e "${GREEN}✅ تم إنشاء الاختصارات:${NC}"
    echo "   gmap <target>  - مسح Nmap سريع"
    echo "   ghelp <tool>   - شرح أي أداة في Kali"
}

# الحلقة الرئيسية
main() {
    show_banner
    
    # التحقق من Gemini
    if ! command -v gemini-cli &> /dev/null; then
        echo -e "${RED}❌ Gemini-CLI غير مثبت!${NC}"
        echo "قم بتثبيته بـ: sudo apt install gemini-cli"
        exit 1
    fi
    
    while true; do
        show_menu
        read choice
        
        case $choice in
            1) run_recon ;;
            2) 
                echo -e "\n${YELLOW}أدوات فحص الثغرات:${NC}"
                gemini-cli "أهم أدوات فحص الثغرات في Kali Linux مع أمثلة"
                ;;
            3)
                echo -e "\n${YELLOW}أدوات الاستغلال:${NC}"
                gemini-cli "أشهر أدوات الاستغلال في Kali (Metasploit, etc) مع شرح استخدامها"
                ;;
            4)
                echo -e "\n${YELLOW}أدوات كسر الشفرات:${NC}"
                gemini-cli "أدوات كسر كلمات المرور في Kali: John the Ripper, Hashcat, Hydra"
                ;;
            5)
                echo -e "\n${YELLOW}أدوات الويب:${NC}"
                gemini-cli "أدوات اختبار تطبيقات الويب في Kali: Burp Suite, OWASP ZAP, SQLmap"
                ;;
            6)
                echo -e "\n${YELLOW}أدوات الشبكات:${NC}"
                gemini-cli "أدوات تحليل الشبكات في Kali: Wireshark, Tcpdump, Ettercap"
                ;;
            7)
                echo -e "\n${YELLOW}اكتب ما تريد أن يفعله السكريبت:${NC}"
                read script_task
                gemini-cli "اكتب سكريبت Bash أو Python للقيام بالتالي في Kali: $script_task مع شرح كامل"
                ;;
            8) 
                echo -e "\n${GREEN}💬 وضع المحادثة الحرة التفاعلية (اكتب 'exit' للخروج)${NC}"
                echo -e "${YELLOW}ملاحظة: الآن المحادثة تفاعلية بالكامل!${NC}\n"
                gemini-cli -i "ابدأ محادثة تفاعلية عن Kali Linux"
                ;;
            9)
                echo -e "\n${BLUE}⚙️  إعدادات متقدمة:${NC}"
                echo "1. إنشاء اختصارات للأدوات"
                echo "2. تحديث Gemini-CLI"
                echo "3. عرض معلومات النظام"
                read adv_choice
                case $adv_choice in
                    1) create_shortcuts ;;
                    2) sudo apt update && sudo apt upgrade gemini-cli ;;
                    3) 
                        echo "📊 معلومات النظام:"
                        uname -a
                        echo "💾 المساحة:"
                        df -h /
                        ;;
                esac
                ;;
            0) 
                echo -e "\n${GREEN}✅ مع السلامة!${NC}"
                exit 0
                ;;
            *) echo -e "${RED}❌ اختيار غير صحيح${NC}" ;;
        esac
        
        echo -e "\n${YELLOW}اضغط Enter للمتابعة...${NC}"
        read
    done
}

# تشغيل البرنامج
main
