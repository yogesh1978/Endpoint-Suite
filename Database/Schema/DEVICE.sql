CREATE TABLE devices (
    device_id            NUMBER(10) GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    device_name          VARCHAR2(100) NOT NULL,
    device_type          VARCHAR2(50) NOT NULL,
    serial_number        VARCHAR2(100) UNIQUE NOT NULL,
    purchase_date        DATE DEFAULT SYSDATE NOT NULL,
    warranty_expiry_date DATE,
    manufacturer_name    VARCHAR2(100),
    model_number         VARCHAR2(50),
    firmware_version     VARCHAR2(50),
    ip_address           VARCHAR2(15) CHECK (REGEXP_LIKE(ip_address, '^([0-9]{1,3}\.){3}[0-9]{1,3}$')),
    mac_address          VARCHAR2(17) CHECK (REGEXP_LIKE(mac_address, '^([0-9A-Fa-f]{2}:){5}[0-9A-Fa-f]{2}$')),
    status               VARCHAR2(20) CHECK (status IN ('active', 'inactive', 'retired', 'faulty')),
    location             VARCHAR2(100),
    last_service_date    DATE,
    service_contract_id  NUMBER(10),
    asset_tag            VARCHAR2(50),
    device_photo         BLOB,
    device_manual        CLOB,
    storage_capacity     NUMBER(12, 2),  -- Capacity in GB
    memory_capacity      NUMBER(12, 2),  -- Memory in GB
    processor_type       VARCHAR2(100),
    os_version           VARCHAR2(50),
    battery_life         NUMBER(5, 2),  -- Battery life in hours
    is_virtual           CHAR(1) DEFAULT 'N' CHECK (is_virtual IN ('Y', 'N')),
    network_bandwidth    NUMBER(10, 2) CHECK (network_bandwidth >= 0), -- in Mbps

    -- Constraints on columns
    CONSTRAINT ck_warranty_dates CHECK (warranty_expiry_date > purchase_date),
   
    -- Ensure serial numbers are unique across device types
    CONSTRAINT uq_device_serial UNIQUE (serial_number, device_type)
)
PARTITION BY RANGE (purchase_date) (
    PARTITION p_before_2020 VALUES LESS THAN (TO_DATE('01-JAN-2020', 'DD-MON-YYYY')),
    PARTITION p_2020_2022 VALUES LESS THAN (TO_DATE('01-JAN-2023', 'DD-MON-YYYY')),
    PARTITION p_after_2022 VALUES LESS THAN (MAXVALUE)
);
/
-- Create indexes
CREATE INDEX idx_device_name ON devices (device_name) TABLESPACE users ONLINE;
CREATE INDEX idx_location ON devices (location) TABLESPACE users ONLINE;