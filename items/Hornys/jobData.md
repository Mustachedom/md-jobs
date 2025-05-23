-- QBCORE
hornys = {
    label = 'Hornys',
    type = 'restaurant',
    defaultDuty = true,
    offDutyPay = false,
    grades = {
        ['0'] = {
            name = 'trainee',
            payment = 50
        },
        ['1'] = {
            name = 'Shift Lead',
            payment = 75
        },
        ['2'] = {
            name = 'Assistant Manager',
            payment = 100
        },
        ['3'] = {
            name = 'Manager',
            payment = 150,
            isboss = true,
            bankAuth = true
        }
    },
},

-- QBOX
hornys = {
    label = 'Hornys',
    type = 'restaurant',
    defaultDuty = true,
    offDutyPay = false,
    grades = {
        [0] = {
            name = 'trainee',
            payment = 50
        },
        [1] = {
            name = 'Shift Lead',
            payment = 75
        },
        [2] = {
            name = 'Assistant Manager',
            payment = 100
        },
        [3] = {
            name = 'Manager',
            payment = 150,
            isboss = true,
            bankAuth = true
        }
    },
},

-- SQL Insert Statements
INSERT INTO `jobs` (name, label) VALUES
  ('hornys', 'Hornies');

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
  ('hornys', 0, 'trainee', 'trainee', 50, '{}', '{}'),
  ('hornys', 1, 'shift lead', 'Shift Lead', 75, '{}', '{}'),
  ('hornys', 2, 'assistant manager', 'Assistant Manager', 100, '{}', '{}'),
  ('hornys', 3, 'manager', 'Manager', 150, '{}', '{}')
;
