def findLargestPair(line):
    largestPair = 0
    for i in range(0,len(line)):
        for j in range(i+1,len(line)):
            if ord(line[i]) in range(ord("1"),ord("9")+1) and ord(line[j]) in range(ord("1"),ord("9")+1):
                tmp = int(line[i] + line[j])
                if tmp > largestPair:
                    largestPair = tmp
    return largestPair

sum = 0

with open("day3.txt", 'r') as txt:
    for ln in txt.readlines():
        sum += findLargestPair(ln)    
    pass

print(sum)
