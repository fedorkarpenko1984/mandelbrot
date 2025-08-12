export function mandelbrot(real: f64, imaginary: f64, iterations: i32): i32 {
  var currentR: f64 = 0;
  var currentI: f64 = 0;
  var temporalyR: f64 = 0;
  var temporalyI: f64 = 0;
  const r = Math.hypot(real, imaginary);
  const theta = Math.atan2(imaginary, real);
  const boundary = (1.0 - Math.cos(theta)) / 2;
  if (r <= boundary) return 0;
  for (let i: i32 = 1; i <= iterations; i++) {
    temporalyR = currentR * currentR - currentI * currentI + real;
    temporalyI = 2 * currentR * currentI + imaginary;
    if (temporalyR * temporalyR + temporalyI * temporalyI >= 4) {
      return i;
    }
    currentR = temporalyR;
    currentI = temporalyI;
  }
  return 0;
}
