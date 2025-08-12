async function instantiate(module, imports = {}) {
  const { exports } = await WebAssembly.instantiate(module, imports);
  return exports;
}

// Экспортируем функцию, а не значения
export async function initMandelbrot() {
  const response = await fetch(
    new URL("data:application/wasm;base64,AGFzbQEAAAABCAFgA3x8fwF/AwIBAAUDAQAABxcCCm1hbmRlbGJyb3QAAAZtZW1vcnkCAApaAVgCA3wBf0EBIQYDQCACIAZOBEAgBCAEoiAFIAWioSAAoCIDIAOiIAQgBKAgBaIgAaAiBSAFoqBEAAAAAAAAEEBmBEAgBg8LIAMhBCAGQQFqIQYMAQsLQQALACQQc291cmNlTWFwcGluZ1VSTBIuL3JlbGVhc2Uud2FzbS5tYXA=", import.meta.url)
  );
  const bytes = await response.arrayBuffer();
  const wasmModule = await WebAssembly.compile(bytes);
  return await instantiate(wasmModule);
}
