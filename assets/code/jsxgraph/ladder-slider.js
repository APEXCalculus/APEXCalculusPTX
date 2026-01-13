const board = JXG.JSXGraph.initBoard('ladderbox', {
	boundingbox: [-1, 11, 11, -1],
	axis: true,
	showNavigation: false,
	showCopyright: false
});

const L = 10; // ladder length
const x = board.create('glider', [6, 0, board.defaultAxes.x], {name: 'x', snapToGrid: true});
const y = board.create('point', [
	() => x.X(),
	() => Math.sqrt(L*L - x.X()*x.X())
], {name: 'y', visible: true});

board.create('line', [x, y], {straightFirst: false, straightLast: false, strokeColor: 'black'});

const xVal = board.create('text', [1, -0.5, () => `x = ${x.X().toFixed(2)} ft`]);
const yVal = board.create('text', [1, -1, () => `y = ${y.Y().toFixed(2)} ft`]);
const dydtVal = board.create('text', [1, -1.5, () => {
	const dxdt = 1;
	const xnum = x.X();
	const ynum = Math.sqrt(L*L - xnum*xnum);
	const dydt = -(xnum / ynum) * dxdt;
	return `dy/dt = ${dydt.toFixed(2)} ft/sec`;
}]);