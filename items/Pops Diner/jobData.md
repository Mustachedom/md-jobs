-- QBCORE
popsdiner = {
    label = 'Pops Diner',
    type = 'restaurant',
    defaultDuty = true,
    offDutyPay = false,
    grades = {
         ['0'] = {
            name = 'recruit',
            payment = 50
        },
        ['1'] = {
            name = 'barista',
            payment = 75
        },
        ['2'] = {
            name = 'shift lead',
            payment = 100
        },
        ['3'] = {
            name = 'management',
            payment = 50,
            isboss = true,
            bankAuth = true
        }
    },
},

-- QBOX
['popsdiner'] = {
    label = 'Pops Diner',
    type = 'restaurant',
    defaultDuty = true,
    offDutyPay = false,
    grades = {
         [0] = {
            name = 'recruit',
            payment = 50
        },
        [1] = {
            name = 'barista',
            payment = 75
        },
        [2] = {
            name = 'shift lead',
            payment = 100
        },
        [3] = {
            name = 'management',
            payment = 50,
            isboss = true,
            bankAuth = true
        }
    },
},

-- SQL Insert Statements
INSERT INTO `jobs` (name, label) VALUES
  ('popsdiner', 'Pops Diner');

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
  ('popsdiner', 0, 'recruit', 'recruit', 50, '{}', '{}'),
  ('popsdiner', 1, 'trainer', 'trainer', 75, '{}', '{}'),
  ('popsdiner', 2, 'shift lead', 'shift lead', 100, '{}', '{}'),
  ('popsdiner', 3, 'management', 'management', 50, '{}', '{}')
;
