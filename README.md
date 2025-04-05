# 🚀 Facebook Sign-Up Test Automation

## 🔍 Overview

This repository provides automated test cases for validating Facebook’s **Sign-Up** page, focusing on the **Mobile Number** and **Password** fields. The tests are built using **Robot Framework** and **SeleniumLibrary**.

---

## 📝 Instructions

### 📱 1. Mobile Number Test Case

Validate the **Mobile Number** input field by testing various valid and invalid formats. Scenarios include:

- Proper input formatting  
- Edge cases  
- Expected error messages

### 🔑 2. Password Test Case

Validate the **Password** field against Facebook's complexity requirements. Ensure test cases verify:

- ✅ Minimum of 6 characters  
- 🔠 At least one lowercase letter  
- 🔡 At least one uppercase letter  
- 🔢 At least one numeric digit  
- ✨ At least one special character  

---

## 🧪 Test Case Guidelines

- **Test Matrix** 📊  
- **Deliverables**:
  - ✅ Minimum of **four (4)** test cases written in **Gherkin** syntax (`GIVEN`, `WHEN`, `THEN`)
  - ✅ Clearly defined keywords and steps
  - ✅ Hardcoded test data is allowed
  - ✅ Prepare a **presentation and live demo**

---

## 🎯 Objectives

Build and run test cases that validate the **Mobile Number** and **Password** fields on Facebook’s sign-up form, especially ensuring passwords meet the required criteria.

---

## 📚 Resources

- 🎞️ **Presentation (Canva)**: [View Presentation](https://www.canva.com/design/DAGjr3pUnYk/j_qvv43e-vOAnbkoc9RHVw/view?utm_content=DAGjr3pUnYk&utm_campaign=designshare&utm_medium=link2&utm_source=uniquelinks&utlId=h1dffea2afb)  
- 💻 **GitHub Repository**: [fb-signup-test-automation](https://github.com/johnrosalesss/fb-signup-test-automation)

---

## 🧠 How It Works

This Robot Framework suite includes:

### **Settings**
- Imports a shared resource file (`resource.robot`)
- Uses `Close Browser` as a teardown step after each test

### **Variables**
- Stores test data for mobile numbers, password combinations, and browser settings

### **Test Cases**
1. ✅ **Valid Mobile Numbers**  
   - Examples: `+639162856662`, `09162556862`, `+63 916 285 6982`, `+63-916-285-6982`

2. ❌ **Invalid Mobile Numbers**  
   - Examples: `0916255`, `09162556862124A`, `09AB2556862`, `08162556862`

3. 🔐 **Password Combinations**  
   - Lowercase-only, uppercase-only, numeric-only, special char-only  
   - Mixed combinations according to Facebook’s password rules

---

## 🔑 Keywords Reference

Reusable Robot Framework keywords for clean and modular test scripts:

| **Keyword Name**                                      | **Purpose**                                      |
|-------------------------------------------------------|--------------------------------------------------|
| `Browser Is Opened To Facebook Registration Page`     | Opens the browser and navigates to Facebook      |
| `User Enters Valid Credentials With Mobile Number`    | Inputs a valid mobile number                     |
| `User Enters Invalid Credentials With Mobile Number`  | Inputs an invalid mobile number                  |
| `Confirm Mobile Number Page Should Be Displayed`      | Checks if confirmation page is displayed         |
| `Registration Error Should Appear`                    | Verifies error message for invalid input         |
| `User Enters Registration With Password`              | Inputs a password                                |
| `Password Error Should Be Displayed`                  | Validates rejection of invalid/weak password     |
| `Password Should Be Accepted`                         | Confirms acceptance of valid password            |

---

## 📊 Mobile Number Test Matrix

| **Test Case Description**                   | **Example**        | **VALID** | **INVALID** | **BLANK** |
|---------------------------------------------|--------------------|:---------:|:-----------:|:---------:|
| With `+63` country code (no spaces)          | +639162856662      | ✅        |             |           |
| With `09` prefix                             | 09162556862        | ✅        |             |           |
| With spaces                                  | +63 916 285 6982   | ✅        |             |           |
| With dashes                                  | +63-916-285-6982   | ✅        |             |           |
| Too short                                    | 0916255            |          | ❌          |           |
| Too long / extra characters                  | 09162556862124A    |          | ❌          |           |
| Contains letters                             | 09AB2556862        |          | ❌          |           |
| Special characters not allowed               | 0916-989-6862      |          | ❌          |           |
| Missing country code                         | 9162556862         |          | ❌          |           |
| Starts with invalid prefix (e.g. 08)         | 08162556862        |          | ❌          |           |
| Empty input                                  | (blank)            |          |             | ✅        |

---

## 🔐 Password Test Matrix

### Password Requirements (Based on Facebook’s Criteria)

- Minimum of **6 characters**
- Must include at least **1 letter** (uppercase or lowercase)
- At least **1 number**
- At least **1 special character**

| **Password Example**        | **VALID** | **INVALID** | **BLANK** |
|----------------------------|:---------:|:-----------:|:---------:|
| `abcdef` (all lowercase)   |           | ✅          |           |
| `ABCDEF` (all uppercase)   |           | ✅          |           |
| `123456` (only numbers)    |           | ✅          |           |
| `!@#$%^` (only special)    |           | ✅          |           |
| `abc123` (lowercase + num) |           | ✅          |           |
| `ABC!@#` (uppercase + spec)|           | ✅          |           |
| `aB1@34` (valid combo)     | ✅        |             |           |
| `Abcdef!` (missing number) | ✅         |           |           |
| `Abc123` (missing special) | ✅        |             |           |
| `aB1@` (too short)         |           | ✅          |           |
| (blank)                    |           |             | ✅        |

---

## ✅ Summary

This project ensures comprehensive validation of Facebook’s sign-up form using a well-structured Robot Framework suite. It encourages best practices in automation, clear reporting, and team collaboration through live demos and documentation.

---

**Happy testing! 🧪🎉**
