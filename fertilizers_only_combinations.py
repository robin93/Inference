raw = [1,2,3,4,5,6,7,8,9,10]

#for the porgram to work it is important to use list within the list
def combinations(input_list,output_size):
	comb = []
	if output_size==0:
		return [[]]
	elif output_size==len(input_list):
		return [input_list]
	temp = input_list[:]
	element = temp[0]
	temp.remove(element)
	comb.extend([[element] + r for r in combinations(temp,output_size-1)])
	#the iteration on r will add a new entity to the main list for every list in the combinations(temp,output_size-1)
	comb.extend([r for r in combinations(temp,output_size)])
	#for every sublist in the combinations(temp,output_size), it will extend the list to the comb and increase length
	return comb

list_of_outputs = combinations(raw,3)
print list_of_outputs

#lets see how the program functions
"""
lets say we have input list of size 2 and we need to choose 1 element
combinations([1,2],1)
first check failed
second check failed
temp = [2]
comb = []
comb.extend([[1] + r for r in combinations([2],0)]) --> comb.extend([  [1]+ r for r in [[]] ] )
comb = [1]
comb.extend([r for r in combinations([2],1)]) --> comb.extend([ r for r in [[2]] ])
comb = [[1],[2]]

similarly for the higher level lists the smaller outputs of lists in lists can be used
"""

#-------------------------------------------------------------------------------------
##An alternative solution extracted from stack overflow
# def choose_iter(elements, length):
#     for i in xrange(len(elements)):
#         if length == 1:
#             yield (elements[i],)
#         else:
#             for next in choose_iter(elements[i+1:len(elements)], length-1):
#                 yield (elements[i],) + next
# def choose(l, k):
#     return list(choose_iter(l, k))

# print choose_iter(raw,3)

#--------------------------------------------------------------------------------------
#use of extend and loop to continuously append lists as output
# a = [[1,2,3],[20,30,40],[100,200,300]]
# y = [1000]
# y.extend( y + r for r in a)
# print y