n_sf = []
sta = 2
sto = 100

def div_prev(num,lim):
    chk = False
    aaa = True
    while aaa == True:
        for i in range(2,lim+1):
            #print("\n",num,i)
            #print("mod", num % i)
            if num % i == 0:
                #print("true")
                chk = True
            else:
                continue
                #print(false)
        aaa = False

    #print("chk", chk)
    if chk == True:
        return True
    else:
        return False

for x in range(sta,sto+1):
    if div_prev(x,len(n_sf)) == False:
        n_sf.append(x)

print(n_sf)
