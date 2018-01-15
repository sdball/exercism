function isLeapYear(year: number): boolean {
  const yearIsDivisibleBy = function(n: number): boolean { return year % n == 0; };

  if (yearIsDivisibleBy(400)) { return true } // years divisible by 400 are always leap years
  if (yearIsDivisibleBy(4) && !yearIsDivisibleBy(100)) { return true }
  return false
}

export default isLeapYear
