-- QBCORE
deerdiner = {
    label = 'Deer Diner',
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
['deerdiner'] = {
    label = 'Deer Diner',
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
  ('deerdiner', 'Deer Diner');

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
  ('deerdiner', 0, 'recruit', 'recruit', 50, '{}', '{}'),
  ('deerdiner', 1, 'trainer', 'trainer', 75, '{}', '{}'),
  ('deerdiner', 2, 'shift lead', 'shift lead', 100, '{}', '{}'),
  ('deerdiner', 3, 'management', 'management', 50, '{}', '{}')
;
