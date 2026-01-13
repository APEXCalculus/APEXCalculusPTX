/* 
Interactive Script illustrating the concepts of
	> Family of Solutions
	> Initial Conditions
	> Particular Solutions
*/

// Define the x and y ranges for the board
var x_L = -3.1, x_R = 3.1, y_B = -2, y_T = 7;

// Create the JSXGraph board
var board = JXG.JSXGraph.initBoard(
	'interactive-drag-ic-slate',
	{
		boundingbox:[x_L,y_T,x_R,y_B],
		keepaspectratio:false,
		axis:true,
		defaultAxes: {
			x: {ticks: {insertTicks: false, ticksDistance: 1, label: {fontsize: 14}}},
			y: {ticks: {label: {fontsize: 14}}},
		},
		showNavigation:false,
		showCopyright:false
	}
);

// Added because the board is too small in pretext's side-by-side environment
// Comment out or adjust as needed
board.resizeContainer(300, 300);

// Hardcode a subset of the family of solutions' y-intercepts and corresponding constants
const y_list 	= [  -1,    0,    1,    2,  2.5,    3,  3.5,    4,    5,    6];
const c_list	= [  -4,   -3,   -2,   -1,  -.5,    0,   .5,    1,    2,    3];

// Create the family of solution objects
const f_str = [];
const f_list = [];
const f_plot = [];

for (let i=0; i<y_list.length; i++) {

	// Define the family of solutions arrays
	f_str.push('y = ' + c_list[i] + 'e^{x^2} + 3');
	f_list.push(function(x){ return (y_list[i] - 3)*Math.exp(x*x)+3; });
	f_plot.push(board.create(
		'functiongraph',
		[f_list[i], x_L, x_R],
		{strokecolor:'green', strokeOpacity:0.35, strokeWidth:3}
	));
}

// Create the interactive slider along the y-axis
var y_slider = board.create(
	'slider',
	[[0,y_B+1],[0,y_T-1],[y_B+1,2,y_T-1]],
	{ 	// Slider Properties
		withLabel: false,
		size: 5,
		highline: {strokeWidth: 0},
		snapWidth: 0.1
	}
);

// Currently selected y(0) = slider value, corresponding constant C, and the particular solution
var f0 = function(x){ 
	return (y_slider.Value() - 3)*Math.exp(x*x) + 3; 
};

// Update the particular solution
var plot_soln = board.create(
	'functiongraph',
	[f0, x_L, x_R],
	{strokecolor: 'blue', strokeOpacity: 0.6, strokeWidth: 4}
);

var label_x = 1.6;
	label_y = 3.7;

var label_line = function(x){ return ( (3.3 - y_slider.Value())/(-1.7) )*x + y_slider.Value(); }

board.create(
	'functiongraph',
	[label_line, -1.6, 0],
	{
		strokecolor:	'black', 
		strokeOpacity:	1, 
		strokeWidth:	1
	});
	
board.create(
	'text',
	[-3, 3.8, function(){ return 'Initial Condition:' }],
	{fontSize: 13}
);
board.create(
	'text',
	[-3, 3.3, function(){ return 'y(0) = ' + (y_slider.Value()).toFixed(1); }],
	{fontSize: 14}
);
board.create(
	'text',
	[1.5, 4.4, function(){ return 'Particular Solution:' }],
	{fontSize: 13}
);
board.create(
	'text',
	[1.1, 3.6 ,function(){ 
		if (y_slider.Value() < 3) {
			return 'y = ' + (y_slider.Value() - 3).toFixed(1) + 'e^{x^2} + 3';
		} else {
			return 'y =  ' + (y_slider.Value() - 3).toFixed(1) + 'e^{x^2} + 3';
		};
	}],
	{fontSize: 14}
);

board.create(
	'text',
	[-2.65, 2.6 ,function(){ return 'c = ' + (y_slider.Value() - 3).toFixed(1); }],
	{fontSize: 14}
);
