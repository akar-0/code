//https://www.codewars.com/kata/582c01ad3fd1cc5736000348/train/javascript
//see also http://www.codesuck.com/2012/02/transpose-javascript-array-in-one-line.html
//https://www.codewars.com/kata/reviews/525a5cef85a9a47bc80006b0/groups/55009212c502956b41000c85
const _=require("lodash");

const rotateMatrix = arr => _.zip(...arr).reverse();
