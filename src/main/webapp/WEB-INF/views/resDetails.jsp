<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Zayka@Door - Restaurant Details</title>
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
            width: 33.33%;
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
        
        input[type="text"] {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
            transition: var(--transition);
        }
        
        input[type="text"]:focus {
            outline: none;
            border-color: var(--secondary-color);
            box-shadow: 0 0 0 2px rgba(0, 166, 153, 0.2);
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
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="logo">
            <h1>Zayka<span>@Door</span></h1>
        </div>
        
        <div class="page-header">
            <h2>Restaurant Details</h2>
            <p>Tell us about your restaurant</p>
        </div>
        
        <div class="progress-bar">
            <div class="progress-fill"></div>
        </div>
        
        <form id="restaurantDetailsForm" action="/register/resDetails" method="post">
            <div class="form-group">
                <label for="resName">Restaurant Name <span class="required">*</span></label>
                <input type="text" id="resName" name="resName" placeholder="Enter your restaurant name" required>
                <div class="error-message" id="resNameError">Please enter a valid restaurant name</div>
            </div>
            
            <div class="form-group">
                <label for="ownerName">Owner Name <span class="required">*</span></label>
                <input type="text" id="ownerName" name="ownerName" placeholder="Enter owner's full name" required>
                <div class="error-message" id="ownerNameError">Please enter a valid owner name</div>
            </div>
            
            <div class="form-group">
                <label for="fssaiNo">FSSAI License Number <span class="required">*</span></label>
                <input type="text" id="fssaiNo" name="fssaiNo" placeholder="Enter 14-digit FSSAI number" required>
                <div class="input-help">14-digit Food Safety and Standards Authority license number</div>
                <div class="error-message" id="fssaiError">Please enter a valid 14-digit FSSAI number</div>
            </div>
            
            <button type="submit" class="button" id="continueButton">Continue</button>
            
            <a href="javascript:history.back()" class="back-link">← Back</a>
        </form>
    </div>
    
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const form = document.getElementById('restaurantDetailsForm');
            const continueButton = document.getElementById('continueButton');
            
            // Form inputs
            const resNameInput = document.getElementById('resName');
            const ownerNameInput = document.getElementById('ownerName');
            const fssaiInput = document.getElementById('fssaiNo');
            
            // Error messages
            const resNameError = document.getElementById('resNameError');
            const ownerNameError = document.getElementById('ownerNameError');
            const fssaiError = document.getElementById('fssaiError');
            
            // Validation functions
            function validateRestaurantName(name) {
                return name.trim().length >= 2 && /^[a-zA-Z0-9\s&',.-]+$/.test(name.trim());
            }
            
            function validateOwnerName(name) {
                return name.trim().length >= 2 && /^[a-zA-Z\s.]+$/.test(name.trim());
            }
            
            function validateFSSAI(fssai) {
                return /^\d{14}$/.test(fssai.replace(/\s/g, ''));
            }
            
            // Real-time validation
            resNameInput.addEventListener('input', function() {
                const value = this.value.trim();
                if (value && !validateRestaurantName(value)) {
                    resNameError.textContent = 'Restaurant name should contain only letters, numbers, and common symbols';
                    resNameError.classList.add('show');
                } else {
                    resNameError.classList.remove('show');
                }
            });
            
            ownerNameInput.addEventListener('input', function() {
                const value = this.value.trim();
                if (value && !validateOwnerName(value)) {
                    ownerNameError.textContent = 'Owner name should contain only letters and spaces';
                    ownerNameError.classList.add('show');
                } else {
                    ownerNameError.classList.remove('show');
                }
            });
            
            fssaiInput.addEventListener('input', function() {
                // Remove all non-digit characters
                let value = this.value.replace(/\D/g, '');
                
                // Limit to 14 digits
                if (value.length > 14) {
                    value = value.substring(0, 14);
                }
                
                // Format with spaces for better readability
                if (value.length > 0) {
                    value = value.replace(/(\d{2})(\d{2})(\d{2})(\d{2})(\d{6})/, '$1 $2 $3 $4 $5');
                }
                
                this.value = value;
                
                // Validation
                const cleanedValue = value.replace(/\s/g, '');
                if (cleanedValue.length > 0 && cleanedValue.length !== 14) {
                    fssaiError.classList.add('show');
                } else {
                    fssaiError.classList.remove('show');
                }
            });
            
            // Form submission
            form.addEventListener('submit', function(event) {
                let isValid = true;
                
                // Validate restaurant name
                if (!validateRestaurantName(resNameInput.value)) {
                    resNameError.textContent = 'Please enter a valid restaurant name';
                    resNameError.classList.add('show');
                    isValid = false;
                } else {
                    resNameError.classList.remove('show');
                }
                
                // Validate owner name
                if (!validateOwnerName(ownerNameInput.value)) {
                    ownerNameError.textContent = 'Please enter a valid owner name';
                    ownerNameError.classList.add('show');
                    isValid = false;
                } else {
                    ownerNameError.classList.remove('show');
                }
                
                // Validate FSSAI number
                if (!validateFSSAI(fssaiInput.value)) {
                    fssaiError.textContent = 'Please enter a valid 14-digit FSSAI number';
                    fssaiError.classList.add('show');
                    isValid = false;
                } else {
                    fssaiError.classList.remove('show');
                }
                
                if (!isValid) {
                    event.preventDefault();
                    // Focus on first invalid field
                    if (resNameError.classList.contains('show')) {
                        resNameInput.focus();
                    } else if (ownerNameError.classList.contains('show')) {
                        ownerNameInput.focus();
                    } else if (fssaiError.classList.contains('show')) {
                        fssaiInput.focus();
                    }
                } else {
                    // Clean FSSAI number before submission
                    fssaiInput.value = fssaiInput.value.replace(/\s/g, '');
                    continueButton.classList.add('pulse');
                }
            });
            
            // Remove pulse animation after it completes
            continueButton.addEventListener('animationend', function() {
                this.classList.remove('pulse');
            });
        });
    </script>
</body>
</html>