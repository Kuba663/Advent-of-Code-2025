def findLargest12(line):
    largest12 = 0
    for i in range(0,len(line)-11):
        if ord(line[i]) in range(ord("1"),ord("9")+1):
            combination = str(line[i])
            nextPos = i+1
            while len(combination) < 12:
                largestNum = 0
                nx = nextPos
                for j in range(nx,len(line)-(11-len(combination))):
                    if ord(line[j]) in range(ord("1"),ord("9")+1):
                        tmp = int(line[j])
                        if tmp > largestNum:
                            largestNum = tmp
                            nextPos = j+1
                combination += str(largestNum)
            if int(combination) > largest12:
                largest12 = int(combination)
    return largest12

sum = 0

with open("day3.txt", 'r') as txt:
    for ln in txt.readlines():
        tmp = findLargest12(ln.strip())
        sum += tmp
    pass

print(sum)
