-- Group 7 Schema

-- 1. Lookup Tables (no FK dependencies)

CREATE TABLE status (
    statusId        INT PRIMARY KEY AUTO_INCREMENT,
    statusName      ENUM('Using', 'Under_maintenance', 'Available') NOT NULL
);

CREATE TABLE purpose (
    purposeId       INT PRIMARY KEY AUTO_INCREMENT,
    purposeName     VARCHAR(100) NOT NULL
);

CREATE TABLE equipment_type (
    equipmentTypeId       INT PRIMARY KEY AUTO_INCREMENT,
    typeName              VARCHAR(100) NOT NULL,
    description           VARCHAR(255),
    requiresPreparation   BOOLEAN NOT NULL DEFAULT FALSE,
    requiresOversight     BOOLEAN NOT NULL DEFAULT FALSE,
    usageFrequency        VARCHAR(50),
    capabilityDescription VARCHAR(255)
);

CREATE TABLE facility_type (
    facilityTypeId        INT PRIMARY KEY AUTO_INCREMENT,
    typeName              VARCHAR(100) NOT NULL,
    requiresTraining      BOOLEAN NOT NULL DEFAULT FALSE,
    requiresCertification BOOLEAN NOT NULL DEFAULT FALSE,
    intendedUseDuration   ENUM('short-term', 'long-term') NOT NULL,
    capabilityDescription VARCHAR(255)
);

CREATE TABLE institution (
    institutionId INT PRIMARY KEY AUTO_INCREMENT,
    name          VARCHAR(100) NOT NULL,
    type          VARCHAR(50) NOT NULL,
    emailDomain   VARCHAR(100)
);

CREATE TABLE occupation (
    occupationId   INT PRIMARY KEY AUTO_INCREMENT,
    occupationType ENUM('technical_staff', 'researcher') NOT NULL
);

CREATE TABLE application_result (
    resultId          INT PRIMARY KEY AUTO_INCREMENT,
    applicationResult VARCHAR(50) NOT NULL
);

CREATE TABLE charge_catogory (
    chargeCatogoryId INT PRIMARY KEY AUTO_INCREMENT,
    chargeCatogory   ENUM('equipment_charge', 'staff_support', 'material_cost') NOT NULL
);

CREATE TABLE funding_source (
    fundingSourceId INT PRIMARY KEY AUTO_INCREMENT,
    payerName       VARCHAR(100) NOT NULL,
    sourceType      VARCHAR(50) NOT NULL,
    sourceName      VARCHAR(100),
    startDate       DATE,
    endDate         DATE,
    totalBudget     DECIMAL(15,2),
    status          VARCHAR(50)
);

-- 2. Person & Authentication (Yellow)

CREATE TABLE person (
    personId      INT PRIMARY KEY AUTO_INCREMENT,
    institutionId INT NOT NULL,
    fullName      VARCHAR(100) NOT NULL,
    email         VARCHAR(100) NOT NULL,
    phone         VARCHAR(20),
    status        VARCHAR(50),
    occupationId  INT NOT NULL,
    FOREIGN KEY (institutionId) REFERENCES institution(institutionId),
    FOREIGN KEY (occupationId)  REFERENCES occupation(occupationId)
);

CREATE TABLE credential (
    credentialId      INT PRIMARY KEY AUTO_INCREMENT,
    personId          INT NOT NULL,
    issuerType        ENUM('home_institution', 'consortium') NOT NULL,
    provider          VARCHAR(100),
    externalSubjectId VARCHAR(255),
    status            VARCHAR(50),
    issuedAt          DATETIME,
    expiresAt         DATETIME,
    FOREIGN KEY (personId) REFERENCES person(personId)
);

-- 3. Facility & Maintenance (Red)

CREATE TABLE facility (
    facilityId     INT PRIMARY KEY AUTO_INCREMENT,
    name           VARCHAR(100) NOT NULL,
    facilityTypeId INT NOT NULL,
    purposeId      INT NOT NULL,
    statusId       INT NOT NULL,
    address        VARCHAR(255),
    FOREIGN KEY (facilityTypeId) REFERENCES facility_type(facilityTypeId),
    FOREIGN KEY (purposeId)      REFERENCES purpose(purposeId),
    FOREIGN KEY (statusId)       REFERENCES status(statusId)
);

CREATE TABLE equipment (
    equipmentId     INT PRIMARY KEY AUTO_INCREMENT,
    name            VARCHAR(100) NOT NULL,
    equipmentTypeId INT NOT NULL,
    facilityId      INT NOT NULL,
    statusId        INT NOT NULL,
    FOREIGN KEY (equipmentTypeId) REFERENCES equipment_type(equipmentTypeId),
    FOREIGN KEY (facilityId)      REFERENCES facility(facilityId),
    FOREIGN KEY (statusId)        REFERENCES status(statusId)
);

CREATE TABLE equipment_maintenance (
    activityId   INT PRIMARY KEY AUTO_INCREMENT,
    equipmentId  INT NOT NULL,
    activityType ENUM('maintenance', 'calibration', 'cleaning', 'inspection') NOT NULL,
    startTime    DATETIME NOT NULL,
    endTime      DATETIME,
    isScheduled  BOOLEAN NOT NULL DEFAULT FALSE,
    personId     INT NOT NULL,
    FOREIGN KEY (equipmentId) REFERENCES equipment(equipmentId),
    FOREIGN KEY (personId)    REFERENCES person(personId)
);

