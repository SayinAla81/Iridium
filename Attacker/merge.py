last_file = open("user-pass.csv","w") 
user = "username.csv" 
password = "password.csv" 

ans1, ans2 = list(), list()

with open(user, "r") as file:
    for line in file:
        ans1.append(line.strip().split()[0])
with open(password, "r") as file:
    for line in file:
        ans2.append(line.strip().split()[0])
for i in ans1:
    for j in ans2:
        last_file.write(i)
        last_file.write(',')
        last_file.write(j)
        last_file.write('\n')
test