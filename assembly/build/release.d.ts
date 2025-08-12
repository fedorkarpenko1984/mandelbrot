/** Exported memory */
export declare const memory: WebAssembly.Memory;
/**
 * assembly/index/mandelbrot
 * @param real `f64`
 * @param imaginary `f64`
 * @param iterations `i32`
 * @returns `i32`
 */
export declare function mandelbrot(real: number, imaginary: number, iterations: number): number;
