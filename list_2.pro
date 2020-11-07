pro lista_2

; Task 1

A = [4 , 3, 7, 1, 2, 8, 10, 18, 20, 2, 1]

PRINT, 'Low to High: ', A[SORT(A)]
PRINT, 'HIGH to Low: ', A[REVERSE(SORT(A))]

; Task 2

A = INDGEN(10)
_ = WHERE(A GT 5, count)
PRINT, 'There are ', count, ' numbers greater than 5'

_ = WHERE(A LE 5, count)
PRINT, 'There are ', count, ' numbers lesser or equal 5'

; Task 3

A = [1, 2, 1, 2, 3, 4, 5, 6, 6, 5]

PRINT, UNIQ(SORT(A))

; Task 4

; f(x) = a * x^2 + b* x + c

a = 4
b = 2
c = -2

d = b ^ 2 - 4 * a * c

print, 'Delta = ', d

IF d lt 0 THEN EXIT

x1 = (-b - SQRT(d))/(2 * a)
x2 = (-b + SQRT(d))/(2 * a)

PRINT, 'x_1 = ', x1
PRINT, 'x_2 = ', x2

IF (x2 - x1) NE 0 THEN BEGIN
	start = 99 * (x2 - x1)
	x = FINDGEN(100, x2-x1, start)
	y = a * x^2 + b * x + c
	PRINT, 'dupa1'
ENDIF ELSE BEGIN
	PRINT, 'dupa2'
ENDELSE

; Task 5

FUNCTION CToF, c
	RETURN, 32 + 9./5 * c
END

FUNCTION CToFTable, start, stop, step
	n = FLOOR((stop - start)/ step)
	c = FINDGEN(n, step, start)
	f = CToF(c)
	PRINT, c
	PRINT, f
END

EXIT
END