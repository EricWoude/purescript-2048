import TwoThousandFortyEight from '../output/TwoThousandFortyEight/index'

/* Triggers the keyControl function as soon as a key is released.
 * This function will only listen for the arrow keys. */
document.onkeydown = keyControl;
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

/* Takes the grid as HTML string and appends it to the app. */
const drawGrid = () => {
    const app = document.getElementById('app')
    app.insertAdjacentHTML('beforeend',TwoThousandFortyEight.renderTable)
}

drawGrid()

