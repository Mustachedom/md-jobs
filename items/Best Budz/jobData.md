-- QBCORE
bestbudz = {
    label = 'Best Budz',
    type = 'weedshop',
    defaultDuty = true,
    offDutyPay = undefined,
    grades = {
        ['0'] = {
            name = 'ten sack',
            payment = 50
        },
        ['1'] = {
            name = 'dub',
            payment = 75
        },
        ['2'] = {
            name = 'eigth',
            payment = 100
        },
        ['3'] = {
            name = 'quarter',
            payment = 125
        },
        ['4'] = {
            name = 'ounce',
            payment = 150,
            isboss = true,
            bankAuth = true
        }
    },
},

-- QBOX
['bestbudz'] = {
    label = 'Best Budz',
    type = 'weedshop',
    defaultDuty = true,
    offDutyPay = undefined,
    grades = {
        [0] = {
            name = 'ten sack',
            payment = 50
        },
        [1] = {
            name = 'dub',
            payment = 75
        },
        [2] = {
            name = 'eigth',
            payment = 100
        },
        [3] = {
            name = 'quarter',
            payment = 125
        },
        [4] = {
            name = 'ounce',
            payment = 150,
            isboss = true,
            bankAuth = true
        }
    },
},

-- SQL Insert Statements
INSERT INTO `jobs` (name, label) VALUES
  ('bestbudz', 'Best Budz');

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
  ('bestbudz', 0, 'ten sack', 'ten sack', 50, '{}', '{}'),
  ('bestbudz', 1, 'dub', 'dub', 75, '{}', '{}'),
  ('bestbudz', 2, 'eigth', 'eigth', 100, '{}', '{}'),
  ('bestbudz', 3, 'quarter', 'quarter', 125, '{}', '{}'),
  ('bestbudz', 4, 'ounce', 'ounce', 150, '{}', '{}')
;
