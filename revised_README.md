# 🤖 Facebook Registration Test Suite (Robot Framework)

## ⚙️ Settings

| Setting        | Value                      |
|----------------|----------------------------|
| Resource       | `revised_resource.robot`   |
| Test Teardown  | `Close Browser`            |

---

## 📱 Test Cases: Mobile Number Validation

### ✅ Valid Mobile Numbers

| Test Case | Mobile Format | Description |
|----------|----------------|-------------|
| **Valid +63 Format** | `+639162856862` | Correct format with country code |
| **Valid 09 Prefix** | `09162856862` | Local format with 09 prefix |
| **With Spaces** | `+63 916 285 6862` | Formatted with spaces |
| **With Dashes** | `+63-916-285-6862` | Formatted with dashes |
| **Without Country Code** | `9162856862` | Missing country code |

### ❌ Invalid Mobile Numbers

| Test Case | Input | Reason |
|-----------|-------|--------|
| **Too Short** | `0916` | Less than 10 digits |
| **Too Long** | `091628568621234` | Exceeds valid length |
| **With Letters** | `09AB2856862` | Invalid characters |
| **With Special Characters** | `0916-!@#-6862` | Invalid characters |
| **Starts with 08** | `08162856862` | Not a valid network prefix |
| **Empty Field** | _empty_ | No input provided |

---

## 🔒 Test Cases: Password Validation

### ❌ Invalid Passwords

| Test Case | Password | Reason |
|-----------|----------|--------|
| **All lowercase** | `abcdef` | Lacks complexity |
| **All numbers** | `123456` | Lacks letters/specials |
| **Lowercase + numbers** | `abc123` | Missing uppercase or special |
| **Too short (4 chars)** | `aB1@` | Minimum length not met |
| **Empty Field** | _empty_ | No input |

### ✅ Valid Passwords

| Test Case | Password | Description |
|-----------|----------|-------------|
| **Strong Mix** | `aB1@34` | Includes all types |
| **All Uppercase** | `GHIJKL` | All capital letters |
| **All Specials** | `!@#$%^` | Only special characters |
| **Uppercase + Numbers** | `DEF123` | Valid combo |
| **Uppercase + Specials** | `ABC@#?` | Valid combo |
| **Missing Numbers** | `Abcdef!` | Still accepted |
| **Missing Specials** | `HIJ123` | Still accepted |

---

## 🔧 Keywords: `revised_resource.robot`

### 🌐 Browser & Navigation

| Keyword | Description |
|--------|-------------|
| `The user opens Chrome browser in incognito mode` | Opens browser in private mode |
| `The user navigates to Facebook registration page` | Navigates to the sign-up page |

### 👤 Form Inputs

| Keyword | Field | Value |
|--------|-------|-------|
| `The user enters a valid first name "John Crisistom"` | First Name | John Crisistom |
| `The user enters a valid last name "Rosales"` | Last Name | Rosales |
| `The user selects birthdate November 17, 1994` | Birthday | Nov 17, 1994 |
| `The user selects male gender` | Gender | Male |
| `The user enters a valid email "natsuxlucy02@gmail.com"` | Email | natsuxlucy02@gmail.com |

### 📞 Mobile Number Inputs

> _All include a sleep & progressbar wait_

| Keyword | Sample Input |
|---------|---------------|
| `The user enters mobile number "+639162856862"` | Valid international format |
| `The user enters mobile number "09162856862"` | Valid local format |
| `The user enters mobile number with spaces "+63 916 285 6862"` | Valid with spacing |
| `The user enters mobile number "+63-916-285-6862"` | Valid with dashes |
| `The user enters mobile number "0916"` | Too short |
| `The user enters mobile number "091628568621234"` | Too long |
| `The user enters mobile number "09AB2856862"` | Contains letters |
| `The user enters mobile number "0916-!@#-6862"` | Contains special chars |
| `The user enters mobile number "9162856862"` | No country code |
| `The user enters mobile number "08162856862"` | Invalid prefix |
| `The user leaves mobile number field empty` | Clears input field |

### 🔑 Password Inputs

| Keyword | Sample Input |
|---------|--------------|
| `The user enters password "Paolo095!"` | Example valid password |
| `The user enters password "abcdef"` | All lowercase |
| `The user enters password "123456"` | All digits |
| `The user enters password "abc123"` | Lacks upper/special |
| `The user enters password "aB1@"` | Too short |
| `The user enters password "aB1@34"` | Strong |
| `The user enters password "GHIJKL"` | All caps |
| `The user enters password "!@#$%^"` | All special |
| `The user enters password "DEF123"` | Caps + numbers |
| `The user enters password "ABC@#?"` | Caps + specials |
| `The user enters password "Abcdef!"` | No numbers |
| `The user enters password "HIJ123"` | No special chars |
| `The user leaves password field empty` | Clears password input |

---

## ✅ Final Notes

- All tests simulate the **Facebook registration page** with various input formats.
- Validations ensure form behavior against both valid and invalid data.
- Tests run using **SeleniumLibrary** and Chrome in **incognito** mode.
- Add `Test Setup` or tags if needed for grouping in larger suites.

---

🧪 _Happy Testing!_ 💡

