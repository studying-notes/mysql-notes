create table Expressions
(
    left_operand  varchar(255)         null,
    operator      enum ('<', '>', '=') null,
    right_operand varchar(255)         null
);

INSERT INTO leetcode_medium.Expressions (left_operand, operator, right_operand) VALUES ('x', '>', 'y');
INSERT INTO leetcode_medium.Expressions (left_operand, operator, right_operand) VALUES ('x', '<', 'y');
INSERT INTO leetcode_medium.Expressions (left_operand, operator, right_operand) VALUES ('x', '=', 'y');
INSERT INTO leetcode_medium.Expressions (left_operand, operator, right_operand) VALUES ('y', '>', 'x');
INSERT INTO leetcode_medium.Expressions (left_operand, operator, right_operand) VALUES ('y', '<', 'x');
INSERT INTO leetcode_medium.Expressions (left_operand, operator, right_operand) VALUES ('x', '=', 'x');