CREATE TABLE facility_maintenance (
    activityId   INT PRIMARY KEY AUTO_INCREMENT,
    facilityId   INT NOT NULL,
    activityType ENUM('maintenance', 'calibration', 'cleaning', 'inspection') NOT NULL,
    startTime    DATETIME NOT NULL,
    endTime      DATETIME,
    isScheduled  BOOLEAN NOT NULL DEFAULT FALSE,
    personId     INT NOT NULL,
    FOREIGN KEY (facilityId) REFERENCES facility(facilityId),
    FOREIGN KEY (personId)   REFERENCES person(personId)
);
 
-- 4. Application & Allocation (Blue)

CREATE TABLE experiment (
    experimentId INT PRIMARY KEY AUTO_INCREMENT,
    title        VARCHAR(200) NOT NULL,
    description  TEXT
);

CREATE TABLE experiment_phase (
    phaseId        INT NOT NULL,
    expId          INT NOT NULL,
    phaseStartdate DATE,
    phaseEnddate   DATE,
    PRIMARY KEY (phaseId, expId),
    FOREIGN KEY (expId) REFERENCES experiment(experimentId)
);

CREATE TABLE researcher_allocation (
    allocateId   INT PRIMARY KEY AUTO_INCREMENT,
    experimentId INT NOT NULL,
    personId     INT NOT NULL,
    FOREIGN KEY (experimentId) REFERENCES experiment(experimentId),
    FOREIGN KEY (personId)     REFERENCES person(personId)
);

CREATE TABLE application (
    applicationId       INT PRIMARY KEY AUTO_INCREMENT,
    personId            INT NOT NULL,
    experimentId        INT NOT NULL,
    submitTime          DATETIME NOT NULL,
    safetyConsideration TEXT,
    specialNote         TEXT,
    estimatedUsage      VARCHAR(100),
    estimatedOutcome    TEXT,
    equipmentId         INT NOT NULL,
    facilityId          INT NOT NULL,
    staffId             INT NOT NULL,
    FOREIGN KEY (personId)     REFERENCES person(personId),
    FOREIGN KEY (experimentId) REFERENCES experiment(experimentId),
    FOREIGN KEY (equipmentId)  REFERENCES equipment(equipmentId),
    FOREIGN KEY (facilityId)   REFERENCES facility(facilityId),
    FOREIGN KEY (staffId)      REFERENCES person(personId)
);

CREATE TABLE application_review (
    reviewId      INT PRIMARY KEY AUTO_INCREMENT,
    applicationId INT NOT NULL,
    resultId      INT,
    justification TEXT,
    FOREIGN KEY (applicationId) REFERENCES application(applicationId),
    FOREIGN KEY (resultId)      REFERENCES application_result(resultId)
);

CREATE TABLE acutal_alloccation (
    allocationId    INT PRIMARY KEY AUTO_INCREMENT,
    equipmentId     INT NOT NULL,
    actualStartdate DATE,
    actualEnddate   DATE,
    FOREIGN KEY (equipmentId) REFERENCES equipment(equipmentId)
);

-- 5. Billing & Payment (Purple)

CREATE TABLE usage_record (
    usageId      INT PRIMARY KEY AUTO_INCREMENT,
    allocationId INT NOT NULL,
    facilityId   INT NOT NULL,
    equipmentId  INT NOT NULL,
    startTime    DATETIME,
    endTime      DATETIME,
    quantity     VARCHAR(50),
    usageStatus  VARCHAR(50),
    credentialId INT NOT NULL,
    FOREIGN KEY (allocationId) REFERENCES acutal_alloccation(allocationId),
    FOREIGN KEY (facilityId)   REFERENCES facility(facilityId),
    FOREIGN KEY (equipmentId)  REFERENCES equipment(equipmentId),
    FOREIGN KEY (credentialId) REFERENCES credential(credentialId)
);

CREATE TABLE charge (
    chargeId         INT PRIMARY KEY AUTO_INCREMENT,
    usageId          INT NOT NULL,
    chargeCatogoryId INT NOT NULL,
    amount           DECIMAL(15,2) NOT NULL,
    personId         INT NOT NULL,
    FOREIGN KEY (usageId)          REFERENCES usage_record(usageId),
    FOREIGN KEY (chargeCatogoryId) REFERENCES charge_catogory(chargeCatogoryId),
    FOREIGN KEY (personId)         REFERENCES person(personId)
);

CREATE TABLE charge_allocation (
    chargeAllocationId INT PRIMARY KEY AUTO_INCREMENT,
    fundingSourceId    INT NOT NULL,
    chargeId           INT NOT NULL,
    allocationAmount   DECIMAL(15,2) NOT NULL,
    FOREIGN KEY (fundingSourceId) REFERENCES funding_source(fundingSourceId),
    FOREIGN KEY (chargeId)        REFERENCES charge(chargeId)
);

CREATE TABLE adjustment (
    adjustmentId   INT PRIMARY KEY AUTO_INCREMENT,
    chargeId       INT NOT NULL,
    adjustMentType ENUM('credit', 'surcharge') NOT NULL,
    amount         DECIMAL(15,2) NOT NULL,
    reasonCode     VARCHAR(50),
    FOREIGN KEY (chargeId) REFERENCES charge(chargeId)
);

CREATE TABLE payment (
    paymentId       INT PRIMARY KEY AUTO_INCREMENT,
    chargeId        INT NOT NULL,
    fundingSourceId INT NOT NULL,
    paidAt          DATETIME,
    method          VARCHAR(50),
    paidAmount      DECIMAL(15,2) NOT NULL,
    FOREIGN KEY (chargeId)        REFERENCES charge(chargeId),
    FOREIGN KEY (fundingSourceId) REFERENCES funding_source(fundingSourceId)
);
