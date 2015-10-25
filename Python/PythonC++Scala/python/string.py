class Solution:
	def distanceleft(self,s1,s2):
		countl = 0 
		while s1!=s2:
			s1 = self.left(s1)
			countl = countl+1
			if countl>len(s1):
				break 
		if countl>len(s1):
			return -1 
		else:
			return countl	
	def distanceright(self,s1,s2):
		countr = 0
		while s1!=s2:
			s1 = self.right(s1)
			countr = countr+1 
			if countr>len(s1):
				break
		if countr>len(s1):
			return -1
		else:
			return countr 					

	def left(self,s):
		s = s+s[0]
		s = s[1:]
		return s

	def right(self,s):
		s = s[-1]+s
		n = len(s)
		s = s[0:n-1]
		return s
if __name__ == '__main__':
	solution = Solution()
	left = solution.distanceleft("abcd","bcda")
	right = solution.distanceright("abcd","bcda")
	print right
