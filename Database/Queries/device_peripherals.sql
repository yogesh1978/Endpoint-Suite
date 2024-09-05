CREATE TABLE device_peripherals (
    peripheral_id       NUMBER(10) GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    peripheral_name     VARCHAR2(100) NOT NULL,
    device_id           NUMBER(10) NOT NULL,
    peripheral_type     VARCHAR2(50),
    manufacturer        VARCHAR2(100),
    model_number        VARCHAR2(50),
    serial_number       VARCHAR2(100) UNIQUE NOT NULL,
    purchase_date       DATE DEFAULT SYSDATE,
    warranty_expiry     DATE,
    installation_date   DATE,
    notes               CLOB,  -- Large text data
    is_active           CHAR(1) DEFAULT 'Y' CHECK (is_active IN ('Y', 'N')),
    peripheral_data     XMLTYPE,  -- XML data type
 
    -- Foreign Key constraint
    CONSTRAINT fk_device
        FOREIGN KEY (device_id)
        REFERENCES DEVICES(device_id)
);