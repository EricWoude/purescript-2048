import {main} from '../output/Main/index'

const app = document.getElementById('app')

document.onkeydown = keyControl;

/* Takes the grid as HTML string and appends it to the app. */
const drawGrid = () => {
    app.insertAdjacentHTML('beforeend', main)
}

function keyControl(event) {
    switch(event.keyCode) {
        case 37: // left arrow
            break

        case 38: // up arrow
            break
    
        case 39: // right arrow
            break

        case 40: // down arrow
            break
    }
}

drawGrid()

