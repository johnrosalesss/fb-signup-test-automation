# 🚀 Facebook Sign-Up Test Automation

## 🔍 Overview

This repository provides automated test cases for validating Facebook’s **Sign-Up** page, specifically focusing on the **Mobile Number** and **Password** fields. The tests are built using **Robot Framework** and **SeleniumLibrary**.

---

## 📝 Instructions

### 📱 1. Mobile Number Test Case

Validate the **Mobile Number** input field by checking different valid and invalid formats. Scenarios include proper input formatting, edge cases, and expected error messages.

### 🔑 2. Password Test Case

All participants will work on validating the **Password** field. Ensure your test cases verify the following rules:

- ✅ Minimum number of characters  
- 🔠 At least one lowercase letter  
- 🔡 At least one uppercase letter  
- 🔢 At least one numeric digit  
- ✨ At least one special character  

---

## 🧪 Test Case Guidelines

- **Test Matrix** 📊: Use the provided matrix as a foundation. You're encouraged to add more relevant scenarios.
- **Deliverables**:
  - ✅ Minimum of **four (4)** test cases written in **Gherkin** syntax (GIVEN, WHEN, THEN)
  - ✅ Keywords used along with their defined steps
  - ✅ Hardcoded test data is allowed
  - ✅ Prepare a **presentation and live demo** for your work

---

## 🎯 Objectives

Build and run test cases that validate the **Mobile Number** and **Password** fields of Facebook's sign-up form, with an emphasis on the **password's minimum requirement** and character composition.

---

## 📚 Resources

- 🎞️ **Presentation (Canva)**: [View Presentation](https://www.canva.com/design/DAGjr3pUnYk/j_qvv43e-vOAnbkoc9RHVw/view?utm_content=DAGjr3pUnYk&utm_campaign=designshare&utm_medium=link2&utm_source=uniquelinks&utlId=h1dffea2afb)  
- 💻 **GitHub Repository**: [fb-signup-test-automation](https://github.com/johnrosalesss/fb-signup-test-automation)

---

## 🧠 How It Works

This Robot Framework suite is structured as follows:

### **Settings**
- Imports a shared resource file (`resource.robot`)
- Ensures the browser is closed after each test using a teardown: `Close Browser`

### **Variables**
- Stores test data such as valid/invalid mobile numbers, password combinations, and browser settings

### **Test Cases**
1. ✅ **Valid Mobile Numbers**  
   Tests entries with:
   - `+63` country code  
   - `09` prefix  
   - Spaces, dashes, or formatted input

2. ❌ **Invalid Mobile Numbers**  
   Covers:
   - Too short/long numbers  
   - Letters or special characters  
   - Missing country code or invalid prefixes  
   - Empty input

3. 🔐 **Password Combinations**  
   Validates:
   - Lowercase-only, uppercase-only, numeric-only, and special-char-only passwords  
   - Mixed combinations based on Facebook’s complexity rules

### **Keywords**
Custom reusable keywords encapsulate tasks like:

- `User Enters Valid Credentials With Mobile Number`
- `User Enters Registration With Password`
- `Confirm Mobile Number Page Should Be Displayed`
- `Registration Error Should Appear`

These keywords help maintain clean, readable, and modular test scripts.

---

## ✅ Summary

This project ensures robust validation testing of Facebook’s sign-up form using a structured, maintainable Robot Framework test suite. It promotes collaboration, best practices in test design, and clear reporting through demos and presentations.

---

Happy testing! 🧪🎉
