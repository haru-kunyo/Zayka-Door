<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Zayka@Door - Verify OTP</title>
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
            text-align: center;
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
        
        .verification-icon {
            font-size: 4rem;
            color: var(--secondary-color);
            margin-bottom: 20px;
        }
        
        .verification-text {
            margin-bottom: 30px;
        }
        
        .verification-text h2 {
            color: var(--dark-color);
            margin-bottom: 10px;
            font-size: 1.5rem;
        }
        
        .verification-text p {
            color: #666;
            font-size: 14px;
            line-height: 1.5;
        }
        
        .phone-display {
            color: var(--primary-color);
            font-weight: 600;
        }
        
        .otp-container {
            display: flex;
            justify-content: center;
            gap: 10px;
            margin-bottom: 30px;
        }
        
        .otp-input {
            width: 50px;
            height: 50px;
            border: 2px solid #ddd;
            border-radius: 8px;
            text-align: center;
            font-size: 1.5rem;
            font-weight: bold;
            transition: var(--transition);
        }
        
        .otp-input:focus {
            outline: none;
            border-color: var(--secondary-color);
            box-shadow: 0 0 0 2px rgba(0, 166, 153, 0.2);
        }
        
        .error-message {
            color: var(--error-color);
            font-size: 14px;
            margin-bottom: 20px;
            display: none;
        }
        
        .error-message.show {
            display: block;
        }
        
        .server-error {
            color: var(--error-color);
            font-size: 14px;
            margin-bottom: 20px;
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
        }
        
        .back-link:hover {
            color: var(--primary-color);
            text-decoration: underline;
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
            
            .verification-icon {
                font-size: 3rem;
            }
            
            .otp-input {
                width: 45px;
                height: 45px;
                font-size: 1.2rem;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="logo">
            <h1>Zayka<span>@Door</span></h1>
        </div>
        
        <div class="verification-icon">📱</div>
        
        <div class="verification-text">
            <h2>Verify Your Phone</h2>
            <p>We've sent a 6-digit verification code to<br>
            <span class="phone-display" id="phoneDisplay">${a}</span></p>
        </div>
        
        <form id="otpForm" action="verify" method="post">
            <!-- Hidden fields to pass userType and formattedNumber -->
            <input type="hidden" name="userType" value="${userType}">
            <input type="hidden" name="formattedNumber" value="${a}">
            
            <div class="otp-container">
                <input type="text" class="otp-input" maxlength="1" id="otp1" required>
                <input type="text" class="otp-input" maxlength="1" id="otp2" required>
                <input type="text" class="otp-input" maxlength="1" id="otp3" required>
                <input type="text" class="otp-input" maxlength="1" id="otp4" required>
                <input type="text" class="otp-input" maxlength="1" id="otp5" required>
                <input type="text" class="otp-input" maxlength="1" id="otp6" required>
            </div>
            
            <!-- Hidden input to combine all OTP digits -->
            <input type="hidden" name="otp" id="combinedOtp">
            
            <div class="error-message" id="otpError">Please enter a valid 6-digit OTP</div>
            
            <!-- Display server error message if present -->
            <% if(request.getAttribute("msg") != null) { %>
                <div class="server-error">${msg}</div>
            <% } %>
            
            <button type="submit" class="button" id="continueButton">Continue</button>
            

            
            <a href="/" class="back-link">← Back to Login</a>
        </form>
    </div>
    
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const otpInputs = document.querySelectorAll('.otp-input');
            const otpForm = document.getElementById('otpForm');
            const continueButton = document.getElementById('continueButton');
            const otpError = document.getElementById('otpError');
            const combinedOtpInput = document.getElementById('combinedOtp');
            
            // Auto-focus and navigation between OTP inputs
            otpInputs.forEach((input, index) => {
                input.addEventListener('input', function() {
                    // Only allow numeric input
                    this.value = this.value.replace(/[^0-9]/g, '');
                    
                    // Move to next input if current is filled
                    if (this.value.length === 1 && index < otpInputs.length - 1) {
                        otpInputs[index + 1].focus();
                    }
                    
                    // Hide error message when user starts typing
                    otpError.classList.remove('show');
                });
                
                input.addEventListener('keydown', function(e) {
                    // Move to previous input on backspace
                    if (e.key === 'Backspace' && this.value === '' && index > 0) {
                        otpInputs[index - 1].focus();
                    }
                });
                
                input.addEventListener('paste', function(e) {
                    e.preventDefault();
                    const paste = (e.clipboardData || window.clipboardData).getData('text');
                    const pasteData = paste.replace(/[^0-9]/g, '');
                    
                    if (pasteData.length === 6) {
                        for (let i = 0; i < 6; i++) {
                            if (otpInputs[i]) {
                                otpInputs[i].value = pasteData[i];
                            }
                        }
                        otpInputs[5].focus();
                    }
                });
            });
            
            // Focus first input on page load
            otpInputs[0].focus();
            
            // Form submission
            otpForm.addEventListener('submit', function(event) {
                let otp = '';
                otpInputs.forEach(input => {
                    otp += input.value;
                });
                
                if (otp.length !== 6) {
                    event.preventDefault();
                    otpError.classList.add('show');
                    otpInputs[0].focus();
                } else {
                    // Set the combined OTP value to hidden input
                    combinedOtpInput.value = otp;
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