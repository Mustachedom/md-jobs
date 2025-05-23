-- QBCORE
hookies = {
    label = 'Hookies',
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
['hookies'] = {
    label = 'Hookies',
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
  ('hookies', 'Hookies');

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
  ('hookies', 0, 'trainee', 'trainee', 50, '{}', '{}'),
  ('hookies', 1, 'shift lead', 'Shift Lead', 75, '{}', '{}'),
  ('hookies', 2, 'assistant manager', 'Assistant Manager', 100, '{}', '{}'),
  ('hookies', 3, 'manager', 'Manager', 150, '{}', '{}')
;
