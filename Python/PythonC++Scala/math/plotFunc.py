import numpy
import matplotlib.pyplot as plt
def func(x):
    return x**4*(numpy.cos(1.0/x))+2*(x**4)
plt.plot(func(numpy.linspace(-2*numpy.pi,2*numpy.pi,20)))
plt.show()

