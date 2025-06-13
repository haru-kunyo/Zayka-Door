<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Restaurant Dashboard - <%= request.getAttribute("restaurantName") != null ? request.getAttribute("restaurantName") : "My Restaurant" %></title>
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
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: var(--light-color);
            color: var(--dark-color);
            line-height: 1.6;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        .header {
            background: linear-gradient(135deg, var(--primary-color) 0%, var(--secondary-color) 100%);
            color: white;
            padding: 30px;
            border-radius: 10px;
            margin-bottom: 30px;
            box-shadow: var(--shadow);
        }

        .welcome-section {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 20px;
        }

        .restaurant-info h1 {
            font-size: 2.5em;
            margin-bottom: 10px;
        }

        .status {
            display: flex;
            align-items: center;
            gap: 15px;
            margin-top: 10px;
        }

        .status-badge {
            padding: 8px 16px;
            border-radius: 20px;
            font-weight: bold;
            text-transform: uppercase;
            font-size: 0.9em;
        }

        .status-open {
            background-color: var(--success-color);
            color: white;
        }

        .status-closed {
            background-color: var(--primary-color);
            color: white;
        }

        /* Toggle Switch Styles */
        .toggle-container {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .toggle-switch {
            position: relative;
            width: 60px;
            height: 30px;
            background-color: var(--primary-color);
            border-radius: 15px;
            cursor: pointer;
            transition: var(--transition);
        }

        .toggle-switch.active {
            background-color: var(--success-color);
        }

        .toggle-slider {
            position: absolute;
            top: 3px;
            left: 3px;
            width: 24px;
            height: 24px;
            background-color: white;
            border-radius: 50%;
            transition: var(--transition);
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
        }

        .toggle-switch.active .toggle-slider {
            transform: translateX(30px);
        }

        .toggle-label {
            font-weight: bold;
            color: white;
            font-size: 0.9em;
        }

        .restaurant-header {
            display: flex;
            align-items: center;
            gap: 20px;
            margin-bottom: 15px;
        }

        .restaurant-avatar {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            object-fit: cover;
            border: 3px solid white;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.2);
        }

        .btn {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: var(--transition);
            text-decoration: none;
            display: inline-block;
            text-align: center;
        }

        .btn-primary {
            background-color: var(--primary-color);
            color: white;
        }

        .btn-primary:hover {
            background-color: #e0484d;
            transform: translateY(-2px);
        }

        .btn-success {
            background-color: var(--success-color);
            color: white;
        }

        .btn-success:hover {
            background-color: #1e6e2a;
            transform: translateY(-2px);
        }

        .btn-warning {
            background-color: var(--primary-color);
            color: white;
        }

        .btn-warning:hover {
            background-color: #e0484d;
            transform: translateY(-2px);
        }

        .btn-danger {
            background-color: var(--error-color);
            color: white;
        }

        .btn-danger:hover {
            background-color: #c91531;
            transform: translateY(-2px);
        }

        .btn-small {
            padding: 5px 10px;
            font-size: 14px;
        }

        .dashboard-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 30px;
            margin-bottom: 30px;
        }

        .section {
            background: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: var(--shadow);
        }

        .section h2 {
            color: var(--dark-color);
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 2px solid var(--primary-color);
        }

        .info-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 15px;
        }

        .address-grid {
            display: grid;
            grid-template-columns: 2fr 1fr 1fr;
            gap: 15px;
            grid-column: 1 / -1;
        }

        .info-item {
            display: flex;
            flex-direction: column;
        }

        .info-item label {
            font-weight: bold;
            color: var(--dark-color);
            margin-bottom: 5px;
        }

        .info-item input {
            padding: 8px 12px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
            transition: var(--transition);
        }

        .info-item input:focus {
            outline: none;
            border-color: var(--secondary-color);
            box-shadow: 0 0 0 2px rgba(0, 166, 153, 0.2);
        }

        .info-item input:disabled {
            background-color: var(--light-color);
            color: #6c757d;
        }

        .table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }

        .table th,
        .table td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        .table th {
            background-color: var(--light-color);
            font-weight: bold;
            color: var(--dark-color);
        }

        .table tr:hover {
            background-color: rgba(0, 166, 153, 0.05);
        }

        .full-width {
            grid-column: 1 / -1;
        }

        .modal {
            display: none;
            position: fixed;
            z-index: 1000;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
        }

        .modal-content {
            background-color: white;
            margin: 5% auto;
            padding: 30px;
            border-radius: 10px;
            width: 90%;
            max-width: 500px;
            max-height: 80vh;
            overflow-y: auto;
        }

        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
            cursor: pointer;
            line-height: 1;
        }

        .close:hover {
            color: #000;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: var(--dark-color);
        }

        .form-group input,
        .form-group textarea,
        .form-group select {
            width: 100%;
            padding: 8px 12px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
            transition: var(--transition);
        }

        .form-group input:focus,
        .form-group textarea:focus,
        .form-group select:focus {
            outline: none;
            border-color: var(--secondary-color);
            box-shadow: 0 0 0 2px rgba(0, 166, 153, 0.2);
        }

        .form-group textarea {
            resize: vertical;
            height: 80px;
        }

        .action-buttons {
            display: flex;
            gap: 10px;
            margin-top: 20px;
        }

        .stars {
            color: #ffc107;
            font-size: 18px;
        }

        /* Footer Styles */
        .footer {
            background-color: var(--dark-color);
            color: white;
            padding: 30px 0;
            margin-top: 50px;
            text-align: center;
        }

        .footer-content {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }

        .footer-logo {
            font-size: 2rem;
            font-weight: bold;
            color: var(--primary-color);
            margin-bottom: 15px;
        }

        .footer-logo span {
            color: var(--secondary-color);
        }

        .footer-links {
            display: flex;
            justify-content: center;
            gap: 30px;
            margin-bottom: 20px;
            flex-wrap: wrap;
        }

        .footer-links a {
            color: white;
            text-decoration: none;
            transition: var(--transition);
            font-size: 14px;
        }

        .footer-links a:hover {
            color: var(--primary-color);
        }

        .footer-contact {
            margin-bottom: 20px;
        }

        .footer-contact p {
            margin: 5px 0;
            font-size: 14px;
        }

        .footer-contact a {
            color: var(--secondary-color);
            text-decoration: none;
            transition: var(--transition);
        }

        .footer-contact a:hover {
            color: var(--primary-color);
        }

        .footer-copyright {
            border-top: 1px solid rgba(255, 255, 255, 0.1);
            padding-top: 20px;
            font-size: 14px;
            color: #ccc;
        }

        .order-status {
            padding: 4px 8px;
            border-radius: 12px;
            font-size: 12px;
            font-weight: bold;
            text-transform: uppercase;
        }

        .status-pending {
            background-color: #fff3cd;
            color: #856404;
        }

        .status-preparing {
            background-color: #d4edda;
            color: var(--success-color);
        }

        .status-out-for-delivery {
            background-color: #fff3cd;
            color: var(--primary-color);
        }

        .status-delivered {
            background-color: #d1ecf1;
            color: #0c5460;
        }

        @media (max-width: 768px) {
            .dashboard-grid {
                grid-template-columns: 1fr;
            }

            .welcome-section {
                flex-direction: column;
                text-align: center;
            }

            .info-grid {
                grid-template-columns: 1fr;
            }

            .table {
                font-size: 14px;
            }

            .table th,
            .table td {
                padding: 8px;
            }

            .container {
                padding: 10px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Header/Welcome Section -->
        <div class="header">
            <div class="welcome-section">
                <div class="restaurant-info">
                    <div class="restaurant-header">
                        <img src="<%= request.getAttribute("profileImageUrl") != null ? request.getAttribute("profileImageUrl") : "/api/placeholder/80/80" %>" 
                             alt="Restaurant Profile" class="restaurant-avatar">
                        <div>
                            <h1><%= request.getAttribute("resName") != null ? request.getAttribute("resName") : "Delicious Bites Restaurant" %></h1>
                            <p style="margin: 5px 0; opacity: 0.9;">Owner: <%= request.getAttribute("ownername") != null ? request.getAttribute("ownername") : "John Doe" %></p>
                        </div>
                    </div>
                    <div class="status">
                        <span id="statusBadge" class="status-badge status-open">Open</span>
                        <div class="toggle-container">
                            <span class="toggle-label">Closed</span>
                            <div class="toggle-switch active" id="statusToggle">
                                <div class="toggle-slider"></div>
                            </div>
                            <span class="toggle-label">Open</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Dashboard Grid -->
        <div class="dashboard-grid">
            <!-- Restaurant Info Section -->
            <div class="section">
                <h2>Restaurant Information</h2>
                <div class="info-grid">
                    <div class="info-item">
                        <label>Restaurant Name:</label>
                        <input type="text" id="resName" value="<%= request.getAttribute("resName") != null ? request.getAttribute("resName") : "Delicious Bites Restaurant" %>" disabled>
                    </div>
                    <div class="info-item">
                        <label>Owner Name:</label>
                        <input type="text" id="ownername" value="<%= request.getAttribute("ownername") != null ? request.getAttribute("ownername") : "John Doe" %>" disabled>
                    </div>
                    <div class="info-item">
                        <label>Phone Number:</label>
                        <input type="tel" id="phoneNumber" value="<%= request.getAttribute("phoneNumber") != null ? request.getAttribute("phoneNumber") : "+1 (555) 123-4567" %>" disabled>
                    </div>
                    <div class="info-item">
                        <label>FSSAI Number:</label>
                        <input type="text" id="fssaiNo" value="<%= request.getAttribute("fssaiNo") != null ? request.getAttribute("fssaiNo") : "12345678901234" %>" disabled>
                    </div>
                    <div class="info-item">
                        <label>Opening Time:</label>
                        <input type="time" id="openingTime" value="<%= request.getAttribute("openingTime") != null ? request.getAttribute("openingTime") : "09:00" %>" disabled>
                    </div>
                    <div class="info-item">
                        <label>Closing Time:</label>
                        <input type="time" id="closingTime" value="<%= request.getAttribute("closingTime") != null ? request.getAttribute("closingTime") : "22:00" %>" disabled>
                    </div>
                    <div class="info-item" style="grid-column: 1 / -1;">
                        <label>Profile Image URL:</label>
                        <input type="url" id="profileImageUrl" value="<%= request.getAttribute("profileImageUrl") != null ? request.getAttribute("profileImageUrl") : "" %>" disabled placeholder="https://example.com/restaurant-image.jpg">
                    </div>
                </div>
                
                <!-- Address Section -->
                <div style="margin-top: 20px;">
                    <h3 style="color: #333; margin-bottom: 15px; font-size: 1.1em;">Address Details</h3>
                    <div class="address-grid">
                        <div class="info-item">
                            <label>Address Line:</label>
                            <input type="text" id="addLine" value="<%= request.getAttribute("addLine") != null ? request.getAttribute("addLine") : "123 Food Street" %>" disabled>
                        </div>
                        <div class="info-item">
                            <label>City:</label>
                            <input type="text" id="city" value="<%= request.getAttribute("city") != null ? request.getAttribute("city") : "Taste City" %>" disabled>
                        </div>
                        <div class="info-item">
                            <label>State:</label>
                            <input type="text" id="state" value="<%= request.getAttribute("state") != null ? request.getAttribute("state") : "TC" %>" disabled>
                        </div>
                        <div class="info-item">
                            <label>Pincode:</label>
                            <input type="text" id="pincode" value="<%= request.getAttribute("pincode") != null ? request.getAttribute("pincode") : "12345" %>" disabled>
                        </div>
                    </div>
                </div>
                <div class="action-buttons">
                    <button id="editInfoBtn" class="btn btn-primary">Edit Info</button>
                    <button id="saveInfoBtn" class="btn btn-success" style="display: none;">Save Changes</button>
                    <button id="cancelEditBtn" class="btn btn-danger" style="display: none;">Cancel</button>
                </div>
            </div>

            <!-- Menu Management Section -->
            <div class="section">
                <h2>Menu Management</h2>
                <button class="btn btn-success" onclick="openAddItemModal()">Add New Item</button>
                <table class="table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Item Name</th>
                            <th>Description</th>
                            <th>Price</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody id="menuTable">
                        <tr>
                            <td>1</td>
                            <td>Margherita Pizza</td>
                            <td>Fresh tomatoes, mozzarella, basil</td>
                            <td>$12</td>
                            <td>
                                <button class="btn btn-primary btn-small" onclick="editMenuItem(1)">Edit</button>
                                <button class="btn btn-danger btn-small" onclick="deleteMenuItem(1)">Delete</button>
                            </td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>Caesar Salad</td>
                            <td>Crisp romaine lettuce with Caesar dressing</td>
                            <td>$8</td>
                            <td>
                                <button class="btn btn-primary btn-small" onclick="editMenuItem(2)">Edit</button>
                                <button class="btn btn-danger btn-small" onclick="deleteMenuItem(2)">Delete</button>
                            </td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td>Chicken Alfredo</td>
                            <td>Creamy pasta with grilled chicken</td>
                            <td>$15</td>
                            <td>
                                <button class="btn btn-primary btn-small" onclick="editMenuItem(3)">Edit</button>
                                <button class="btn btn-danger btn-small" onclick="deleteMenuItem(3)">Delete</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <!-- Orders Section -->
            <div class="section full-width">
                <h2>Recent Orders</h2>
                <table class="table">
                    <thead>
                        <tr>
                            <th>Order ID</th>
                            <th>Customer</th>
                            <th>Items</th>
                            <th>Total</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>#1001</td>
                            <td>John Smith</td>
                            <td>Margherita Pizza x1, Caesar Salad x1</td>
                            <td>$21.98</td>
                            <td><span class="order-status status-preparing">Preparing</span></td>
                            <td>
                                <select onchange="updateOrderStatus(1001, this.value)">
                                    <option value="pending">Pending</option>
                                    <option value="preparing" selected>Preparing</option>
                                    <option value="out-for-delivery">Out for Delivery</option>
                                    <option value="delivered">Delivered</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>#1002</td>
                            <td>Sarah Johnson</td>
                            <td>Chicken Alfredo x2</td>
                            <td>$31.98</td>
                            <td><span class="order-status status-out-for-delivery">Out for Delivery</span></td>
                            <td>
                                <select onchange="updateOrderStatus(1002, this.value)">
                                    <option value="pending">Pending</option>
                                    <option value="preparing">Preparing</option>
                                    <option value="out-for-delivery" selected>Out for Delivery</option>
                                    <option value="delivered">Delivered</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>#1003</td>
                            <td>Mike Davis</td>
                            <td>Margherita Pizza x2, Caesar Salad x2</td>
                            <td>$43.96</td>
                            <td><span class="order-status status-delivered">Delivered</span></td>
                            <td>
                                <select onchange="updateOrderStatus(1003, this.value)">
                                    <option value="pending">Pending</option>
                                    <option value="preparing">Preparing</option>
                                    <option value="out-for-delivery">Out for Delivery</option>
                                    <option value="delivered" selected>Delivered</option>
                                </select>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <!-- Reviews Section -->
            <div class="section full-width">
                <h2>Customer Reviews</h2>
                <div class="reviews-container">
                    <div class="review-item" style="border-bottom: 1px solid #eee; padding: 15px 0;">
                        <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 10px;">
                            <strong>Emma Wilson</strong>
                            <div>
                                <span class="stars">★★★★★</span>
                                <small style="color: #666; margin-left: 10px;">2 hours ago</small>
                            </div>
                        </div>
                        <p style="color: #555;">Absolutely delicious! The Margherita pizza was perfect and delivered hot. Will definitely order again!</p>
                    </div>
                    <div class="review-item" style="border-bottom: 1px solid #eee; padding: 15px 0;">
                        <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 10px;">
                            <strong>David Brown</strong>
                            <div>
                                <span class="stars">★★★★☆</span>
                                <small style="color: #666; margin-left: 10px;">1 day ago</small>
                            </div>
                        </div>
                        <p style="color: #555;">Great food quality. The Chicken Alfredo was creamy and flavorful. Delivery was a bit slow but worth the wait.</p>
                    </div>
                    <div class="review-item" style="padding: 15px 0;">
                        <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 10px;">
                            <strong>Lisa Anderson</strong>
                            <div>
                                <span class="stars">★★★★★</span>
                                <small style="color: #666; margin-left: 10px;">3 days ago</small>
                            </div>
                        </div>
                        <p style="color: #555;">Excellent service and amazing food! The Caesar salad was fresh and the portions were generous. Highly recommended!</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="footer">
        <div class="footer-content">
            <div class="footer-logo">
                Zayka<span>@Door</span>
            </div>
            
            <div class="footer-links">
                <a href="/about">About Us</a>
                <a href="/privacy">Privacy Policy</a>
                <a href="/terms">Terms of Service</a>
                <a href="/help">Help Center</a>
                <a href="/careers">Careers</a>
            </div>
            
            <div class="footer-contact">
                <p>Contact us for support and inquiries</p>
                <p>Email: <a href="mailto:support@zaykadoor.com">support@zaykadoor.com</a></p>
                <p>Phone: <a href="tel:+1-800-ZAYKA-DOOR">+1 (800) ZAYKA-DOOR</a></p>
            </div>
            
            <div class="footer-copyright">
                <p>&copy; 2025 Zayka@Door. All rights reserved. | Bringing delicious food to your doorstep.</p>
            </div>
        </div>
    </footer>

    <!-- Add/Edit Menu Item Modal -->
    <div id="menuItemModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeMenuItemModal()">&times;</span>
            <h2 id="modalTitle">Add New Menu Item</h2>
            <form id="menuItemForm">
                <div class="form-group">
                    <label for="itemId">Item ID:</label>
                    <input type="number" id="itemId" name="itemId" readonly style="background-color: #f8f9fa;">
                </div>
                <div class="form-group">
                    <label for="itemName">Item Name:</label>
                    <input type="text" id="itemName" name="itemName" required>
                </div>
                <div class="form-group">
                    <label for="itemDesc">Description:</label>
                    <textarea id="itemDesc" name="itemDesc" required></textarea>
                </div>
                <div class="form-group">
                    <label for="itemPrice">Price ($):</label>
                    <input type="number" id="itemPrice" name="itemPrice" min="0" required>
                </div>
                <div class="form-group">
                    <label for="itemImgURL">Image URL:</label>
                    <input type="url" id="itemImgURL" name="itemImgURL" placeholder="https://example.com/image.jpg">
                </div>
                <div class="action-buttons">
                    <button type="submit" class="btn btn-success">Save Item</button>
                    <button type="button" class="btn btn-danger" onclick="closeMenuItemModal()">Cancel</button>
                </div>
            </form>
        </div>
    </div>

    <script>
	 // Fixed JavaScript for Restaurant Dashboard Edit Functionality
	
	 // Get phone number from model attribute
	 const phoneNumber = '<%= request.getAttribute("phoneNumber") %>';
	
	 // Restaurant status toggle with slider
	 let isOpen = true;
	
	 document.getElementById('statusToggle').addEventListener('click', function() {
	     const statusBadge = document.getElementById('statusBadge');
	     const toggleSwitch = document.getElementById('statusToggle');
	     
	     if (isOpen) {
	         statusBadge.textContent = 'Closed';
	         statusBadge.className = 'status-badge status-closed';
	         toggleSwitch.classList.remove('active');
	         isOpen = false;
	     } else {
	         statusBadge.textContent = 'Open';
	         statusBadge.className = 'status-badge status-open';
	         toggleSwitch.classList.add('active');
	         isOpen = true;
	     }
	 });
	
	 // Restaurant info editing
	 let isEditing = false;
	 let originalValues = {};
	
	 document.getElementById('editInfoBtn').addEventListener('click', function() {
	     const inputs = ['resName', 'ownername', 'phoneNumber', 'fssaiNo', 'openingTime', 'closingTime', 'profileImageUrl', 'addLine', 'city', 'state', 'pincode'];
	     
	     // Store original values
	     inputs.forEach(id => {
	         const element = document.getElementById(id);
	         if (element) {
	             originalValues[id] = element.value;
	             element.disabled = false;
	             element.style.backgroundColor = '#fff'; // Make it clear it's editable
	         }
	     });
	     
	     document.getElementById('editInfoBtn').style.display = 'none';
	     document.getElementById('saveInfoBtn').style.display = 'inline-block';
	     document.getElementById('cancelEditBtn').style.display = 'inline-block';
	     isEditing = true;
	 });
	
	 document.getElementById('saveInfoBtn').addEventListener('click', function() {
	     // Validate required fields
	     const requiredFields = ['resName', 'ownername', 'fssaiNo', 'addLine', 'city', 'state', 'pincode'];
	     let isValid = true;
	     
	     requiredFields.forEach(fieldId => {
	         const element = document.getElementById(fieldId);
	         if (element && !element.value.trim()) {
	             element.style.borderColor = '#dc3545';
	             isValid = false;
	         } else if (element) {
	             element.style.borderColor = '';
	         }
	     });
	     
	     if (!isValid) {
	         alert('Please fill in all required fields.');
	         return;
	     }
	     
	     // Validate time format
	     const openingTime = document.getElementById('openingTime').value;
	     const closingTime = document.getElementById('closingTime').value;
	     
	     if (openingTime && !openingTime.match(/^([01]?[0-9]|2[0-3]):[0-5][0-9]$/)) {
	         alert('Invalid opening time format. Please use HH:MM format.');
	         return;
	     }
	     
	     if (closingTime && !closingTime.match(/^([01]?[0-9]|2[0-3]):[0-5][0-9]$/)) {
	         alert('Invalid closing time format. Please use HH:MM format.');
	         return;
	     }
	     
	     // Create form and submit
	     const form = document.createElement('form');
	     form.method = 'POST';
	     form.action = window.location.pathname; // Use current path
	     
	     // Add all input values as hidden fields
	     const inputIds = ['resName', 'ownername', 'fssaiNo', 'addLine', 'city', 'state', 'pincode', 'profileImageUrl', 'openingTime', 'closingTime'];
	     inputIds.forEach(inputId => {
	         const input = document.getElementById(inputId);
	         if (input) {
	             const hiddenInput = document.createElement('input');
	             hiddenInput.type = 'hidden';
	             hiddenInput.name = inputId;
	             hiddenInput.value = input.value.trim();
	             form.appendChild(hiddenInput);
	         }
	     });
	     
	     // Add phone number as hidden field
	     const phoneInput = document.createElement('input');
	     phoneInput.type = 'hidden';
	     phoneInput.name = 'phoneNumber';
	     phoneInput.value = phoneNumber;
	     form.appendChild(phoneInput);
	     
	     document.body.appendChild(form);
	     form.submit();
	 });
	
	 document.getElementById('cancelEditBtn').addEventListener('click', function() {
	     const inputs = ['resName', 'ownername', 'phoneNumber', 'fssaiNo', 'openingTime', 'closingTime', 'profileImageUrl', 'addLine', 'city', 'state', 'pincode'];
	     
	     // Restore original values
	     inputs.forEach(id => {
	         const element = document.getElementById(id);
	         if (element && originalValues[id] !== undefined) {
	             element.value = originalValues[id];
	             element.style.borderColor = '';
	         }
	     });
	     
	     finishEditing();
	 });
	
	 function finishEditing() {
	     const inputs = ['resName', 'ownername', 'phoneNumber', 'fssaiNo', 'openingTime', 'closingTime', 'profileImageUrl', 'addLine', 'city', 'state', 'pincode'];
	     
	     inputs.forEach(id => {
	         const element = document.getElementById(id);
	         if (element) {
	             element.disabled = true;
	             element.style.backgroundColor = '#f7f7f7'; // Disabled appearance
	         }
	     });
	     
	     document.getElementById('editInfoBtn').style.display = 'inline-block';
	     document.getElementById('saveInfoBtn').style.display = 'none';
	     document.getElementById('cancelEditBtn').style.display = 'none';
	     isEditing = false;
	 }
	
	 // Menu item management
	 let nextMenuItemId = 4; // For generating new IDs in demo
	
	 function openAddItemModal() {
	     document.getElementById('modalTitle').textContent = 'Add New Menu Item';
	     document.getElementById('menuItemForm').reset();
	     document.getElementById('itemId').value = nextMenuItemId;
	     document.getElementById('menuItemModal').style.display = 'block';
	 }
	
	 function closeMenuItemModal() {
	     document.getElementById('menuItemModal').style.display = 'none';
	 }
	
	 function editMenuItem(id) {
	     // In a real application, you would fetch the item data from the server
	     document.getElementById('modalTitle').textContent = 'Edit Menu Item';
	     document.getElementById('menuItemModal').style.display = 'block';
	     
	     // Mock data population for demonstration
	     if (id === 1) {
	         document.getElementById('itemId').value = '1';
	         document.getElementById('itemName').value = 'Margherita Pizza';
	         document.getElementById('itemDesc').value = 'Fresh tomatoes, mozzarella, basil';
	         document.getElementById('itemPrice').value = '12';
	         document.getElementById('itemImgURL').value = 'https://example.com/margherita.jpg';
	     } else if (id === 2) {
	         document.getElementById('itemId').value = '2';
	         document.getElementById('itemName').value = 'Caesar Salad';
	         document.getElementById('itemDesc').value = 'Crisp romaine lettuce with Caesar dressing';
	         document.getElementById('itemPrice').value = '8';
	         document.getElementById('itemImgURL').value = 'https://example.com/caesar.jpg';
	     } else if (id === 3) {
	         document.getElementById('itemId').value = '3';
	         document.getElementById('itemName').value = 'Chicken Alfredo';
	         document.getElementById('itemDesc').value = 'Creamy pasta with grilled chicken';
	         document.getElementById('itemPrice').value = '15';
	         document.getElementById('itemImgURL').value = 'https://example.com/alfredo.jpg';
	     }
	 }
	
	 function deleteMenuItem(id) {
	     if (confirm('Are you sure you want to delete this menu item?')) {
	         alert('Menu item deleted successfully!');
	         // Here you would normally send a delete request to the server
	     }
	 }
	
	 document.getElementById('menuItemForm').addEventListener('submit', function(e) {
	     e.preventDefault();
	     const isEditingItem = document.getElementById('modalTitle').textContent === 'Edit Menu Item';
	     
	     if (isEditingItem) {
	         alert('Menu item updated successfully!');
	     } else {
	         alert('Menu item added successfully!');
	         nextMenuItemId++; // Increment for next new item
	     }
	     
	     closeMenuItemModal();
	 });
	
	 // Order status update
	 function updateOrderStatus(orderId, newStatus) {
	     // Find the row containing the order ID
	     const rows = document.querySelectorAll('tbody tr');
	     rows.forEach(row => {
	         const orderIdCell = row.querySelector('td:first-child');
	         if (orderIdCell && orderIdCell.textContent === `#${orderId}`) {
	             const statusElement = row.querySelector('.order-status');
	             if (statusElement) {
	                 statusElement.className = `order-status status-${newStatus}`;
	                 statusElement.textContent = newStatus.charAt(0).toUpperCase() + newStatus.slice(1).replace('-', ' ');
	             }
	         }
	     });
	     alert(`Order #${orderId} status updated to: ${newStatus.replace('-', ' ')}`);
	 }
	
	 // Close modal when clicking outside of it
	 window.addEventListener('click', function(event) {
	     const modal = document.getElementById('menuItemModal');
	     if (event.target === modal) {
	         closeMenuItemModal();
	     }
	 });
	
	 // Handle URL parameters for success/error messages
	 document.addEventListener('DOMContentLoaded', function() {
	     const urlParams = new URLSearchParams(window.location.search);
	     
	     if (urlParams.get('success') === 'true') {
	         alert('Restaurant information updated successfully!');
	         // Remove the success parameter from URL
	         window.history.replaceState({}, document.title, window.location.pathname);
	     }
	     
	     if (urlParams.get('error')) {
	         const error = urlParams.get('error');
	         if (error === 'invalidOpeningTime') {
	             alert('Invalid opening time format. Please use HH:mm format.');
	         } else if (error === 'invalidClosingTime') {
	             alert('Invalid closing time format. Please use HH:mm format.');
	         } else {
	             alert('An error occurred: ' + error);
	         }
	         // Remove the error parameter from URL
	         window.history.replaceState({}, document.title, window.location.pathname);
	     }
	     
	     // Initialize the form state
	     finishEditing();
	 });
    </script>
</body>
</html>