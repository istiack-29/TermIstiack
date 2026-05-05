#!/usr/bin/env python3
import requests
import sys

def check_connection():
    url = "http://www.google.com"
    timeout = 5
    
    # আপনার থিমের সাথে মিল রেখে ইন্টারফেসের আউটপুট
    print("\n\033[1;33m       Checking Network Connection...\033[0m")
    
    try:
        # রিকোয়েস্ট পাঠানো হচ্ছে
        request = requests.get(url, timeout=timeout)
        # কানেকশন থাকলে এই মেসেজটি দেখাবে
        print("         \033[1;42m ⚡ Connected To Internet ⚡ \033[0m")
        print("         \033[1;32m   Welcome back, Istiack!\033[0m\n")
        
    except (requests.ConnectionError, requests.Timeout):
        # কানেকশন না থাকলে এই মেসেজটি দেখাবে
        print("         \033[1;41m 🌦 Unable To Connect 🌦 \033[0m")
        print("         \033[1;31m  Please check your data/wifi!\033[0m\n")
        sys.exit()

if __name__ == "__main__":
    check_connection()