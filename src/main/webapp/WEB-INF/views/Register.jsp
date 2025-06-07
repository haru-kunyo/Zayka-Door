<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Zayka@Door - Register</title>
    <style>
        :root {
            --primary-color: #FF5A5F;
            --secondary-color: #00A699;
            --dark-color: #484848;
            --light-color: #F7F7F7;
            --error-color: #E31C3D;
            --success-color: #2E8540;
            --shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            --transition: all 0.3s ease;
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            background-color: var(--light-color);
            color: var(--dark-color);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 20px;
        }
        
        .container {
            background-color: white;
            border-radius: 10px;
            box-shadow: var(--shadow);
            width: 100%;
            max-width: 450px;
            padding: 30px;
            position: relative;
            overflow: hidden;
        }
        
        .logo {
            text-align: center;
            margin-bottom: 25px;
        }
        
        .logo h1 {
            color: var(--primary-color);
            font-size: 2.5rem;
            font-weight: bold;
        }
        
        .logo span {
            color: var(--secondary-color);
        }
        
        .toggle-container {
            display: flex;
            justify-content: center;
            margin-bottom: 25px;
            background: var(--light-color);
            border-radius: 30px;
            padding: 5px;
            position: relative;
        }
        
        .toggle-option {
            padding: 10px 20px;
            cursor: pointer;
            z-index: 1;
            text-align: center;
            flex: 1;
            border-radius: 30px;
            transition: var(--transition);
        }
        
        .toggle-option.active {
            background-color: var(--primary-color);
            color: white;
        }
        
        .form-group {
            margin-bottom: 18px;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
        }
        
        .phone-input-container {
            display: flex;
            gap: 10px;
        }
        
        .country-code-dropdown {
            flex: 0 0 100px;
            position: relative;
        }
        
        .country-code-dropdown .selected {
            display: flex;
            align-items: center;
            padding: 10px 12px;
            border: 1px solid #ddd;
            border-radius: 5px;
            cursor: pointer;
            justify-content: space-between;
            background-color: white;
        }
        
        .country-code-dropdown .selected .flag {
            margin-right: 5px;
            font-size: 1.2rem;
        }
        
        .country-code-dropdown .dropdown-menu {
            position: absolute;
            top: 100%;
            left: 0;
            width: 100%;
            max-height: 200px;
            overflow-y: auto;
            background-color: white;
            border: 1px solid #ddd;
            border-radius: 5px;
            z-index: 10;
            display: none;
            box-shadow: var(--shadow);
        }
        
        .country-code-dropdown .dropdown-menu.show {
            display: block;
        }
        
        .country-code-dropdown .dropdown-item {
            display: flex;
            align-items: center;
            padding: 8px 12px;
            cursor: pointer;
            transition: var(--transition);
        }
        
        .country-code-dropdown .dropdown-item:hover {
            background-color: var(--light-color);
        }
        
        .country-code-dropdown .dropdown-item .flag {
            margin-right: 8px;
            font-size: 1.2rem;
        }
        
        .phone-input {
            flex: 1;
        }
        
        input[type="tel"],
        input[type="password"],
        input[type="text"] {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
            transition: var(--transition);
        }
        
        input[type="tel"]:focus,
        input[type="password"]:focus,
        input[type="text"]:focus {
            outline: none;
            border-color: var(--secondary-color);
            box-shadow: 0 0 0 2px rgba(0, 166, 153, 0.2);
        }
        
        .error-message {
            color: var(--error-color);
            font-size: 14px;
            margin-top: 5px;
            display: none;
        }
        
        .error-message.show {
            display: block;
        }
        
        .button {
            width: 100%;
            padding: 14px;
            border: none;
            border-radius: 5px;
            background-color: var(--primary-color);
            color: white;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: var(--transition);
            margin-top: 5px;
        }
        
        .button:hover {
            background-color: #e0484d;
            transform: translateY(-2px);
        }
        
        .links {
            display: flex;
            justify-content: center;
            margin-top: 20px;
            font-size: 14px;
        }
        
        .links a {
            color: var(--secondary-color);
            text-decoration: none;
            transition: var(--transition);
        }
        
        .links a:hover {
            color: var(--primary-color);
            text-decoration: underline;
        }
        
        .server-error {
            background-color: rgba(227, 28, 61, 0.1);
            color: var(--error-color);
            padding: 12px;
            border-radius: 5px;
            margin-bottom: 20px;
            text-align: center;
            font-size: 14px;
        }
        
        .password-strength {
            height: 5px;
            background-color: #ddd;
            border-radius: 3px;
            margin-top: 5px;
            position: relative;
            overflow: hidden;
        }
        
        .password-strength-meter {
            position: absolute;
            height: 100%;
            transition: var(--transition);
        }
        
        .password-strength-text {
            font-size: 12px;
            margin-top: 5px;
            text-align: right;
        }
        
        .weak {
            width: 33%;
            background-color: var(--error-color);
        }
        
        .medium {
            width: 66%;
            background-color: #FFC107;
        }
        
        .strong {
            width: 100%;
            background-color: var(--success-color);
        }
        
        /* Animation for form submission */
        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.05); }
            100% { transform: scale(1); }
        }
        
        .pulse {
            animation: pulse 0.5s ease;
        }
        
        @media screen and (max-width: 480px) {
            .container {
                padding: 20px;
            }
            
            .logo h1 {
                font-size: 2rem;
            }
            
            .toggle-container {
                margin-bottom: 20px;
            }
            
            .toggle-option {
                padding: 8px 15px;
                font-size: 14px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="logo">
            <h1>Zayka<span>@Door</span></h1>
        </div>
        
        <div class="toggle-container">
            <div class="toggle-option active" data-user-type="consumer">Consumer</div>
            <div class="toggle-option" data-user-type="restaurant">Restaurant</div>
        </div>
        
        <% if(request.getAttribute("errorMessage") != null) { %>
            <div class="server-error">
                <%= request.getAttribute("errorMessage") %>
            </div>
        <% } %>
        
        <form id="registerForm" action="register" method="post">
            <input type="hidden" id="userType" name="userType" value="consumer">
            
            <div class="form-group">
                <label for="phone">Phone Number</label>
                <div class="phone-input-container">
                    <div class="country-code-dropdown">
                        <div class="selected">
                            <span class="flag">🇮🇳</span>
                            <span class="code">+91</span>
                            <span>▼</span>
                        </div>
                        <div class="dropdown-menu">
                            <div class="dropdown-item" data-code="+91" data-flag="🇮🇳">
                                <span class="flag">🇮🇳</span>
                                <span>India (+91)</span>
                            </div>
                            <div class="dropdown-item" data-code="+1" data-flag="🇺🇸">
                                <span class="flag">🇺🇸</span>
                                <span>USA (+1)</span>
                            </div>
                            <div class="dropdown-item" data-code="+44" data-flag="🇬🇧">
                                <span class="flag">🇬🇧</span>
                                <span>UK (+44)</span>
                            </div>
                            <div class="dropdown-item" data-code="+61" data-flag="🇦🇺">
                                <span class="flag">🇦🇺</span>
                                <span>Australia (+61)</span>
                            </div>
                            <div class="dropdown-item" data-code="+86" data-flag="🇨🇳">
                                <span class="flag">🇨🇳</span>
                                <span>China (+86)</span>
                            </div>
                            <div class="dropdown-item" data-code="+81" data-flag="🇯🇵">
                                <span class="flag">🇯🇵</span>
                                <span>Japan (+81)</span>
                            </div>
                            <div class="dropdown-item" data-code="+49" data-flag="🇩🇪">
                                <span class="flag">🇩🇪</span>
                                <span>Germany (+49)</span>
                            </div>
                            <div class="dropdown-item" data-code="+33" data-flag="🇫🇷">
                                <span class="flag">🇫🇷</span>
                                <span>France (+33)</span>
                            </div>
                            <div class="dropdown-item" data-code="+55" data-flag="🇧🇷">
                                <span class="flag">🇧🇷</span>
                                <span>Brazil (+55)</span>
                            </div>
                            <div class="dropdown-item" data-code="+52" data-flag="🇲🇽">
                                <span class="flag">🇲🇽</span>
                                <span>Mexico (+52)</span>
                            </div>
                        </div>
                    </div>
                    <div class="phone-input">
                        <input type="tel" id="phone" name="number" placeholder="Enter 10-digit number" required>
                        <div class="error-message" id="phoneError">Please enter a valid 10-digit phone number</div>
                    </div>
                </div>
            </div>
            
       
            
            <input type="hidden" id="countryCode" name="countryCode" value="+91">
            <button type="submit" class="button" id="registerButton">Register</button>
            
            <div class="links">
                <a href="/login">Already have an account? Login</a>
            </div>
        </form>
    </div>
    
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Toggle between consumer and restaurant registration
            const toggleOptions = document.querySelectorAll('.toggle-option');
            const userTypeInput = document.getElementById('userType');
            
            toggleOptions.forEach(option => {
                option.addEventListener('click', function() {
                    toggleOptions.forEach(opt => opt.classList.remove('active'));
                    this.classList.add('active');
                    userTypeInput.value = this.getAttribute('data-user-type');
                });
            });
            
            // Country code dropdown functionality
            const countryDropdown = document.querySelector('.country-code-dropdown .selected');
            const dropdownMenu = document.querySelector('.country-code-dropdown .dropdown-menu');
            const countryCodeInput = document.getElementById('countryCode');
            
            countryDropdown.addEventListener('click', function() {
                dropdownMenu.classList.toggle('show');
            });
            
            // Close dropdown when clicking outside
            document.addEventListener('click', function(event) {
                if (!event.target.closest('.country-code-dropdown')) {
                    dropdownMenu.classList.remove('show');
                }
            });
            
            // Handle country selection
            const dropdownItems = document.querySelectorAll('.dropdown-item');
            
            dropdownItems.forEach(item => {
                item.addEventListener('click', function() {
                    const code = this.getAttribute('data-code');
                    const flag = this.getAttribute('data-flag');
                    
                    countryDropdown.querySelector('.flag').textContent = flag;
                    countryDropdown.querySelector('.code').textContent = code;
                    countryCodeInput.value = code;
                    
                    dropdownMenu.classList.remove('show');
                });
            });
            
            // Phone number validation
            const phoneInput = document.getElementById('phone');
            const phoneError = document.getElementById('phoneError');
            
            phoneInput.addEventListener('input', function() {
                // Remove all non-digit characters
                this.value = this.value.replace(/\D/g, '');
                
                // Check if the phone number is valid (10 digits)
                if (this.value.length === 10) {
                    phoneError.classList.remove('show');
                } else {
                    phoneError.classList.add('show');
                }
            });
            
            // Form submission validation
            const registerForm = document.getElementById('registerForm');
            const registerButton = document.getElementById('registerButton');
            
            registerForm.addEventListener('submit', function(event) {
                let isValid = true;
                // Validate phone number
                if (phoneInput.value.length !== 10) {
                    phoneError.classList.add('show');
                    isValid = false;
                }
                
                
               
            });
            
            // Remove pulse animation after it completes
            registerButton.addEventListener('animationend', function() {
                this.classList.remove('pulse');
            });
        });
    </script>
</body>
</html>