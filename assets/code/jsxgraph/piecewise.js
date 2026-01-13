// Initialize JSXGraph board
const board = JXG.JSXGraph.initBoard("piecewise-board", {
	boundingbox: [-1, 4, 5, -2],
	showCopyright: false,
	showNavigation: false,
	grid: false,
	axis: true,
	defaultAxes: {
	x: {
		ticks: {
			insertTicks: false, // Disable automatic placement
			minorTicks: 1, // One minor tick between major ticks
			ticksDistance: 1, // Major ticks at every 2 units
			label: {
				visible: true, // Show tick labels
				offset: [0, -10], // Offset labels slightly above the axis
				// anchorX: 'middle', // Center the label horizontally
				// anchorY: 'top',  // Align the label to the top of the axis
				fontSize: 16, // Set the font size
				//cssClass: 'my-tick-labels' // Apply a CSS class
			}
		}
	},
	y: {
		ticks: {
			insertTicks: false,
			minorTicks: 1,
			ticksDistance: 1,
			label: {
				visible: true,
				offset: [-10, 0],
				// anchorX: 'right',
				// anchorY: 'middle',
				fontSize: 16,
				//cssClass: 'my-tick-labels'
			}
		}
	}
	}
});

const container = document.getElementById("piecewise-board");
container.style.position = "relative";

// === Slider for 't', placed on t axis ===
const tSlider = board.create('slider', [
	[0, 0],       // LEFT endpoint (x, y)
	[5, 0],       // RIGHT endpoint
	[0, 0.5, 5]     // [min, initial, max]
], {
	snapWidth: 0.01,
	withLabel: false,  // hide name label
	size: 3,
	fillColor: '#000000',
});

// === Define piecewise function ===
const f1 = x => x;
const f2 = x => Math.sin(x);

const a = 2; // default transition point
const t = () => tSlider.Value();

// === Function graphs ===
const g1 = board.create('functiongraph', [f1, 0, a], {
	strokeColor: '#3366cc',
	strokeWidth: () => (t() < a ? 4 : 1.5),
});

const g2 = board.create('functiongraph', [f2, a, 5], {
	strokeColor: '#33aa66',
	strokeWidth: () => (t() >= a ? 4 : 1.5)
});

// === Point that follows the function ===
const pointOnGraph = board.create('point', [
	() => t(),
	() => (t() < a ? f1(t()) : f2(t()))
], {
	name: '',
	fillColor: '#ff0000',
	strokeColor: '#ff0000',
	size: 3,
	fixed: true,
	draggable: false,
});

let imageHt, aspect;

imageHt = 0.4; aspect = 279 / 83;
// Rendered label image for "f(t) = t"
const label1 = board.create(
	'image', [
	'external/code/jsxgraph/piecewise-interactive/ft-equals-t.png',
	[0.3, 2.0], [ imageHt * aspect , imageHt ]
	], {
	opacity: () => (t() >= a ? 0.4 : 1),
	}
);

imageHt = 0.4; aspect = 438 / 83;
// Rendered label image for "f(t) = sin(t)"
const label2 = board.create(
	'image', [
	'external/code/jsxgraph/piecewise-interactive/ft-equals-sin.png',
	[ 2.5 , 1 ], [ imageHt * aspect , imageHt ]
	], {
	opacity: () => (t() >= a ? 1 : 0.4),
	}
);

imageHt = 0.25; aspect = 45 / 81;
const w = imageHt * aspect;
const h = imageHt;
const tLabel = board.create(
	'image', [
	'external/code/jsxgraph/piecewise-interactive/t.png',
	[ () => t() - w * 0.5 , -0.75 ], [ w , h ]
	]
);