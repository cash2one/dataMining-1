pyWavelet使用笔记

作者：何委徽

时间：2010年8月25日


1  介绍

本文档的内容参考了pyWavelet 0.1.6的User Guide和ver. 0.2.0的网上例子，主要是把我目前所需要的内容进行了翻译和整理得到的。 主要包含了1D、2D的分解与重构方法，和稳态小波分解重构等内容。 小波包的部分没有翻译，日后有需要的话可能增加。

下载地址：http://www.pybytes.com/pywavelets

   安装：

    easy_install PyWavelets==0.1.6

       python setupegg.py install

       python setup.py install

  

  依赖的软件： numpy, matplotlib

 

pyWavelet的主要特点：

  - 1D,2D正反离散小波变换（DWT，IDWT）

  - 1D,2d稳态小波变换(SWT,Stationary Wavelet Transform)

  - 1D,2D小波包分解重构

  - 逼近小波函数和尺度函数

  - 70多个内置小波滤波器，支持定制小波

  - 单双精度支持

  - 类似Matlab Wavelet Toolbox的使用 


2  Wavelet
2.1  Wavelets families

>>>import pywt

>>>print pywt.families

即可显示软件内含的小波族：

['haar', 'db', 'sym', 'coif', 'bior', 'rbio', 'dmey']

它们分别是：

l         Haar (haar) 

l         Daubechies (db) 

l         Symlets (sym) 

l         Coiflets (coif) 

l         Biorthogonal (bior) 

l         Reverse biorthogonal (rbio) 

l         "Discrete" FIR approximation of Meyer wavelet (dmey) 


2.2  wavelist（）

>>> import pywt
>>> print pywt.wavelist('coif')
['coif1', 'coif2', 'coif3', 'coif4', 'coif5'] 

该方法显示该小波族中包含的小波名称。


2.3  wave object

创建小波对象：Wavelet(name, filter_bank=None)

name：

    小波名称

filter_bank:

    使用用户提供的滤波器组。该滤波器组必须实现:

(dec_lo, dec_hi, rec_lo,rec_hi) =get_filters_coeffs()方法.

dec_lo,dec_hi:

    分解滤波器值

rec_lo,rec_hi:

    重构滤波器值

dec_len:

    分解滤波器长度

rec_len:

    重构滤波器长度

其他属性：

.family_name

.short_name

.orthogonal

.biorthogonal

.symmetry

.vanishing_moments_psi

.vanishing_moments_phi

示例：

>>> import pywt
>>> wavelet = pywt.Wavelet('db1')
>>> print wavelet
Wavelet db1
    Family name:    Daubechies
      Short name:     db
      Filters length: 2
      Orthogonal:     True
      Biorthogonal:   True
      Symmetry:       asymmetric
    >>> print wavelet.dec_lo, wavelet.dec_hi
[0.70710678118654757, 0.70710678118654757] [-0.70710678118654757, 0.70710678118654757]
>>> print wavelet.rec_lo, wavelet.rec_hi
[0.70710678118654757, 0.70710678118654757] [0.70710678118654757, -0.70710678118654757]

 


2.4  wavefun()

wavefun()方法可以在给定的分解阶次上依据小波系数近似给出尺度函数（phi）和小波函数（psi）。

对于正交小波：

>>> import pywt
>>> wavelet = pywt.Wavelet('db2')
>>> phi, psi = wavelet.wavefun(level=5)

对于双正交小波：

>>> import pywt
>>> wavelet = pywt.Wavelet('bior1.1')
>>> phi_d, psi_d, phi_r, psi_r = wavelet.wavefun(level=5)


2.5  使用定制小波

略


3  离散小波变换（DWT）
3.1  1D一阶dwt
3.1.1  基本使用

dwt()函数用于完成一阶、1D的离散小波变换。

(cA, cD) = dwt(data, wavelet, mode=’sym’)

data
输入的信号可以是数值数组、python的list或其它可计数对象。
如果数据不是double格式，则会被转成该格式。
wavelet
使用的小波的名称。可以是wavelist()中的，也可以是Wavelet对象的。
mode 
信号拓展模式。见MODES。

例1：

>>> import pywt

>>> x = [3, 7, 1, 1, -2, 5, 4, 6]

>>> cA, cD = pywt.dwt(x, 'db2')

>>> print cA

