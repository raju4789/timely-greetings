-- Create the customer table
CREATE TABLE IF NOT EXISTS customer (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255),
    date_of_birth DATE,
    time_zone VARCHAR(255)
);

-- Insert sample customer data
-- Covers all time zones listed in the configuration
INSERT INTO customer (id, name, email, date_of_birth, time_zone) VALUES
(1, 'Alice', 'narasimha4789@gmail.com', DATEADD('DAY', 1, CURRENT_DATE), 'Etc/GMT+12'),               -- UTC-12
(2, 'Bob', 'narasimha4789@gmail.com', DATEADD('DAY', 1, CURRENT_DATE), 'Pacific/Kwajalein'),            -- UTC-12
(3, 'Charlie', 'narasimha4789@gmail.com', DATEADD('DAY', 1, CURRENT_DATE), 'Pacific/Efate'),            -- UTC-11
(4, 'Diana', 'narasimha4789@gmail.com', DATEADD('DAY', 1, CURRENT_DATE), 'Pacific/Apia'),               -- UTC-11
(5, 'Edward', 'narasimha4789@gmail.com', DATEADD('DAY', 1, CURRENT_DATE), 'Pacific/Niue'),              -- UTC-11
(6, 'Fiona', 'narasimha4789@gmail.com', DATEADD('DAY', 1, CURRENT_DATE), 'Pacific/Pago_Pago'),         -- UTC-11
(7, 'George', 'narasimha4789@gmail.com', DATEADD('DAY', 1, CURRENT_DATE), 'Etc/GMT+10'),               -- UTC-10
(8, 'Hannah', 'narasimha4789@gmail.com', DATEADD('DAY', 1, CURRENT_DATE), 'Pacific/Honolulu'),         -- UTC-10
(9, 'Ian', 'narasimha4789@gmail.com', DATEADD('DAY', 1, CURRENT_DATE), 'Pacific/Johnston'),            -- UTC-10
(10, 'Jack', 'narasimha4789@gmail.com', DATEADD('DAY', 1, CURRENT_DATE), 'Pacific/Rarotonga'),         -- UTC-10
(11, 'Karen', 'narasimha4789@gmail.com', DATEADD('DAY', 1, CURRENT_DATE), 'Etc/GMT+9'),                -- UTC-9
(12, 'Liam', 'narasimha4789@gmail.com', DATEADD('DAY', 1, CURRENT_DATE), 'America/Anchorage'),         -- UTC-9
(13, 'Mia', 'narasimha4789@gmail.com', DATEADD('DAY', 1, CURRENT_DATE), 'America/Los_Angeles'),        -- UTC-8
(14, 'Noah', 'narasimha4789@gmail.com', DATEADD('DAY', 1, CURRENT_DATE), 'America/Tijuana'),           -- UTC-8
(15, 'Olivia', 'narasimha4789@gmail.com', DATEADD('DAY', 1, CURRENT_DATE), 'America/Vancouver'),       -- UTC-8
(16, 'Paul', 'narasimha4789@gmail.com', DATEADD('DAY', 1, CURRENT_DATE), 'Etc/GMT+8'),                 -- UTC-8
(17, 'Quinn', 'narasimha4789@gmail.com', DATEADD('DAY', 1, CURRENT_DATE), 'America/Denver'),           -- UTC-7
(18, 'Ryan', 'narasimha4789@gmail.com', DATEADD('DAY', 1, CURRENT_DATE), 'America/Phoenix'),           -- UTC-7
(19, 'Sophia', 'narasimha4789@gmail.com', DATEADD('DAY', 1, CURRENT_DATE), 'Etc/GMT+7'),               -- UTC-7
(20, 'Thomas', 'narasimha4789@gmail.com', DATEADD('DAY', 1, CURRENT_DATE), 'America/Chicago'),         -- UTC-6
(21, 'Uma', 'narasimha4789@gmail.com', DATEADD('DAY', 1, CURRENT_DATE), 'America/Mexico_City'),        -- UTC-6
(22, 'Victoria', 'narasimha4789@gmail.com', DATEADD('DAY', 1, CURRENT_DATE), 'America/Regina'),        -- UTC-6
(23, 'William', 'narasimha4789@gmail.com', DATEADD('DAY', 1, CURRENT_DATE), 'Etc/GMT+6'),              -- UTC-6
(24, 'Xander', 'narasimha4789@gmail.com', DATEADD('DAY', 1, CURRENT_DATE), 'America/New_York'),        -- UTC-5
(25, 'Yara', 'narasimha4789@gmail.com', DATEADD('DAY', 1, CURRENT_DATE), 'America/Toronto'),           -- UTC-5
(26, 'Zane', 'narasimha4789@gmail.com', DATEADD('DAY', 1, CURRENT_DATE), 'America/Houston'),          -- UTC-5
(27, 'Adam', 'narasimha4789@gmail.com', DATEADD('DAY', 1, CURRENT_DATE), 'Etc/GMT+5'),                -- UTC-5
(28, 'Bella', 'narasimha4789@gmail.com', DATEADD('DAY', 1, CURRENT_DATE), 'America/Bogota'),           -- UTC-4
(29, 'Cora', 'narasimha4789@gmail.com', DATEADD('DAY', 1, CURRENT_DATE), 'America/Lima'),             -- UTC-4
(30, 'Derek', 'narasimha4789@gmail.com', DATEADD('DAY', 1, CURRENT_DATE), 'America/Caracas'),         -- UTC-4
(31, 'Ella', 'narasimha4789@gmail.com', DATEADD('DAY', 1, CURRENT_DATE), 'Etc/GMT+4'),                -- UTC-4
(32, 'Finn', 'narasimha4789@gmail.com', DATEADD('DAY', 1, CURRENT_DATE), 'America/Argentina/Buenos_Aires'), -- UTC-3
(33, 'Grace', 'narasimha4789@gmail.com', DATEADD('DAY', 1, CURRENT_DATE), 'America/Sao_Paulo'),       -- UTC-3
(34, 'Harry', 'narasimha4789@gmail.com', DATEADD('DAY', 1, CURRENT_DATE), 'America/Guyana'),          -- UTC-3
(35, 'Ivy', 'narasimha4789@gmail.com', DATEADD('DAY', 1, CURRENT_DATE), 'Etc/GMT+3'),                 -- UTC-3
(36, 'Jackie', 'narasimha4789@gmail.com', DATEADD('DAY', 1, CURRENT_DATE), 'Atlantic/Bermuda'),       -- UTC-2
(37, 'Kara', 'narasimha4789@gmail.com', DATEADD('DAY', 1, CURRENT_DATE), 'Etc/GMT+2'),                -- UTC-2
(38, 'Leo', 'narasimha4789@gmail.com', DATEADD('DAY', 1, CURRENT_DATE), 'Atlantic/Azores'),           -- UTC-1
(39, 'Mason', 'narasimha4789@gmail.com', DATEADD('DAY', 1, CURRENT_DATE), 'Atlantic/Cape_Verde'),     -- UTC-1
(40, 'Nina', 'narasimha4789@gmail.com', DATEADD('DAY', 1, CURRENT_DATE), 'Etc/GMT+1'),                -- UTC+0
(41, 'Oscar', 'narasimha4789@gmail.com', DATEADD('DAY', 1, CURRENT_DATE), 'Europe/London'),           -- UTC+0
(42, 'Penny', 'narasimha4789@gmail.com', DATEADD('DAY', 1, CURRENT_DATE), 'Europe/Dublin'),           -- UTC+1
(43, 'Quincy', 'narasimha4789@gmail.com', DATEADD('DAY', 1, CURRENT_DATE), 'Europe/Paris'),           -- UTC+2
(44, 'Rita', 'narasimha4789@gmail.com', DATEADD('DAY', 1, CURRENT_DATE), 'Europe/Berlin'),           -- UTC+2
(45, 'Sam', 'narasimha4789@gmail.com', DATEADD('DAY', 1, CURRENT_DATE), 'Europe/Madrid'),             -- UTC+2
(46, 'Tina', 'narasimha4789@gmail.com', DATEADD('DAY', 1, CURRENT_DATE), 'Europe/Rome'),             -- UTC+2
(47, 'Uma', 'narasimha4789@gmail.com', DATEADD('DAY', 1, CURRENT_DATE), 'Europe/Amsterdam'),         -- UTC+2
(48, 'Victor', 'narasimha4789@gmail.com', DATEADD('DAY', 1, CURRENT_DATE), 'Europe/Oslo'),            -- UTC+2
(49, 'William', 'narasimha4789@gmail.com', DATEADD('DAY', 1, CURRENT_DATE), 'Europe/Stockholm'),      -- UTC+2
(50, 'Xander', 'narasimha4789@gmail.com', DATEADD('DAY', 1, CURRENT_DATE), 'Europe/Vienna'),          -- UTC+2
(51, 'Yara', 'narasimha4789@gmail.com', DATEADD('DAY', 1, CURRENT_DATE), 'Europe/Warsaw'),           -- UTC+2
(52, 'Zane', 'narasimha4789@gmail.com', DATEADD('DAY', 1, CURRENT_DATE), 'Europe/Moscow'),           -- UTC+3
(53, 'Adam', 'narasimha4789@gmail.com', DATEADD('DAY', 1, CURRENT_DATE), 'Africa/Nairobi'),          -- UTC+3
(54, 'Bella', 'narasimha4789@gmail.com', DATEADD('DAY', 1, CURRENT_DATE), 'Asia/Baghdad'),           -- UTC+3
(55, 'Cora', 'narasimha4789@gmail.com', DATEADD('DAY', 1, CURRENT_DATE), 'Asia/Riyadh'),            -- UTC+3
(56, 'Derek', 'narasimha4789@gmail.com', DATEADD('DAY', 1, CURRENT_DATE), 'Asia/Dubai'),             -- UTC+4
(57, 'Ella', 'narasimha4789@gmail.com', DATEADD('DAY', 1, CURRENT_DATE), 'Asia/Baku'),              -- UTC+4
(58, 'Finn', 'narasimha4789@gmail.com', DATEADD('DAY', 1, CURRENT_DATE), 'Asia/Tbilisi'),            -- UTC+4
(59, 'Grace', 'narasimha4789@gmail.com', DATEADD('DAY', 1, CURRENT_DATE), 'Asia/Yerevan'),           -- UTC+4
(60, 'Harry', 'narasimha4789@gmail.com', DATEADD('DAY', 1, CURRENT_DATE), 'Asia/Kabul'),             -- UTC+4:30
(61, 'Ivy', 'narasimha4789@gmail.com', DATEADD('DAY', 1, CURRENT_DATE), 'Asia/Karachi'),            -- UTC+5
(62, 'Jackie', 'narasimha4789@gmail.com', DATEADD('DAY', 1, CURRENT_DATE), 'Asia/Tashkent'),         -- UTC+5
(63, 'Kara', 'narasimha4789@gmail.com', DATEADD('DAY', 1, CURRENT_DATE), 'Asia/Yekaterinburg'),      -- UTC+5
(64, 'Leo', 'narasimha4789@gmail.com', DATEADD('DAY', 1, CURRENT_DATE), 'Asia/Colombo'),            -- UTC+5:30
(65, 'Mason', 'narasimha4789@gmail.com', DATEADD('DAY', 1, CURRENT_DATE), 'Asia/Kolkata'),           -- UTC+5:30
(66, 'Nina', 'narasimha4789@gmail.com', DATEADD('DAY', 1, CURRENT_DATE), 'Asia/Calcutta'),           -- UTC+5:30
(67, 'Oscar', 'narasimha4789@gmail.com', DATEADD('DAY', 1, CURRENT_DATE), 'Asia/Dhaka'),             -- UTC+6
(68, 'Penny', 'narasimha4789@gmail.com', DATEADD('DAY', 1, CURRENT_DATE), 'Asia/Almaty'),            -- UTC+6
(69, 'Quincy', 'narasimha4789@gmail.com', DATEADD('DAY', 1, CURRENT_DATE), 'Asia/Bishkek'),           -- UTC+6
(70, 'Rita', 'narasimha4789@gmail.com', DATEADD('DAY', 1, CURRENT_DATE), 'Asia/Urumqi'),             -- UTC+6
(71, 'Sam', 'narasimha4789@gmail.com', DATEADD('DAY', 1, CURRENT_DATE), 'Asia/Kuala_Lumpur'),        -- UTC+8
(72, 'Tina', 'narasimha4789@gmail.com', DATEADD('DAY', 1, CURRENT_DATE), 'Asia/Singapore'),          -- UTC+8
(73, 'Uma', 'narasimha4789@gmail.com', DATEADD('DAY', 1, CURRENT_DATE), 'Asia/Hong_Kong'),           -- UTC+8
(74, 'Victor', 'narasimha4789@gmail.com', DATEADD('DAY', 1, CURRENT_DATE), 'Asia/Shanghai'),          -- UTC+8
(75, 'William', 'narasimha4789@gmail.com', DATEADD('DAY', 1, CURRENT_DATE), 'Asia/Taipei'),           -- UTC+8
(76, 'Xander', 'narasimha4789@gmail.com', DATEADD('DAY', 1, CURRENT_DATE), 'Australia/Sydney'),       -- UTC+10
(77, 'Yara', 'narasimha4789@gmail.com', DATEADD('DAY', 1, CURRENT_DATE), 'Australia/Brisbane'),       -- UTC+10
(78, 'Zane', 'narasimha4789@gmail.com', DATEADD('DAY', 1, CURRENT_DATE), 'Australia/Melbourne'),     -- UTC+10
(79, 'Adam', 'narasimha4789@gmail.com', DATEADD('DAY', 1, CURRENT_DATE), 'Australia/Adelaide'),       -- UTC+9:30
(80, 'Bella', 'narasimha4789@gmail.com', DATEADD('DAY', 1, CURRENT_DATE), 'Australia/Darwin'),        -- UTC+9:30
(81, 'Cora', 'narasimha4789@gmail.com', DATEADD('DAY', 1, CURRENT_DATE), 'Pacific/Norfolk'),          -- UTC+11
(82, 'Derek', 'narasimha4789@gmail.com', DATEADD('DAY', 1, CURRENT_DATE), 'Pacific/Funafuti'),        -- UTC+12
(83, 'Ella', 'narasimha4789@gmail.com', DATEADD('DAY', 1, CURRENT_DATE), 'Pacific/Fiji'),             -- UTC+12
(84, 'Finn', 'narasimha4789@gmail.com', DATEADD('DAY', 1, CURRENT_DATE), 'Pacific/Tarawa'),           -- UTC+12
(85, 'Grace', 'narasimha4789@gmail.com', DATEADD('DAY', 1, CURRENT_DATE), 'Pacific/Kiritimati');      -- UTC+14
