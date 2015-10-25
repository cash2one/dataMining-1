import sys, getopt, random

def bubble_sort(seq):
	for i in range(len(seq)):
		for j in range(1,len(seq)):
			if seq[j-1]>seq[j]:
				seq[j-1], seq[j]= seq[j], seq[j-1]
	return seq

def insertion_sort(seq):
	for i in range(1,len(seq)):
		tmp=seq[i]
		pos=i;
		for j in range(i-1,-1,-1):
			if seq[j]>tmp:
				seq[j+1]=seq[j]
				pos=j
		seq[pos]=tmp
	return seq

def selection_sort(seq):
	for i in range(len(seq)):
		min_index=i;
		for j in range(i,len(seq)):
			if seq[j]<seq[min_index]:
				min_index=j
		seq[i],seq[min_index]=seq[min_index],seq[i]
	return seq

def partition(seq,p,l,r):
	pivot = seq[p]
	seq[p],seq[r]=seq[r],seq[p]
	p_pos = l
	for i in range(l,r):
		if seq[i]<=pivot:
			seq[i],seq[p_pos]=seq[p_pos],seq[i]
			p_pos=p_pos+1
	seq[p_pos],seq[r]=seq[r],seq[p_pos]
	return p_pos


def quick_sort(seq,left,right):
	if left < right:	
		pivot = random.randint(left,right)			
		mid = partition(seq,pivot,left,right)
		quick_sort(seq,left,mid-1)
		quick_sort(seq,mid+1,right)
	return seq

def shell_sort(seq):
	incr = len(seq)/2
	while(incr>=1):
		for i in range(incr,len(seq)):
			tmp=seq[i]
			pos=i;
			for j in range(i-incr,-1,-incr):
				if seq[j]>tmp:
					seq[j+incr]=seq[j]
					pos=j
			seq[pos]=tmp
		incr = incr/2	
	return seq

def usage():
	print 'Usage: python sort.py sorttype[-q|-i|-b|-s|--shell] sequence'
	print 'Example: python sort.py -q 11,32,3,24,5'

def main():
	try:
		if(len(sys.argv)==1) or (len(sys.argv)!=3):
			raise Exception()
		else:
			opts,args=getopt.getopt(sys.argv[1:],'qibs',['shell'])

			if len(args)>0:
				seq=[]
				tmp=args[0].split(',')
				for i in tmp:
					seq.append(int(i))
			else:
				raise Exception()

			for opt in opts:
				if opt[0] =='-q':
					print quick_sort(seq,0,len(seq)-1)						
				elif opt[0] =='-i':
					print insertion_sort(seq)
				elif opt[0] =='-b':
					print bubble_sort(seq)
				elif opt[0] =='-s':
					print selection_sort(seq)
				elif opt[0] =='--shell':
					print shell_sort(seq)															

	except Exception,e:
		usage()
		print e
		sys.exit()

if __name__ =="__main__":
	main()