[ 5.65685425  7.39923721  0.22414387  3.33677403  7.77817459]

>>> print cD

[-2.44948974 -1.60368225 -4.44140056 -0.41361256  1.22474487]

>>> print pywt.idwt(cA, cD, 'db2')

[ 3.  7.  1.  1. -2.  5.  4.  6.]

 

例2：

传递Wavelet对象时的用法：

>>> w = pywt.Wavelet('sym3')

>>> cA, cD = pywt.dwt(x, wavelet=w, mode='cpd')

>>> print cA

[ 4.38354585  3.80302657  7.31813271 -0.58565539  4.09727044  7.81994027]

>>> print cD

[-1.33068221 -2.78795192 -3.16825651 -0.67715519 -0.09722957 -0.07045258]

注意这里输出的系数数组长度不只跟输入数据的长度有关，还和Wavelet类型有关（特别是它所使用的滤波器长度）。
如果想查看输出数据的长度可以使用dwt_coeff_len()函数：

>>> pywt.dwt_coeff_len(data_len=len(x), filter_len=w.dec_len, mode='sym')
6
>>> pywt.dwt_coeff_len(len(x), w, 'sym')
6
>>> len(cA)
6

dwt_coeff_len（）函数的第三个参数是mode。

>>> pywt.MODES.modes

['zpd', 'cpd', 'sym', 'ppd', 'sp1', 'per']

>>> [pywt.dwt_coeff_len(len(x), w.dec_len, mode) for mode in pywt.MODES.modes]

[6, 6, 6, 6, 6, 4]

从这个例子可以看到，per（periodization）模式与其他的略有不同，它被设计为输出系数刚好是输入数据长度的一半。所以，当你在做DWT和IDWT的时候，不要把per模式和其他模式混合起来用。


3.2.2  使用技巧

用None做其中一个系数数组时，等效于给一个全零数组（两个数组中最多只能有一个None）：

>>> print pywt.idwt([1,2,0,1], None, 'db2', 'sym')

[ 1.19006969  1.54362308  0.44828774 -0.25881905  0.48296291  0.8365163 ]

>>> print pywt.idwt([1, 2, 0, 1], [0, 0, 0, 0], 'db2', 'sym')

[ 1.19006969  1.54362308  0.44828774 -0.25881905  0.48296291  0.8365163 ]

>>> print pywt.idwt(None, [1, 2, 0, 1], 'db2', 'sym')

[ 0.57769726 -0.93125065  1.67303261 -0.96592583 -0.12940952 -0.22414387]

>>> print pywt.idwt([0, 0, 0, 0], [1, 2, 0, 1], 'db2', 'sym')

[ 0.57769726 -0.93125065  1.67303261 -0.96592583 -0.12940952 -0.22414387]


3.2.3         idwt中的系数长度。

做IDWT变换时，通常两个系数数组长度必须相等。但是，在有些情况下，如多阶次的DWT和IDWT变换时，允许两者的数量少许不同会比较方便。当设置了correct_size标志时，逼近系数可以比细节系数大1：

>>> print pywt.idwt([1, 2, 3, 4, 5], [1, 2, 3, 4], 'db2', 'sym', correct_size=True)

[ 1.76776695  0.61237244  3.18198052  0.61237244  4.59619408  0.61237244]

 

>>> print pywt.idwt([1, 2, 3, 4], [1, 2, 3, 4, 5], 'db2', 'sym', correct_size=True)

Traceback (most recent call last):

...

ValueError: Coefficients arrays must satisfy (0 <= len(cA) - len(cD) <= 1).

另外，要注意，不是所有的系数数组后可以使用IDWT，下面的例子所以失败，就是因为db4和sym模式的最小输出长度是4而不是3.

>>> pywt.idwt([1,2,4], [4,1,3], 'db4', 'sym')

Traceback (most recent call last):

...

ValueError: Invalid coefficient arrays length for specified wavelet. Wavelet and mode must be the same as used for decomposition.


3.3     多阶DWT, IDWT和SWT

wavedec()函数完成1D多阶次离散小波分解，返回系数数组list，[cAn, cDn, cDn-1, …, cD2, cD1]，n为分解阶次，cAn是逼近系数数组，后面的依次是细节系数数组。

wavedec(data, wavelet, mode=’sym’, level=None)

data :　输入信号

