 
-- Group 7 - INSERT Mock Data

-- 1. Lookup Tables

-- status (3 rows - as per ENUM)
INSERT INTO status (statusId, statusName) VALUES
(1, 'Using'),
(2, 'Under_maintenance'),
(3, 'Available');

-- purpose (10 rows)
INSERT INTO purpose (purposeId, purposeName) VALUES
(1, 'Research'),
(2, 'Teaching'),
(3, 'Clinical Trial'),
(4, 'Quality Control'),
(5, 'Prototyping'),
(6, 'Calibration Service'),
(7, 'Material Testing'),
(8, 'Data Collection'),
(9, 'Training'),
(10, 'Public Demonstration');

-- equipment_type (5 rows - matching user's 5 categories)
INSERT INTO equipment_type (equipmentTypeId, typeName, description, requiresPreparation, requiresOversight, usageFrequency, capabilityDescription) VALUES
(1, 'Analytical & Spectroscopy Instruments', 'Instruments for chemical and structural analysis', TRUE, TRUE, 'Daily', 'Mass spectrometry, NMR, XRD, HPLC'),
(2, 'Imaging & Microscopy Equipment', 'High-resolution imaging and microscopy devices', TRUE, TRUE, 'Daily', 'SEM, TEM, confocal, fMRI scanning'),
(3, 'Biological & Medical Equipment', 'Equipment for biological and medical research', TRUE, FALSE, 'Weekly', 'Flow cytometry, sequencing, centrifugation, bioprinting'),
(4, 'Fabrication & Engineering Equipment', 'Micro/nano fabrication and precision engineering', TRUE, TRUE, 'Weekly', 'Lithography, etching, deposition, CNC machining'),
(5, 'Large-Scale Physics & Testing', 'Large-scale physics experiments and environmental testing', TRUE, TRUE, 'Monthly', 'Beamline, high-power laser, environmental testing, wind tunnel');

-- facility_type (10 rows)
INSERT INTO facility_type (facilityTypeId, typeName, requiresTraining, requiresCertification, intendedUseDuration, capabilityDescription) VALUES
(1, 'Chemistry Lab', TRUE, TRUE, 'short-term', 'Chemical analysis and synthesis'),
(2, 'Cleanroom', TRUE, TRUE, 'short-term', 'Micro/nano fabrication in controlled environment'),
(3, 'Imaging Center', TRUE, FALSE, 'short-term', 'Microscopy and imaging services'),
(4, 'Biomedical Lab', TRUE, TRUE, 'long-term', 'Biological and medical experiments'),
(5, 'Physics Test Facility', TRUE, TRUE, 'long-term', 'Large-scale physics experiments'),
(6, 'Data Center', FALSE, FALSE, 'long-term', 'High-performance computing and storage'),
(7, 'Workshop', TRUE, FALSE, 'short-term', 'Mechanical fabrication and prototyping'),
(8, 'Environmental Testing Lab', TRUE, FALSE, 'short-term', 'Climate and stress testing'),
(9, 'General Research Lab', FALSE, FALSE, 'long-term', 'Multi-purpose research space'),
(10, 'Training Facility', FALSE, FALSE, 'short-term', 'Equipment training and certification');

-- institution (10 rows)
INSERT INTO institution (institutionId, name, type, emailDomain) VALUES
(1, 'MIT', 'university', 'mit.edu'),
(2, 'Stanford University', 'university', 'stanford.edu'),
(3, 'Johns Hopkins Hospital', 'hospital', 'jhmi.edu'),
(4, 'Caltech', 'university', 'caltech.edu'),
(5, 'Mayo Clinic', 'hospital', 'mayo.edu'),
(6, 'ETH Zurich', 'university', 'ethz.ch'),
(7, 'National Institutes of Health', 'research_institute', 'nih.gov'),
(8, 'University of Tokyo', 'university', 'u-tokyo.ac.jp'),
(9, 'Max Planck Institute', 'research_institute', 'mpg.de'),
(10, 'Cambridge University', 'university', 'cam.ac.uk');

-- occupation (2 rows - as per ENUM)
INSERT INTO occupation (occupationId, occupationType) VALUES
(1, 'technical_staff'),
(2, 'researcher');

-- application_result (3 rows)
INSERT INTO application_result (resultId, applicationResult) VALUES
(1, 'approved'),
(2, 'rejected'),
(3, 'pending');

-- charge_catogory (3 rows - as per ENUM)
INSERT INTO charge_catogory (chargeCatogoryId, chargeCatogory) VALUES
(1, 'equipment_charge'),
(2, 'staff_support'),
(3, 'material_cost');

-- funding_source (10 rows)
INSERT INTO funding_source (fundingSourceId, payerName, sourceType, sourceName, startDate, endDate, totalBudget, status) VALUES
(1, 'NSF', 'government_grant', 'NSF Award #2024-001', '2024-01-01', '2026-12-31', 500000.00, 'active'),
(2, 'NIH', 'government_grant', 'NIH R01 Grant', '2024-06-01', '2027-05-31', 750000.00, 'active'),
(3, 'MIT Internal Fund', 'institutional', 'MIT Research Fund 2025', '2025-01-01', '2025-12-31', 200000.00, 'active'),
(4, 'European Research Council', 'government_grant', 'ERC Starting Grant', '2024-03-01', '2029-02-28', 1500000.00, 'active'),
(5, 'Pfizer Inc.', 'industry', 'Pfizer Collaboration Fund', '2025-01-01', '2026-06-30', 300000.00, 'active'),
(6, 'Stanford Seed Fund', 'institutional', 'Stanford Provost Fund', '2025-03-01', '2025-12-31', 100000.00, 'active'),
(7, 'DOE', 'government_grant', 'DOE Office of Science', '2024-09-01', '2027-08-31', 600000.00, 'active'),
(8, 'Toyota Research', 'industry', 'Toyota Materials Research', '2025-02-01', '2026-01-31', 250000.00, 'active'),
(9, 'Wellcome Trust', 'charity', 'Wellcome Biomedical Grant', '2024-04-01', '2027-03-31', 400000.00, 'active'),
(10, 'Caltech Endowment', 'institutional', 'Caltech Faculty Fund', '2025-01-01', '2025-12-31', 150000.00, 'active');

-- 2. Person & Authentication

-- person (15 rows: 5 technical_staff + 10 researchers)
INSERT INTO person (personId, institutionId, fullName, email, phone, status, occupationId) VALUES
(1, 1, 'Alice Chen', 'alice.chen@mit.edu', '617-555-0101', 'active', 1),
(2, 1, 'Bob Martinez', 'bob.martinez@mit.edu', '617-555-0102', 'active', 1),
(3, 2, 'Carol Zhang', 'carol.zhang@stanford.edu', '650-555-0201', 'active', 1),
(4, 3, 'David Kim', 'david.kim@jhmi.edu', '410-555-0301', 'active', 1),
(5, 4, 'Eva Rossi', 'eva.rossi@caltech.edu', '626-555-0401', 'active', 1),
(6, 1, 'Frank Liu', 'frank.liu@mit.edu', '617-555-0103', 'active', 2),
(7, 2, 'Grace Park', 'grace.park@stanford.edu', '650-555-0202', 'active', 2),
(8, 3, 'Henry Wang', 'henry.wang@jhmi.edu', '410-555-0302', 'active', 2),
(9, 4, 'Irene Tanaka', 'irene.tanaka@caltech.edu', '626-555-0402', 'active', 2),
(10, 5, 'James Brown', 'james.brown@mayo.edu', '507-555-0501', 'active', 2),
(11, 6, 'Karen Mueller', 'karen.mueller@ethz.ch', '044-555-0601', 'active', 2),
(12, 7, 'Leo Singh', 'leo.singh@nih.gov', '301-555-0701', 'active', 2),
(13, 8, 'Mika Sato', 'mika.sato@u-tokyo.ac.jp', '03-555-0801', 'active', 2),
(14, 9, 'Nina Fischer', 'nina.fischer@mpg.de', '089-555-0901', 'active', 2),
(15, 10, 'Oscar Patel', 'oscar.patel@cam.ac.uk', '01223-555001', 'active', 2);

-- credential (15 rows - one per person)
INSERT INTO credential (credentialId, personId, issuerType, provider, externalSubjectId, status, issuedAt, expiresAt) VALUES
(1, 1, 'home_institution', 'MIT SSO', 'MIT-001-ACHEN', 'active', '2024-09-01 00:00:00', '2026-08-31 23:59:59'),
(2, 2, 'home_institution', 'MIT SSO', 'MIT-002-BMART', 'active', '2024-09-01 00:00:00', '2026-08-31 23:59:59'),
(3, 3, 'home_institution', 'Stanford SSO', 'SU-001-CZHAN', 'active', '2024-09-01 00:00:00', '2026-08-31 23:59:59'),
(4, 4, 'home_institution', 'JHU SSO', 'JHU-001-DKIM', 'active', '2024-09-01 00:00:00', '2026-08-31 23:59:59'),
(5, 5, 'home_institution', 'Caltech SSO', 'CT-001-EROSS', 'active', '2024-09-01 00:00:00', '2026-08-31 23:59:59'),
(6, 6, 'consortium', 'InCommon Federation', 'IC-006-FLIU', 'active', '2025-01-01 00:00:00', '2026-12-31 23:59:59'),
(7, 7, 'consortium', 'InCommon Federation', 'IC-007-GPARK', 'active', '2025-01-01 00:00:00', '2026-12-31 23:59:59'),
(8, 8, 'home_institution', 'JHU SSO', 'JHU-002-HWANG', 'active', '2024-09-01 00:00:00', '2026-08-31 23:59:59'),
(9, 9, 'home_institution', 'Caltech SSO', 'CT-002-ITANA', 'active', '2024-09-01 00:00:00', '2026-08-31 23:59:59'),
(10, 10, 'consortium', 'InCommon Federation', 'IC-010-JBROW', 'active', '2025-01-01 00:00:00', '2026-12-31 23:59:59'),
(11, 11, 'consortium', 'eduGAIN', 'EG-011-KMUEL', 'active', '2025-02-01 00:00:00', '2027-01-31 23:59:59'),
(12, 12, 'home_institution', 'NIH SSO', 'NIH-001-LSING', 'active', '2024-09-01 00:00:00', '2026-08-31 23:59:59'),
(13, 13, 'consortium', 'eduGAIN', 'EG-013-MSATO', 'active', '2025-03-01 00:00:00', '2027-02-28 23:59:59'),
(14, 14, 'consortium', 'eduGAIN', 'EG-014-NFISC', 'active', '2025-03-01 00:00:00', '2027-02-28 23:59:59'),
(15, 15, 'consortium', 'eduGAIN', 'EG-015-OPATE', 'active', '2025-04-01 00:00:00', '2027-03-31 23:59:59');

-- 3. Facility & Maintenance

-- facility (12 rows)
INSERT INTO facility (facilityId, name, facilityTypeId, purposeId, statusId, address) VALUES
(1, 'Analytical Chemistry Lab A', 1, 1, 1, 'Building 18, Room 201, MIT'),
(2, 'Nanofabrication Cleanroom', 2, 1, 3, 'Building 39, Floor B1, MIT'),
(3, 'Electron Microscopy Center', 3, 1, 1, 'Clark Center, Room 105, Stanford'),
(4, 'Biomedical Research Lab', 4, 3, 1, 'Pathology Building, Room 312, JHU'),
(5, 'High-Energy Physics Lab', 5, 1, 3, 'Lauritsen Lab, Room 001, Caltech'),
(6, 'Genomics Data Center', 6, 8, 1, 'Koch Institute, Room 010, MIT'),
(7, 'Precision Workshop', 7, 5, 3, 'Building 35, Room 102, MIT'),
(8, 'Environmental Test Facility', 8, 7, 2, 'Engineering Quad, Room 050, Stanford'),
(9, 'General Biology Lab B', 9, 1, 1, 'Science Hall, Room 220, Mayo Clinic'),
(10, 'Equipment Training Room', 10, 9, 3, 'Building 1, Room 101, MIT'),
(11, 'Materials Science Lab', 1, 1, 1, 'Gates Building, Room 305, Caltech'),
(12, 'Medical Imaging Suite', 3, 3, 1, 'Radiology Wing, Room 150, JHU');

-- equipment (20 rows - using user's provided equipment names)
INSERT INTO equipment (equipmentId, name, equipmentTypeId, facilityId, statusId) VALUES
(1, 'Mass Spectrometer (MS)', 1, 1, 1),
(2, 'Nuclear Magnetic Resonance (NMR) Spectrometer', 1, 1, 3),
(3, 'X-ray Diffractometer (XRD)', 1, 11, 1),
(4, 'High-Performance Liquid Chromatography (HPLC)', 1, 1, 1),
(5, 'Scanning Electron Microscope (SEM)', 2, 3, 1),
(6, 'Transmission Electron Microscope (TEM)', 2, 3, 2),
(7, 'Confocal Laser Scanning Microscope', 2, 3, 3),
(8, 'Functional MRI (fMRI) Scanner', 2, 12, 1),
(9, 'Flow Cytometer', 3, 4, 1),
(10, 'Next-Generation Sequencer (NGS)', 3, 4, 3),
(11, 'Ultracentrifuge', 3, 9, 1),
(12, '3D Bioprinter', 3, 4, 2),
(13, 'Electron Beam Lithography (EBL) System', 4, 2, 1),
(14, 'Reactive Ion Etcher (RIE)', 4, 2, 3),
(15, 'Sputtering Deposition System', 4, 2, 1),
(16, 'CNC Machining Center', 4, 7, 1),
(17, 'Particle Beamline', 5, 5, 3),
(18, 'High-Power Laser System', 5, 5, 1),
(19, 'Environmental Test Chamber', 5, 8, 2),
(20, 'Wind Tunnel', 5, 8, 3);

-- equipment_maintenance (15 rows - varying counts per equipment, mix of scheduled/unscheduled)
INSERT INTO equipment_maintenance (activityId, equipmentId, activityType, startTime, endTime, isScheduled, personId) VALUES
(1, 1, 'maintenance', '2025-01-10 08:00:00', '2025-01-10 12:00:00', TRUE, 1),
(2, 1, 'calibration', '2025-02-15 09:00:00', '2025-02-15 11:00:00', TRUE, 1),
(3, 1, 'cleaning', '2025-03-20 08:00:00', '2025-03-20 10:00:00', FALSE, 2),
(4, 5, 'maintenance', '2025-01-05 08:00:00', '2025-01-05 16:00:00', TRUE, 3),
(5, 5, 'calibration', '2025-02-10 09:00:00', '2025-02-10 15:00:00', TRUE, 3),
(6, 5, 'inspection', '2025-03-12 10:00:00', '2025-03-12 12:00:00', FALSE, 3),
(7, 5, 'maintenance', '2025-04-01 08:00:00', '2025-04-01 17:00:00', FALSE, 3),
(8, 6, 'maintenance', '2025-02-20 08:00:00', '2025-02-21 17:00:00', TRUE, 3),
(9, 12, 'maintenance', '2025-01-15 08:00:00', '2025-01-15 12:00:00', FALSE, 4),
(10, 12, 'calibration', '2025-03-01 09:00:00', '2025-03-01 11:00:00', TRUE, 4),
(11, 13, 'inspection', '2025-02-01 10:00:00', '2025-02-01 12:00:00', TRUE, 2),
(12, 19, 'maintenance', '2025-01-20 08:00:00', '2025-01-22 17:00:00', FALSE, 5),
(13, 19, 'calibration', '2025-03-05 09:00:00', '2025-03-05 16:00:00', TRUE, 5),
(14, 8, 'maintenance', '2025-02-25 08:00:00', '2025-02-26 17:00:00', TRUE, 4),
(15, 16, 'cleaning', '2025-03-15 08:00:00', '2025-03-15 10:00:00', FALSE, 2);

-- facility_maintenance (12 rows)
INSERT INTO facility_maintenance (activityId, facilityId, activityType, startTime, endTime, isScheduled, personId) VALUES
(1, 1, 'cleaning', '2025-01-06 06:00:00', '2025-01-06 08:00:00', TRUE, 1),
(2, 1, 'inspection', '2025-02-03 09:00:00', '2025-02-03 11:00:00', TRUE, 1),
(3, 2, 'cleaning', '2025-01-13 06:00:00', '2025-01-13 10:00:00', TRUE, 2),
(4, 2, 'maintenance', '2025-03-10 08:00:00', '2025-03-11 17:00:00', TRUE, 2),
(5, 3, 'cleaning', '2025-01-20 06:00:00', '2025-01-20 08:00:00', TRUE, 3),
(6, 4, 'inspection', '2025-02-17 09:00:00', '2025-02-17 12:00:00', TRUE, 4),
(7, 5, 'maintenance', '2025-01-27 08:00:00', '2025-01-28 17:00:00', FALSE, 5),
(8, 8, 'maintenance', '2025-02-10 08:00:00', '2025-02-12 17:00:00', TRUE, 5),
(9, 9, 'cleaning', '2025-03-03 06:00:00', '2025-03-03 08:00:00', TRUE, 4),
(10, 11, 'inspection', '2025-03-17 09:00:00', '2025-03-17 11:00:00', TRUE, 5),
(11, 12, 'cleaning', '2025-02-24 06:00:00', '2025-02-24 08:00:00', TRUE, 4),
(12, 6, 'inspection', '2025-03-24 10:00:00', '2025-03-24 12:00:00', FALSE, 1);

-- 4. Application & Allocation

-- experiment (12 rows)
INSERT INTO experiment (experimentId, title, description) VALUES
(1, 'Protein Folding Dynamics Study', 'Investigating protein misfolding mechanisms using NMR and MS'),
(2, 'Nanowire Synthesis for Solar Cells', 'Fabricating ZnO nanowires via EBL and sputtering deposition'),
(3, 'Tumor Microenvironment Imaging', 'High-resolution SEM/TEM imaging of tumor tissue samples'),
(4, 'CRISPR Gene Editing Validation', 'NGS-based validation of CRISPR edits in human cell lines'),
(5, 'High-Temperature Superconductor Analysis', 'XRD structural analysis of novel superconductor materials'),
(6, 'Neural Circuit Mapping', 'fMRI-based mapping of motor cortex neural pathways'),
(7, 'Drug Compound Screening', 'HPLC and flow cytometry screening of candidate compounds'),
(8, 'Microfluidic Chip Fabrication', 'Cleanroom fabrication of PDMS microfluidic devices'),
(9, 'Wind Load Testing on Bridge Models', 'Wind tunnel aerodynamic testing of scale bridge models'),
(10, 'Bioprinted Tissue Viability Study', '3D bioprinting and viability assessment of liver tissue'),
(11, 'Catalyst Surface Characterization', 'SEM and XRD analysis of platinum catalyst surfaces'),
(12, 'Environmental Stress Testing of Alloys', 'Thermal cycling and humidity testing of aerospace alloys');

-- experiment_phase (15 rows)
INSERT INTO experiment_phase (phaseId, expId, phaseStartdate, phaseEnddate) VALUES
(1, 1, '2025-01-15', '2025-03-15'),
(2, 1, '2025-03-16', '2025-06-15'),
(1, 2, '2025-02-01', '2025-04-30'),
(2, 2, '2025-05-01', '2025-07-31'),
(1, 3, '2025-01-10', '2025-03-10'),
(1, 4, '2025-03-01', '2025-05-31'),
(2, 4, '2025-06-01', '2025-08-31'),
(1, 5, '2025-02-15', '2025-04-15'),
(1, 6, '2025-01-20', '2025-04-20'),
(1, 7, '2025-03-01', '2025-05-31'),
(1, 8, '2025-02-10', '2025-04-10'),
(1, 9, '2025-04-01', '2025-06-30'),
(1, 10, '2025-03-15', '2025-06-15'),
(1, 11, '2025-01-05', '2025-03-05'),
(1, 12, '2025-04-01', '2025-07-01');

-- researcher_allocation (12 rows)
INSERT INTO researcher_allocation (allocateId, experimentId, personId) VALUES
(1, 1, 6),
(2, 1, 7),
(3, 2, 9),
(4, 3, 7),
(5, 4, 8),
(6, 5, 9),
(7, 6, 10),
(8, 7, 11),
(9, 8, 6),
(10, 9, 13),
(11, 10, 12),
(12, 11, 14);

-- application (15 rows - spread across months Jan-Apr 2025, various experiments/equipment/facilities)
INSERT INTO application (applicationId, personId, experimentId, submitTime, safetyConsideration, specialNote, estimatedUsage, estimatedOutcome, equipmentId, facilityId, staffId) VALUES
(1, 6, 1, '2025-01-05 09:30:00', 'Chemical handling protocols required', NULL, '40 hours', 'Protein structure data', 1, 1, 1),
(2, 7, 3, '2025-01-12 14:00:00', 'Electron beam safety training', NULL, '20 hours', 'High-res tumor images', 5, 3, 3),
(3, 8, 4, '2025-01-20 10:15:00', 'Biosafety level 2 required', 'Urgent clinical trial deadline', '60 hours', 'Validated CRISPR edits', 10, 4, 4),
(4, 9, 2, '2025-01-28 11:00:00', 'Cleanroom gowning protocol', NULL, '30 hours', 'Nanowire array samples', 13, 2, 2),
(5, 10, 6, '2025-02-03 08:45:00', 'MRI safety screening for subjects', 'IRB approval attached', '25 hours', 'Neural pathway maps', 8, 12, 4),
(6, 11, 7, '2025-02-10 16:30:00', 'Chemical waste disposal plan', NULL, '35 hours', 'Drug screening results', 4, 1, 1),
(7, 6, 8, '2025-02-18 09:00:00', 'Cleanroom protocols', NULL, '15 hours', 'Microfluidic chip prototypes', 13, 2, 2),
(8, 12, 10, '2025-02-25 13:20:00', 'Bioprinting material safety', NULL, '50 hours', 'Viable liver tissue constructs', 12, 4, 4),
(9, 13, 9, '2025-03-03 10:00:00', 'Wind tunnel safety barriers', 'Scale model provided', '20 hours', 'Aerodynamic load data', 20, 8, 5),
(10, 14, 11, '2025-03-10 11:30:00', 'X-ray radiation shielding', NULL, '30 hours', 'Catalyst surface structure data', 5, 3, 3),
(11, 15, 5, '2025-03-17 15:00:00', 'Cryogenic material handling', NULL, '25 hours', 'Superconductor XRD patterns', 3, 11, 5),
(12, 7, 1, '2025-03-24 09:45:00', 'NMR magnet safety', NULL, '20 hours', 'Additional NMR spectra', 2, 1, 1),
(13, 9, 12, '2025-04-01 08:30:00', 'Thermal hazard awareness', NULL, '40 hours', 'Alloy fatigue data', 19, 8, 5),
(14, 8, 4, '2025-04-07 14:15:00', 'BSL-2 protocols', 'Phase 2 of CRISPR study', '45 hours', 'Extended gene edit validation', 9, 4, 4),
(15, 6, 1, '2025-04-14 10:00:00', 'Chemical handling', NULL, '30 hours', 'Final protein analysis', 1, 1, 1);

-- application_review (15 rows - mix of approved/rejected/pending)
INSERT INTO application_review (reviewId, applicationId, resultId, justification) VALUES
(1, 1, 1, 'All safety requirements met, equipment available'),
(2, 2, 1, 'Training verified, schedule confirmed'),
(3, 3, 1, 'Urgent request approved with priority scheduling'),
(4, 4, 1, 'Cleanroom slot available, approved'),
(5, 5, 1, 'IRB approval verified, MRI time allocated'),
(6, 6, 2, 'HPLC fully booked for requested period'),
(7, 7, 1, 'Cleanroom slot available'),
(8, 8, 1, 'Bioprinter maintenance completed, approved'),
(9, 9, 3, 'Pending wind tunnel schedule confirmation'),
(10, 10, 1, 'SEM time allocated'),
(11, 11, 2, 'XRD under maintenance during requested dates'),
(12, 12, 1, 'NMR available, approved'),
(13, 13, 3, 'Pending environmental chamber repair status'),
(14, 14, 1, 'BSL-2 lab confirmed available'),
(15, 15, 3, 'Pending staff availability confirmation');

-- acutal_alloccation (10 rows - only for approved applications)
INSERT INTO acutal_alloccation (allocationId, equipmentId, actualStartdate, actualEnddate) VALUES
(1, 1, '2025-01-20', '2025-02-20'),
(2, 5, '2025-01-25', '2025-02-15'),
(3, 10, '2025-02-01', '2025-03-31'),
(4, 13, '2025-02-10', '2025-03-10'),
(5, 8, '2025-02-15', '2025-03-15'),
(6, 13, '2025-03-01', '2025-03-15'),
(7, 12, '2025-03-10', '2025-04-30'),
(8, 5, '2025-03-20', '2025-04-10'),
(9, 2, '2025-04-01', '2025-04-20'),
(10, 9, '2025-04-15', '2025-05-31');

-- 5. Billing & Payment

-- usage_record (12 rows)
INSERT INTO usage_record (usageId, allocationId, facilityId, equipmentId, startTime, endTime, quantity, usageStatus, credentialId) VALUES
(1, 1, 1, 1, '2025-01-20 09:00:00', '2025-01-20 17:00:00', '8 hours', 'completed', 6),
(2, 1, 1, 1, '2025-01-22 09:00:00', '2025-01-22 13:00:00', '4 hours', 'completed', 6),
(3, 2, 3, 5, '2025-01-25 10:00:00', '2025-01-25 18:00:00', '8 hours', 'completed', 7),
(4, 3, 4, 10, '2025-02-03 08:00:00', '2025-02-03 20:00:00', '12 hours', 'completed', 8),
(5, 4, 2, 13, '2025-02-12 09:00:00', '2025-02-12 17:00:00', '8 hours', 'completed', 9),
(6, 5, 12, 8, '2025-02-17 08:00:00', '2025-02-17 12:00:00', '4 hours', 'completed', 10),
(7, 6, 2, 13, '2025-03-03 09:00:00', '2025-03-03 15:00:00', '6 hours', 'completed', 6),
(8, 7, 4, 12, '2025-03-12 10:00:00', '2025-03-12 16:00:00', '6 hours', 'completed', 12),
(9, 8, 3, 5, '2025-03-22 09:00:00', '2025-03-22 17:00:00', '8 hours', 'completed', 14),
(10, 9, 1, 2, '2025-04-02 09:00:00', '2025-04-02 15:00:00', '6 hours', 'completed', 7),
(11, 10, 4, 9, '2025-04-16 08:00:00', '2025-04-16 16:00:00', '8 hours', 'completed', 8),
(12, 1, 1, 1, '2025-02-10 09:00:00', '2025-02-10 17:00:00', '8 hours', 'completed', 6);

-- charge (12 rows)
INSERT INTO charge (chargeId, usageId, chargeCatogoryId, amount, personId) VALUES
(1, 1, 1, 500.00, 6),
(2, 2, 1, 250.00, 6),
(3, 3, 1, 800.00, 7),
(4, 4, 1, 1200.00, 8),
(5, 5, 1, 600.00, 9),
(6, 6, 1, 1500.00, 10),
(7, 7, 1, 450.00, 6),
(8, 8, 1, 900.00, 12),
(9, 9, 1, 800.00, 14),
(10, 10, 1, 400.00, 7),
(11, 11, 1, 350.00, 8),
(12, 1, 2, 200.00, 6),
(13, 4, 3, 300.00, 8),
(14, 6, 2, 500.00, 10),
(15, 8, 3, 150.00, 12);

-- charge_allocation (12 rows)
INSERT INTO charge_allocation (chargeAllocationId, fundingSourceId, chargeId, allocationAmount) VALUES
(1, 1, 1, 500.00),
(2, 1, 2, 250.00),
(3, 6, 3, 800.00),
(4, 2, 4, 1200.00),
(5, 10, 5, 600.00),
(6, 2, 6, 1500.00),
(7, 3, 7, 450.00),
(8, 9, 8, 900.00),
(9, 4, 9, 800.00),
(10, 6, 10, 400.00),
(11, 2, 11, 350.00),
(12, 1, 12, 200.00);

-- adjustment (10 rows)
INSERT INTO adjustment (adjustmentId, chargeId, adjustMentType, amount, reasonCode) VALUES
(1, 1, 'credit', 50.00, 'EARLY_RETURN'),
(2, 4, 'surcharge', 120.00, 'OVERTIME_USE'),
(3, 6, 'credit', 200.00, 'EQUIPMENT_DOWNTIME'),
(4, 3, 'surcharge', 80.00, 'CONSUMABLE_EXCESS'),
(5, 5, 'credit', 60.00, 'BOOKING_ERROR'),
(6, 8, 'surcharge', 100.00, 'MATERIAL_SURCHARGE'),
(7, 9, 'credit', 100.00, 'EARLY_RETURN'),
(8, 11, 'surcharge', 35.00, 'OVERTIME_USE'),
(9, 12, 'credit', 20.00, 'DISCOUNT_APPLIED'),
(10, 14, 'surcharge', 75.00, 'CONSUMABLE_EXCESS');

-- payment (10 rows - some charges left unpaid for Query 10)
INSERT INTO payment (paymentId, chargeId, fundingSourceId, paidAt, method, paidAmount) VALUES
(1, 1, 1, '2025-02-28 10:00:00', 'bank_transfer', 450.00),
(2, 2, 1, '2025-02-28 10:00:00', 'bank_transfer', 250.00),
(3, 3, 6, '2025-03-15 14:00:00', 'bank_transfer', 880.00),
(4, 4, 2, '2025-03-31 09:00:00', 'wire_transfer', 1320.00),
(5, 5, 10, '2025-04-10 11:00:00', 'bank_transfer', 540.00),
(6, 7, 3, '2025-04-15 10:00:00', 'bank_transfer', 450.00),
(7, 9, 4, '2025-04-20 16:00:00', 'wire_transfer', 700.00),
(8, 10, 6, '2025-04-25 09:00:00', 'bank_transfer', 400.00),
(9, 12, 1, '2025-03-15 10:00:00', 'bank_transfer', 180.00),
(10, 13, 2, '2025-04-30 14:00:00', 'wire_transfer', 300.00);
-- Note: chargeId 6, 8, 11, 14, 15 are UNPAID - used by Query 10
