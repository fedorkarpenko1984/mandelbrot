async function loadWasm() {
  const response = await fetch('./mandelbrot.wasm')
  const bytes = await response.arrayBuffer()
  const wasmModule = await WebAssembly.instantiate(bytes)
  
  const { mandelbrot } = wasmModule.instance.exports
  return mandelbrot
}

let mandelbrot = null

loadWasm().then(res => {
  console.log(res)
  console.log(res(-.75, 0.001, 10000))
  mandelbrot = res
})

const canvas = document.querySelector('canvas')
const ctx = canvas.getContext('2d')
const imageData = ctx.createImageData(1601, 801);
const data = imageData.data;
const loader = document.querySelector('.loader')

let startX = -2
let startY = 1
let zoomIndex = 0
const zoomOptions = [0.0025, 0.001, 0.0005]

const getZoom = () => {
  return zoomOptions[zoomIndex % 3] * (10 ** (Math.floor(zoomIndex / 3) * (-1)))
}

let isScrollHandlerWorks = false

const xCoordEl = document.querySelector('.x-coord')
const yCoordEl = document.querySelector('.y-coord')

const cursorXCoordEl = document.querySelector('.cursor-x-coord')
const cursorYCoordEl = document.querySelector('.cursor-y-coord')

const modal = document.querySelector('.modal')
const closeModalBtn = document.querySelector('.modal .close')

const message = document.querySelector('.message')


function render(startX, startY, step) {
  const qoef = 1 / step
  for (let x = 0; x < 1601; x++) {
    for (let y = 0; y < 801; y++) {
      const real = (startX * qoef + x) / qoef
      const imaginary = (startY * qoef - y) / qoef
      const result = mandelbrot(real, imaginary, 5000)
      if (result === 0) {
        const index = (y * 1601 + x) * 4;
        data[index] = 0;
        data[index + 1] = 0;
        data[index + 2] = 0;
        data[index + 3] = 255;
      }
      if (result > 0 && result <= 10) {
        const index = (y * 1601 + x) * 4;
        data[index] = 50;
        data[index + 1] = result * 5;
        data[index + 2] = result * 15;
        data[index + 3] = (result / 10 + 0.1) * 255;
      }
      else if (result > 10 && result <= 100) {
        const index = (y * 1601 + x) * 4;
        data[index] = result * 2;
        data[index + 1] = result > 45 ? 90 : 70, 100 + result;
        data[index + 2] = 100 + result;
        data[index + 3] = Math.round((0.2 + result / 20) * 255);
      }
      else if (result > 100 && result <= 1000) {
        const index = (y * 1601 + x) * 4;
        data[index] = 40;
        data[index + 1] = 80;
        data[index + 2] = Math.round(result / 5);
        data[index + 3] = Math.round((0.4 + result / 2000) * 255);
      }
      else if (result > 1000 && result <= 5000) {
        const index = (y * 1601 + x) * 4;
        data[index] = 140;
        data[index + 1] = 120;
        data[index + 2] = Math.round(result / 50);
        data[index + 3] = Math.round((0.4 + result / 10000) * 255);
      }
    }
  }
  ctx.putImageData(imageData, 0, 0);
}

if (closeModalBtn) {
  closeModalBtn.addEventListener('click', event => {
    event.stopPropagation()
    modal.style.display = 'none'
  })
}

window.addEventListener('load', () => {
  setTimeout(() => {
    render(startX, startY, getZoom())
    loader.style.display = 'none'
    if (xCoordEl) xCoordEl.textContent = 'X: 0'
    if (yCoordEl) yCoordEl.textContent = 'Y: 0'

    setTimeout(() => {
      if (modal) modal.style.display = 'none'
    }, 10000)
  }, 500)
})

function mouseClicksHandler(event) {
  if (event.type === 'contextmenu') event.preventDefault()
  if (isScrollHandlerWorks) return
  const newZoomIndex = zoomIndex + (event.type === 'click' ? 1 : -1)
  if (!(newZoomIndex >= 0 && newZoomIndex < 40)) {
    if (message) {
      message.style.display = 'block'
      setTimeout(() => { 
        if (message) message.style.display = 'none' 
      }, 3000)
    }
    return
  }

  isScrollHandlerWorks = true
  const rect = canvas.getBoundingClientRect()
  const pixelCoords = {
    x: event.clientX - rect.left,
    y: event.clientY - rect.top
  }

  const centerMathCoords = {
    x: Math.round(startX / getZoom() + pixelCoords.x) * getZoom(),
    y: Math.round(startY / getZoom() - pixelCoords.y) * getZoom(),
  }

  zoomIndex = newZoomIndex
  const deltaX = 800 * getZoom()
  const deltaY = 400 * getZoom()
  if (centerMathCoords.x - deltaX <= -2) {
    startX = -2
  } else if (centerMathCoords.x + deltaX >= 2) {
    startX = 2 - 2 * deltaX
  } else {
    startX = centerMathCoords.x - deltaX
  }
  if (centerMathCoords.y + deltaY >= 1) {
    startY = 1
  } else if (centerMathCoords.y - deltaY <= -1) {
    startY = -1 + 2 * deltaY
  } else {
    startY = centerMathCoords.y + deltaY
  }
  
  if (xCoordEl) {
    xCoordEl.textContent = 'X: ' + (zoomIndex === 0 ? '0' : (Math.round(centerMathCoords.x * 10000000000000) / 10000000000000).toString())
  }
  if (yCoordEl) {
    yCoordEl.textContent = 'Y: ' + (zoomIndex === 0 ? '0' : (Math.round(centerMathCoords.y * 10000000000000) / 10000000000000).toString())
  }

  if (loader) loader.style.display = 'flex'
  setTimeout(() => {
    render(startX, startY, getZoom())
    if (loader) loader.style.display = 'none'
    isScrollHandlerWorks = false
  })
}

window.addEventListener('click', mouseClicksHandler)
window.addEventListener('contextmenu', mouseClicksHandler)

canvas.addEventListener('mousemove', event => {
  const rect = canvas.getBoundingClientRect()
  const pixelCoords = {
    x: event.clientX - rect.left,
    y: event.clientY - rect.top
  }
  const cursorMathCoords = {
    x: Math.round(startX / getZoom() + pixelCoords.x) * getZoom(),
    y: Math.round(startY / getZoom() - pixelCoords.y - 1) * getZoom(),
  }
  
  if (cursorXCoordEl) {
    cursorXCoordEl.innerHTML = 'X: ' + (Math.round(cursorMathCoords.x * 10000000000000) / 10000000000000).toString()
  }
  if (cursorYCoordEl) {
    cursorYCoordEl.innerHTML = 'Y: ' + (Math.round(cursorMathCoords.y * 10000000000000) / 10000000000000).toString()
  }
})