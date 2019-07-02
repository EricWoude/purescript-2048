# TwoThousandFortyEight
This project aims to implement the famous game [2048](https://en.wikipedia.org/wiki/2048_(video_game)) in purescript. It may (~~will~~) contain design errors and other quirks, as this is just made to increase my functional programming skills.

## Development
### Installing
To install all needed packages run `bower i` from the root folder. This project uses [Parcel](https://parceljs.org/) for bundling the application, so make sure you have installed Parcel by running `npm install -g parcel-bundler`.

### Environment
1. Make sure the purescript code builds using command `pulp --watch build`.
2. Start the Javascript development environment: `npm run develop`.
3. The environment will be hosted at `localhost:1234`

### Testing
To start the test suite, run `pulp test` from the root folder.

## Acknowledgments
My work is highly inspired by the blog post [Implementing the game 2048 in less than 90 lines of Haskell](http://gregorulm.com/2048-in-90-lines-haskell/) by Gregor Ulm.
