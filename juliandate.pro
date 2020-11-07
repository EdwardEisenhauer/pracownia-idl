FUNCTION JulianDate, L, M, N
  ; L - year, M - month, N - day
  L1 = L + 4716 - FLOOR((14. - M) / 12, /L64)
  M1 = (M + 9) MOD 12
  G = FLOOR(3./4*FLOOR((L1 + 184.)/100, /L64), /L64) - 38
  RETURN, FLOOR(365.25 * L1, /L64) + FLOOR(30.6 * M1 + 0.4, /L64) + N - G - 1402
END