wavelet: 可以是来自wavelist()的小波名称，也可以是Wavelet对象。

mode: 信号拓展模式

level:  分解阶次。使用dwt_max_level（）时，计算信号能达到的最高分解阶次。

>>> import pywt

>>> x = [3, 7, 1, 1, -2, 5, 4, 6]

>>> db1 = pywt.Wavelet('db1')

>>> cA3, cD3, cD2, cD1 = pywt.wavedec(x, db1)

>>> print cA3

[ 8.83883476]

>>> print cD3

[-0.35355339]

>>> print cD2

[ 4.  -3.5]

>>> print cD1

[-2.82842712  0.         -4.94974747 -1.41421356]

 

>>> pywt.dwt_max_level(len(x), db1)

3

>>> cA2, cD2, cD1 = pywt.wavedec(x, db1, mode='cpd', level=2)

dwt_max_level(data_len, filter_len) 等于 floor(log(data_len/(filter_len-1))/log(2))

 

多阶次重建

waverec(coeffs, wavelet, mode='sym')

>>> coeffs = pywt.wavedec(x, db1)

>>> print pywt.waverec(coeffs, db1)

[ 3.  7.  1.  1. -2.  5.  4.  6.]


3.4     多阶SWT分解

     >>> x = [3, 7, 1, 3, -2, 6, 4, 6]

>>> (cA2, cD2), (cA1, cD1) = pywt.swt(x, db1, level=2)

>>> print cA1

[ 7.07106781  5.65685425  2.82842712  0.70710678  2.82842712  7.07106781

  7.07106781  6.36396103]

>>> print cD1

[-2.82842712  4.24264069 -1.41421356  3.53553391 -5.65685425  1.41421356

 -1.41421356  2.12132034]

>>> print cA2

[  7.    4.5   4.    5.5   7.    9.5  10.    8.5]

>>> print cD2

[ 3.   3.5  0.  -4.5 -3.   0.5  0.   0.5]

>>> [(cA2, cD2)] = pywt.swt(cA1, db1, level=1, start_level=1)

>>> print cA2

[  7.    4.5   4.    5.5   7.    9.5  10.    8.5]

>>> print cD2

[ 3.   3.5  0.  -4.5 -3.   0.5  0.   0.5]

>>> coeffs = pywt.swt(x, db1)

>>> len(coeffs)

3

>>> pywt.swt_max_level(len(x))

3


4  2D DWT和IDWT
4.1  2D一阶变换dwt2

dwt2(data, wavelet, mode=’sym’)

         返回 (cA, (cH, cV, cD)), 分别是逼近、水平细节、垂直细节和对角线细节

>>> import pywt, numpy

>>> data = numpy.ones((4,4), dtype=numpy.float64)

>>> coeffs = pywt.dwt2(data, 'haar')

>>> cA, (cH, cV, cD) = coeffs

>>> print cA

[[ 2.  2.]

 [ 2.  2.]]

>>> print cV

[[ 0.  0.]

 [ 0.  0.]]


 4.2  2D一阶重构idwt2

idwt2(coeffs, wavelet, mode='sym')

     coeffs是tuple，(cA, (cH, cV, cD))。其余参数不再赘述。


 4.3  2D多阶分解

wavedec2(data, wavelet, mode='sym', level=None)

         该函数返回一个list, [cAn, (cHn, cVn, cDn), ..., (cH1, cV1, cD1)]。例如： 

>>> import pywt, numpy

>>> coeffs = pywt.wavedec2(numpy.ones((8,8)), 'db1', level=2)

>>> cA2, (cH2, cV2, cD2), (cH1, cV1, cD1) = coeffs

>>> print cA2

[[ 4.  4.]

 [ 4.  4.]]


4.4  2D多阶重建

waverec2(coeffs, wavelet, mode='sym')

         coeffs的形式与wavedec2()的分解结果相同。[cAn, (cHn, cVn, cDn), ..., (cH1, cV1, cD1)]，例如：

>>> import pywt, numpy

>>> coeffs = pywt.wavedec2(numpy.ones((4,4)), 'db1')

>>> print "levels:", len(coeffs)-1

levels: 2

>>> print pywt.waverec2(coeffs, 'db1')

[[ 1.  1.  1.  1.]

 [ 1.  1.  1.  1.]

 [ 1.  1.  1.  1.]

 [ 1.  1.  1.  1.]]