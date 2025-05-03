# 🤖 Facebook Signup Automation Test Suite

Welcome to the **Facebook Signup Test Suite**!  
This project automates the Facebook registration process using **Robot Framework** and **SeleniumLibrary**, focusing on testing **mobile number** and **password** validations. 📱🔐

---

## 📁 Project Structure

```
.
├── facebook_signup_tests.robot    # Main test suite with test cases and keywords
├── final_resource.robot           # Resource file with reusable keywords and settings
└── README.md                      # You're reading it!
```

- `facebook_signup_tests.robot` — Main test suite containing test cases and keyword usage  
- `final_resource.robot` — Keyword library for reuse across test cases  
- `README.md` — Documentation file you're reading now

---

## 🛠️ Requirements

- 🐍 Python 3.13  
- 📦 Robot Framework  
- 🌐 SeleniumLibrary  
- 🧪 Chrome WebDriver

Install dependencies:

```bash
pip install robotframework selenium
```

Make sure `chromedriver` is in your system PATH.

---

## 🚀 How to Run

```bash
robot facebook_signup_tests.robot
```

The browser will launch in **Incognito Mode** and simulate Facebook sign-up scenarios.

---

## 🔍 Test Categories

### 📲 Mobile Number Validation

Validates various Philippine mobile number formats:

| ✅ Valid Examples     | ❌ Other Examples                      |
|----------------------|------------------------------------------|
| `+639162856862`      | Too short: `0916`                        |
| `09162856862`        | Missing prefix: `9162856862`             |
| `+63 916 285 6862`   | With letters: `09AB2856862`              |
| `+63-916-285-6862`   | With symbols: `0916-!@#-6862`            |
|                      | Invalid prefix: `08162856862`           |
|                      | Blank field                              |

---

### 🔑 Password Validation

Tests password strength based on Facebook's rules:

| ✅ Strong Example | ❌ Weak Examples                      |
|------------------|----------------------------------------|
| `Paolo095!`      | Too short: `aB1@`                      |
|                  | Letters only: `abcdef`                |
|                  | Numbers only: `123456`                |
|                  | Common combos: `abc123`               |
|                  | Blank field                           |

---

## 🧠 Test Design Overview

- 📌 **Dynamic Validations**  
  Keywords like:  
  - `If the number is valid...`  
  - `If password meets requirements...`  
  These check whether the next page appears or an error message pops up.

- 🧱 **Reusable Keywords**  
  Keywords are modular and human-readable (e.g., `Enter name`, `Choose male gender`, `Click sign up`).

- ⌛ **Wait Mechanisms**  
  `Sleep` is used for transitions. You can improve reliability by using element-based waits later.

---

## ⚙️ Sample Test Scenario (Mobile Number)

```robot
When I Sign Up for a new Facebook account using a standard Philippine mobile number
    Given I'm on the Facebook signup page
    And I've entered a valid input for credentials
    When I type "09162856862" as my mobile number
    And I click sign up
    Then If the number is valid I should see the mobile confirmation page otherwise I should see a pop-up message "Please enter a valid mobile number or email address"
```

---

## ⚠️ Notes

- Facebook may throttle sign-up attempts using real numbers due to **spam filters**.  
- For password tests, consider using **email instead of mobile number** to avoid blocks.  
- Adjust `Sleep` durations or use smarter **explicit waits** as needed.

---

## 🙋 Author

Crafted with ❤️ for learning, testing, and automating real-world form validations.  
Feel free to fork or reuse this for educational and QA purposes.
