var canvas = document.getElementById("brickoutCanvas");
var ctx = canvas.getContext("2d");
var mx=canvas.width, my=canvas.height;
var x = mx/2, y = my-30;
var dx = 0, dy = 0;
var rad=10;

var sBtn=document.getElementById("startBtn");

var scoreTb=document.getElementById("scoreTextbox");
var levelTb=document.getElementById("levelTextbox");
var score=0, level=1;

//Pad
var curX, curY, padX=150, padY=10;
var padWidth=80, padHeight=10, padThickness=2;

//Block
var brickRowCnt=1, brickColCnt=5;
var brickWidth=75, brickHeight=20;
var brickThickness=10;
var brickOffsetTop=30, brickOffsetLeft=30;
var brickCnt=brickRowCnt*brickColCnt;

var bricks=[];
var brickState=[];
for(var c=0; c<brickColCnt; c++){
	bricks[c]=[];
	brickState[c]=[];
	for(var r=0; r<brickRowCnt; r++){
		bricks[c][r]={x:0, y:0};
		brickState[c][r]=1;
	}
}

canvas.addEventListener('mousemove', function(e){ findxy('move', e);}, false);

function gameover()
{
	alert("Game Over");
	document.brickform.submit();
	init();
	dx=0;
	dy=0;
}

function startBtnClicked()
{
	alert("Game Start");
	init();
}

function init()
{
	x = mx/2; y = my-30;
	dx = 2; dy = -2;
	rad=10;
	padX=150; padY=10;
	padWidth=80; padHeight=10; padThickness=2;
	
	for(var c=0; c<brickColCnt; c++){
		bricks[c]=[];
		brickState[c]=[];
		for(var r=0; r<brickRowCnt; r++){
			bricks[c][r]={x:0, y:0};
			brickState[c][r]=1;
		}
	}
	brickCnt=brickRowCnt*brickColCnt;
}

function findxy(res, e)
{
	if(res=='move' || res=='down')
	{
		curX=e.clientX-canvas.offsetLeft;
		padX=curX;
		curY=e.clientY-canvas.offsetTop;
	}
}

function drawBall()
{
    ctx.beginPath();
    ctx.arc(x, y, rad, 0, Math.PI*2);
    ctx.fillStyle = "#0095DD";
    ctx.fill();
    ctx.closePath();
}

function drawPaddle()
{
	ctx.beginPath();
	ctx.fillStyle="red";
	ctx.fillRect(padX-padWidth/2, my-padHeight, padWidth, padHeight);
	ctx.fill();
	ctx.closePath();
}


function drawBricks()
{
	for(var c=0; c<brickColCnt; c++)
	{
		for(var r=0; r<brickRowCnt; r++)
		{
			if(brickState[c][r]==1)
			{
				var brickX = (c*(brickWidth+brickThickness))+brickOffsetLeft;
				var brickY = (r*(brickHeight+brickThickness))+brickOffsetTop;
				
				bricks[c][r].x=brickX;
				bricks[c][r].y=brickY;
				ctx.beginPath();
				ctx.rect(brickX, brickY, brickWidth, brickHeight);
				ctx.fillStyle="green";
				ctx.fill();
				ctx.closePath();
			}
		}
	}
}

var bx, by;
function draw() {
    ctx.clearRect(0, 0, mx, my);
    drawBricks();
    drawPaddle();
    drawBall();
    
    //Hit test
    for(var c=0; c<brickColCnt; c++)
    {
    	for(var r=0; r<brickRowCnt; r++)
    	{
    		if(brickState[c][r]==1)
    		{
	    		bx=bricks[c][r].x;
	    		by=bricks[c][r].y;
	    		if(x>=bx && x<=bx+brickWidth && y>=by && y<=by+brickHeight)
	    		{
	    			brickState[c][r]=0;
	    			dy=-dy;
	    			brickCnt--;
	    			score=score+level;
	    			if(brickCnt==0)
	    			{
	    				level+=1;
	    				alert("Clear");
	    				init();
	    			}
	    		}
    		}
    	}
    }

    
    x += dx;
    y += dy;
    //change direction
    if(x<=(0+rad) || x >=(mx-rad))
    	dx=-dx;
    if(y<=(0+rad+padHeight))
    	dy=-dy;
    else if(y>=(my-rad))
    {
    	if(x>=padX-padWidth/2 && x<=padX+padWidth/2)
    		dy=-dy;
    	else
		{
    		gameover();
		}
    }
    
    levelTextbox.value=level;
    scoreTextbox.value=score;
}

setInterval(draw, 5);