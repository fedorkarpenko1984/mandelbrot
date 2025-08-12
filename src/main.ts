import './style.css'
// @ts-ignore
import { initMandelbrot } from './wasm/release.js'

const canvas = document.querySelector('canvas')!
const ctx = canvas.getContext('2d')!

const imageData = ctx.createImageData(1601, 801);
const data = imageData.data;

let mandelbrot: any; // <-- будем инициализировать позже

// Загружаем WASM
initMandelbrot()
  .then((exports: any) => {
    mandelbrot = exports.mandelbrot;
    // Теперь можно рисовать
    render(-2, 1, getZoom());
    loader.style.display = 'none';
  })
  .catch((err: any) => {
    console.error('Failed to load WASM', err);
    loader.style.display = 'none';
  });

const loader = document.querySelector('.loader') as HTMLElement

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

const modal = document.querySelector('.modal') as HTMLElement
const closeModalBtn = document.querySelector('.modal .close')

const message = document.querySelector('.message') as HTMLElement

function render(startX: number, startY: number, step: number) {
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

closeModalBtn?.addEventListener('click', event => {
  event.stopPropagation()
  modal.style.display = 'none'
})

window.addEventListener('load', () => {
  setTimeout(() => {
    render(startX, startY, getZoom())
    loader.style.display = 'none'
    xCoordEl!.textContent = 'X: 0'
    yCoordEl!.textContent = 'Y: 0'

    setTimeout(() => {
      modal.style.display = 'none'
    }, 10000)
  })
})

function mouseClicksHandler(event: MouseEvent) {
  if (event.type === 'contextmenu') event.preventDefault()
  if (isScrollHandlerWorks) return
  const newZoomIndex = zoomIndex + (event.type === 'click' ? 1 : -1)
  if (!(newZoomIndex >= 0 && newZoomIndex < 40)) {
    message.style.display = 'block'
    setTimeout(() => { message.style.display = 'none' }, 3000)
    return
  }

  isScrollHandlerWorks = true
  const { x: canvasX, y: canvasY } = canvas.getBoundingClientRect()
  const pixelCoords = {
    x: event.x - canvasX,
    y: event.y - canvasY
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
  xCoordEl!.textContent = 'X: ' + (zoomIndex === 0 ? '0' : (Math.round(centerMathCoords.x * 10_000_000_000_000) / 10_000_000_000_000).toString())
  yCoordEl!.textContent = 'Y: ' + (zoomIndex === 0 ? '0' : (Math.round(centerMathCoords.y * 10_000_000_000_000) / 10_000_000_000_000).toString())

  loader.style.display = 'flex'
  setTimeout(() => {
    render(startX, startY, getZoom())
    loader.style.display = 'none'
    isScrollHandlerWorks = false
  })
}

window.addEventListener('click', mouseClicksHandler)
window.addEventListener('contextmenu', mouseClicksHandler)

canvas.addEventListener('mousemove', event => {
  const { x: canvasX, y: canvasY } = canvas.getBoundingClientRect()
  const pixelCoords = {
    x: event.x - canvasX,
    y: event.y - canvasY
  }
  const cursorMathCoords = {
    x: Math.round(startX / getZoom() + pixelCoords.x) * getZoom(),
    y: Math.round(startY / getZoom() - pixelCoords.y - 1) * getZoom(),
  }
  cursorXCoordEl!.innerHTML = 'X: ' + (Math.round(cursorMathCoords.x * 10_000_000_000_000) / 10_000_000_000_000).toString()
  cursorYCoordEl!.innerHTML = 'Y: ' + (Math.round(cursorMathCoords.y * 10_000_000_000_000) / 10_000_000_000_000).toString()
}) 