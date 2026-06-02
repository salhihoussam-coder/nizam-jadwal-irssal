-- قاعدة بيانات نظام تسيير جدول الإرسال
CREATE DATABASE IF NOT EXISTS nizam_jadwal_irssal;
USE nizam_jadwal_irssal;

-- جدول المستخدمين
CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role ENUM('admin', 'secretary') DEFAULT 'secretary',
    status ENUM('active', 'inactive') DEFAULT 'active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- جدول المراسلات
CREATE TABLE correspondences (
    id INT PRIMARY KEY AUTO_INCREMENT,
    registration_number VARCHAR(50) UNIQUE NOT NULL,
    date DATE NOT NULL,
    subject VARCHAR(255) NOT NULL,
    recipient VARCHAR(100) NOT NULL,
    attachments_count INT DEFAULT 0,
    archive_number VARCHAR(50),
    notes TEXT,
    attachment_file VARCHAR(255),
    created_by INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    status ENUM('active', 'archived') DEFAULT 'active',
    FOREIGN KEY (created_by) REFERENCES users(id)
);

-- إدراج بيانات الاختبار
INSERT INTO users (name, username, email, password, role) VALUES
('مدير المتوسطة', 'admin', 'admin@school.dz', '$2y$10$WXgNlKKSK.n4l2L.z8H9Se/9gWb3K2WZN5n6p7Q8r9S0t1U2v3W4x', 'admin'),
('موظف الأمانة', 'secretary1', 'secretary@school.dz', '$2y$10$WXgNlKKSK.n4l2L.z8H9Se/9gWb3K2WZN5n6p7Q8r9S0t1U2v3W4x', 'secretary');
