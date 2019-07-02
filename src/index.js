import {main} from '../output/Main/index'

const app = document.getElementById('app')

/* Takes the grid as HTML string and appends it to the app. */
const drawGrid = () => {
    app.insertAdjacentHTML('beforeend', main)
}

drawGrid()