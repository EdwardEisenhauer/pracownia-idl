FUNCTION C2F, c
  RETURN, 32 + 9./5 * c
END

FUNCTION C2FTable, start, stop, step
  n = FLOOR((stop - start)/ step)
  c = FINDGEN(n, step, start)
  f = C2F(c)
  PRINT, c
  PRINT, f
END

; Task 1
PRINT,"===== Task 1 ====="

A = [4 , 3, 7, 1, 2, 8, 10, 18, 20, 2, 1]

PRINT, 'Low to High: ', A[SORT(A)]
PRINT, 'HIGH to Low: ', A[REVERSE(SORT(A))]

; Task 2
PRINT,"===== Task 2 ====="

A = INDGEN(10)
INDICES = WHERE(A GT 5, count, COMPLEMENT=A_compl, NCOMPLEMENT=coutn_compl)
PRINT, 'There are ', count, ' numbers greater than 5'
PRINT, 'They are at indices', indices
PRINT, 'There are ', coutn_compl, ' numbers less or equal 5'
PRINT, 'They are at indices', A_compl

; Task 3
PRINT,"===== Task 3 ====="

A = [1, 2, 1, 2, 3, 4, 5, 6, 6, 5]
sorted = A[SORT(A)]
INDICES = UNIQ(sorted)
PRINT, "Unique elements of ", A, "are: "
PRINT, sorted[INDICES]

; Task 4
PRINT,"===== Task 4 ====="

; f(x) = a * x^2 + b* x + c

a = 4
b = 2
c = -6

PRINT, 'f(x) = ', a, ' * x^2 + ', b, ' * x', ' + ', c

d = b ^ 2 - 4 * a * c

print, 'Delta = ', d

IF d lt 0 THEN EXIT

x1 = (-b - SQRT(d))/(2 * a)
x2 = (-b + SQRT(d))/(2 * a)

PRINT, 'x_1 = ', x1
PRINT, 'x_2 = ', x2

x = FINDGEN(30, INCREMENT=1, START=x1 - 10)
y = a * x^2 + b * x + c
PLOT, x, y, XTITLE='x', YTITLE='f(x)'

; WAIT, 3.3
; IF (x2 - x1) NE 0 THEN BEGIN
 ;    start = 99 * (x2 - x1)
	; x = FINDGEN(100, x2-x1, start)
	; y = a * x^2 + b * x + c
; ENDIF

; Task 5
PRINT,"===== Task 5 ====="

C2FTable, -10, 10, 1


EXIT
END