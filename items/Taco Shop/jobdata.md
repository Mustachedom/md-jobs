-- QBCORE
tacoshop = {
    label = 'Taco Shop',
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
['tacoshop'] = {
    label = 'Taco Shop',
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
  ('tacoshop', 'Taco Shop');

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
  ('tacoshop', 0, 'recruit', 'recruit', 50, '{}', '{}'),
  ('tacoshop', 1, 'trainer', 'trainer', 75, '{}', '{}'),
  ('tacoshop', 2, 'shift lead', 'shift lead', 100, '{}', '{}'),
  ('tacoshop', 3, 'management', 'management', 50, '{}', '{}')
;
