var canvas = document.getElementById("dinojumpCanvas");
var ctx = canvas.getContext("2d");
var mx=canvas.width, my=canvas.height;
var jumpInput=document.getElementById("jumpingInput");
var itb=document.getElementById("intervalTextbox");
var scoreTb=document.getElementById("scoreTextbox");
var levelTb=document.getElementById("levelTextbox");
var sBtn=document.getElementById("startBtn");

document.addEventListener("keydown", keyDownHandler, false);

var timerID;
var interval=30;

//Dino
var x=20, y=180;
var dinoWidth=20, dinoHeight=30;
var isJumping=0, jumpCounter=0;
var jumpHeight=80, jumpDuration=40;
var dinoImg=new Image();

//Obstacle
var obX=[], obY=[]; //Obstacle Position
var obWidth=[], obHeight=[];//Obstacle Size
var obBaseWidth=5, obBaseHeight=10;//Obstacle Base Size
var gameSpeed=0; //Obstacle Speed
obWidth[0]=getObstacleWidth();
obHeight[0]=getObstacleHeight();
obWidth[1]=getObstacleWidth();
obHeight[1]=getObstacleHeight();
obX[0]=mx; obY[0]=210-obHeight[0];
obX[1]=mx*1.5; obY[1]=210-obHeight[1];

var score=0, level=0;

function setDinoImage()
{
	dinoImg.src="dino.png";
	dinoImg.onload = function(){
		ctx.drawImage(dinoImg, x, y);
	}
}

function startBtnClicked()
{
	alert("Game Start");
	sBtn.disabled=true;
	init();
}

function getRandomNum(min, max) {
  return Math.random() * (max - min + 1) + min;
}

function getObstacleWidth()
{
	return getRandomNum(1, 3)*obBaseWidth;
}

function getObstacleHeight()
{
	return getRandomNum(1, 3)*obBaseHeight;
}

function setDrawInterval(it)
{
	clearInterval(timerID);
	timerID=setInterval(draw, it);
}
function form_submit() {
	document.dinoform.submit();
}
function gameOver()
{
	sBtn.disabled=false;
	form_submit();
	init();
	gameSpeed=0;
}

function init()
{
	setDinoImage();
	
	x=20; y=180;
	isJumping=0; jumpCounter=0;
	jumpDuration=40;
	interval=30;
	setDrawInterval(interval);
	
	obBaseWidth=5; obBaseHeight=10;
	gameSpeed=3;
	obWidth[0]=getObstacleWidth();
	obHeight[0]=getObstacleHeight();
	obWidth[1]=getObstacleWidth();
	obHeight[1]=getObstacleHeight();
	obX[0]=mx; obY[0]=210-obHeight[0];
	obX[1]=mx*1.5; obY[1]=210-obHeight[1];
	
	score=0;
	level=0;
}

function keyDownHandler() 
{
	var keycode = event.keyCode; 
	if ( keycode == 8) 
		event.returnValue = false; //cancle System keydown Event
	
	if ( keycode == 32 ){
		if(isJumping==0)
		{
			isJumping=1;
			jumpCounter=jumpDuration;
		}
	}
}

function drawDino()
{
	ctx.drawImage(dinoImg, x, y);
}

function drawBackground()
{
	ctx.beginPath();
	ctx.fillStyle="gray";
	ctx.fillRect(0, 210, mx, 5);
	ctx.fill();
	ctx.closePath();
}

function drawObstacle()
{
	for(var i=0; i<2; i++)
	{
		ctx.beginPath();
		ctx.fillStyle="black";
		ctx.fillRect(obX[i], obY[i], obWidth[i], obHeight[i]);
		ctx.fill();
		ctx.closePath();
	}
}


function draw()
{	
	ctx.clearRect(0, 0, mx, my);
	
	drawBackground();
	drawObstacle();
	drawDino();
	
	for(var i=0; i<2; i++) //장애물 숫자만큼
	{
		if(obX[i]<=0) //If obstacle X position is under 0
		{
			score+=1; //add score
			
			if(score%5==1) //If score value is #
			{
				level+=1; //add level
				
				setDrawInterval(interval*0.9); //change obstacle speed
			}
			
			obX[i]=canvas.width; //Change the x position of the obstacle to the right of the screen 
			
			obWidth[i]=getObstacleWidth();   //Randomize obstacle size
			obHeight[i]=getObstacleHeight(); //Randomize obstacle size
			obY[i]=210-obHeight[i];
		}
		obX[i]-=gameSpeed; //장애물 움직임
	}
	
	for(var i=0; i<2; i++)
	{
		var dinoLeft=x, dinoRight=x+dinoWidth, dinoBottom=y+dinoHeight, dinoTop=y;
		var obLeft=obX[i], obRight=obX[i]+obWidth[i], obTop=obY[i], obBottom=obY[i]+obHeight[i]
		if(dinoLeft<obRight && dinoRight>obLeft && dinoTop<obBottom && dinoBottom>obTop)
		{
			alert("Score: "+score);
			gameOver();
		}
	}
	
	if(jumpCounter>0) //if in a jumping
	{
		if(jumpCounter<=jumpDuration/2)
			y+=jumpHeight/(jumpDuration/2);
		else
			y-=jumpHeight/(jumpDuration/2);
		
		jumpCounter-=1;
		
		if(jumpCounter<=0)
		{
			isJumping=0;
		}
	}
	levelTb.value=level;
	scoreTb.value=score;
}
