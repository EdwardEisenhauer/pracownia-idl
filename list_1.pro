FUNCTION JulianDate, L, M, N
  ; L - year, M - month, N - day
  L1 = L + 4716 - FLOOR((14. - M) / 12, /L64)
  M1 = (M + 9) MOD 12
  G = FLOOR(3./4*FLOOR((L1 + 184.)/100, /L64), /L64) - 38
  RETURN, FLOOR(365.25 * L1, /L64) + FLOOR(30.6 * M1 + 0.4, /L64) + N - G - 1402
END

FUNCTION WeekDay, L, M, N
  week_days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday']
  RETURN, week_days[(CALL_FUNCTION('JulianDate', L, M, N) + 0.5) MOD 7]
END

FUNCTION Biorytm, birth, day
  ; day and birth are Julian Dates
  P = [23., 28., 33.]
  F = []
  FOR i = 0, 2 DO F = [F, SIN(2. * !PI * (day-birth) / P[i])]
  RETURN, F
END 

FUNCTION MoonPhase, day
  ; day is a Julian Date
  D = (297.5 + 12.19074912 * (day - 2451545)) MOD 360
  IF D < 0 THEN D = D + 360
  RETURN, D
END

FUNCTION DaysAfter, L, M, N, days
  JD = CALL_FUNCTION('JulianDate', L, M, N)
  JD = JD + days
  G = FLOOR(3/4 * FLOOR((JD + 68569)/36524.25)) - 38
  J = 4 * (JD + G + 1401) + 3
  I = 2 + 5 MOD FLOOR(J MOD 1461 / 4)
  Na = 1 + FLOOR(I MOD 153 / 5)
  Ma = 1 + (2 + FLOOR(I/153) MOD 12)
  La = FLOOR(J/1461) - 4716 + FLOOR((14-M)/12)
  RETURN, [La, Ma, Na]
END

; ===== Task 1 =====
PRINT,"===== Task 1 ====="

task1 = [1/2, 1/1 + 1, 1/(1 + 1), 1./2, 1/(1. + 1)]

FOR i = 0, N_ELEMENTS(task1)-1 DO PRINT,task1[i]

HELP,task1

task1 = [1/2, 1/1 + 1, 1/(1 + 1), 1/2, 1/(1 + 1)]

FOR i = 0, N_ELEMENTS(task1)-1 DO PRINT,task1[i]

HELP,task1

; The resulting array is composed out of the floating point numebrs.
; If the dot would be taken from the fourth and fifth expression,
; then the resulting array would be composed out of the inegers values.
; Division is of the floor type.

; ===== Task 2 =====
PRINT,"===== Task 2 ====="

JD = JulianDate(1990, 4, 30)

PRINT, 'Calculated: ', JD
PRINT, 'Should be:  ', 2448012
PRINT, 'Difference: ', JD-2448012

; Possible difference may be the result of integer division (3/4 will result in 0, 3./4 in 0.75).

; ===== Task 3 =====
PRINT,"===== Task 3 ====="

Y = 1410
M = 7
D = 15

PRINT, STRTRIM(STRING(D), 2) + '.' + STRTRIM(STRING(M), 2) + '.' + STRTRIM(STRING(Y), 2) + ' was a ' + WeekDay(Y, M, D)

; Task 4
PRINT,"===== Task 4 ====="

B = Biorytm(JulianDate(1937, 5, 3), JulianDate(2020, 10, 14))

PRINT, "Physical: ", B[0]
PRINT, "Emotional: ", B[1]
PRINT, "Intelectual: ", B[2]

; Task 5
PRINT,"===== Task 5 ====="

phases = ["New Moon", "First Quarter", "Full Moon", "Last Quarter"]

phase = MoonPhase(JulianDate(2020, 11, 7))
index = FLOOR((phase+45)/90) MOD 4
PRINT, phases[index]

; Task 6
PRINT,"===== Task 6 ====="
PRINT,DaysAfter(1937, 5, 3, 7500)

; Task 7
PRINT,"===== Task 7 ====="

r = 0
h = 0

READ, r, PROMPT='Cone radius: '
READ, h, PROMPT='Cone height: '

A = !PI*r^2 + !PI*r*SQRT(h^2 + r ^2)
V = 1./3 * !PI * r^2 * h

PRINT, 'Area is   ', A
PRINT, 'Volume is ', V

END
