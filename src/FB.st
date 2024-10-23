FUNCTION_BLOCK FB
    VAR_IN_OUT
        arr1: ARRAY [0..9] OF INT; // 假设我们有一个包含10个整数的数组
        arr2: ARRAY [0..9] OF INT;
    END_VAR

    VAR
       variable : INT;
    END_VAR
      // 初始化数组示例
    VAR_TEMP
        index : INT;
        shiftIndex : INT;
        index_j : INT;
        temp: INT;               // 临时变量
    END_VAR
    
    // 比较两个数组中是否有相同的元素，有的话把相同元素提取出来
        FOR index := 0 TO 9 DO
            FOR shiftIndex := 0 TO 9 DO
                IF arr1[index] = arr2[shiftIndex] THEN
                    // 找到相同的元素，提取出来
                    temp := arr1[index];
                    FOR index_j := index TO 8 DO
                        arr1[index_j] := arr1[index_j+1];
                    END_FOR;
                    arr1[9] := 0; // 将最后一个元素设置为0
                END_IF;
            END_FOR;
        END_FOR;

        // 将提取出来的元素赋值给变量
        variable := temp;

END_FUNCTION_BLOCK