-- 1. Add New Use Cases for Existing Roles
-- Engineering Manager / Technical Director (ID 1)
INSERT INTO use_cases (role_id, title, prompt_template) VALUES (1, 'System scalability planning', '');

-- Product Manager (ID 2)
INSERT INTO use_cases (role_id, title, prompt_template) VALUES 
(2, 'Customer feedback analysis', ''),
(2, 'Market opportunity analysis', ''),
(2, 'Competitor feature comparison', ''),
(2, 'Product roadmap creation', '');

-- Business Analyst (ID 3)
INSERT INTO use_cases (role_id, title, prompt_template) VALUES 
(3, 'Impact analysis for requirement changes', ''),
(3, 'Stakeholder requirement gathering questions', '');

-- Project Manager (ID 4)
INSERT INTO use_cases (role_id, title, prompt_template) VALUES 
(4, 'Resource allocation planning', ''),
(4, 'Weekly project status report generation', ''),
(4, 'Daily Status Report generation', ''),
(4, 'Project health assessment', ''),
(4, 'Project milestone definition', '');

-- Software Engineer (ID 5)
INSERT INTO use_cases (role_id, title, prompt_template) VALUES 
(5, 'Code refactoring suggestions', ''),
(5, 'Code documentation generation', ''),
(5, 'Database query optimization', ''),
(5, 'Performance optimization guidance', '');

-- Technical Lead (ID 6)
INSERT INTO use_cases (role_id, title, prompt_template) VALUES 
(6, 'System architecture documentation', ''),
(6, 'Technology stack selection guidance', ''),
(6, 'Dependency risk evaluation', ''),
(6, 'Tech debt assessment', '');

-- DevOps / Site Reliability Engineer (ID 7)
INSERT INTO use_cases (role_id, title, prompt_template) VALUES 
(7, 'Deployment pipeline optimization', ''),
(7, 'Environment configuration documentation', ''),
(7, 'Containerization strategy guidance', ''),
(7, 'Cost optimization for cloud infrastructure', '');

-- QA Engineer / Tester (ID 8)
INSERT INTO use_cases (role_id, title, prompt_template) VALUES 
(8, 'Test coverage analysis', ''),
(8, 'Negative test case generation', ''),
(8, 'Edge case identification', '');

-- Automation Test Engineer (ID 9)
INSERT INTO use_cases (role_id, title, prompt_template) VALUES 
(9, 'Test automation strategy planning', ''),
(9, 'Test flakiness analysis', ''),
(9, 'Automation tool comparison', ''),
(9, 'Automation coverage improvement suggestions', '');

-- Technical Writer (ID 13)
INSERT INTO use_cases (role_id, title, prompt_template) VALUES 
(13, 'Troubleshooting manuals', ''),
(13, 'Installation guides', '');

-- UX/UI Designer (ID 15)
INSERT INTO use_cases (role_id, title, prompt_template) VALUES 
(15, 'Wireframe description prompts', ''),
(15, 'UI consistency review', ''),
(15, 'UX heuristic evaluation', ''),
(15, 'Accessibility design recommendations', '');

-- Data Engineer (ID 16)
INSERT INTO use_cases (role_id, title, prompt_template) VALUES 
(16, 'Data pipeline design', ''),
(16, 'Query optimization', ''),
(16, 'Data quality validation rules', '');

-- Data Scientist (ID 17)
INSERT INTO use_cases (role_id, title, prompt_template) VALUES 
(17, 'Feature engineering ideas', ''),
(17, 'Model evaluation report generation', '');

-- Security Engineer (ID 18)
INSERT INTO use_cases (role_id, title, prompt_template) VALUES 
(18, 'Security architecture review', ''),
(18, 'Security awareness training content', ''),
(18, 'Threat modeling', ''),
(18, 'Identity and access control recommendations', '');
