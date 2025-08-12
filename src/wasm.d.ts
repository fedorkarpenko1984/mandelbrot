declare module './wasm/release.js' {
  export function initMandelbrot(): Promise<{
    memory: WebAssembly.Memory;
    mandelbrot: (real: number, imaginary: number, maxIter: number) => number;
  }>;
}