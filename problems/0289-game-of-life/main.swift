var a = [[0, 1, 0], [0, 0, 1], [1, 1, 1], [0, 0, 0]]
Solution().gameOfLife(&a)
precondition(a == [[0, 0, 0], [1, 0, 1], [0, 1, 1], [0, 1, 0]])
var b = [[1, 1], [1, 0]]
Solution().gameOfLife(&b)
precondition(b == [[1, 1], [1, 1]])
// thanh 3 ô dao động: ngang → dọc → ngang
var blinker = [[0, 0, 0], [1, 1, 1], [0, 0, 0]]
Solution().gameOfLife(&blinker)
precondition(blinker == [[0, 1, 0], [0, 1, 0], [0, 1, 0]])
Solution().gameOfLife(&blinker)
precondition(blinker == [[0, 0, 0], [1, 1, 1], [0, 0, 0]])
// khối 2x2 đứng yên
var block = [[1, 1, 0], [1, 1, 0], [0, 0, 0]]
Solution().gameOfLife(&block)
precondition(block == [[1, 1, 0], [1, 1, 0], [0, 0, 0]])
var one = [[1]]
Solution().gameOfLife(&one)
precondition(one == [[0]])
print("OK")
