n_sf = []
cter = 1

while True:
    try:
        sto = int(input("Límite superior para encontrar primos: "))
        break
    except:
        continue

def div_prev(num,lim):
    chk = False
    lpck = True
    while lpck == True:
        for i in range(2,lim+1):
            #print("\n",num,i)
            #print("mod", num % i)
            if num % i == 0:
                #print("true")
                chk = True
            else:
                continue
                #print(false)
        lpck = False

    #print("chk", chk)
    if chk == True:
        return True
    else:
        return False

for x in range(2,sto+1):
    #print(len(n_sf))
    if div_prev(x,cter) == False:
        n_sf.append(x)
    cter+=1

print(n_sf)
