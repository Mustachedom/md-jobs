-- QBCORE
uwu = {
    label = 'uWu Cafe',
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
['uwu'] = {
    label = 'uWu Cafe',
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
  ('uwu', 'uWu Cafe');

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
  ('uwu', 0, 'recruit', 'recruit', 50, '{}', '{}'),
  ('uwu', 1, 'trainer', 'trainer', 75, '{}', '{}'),
  ('uwu', 2, 'shift lead', 'shift lead', 100, '{}', '{}'),
  ('uwu', 3, 'management', 'management', 50, '{}', '{}')
;
