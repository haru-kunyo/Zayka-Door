<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Zayka@Door - Address Details</title>
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
            max-width: 420px;
            padding: 30px;
            position: relative;
            overflow: hidden;
        }
        
        .logo {
            text-align: center;
            margin-bottom: 30px;
        }
        
        .logo h1 {
            color: var(--primary-color);
            font-size: 2.5rem;
            font-weight: bold;
        }
        
        .logo span {
            color: var(--secondary-color);
        }
        
        .page-header {
            text-align: center;
            margin-bottom: 30px;
        }
        
        .page-header h2 {
            color: var(--dark-color);
            font-size: 1.5rem;
            margin-bottom: 8px;
        }
        
        .page-header p {
            color: #666;
            font-size: 14px;
        }
        
        .progress-bar {
            width: 100%;
            height: 4px;
            background-color: var(--light-color);
            border-radius: 2px;
            margin-bottom: 30px;
            overflow: hidden;
        }
        
        .progress-fill {
            height: 100%;
            background-color: var(--secondary-color);
            width: 66.66%;
            transition: var(--transition);
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
            color: var(--dark-color);
        }
        
        .required {
            color: var(--error-color);
        }
        
        input[type="text"],
        textarea,
        select {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
            transition: var(--transition);
            font-family: inherit;
        }
        
        textarea {
            resize: vertical;
            min-height: 80px;
            max-height: 120px;
        }
        
        input[type="text"]:focus,
        textarea:focus,
        select:focus {
            outline: none;
            border-color: var(--secondary-color);
            box-shadow: 0 0 0 2px rgba(0, 166, 153, 0.2);
        }
        
        .form-row {
            display: flex;
            gap: 15px;
        }
        
        .form-row .form-group {
            flex: 1;
        }
        
        .input-help {
            font-size: 12px;
            color: #666;
            margin-top: 4px;
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
            margin-bottom: 20px;
        }
        
        .button:hover {
            background-color: #e0484d;
            transform: translateY(-2px);
        }
        
        .button:disabled {
            background-color: #ccc;
            cursor: not-allowed;
            transform: none;
        }
        
        .back-link {
            color: var(--secondary-color);
            text-decoration: none;
            font-size: 14px;
            transition: var(--transition);
            display: block;
            text-align: center;
        }
        
        .back-link:hover {
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
            
            .page-header h2 {
                font-size: 1.3rem;
            }
            
            .form-row {
                flex-direction: column;
                gap: 0;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="logo">
            <h1>Zayka<span>@Door</span></h1>
        </div>
        
        <div class="page-header">
            <h2>Restaurant Address</h2>
            <p>Where is your restaurant located?</p>
        </div>
        
        <div class="progress-bar">
            <div class="progress-fill"></div>
        </div>
        
        <form id="addressDetailsForm" action="/register/addressDetails" method="post">
            <div class="form-group">
                <label for="addLine">Address Line <span class="required">*</span></label>
                <textarea id="addLine" name="addLine" placeholder="Enter your complete address (Building name, Street, Area)" required></textarea>
                <div class="input-help">Include building name, street name, and area</div>
                <div class="error-message" id="addLineError">Please enter a valid address</div>
            </div>
            
            <div class="form-row">
                <div class="form-group">
                    <label for="city">City <span class="required">*</span></label>
                    <input type="text" id="city" name="city" placeholder="Enter city name" required>
                    <div class="error-message" id="cityError">Please enter a valid city name</div>
                </div>
                
                <div class="form-group">
                    <label for="state">State <span class="required">*</span></label>
                    <select id="state" name="state" required>
                        <option value="">Select State</option>
                        <option value="Andhra Pradesh">Andhra Pradesh</option>
                        <option value="Arunachal Pradesh">Arunachal Pradesh</option>
                        <option value="Assam">Assam</option>
                        <option value="Bihar">Bihar</option>
                        <option value="Chhattisgarh">Chhattisgarh</option>
                        <option value="Goa">Goa</option>
                        <option value="Gujarat">Gujarat</option>
                        <option value="Haryana">Haryana</option>
                        <option value="Himachal Pradesh">Himachal Pradesh</option>
                        <option value="Jharkhand">Jharkhand</option>
                        <option value="Karnataka">Karnataka</option>
                        <option value="Kerala">Kerala</option>
                        <option value="Madhya Pradesh">Madhya Pradesh</option>
                        <option value="Maharashtra">Maharashtra</option>
                        <option value="Manipur">Manipur</option>
                        <option value="Meghalaya">Meghalaya</option>
                        <option value="Mizoram">Mizoram</option>
                        <option value="Nagaland">Nagaland</option>
                        <option value="Odisha">Odisha</option>
                        <option value="Punjab">Punjab</option>
                        <option value="Rajasthan">Rajasthan</option>
                        <option value="Sikkim">Sikkim</option>
                        <option value="Tamil Nadu">Tamil Nadu</option>
                        <option value="Telangana">Telangana</option>
                        <option value="Tripura">Tripura</option>
                        <option value="Uttar Pradesh">Uttar Pradesh</option>
                        <option value="Uttarakhand">Uttarakhand</option>
                        <option value="West Bengal">West Bengal</option>
                        <option value="Andaman and Nicobar Islands">Andaman and Nicobar Islands</option>
                        <option value="Chandigarh">Chandigarh</option>
                        <option value="Dadra and Nagar Haveli and Daman and Diu">Dadra and Nagar Haveli and Daman and Diu</option>
                        <option value="Delhi">Delhi</option>
                        <option value="Jammu and Kashmir">Jammu and Kashmir</option>
                        <option value="Ladakh">Ladakh</option>
                        <option value="Lakshadweep">Lakshadweep</option>
                        <option value="Puducherry">Puducherry</option>
                    </select>
                    <div class="error-message" id="stateError">Please select a state</div>
                </div>
            </div>
            
            <div class="form-group">
                <label for="pincode">Pincode <span class="required">*</span></label>
                <input type="text" id="pincode" name="pincode" placeholder="Enter 6-digit pincode" required maxlength="6">
                <div class="input-help">6-digit postal code</div>
                <div class="error-message" id="pincodeError">Please enter a valid 6-digit pincode</div>
            </div>
            
            <button type="submit" class="button" id="submitButton">Complete Registration</button>
            
            <a href="javascript:history.back()" class="back-link">← Back</a>
        </form>
    </div>
    
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const form = document.getElementById('addressDetailsForm');
            const submitButton = document.getElementById('submitButton');
            
            // Form inputs
            const addLineInput = document.getElementById('addLine');
            const cityInput = document.getElementById('city');
            const stateSelect = document.getElementById('state');
            const pincodeInput = document.getElementById('pincode');
            
            // Error messages
            const addLineError = document.getElementById('addLineError');
            const cityError = document.getElementById('cityError');
            const stateError = document.getElementById('stateError');
            const pincodeError = document.getElementById('pincodeError');
            
            // Validation functions
            function validateAddress(address) {
                return address.trim().length >= 10 && address.trim().length <= 200;
            }
            
            function validateCity(city) {
                return city.trim().length >= 2 && /^[a-zA-Z\s.-]+$/.test(city.trim());
            }
            
            function validatePincode(pincode) {
                return /^\d{6}$/.test(pincode.trim());
            }
            
            // Real-time validation
            addLineInput.addEventListener('input', function() {
                const value = this.value.trim();
                if (value && !validateAddress(value)) {
                    if (value.length < 10) {
                        addLineError.textContent = 'Address should be at least 10 characters long';
                    } else {
                        addLineError.textContent = 'Address should not exceed 200 characters';
                    }
                    addLineError.classList.add('show');
                } else {
                    addLineError.classList.remove('show');
                }
            });
            
            cityInput.addEventListener('input', function() {
                const value = this.value.trim();
                if (value && !validateCity(value)) {
                    cityError.textContent = 'City name should contain only letters, spaces, dots, and hyphens';
                    cityError.classList.add('show');
                } else {
                    cityError.classList.remove('show');
                }
            });
            
            pincodeInput.addEventListener('input', function() {
                // Remove all non-digit characters
                let value = this.value.replace(/\D/g, '');
                
                // Limit to 6 digits
                if (value.length > 6) {
                    value = value.substring(0, 6);
                }
                
                this.value = value;
                
                // Validation
                if (value.length > 0 && value.length !== 6) {
                    pincodeError.classList.add('show');
                } else {
                    pincodeError.classList.remove('show');
                }
            });
            
            stateSelect.addEventListener('change', function() {
                if (this.value) {
                    stateError.classList.remove('show');
                }
            });
            
            // Form submission
            form.addEventListener('submit', function(event) {
                let isValid = true;
                
                // Validate address
                if (!validateAddress(addLineInput.value)) {
                    addLineError.textContent = 'Please enter a valid address (10-200 characters)';
                    addLineError.classList.add('show');
                    isValid = false;
                } else {
                    addLineError.classList.remove('show');
                }
                
                // Validate city
                if (!validateCity(cityInput.value)) {
                    cityError.textContent = 'Please enter a valid city name';
                    cityError.classList.add('show');
                    isValid = false;
                } else {
                    cityError.classList.remove('show');
                }
                
                // Validate state
                if (!stateSelect.value) {
                    stateError.textContent = 'Please select a state';
                    stateError.classList.add('show');
                    isValid = false;
                } else {
                    stateError.classList.remove('show');
                }
                
                // Validate pincode
                if (!validatePincode(pincodeInput.value)) {
                    pincodeError.textContent = 'Please enter a valid 6-digit pincode';
                    pincodeError.classList.add('show');
                    isValid = false;
                } else {
                    pincodeError.classList.remove('show');
                }
                
                if (!isValid) {
                    event.preventDefault();
                    // Focus on first invalid field
                    if (addLineError.classList.contains('show')) {
                        addLineInput.focus();
                    } else if (cityError.classList.contains('show')) {
                        cityInput.focus();
                    } else if (stateError.classList.contains('show')) {
                        stateSelect.focus();
                    } else if (pincodeError.classList.contains('show')) {
                        pincodeInput.focus();
                    }
                } else {
                    submitButton.classList.add('pulse');
                }
            });
            
            // Remove pulse animation after it completes
            submitButton.addEventListener('animationend', function() {
                this.classList.remove('pulse');
            });
        });
    </script>
</body>
</html>