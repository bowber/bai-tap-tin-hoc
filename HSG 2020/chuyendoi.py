import math #Để tính căn 2


def dec_to_base(num, base:int):
    ''' Nếu số > 9 sẽ thay bằng kí tự <Space>'''
    if base < 2:
        return ""
    result = ""
    while num > 0:
        digit = num % base
        result += str(digit) if digit < 10 else " "
        num //= base
    return result[::-1]

  
def count_k(k, string):
    k_char = str(k)
    result = 0
    for i in string[::-1]:
        if i == k_char:
            result += 1
        else:
            return result
    return result

  
def chuyen_doi(n, k):
    m = n - k
    #print("m =", m) #Debug
    if m < 0:
        return (2, 0)
    if n == k:
        return(n + 1, 1)
    can_hai_m = int(math.sqrt(m))
    
    max_base = 2
    max_L = 0
    
    for i in range(1, can_hai_m + 1):
        
        L = count_k(k, dec_to_base(n, i))
        if L > max_L:
            max_L = L
            max_base = i
    for i in reversed(range(1, can_hai_m + 1)):     
        opposite = m // i
        L = count_k(k, dec_to_base(n, opposite))
        if L > max_L:
            max_L = L
            max_base = opposite
    
    return (max_base, max_L)

  
#Debug
def chuyen_doi_2(n, k):
    can_hai_m = int(1e6)
    max_base = 2
    max_L = 0
    for i in range(2, can_hai_m):
        L = count_k(k, dec_to_base(n, i))
        if L > max_L:
            max_L = L
            max_base = i
    return (max_base, max_L)

print(chuyen_doi(*map(int,input().split())))
