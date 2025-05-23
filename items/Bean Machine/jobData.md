-- QBCORE
beanmachine = {
    label = 'Bean Machine',
    type = 'restaurant',
    defaultDuty = true,
    offDutyPay = undefined,
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
['beanmachine'] = {
    label = 'Bean Machine',
    type = 'restaurant',
    defaultDuty = true,
    offDutyPay = undefined,
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
  ('beanmachine', 'Bean Machine');

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
  ('beanmachine', 0, 'recruit', 'recruit', 50, '{}', '{}'),
  ('beanmachine', 1, 'barista', 'barista', 75, '{}', '{}'),
  ('beanmachine', 2, 'shift lead', 'shift lead', 100, '{}', '{}'),
  ('beanmachine', 3, 'management', 'management', 50, '{}', '{}')
;
