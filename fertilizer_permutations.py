#input values
input_values = [1,2,3,4,5,6,7]

#function to create permutations
#http://stackoverflow.com/questions/104420/how-to-generate-all-permutations-of-a-list-in-python
def permutations(input_list):
	if not input_list:
		return [[]]
	permut = []
	for i in input_list:
		temp = input_list[:]
		temp.remove(i)
		permut.extend([[i] + r for r in permutations(temp)])
	return permut

#store all the permutation list by list in the matrix
list_of_permutations = permutations(input_values)

#create a matrix with the diff values of the halves
diff_list = []
for item in list_of_permutations:
	sum1 = 0
	for element in item[0:len(item)/2]:
		sum1 = sum1 + element
	avg1 = sum1/(len(item)/2)
	sum2 = 0
	for element in item[len(item)/2:len(item)]:
		sum2 = sum2 + element
	avg2 = sum2/len(item)/2
	diff = abs(avg1-avg2)
	diff_list.append(diff)

print diff_list