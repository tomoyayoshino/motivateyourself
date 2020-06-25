let timer1;

function cntStart()
{
  document.timer.elements[2].disabled=true;
  timer1=setInterval("countDown()",1000);
}

function cntStop()
{
  document.timer.elements[2].disabled=false;
  clearInterval(timer1);
}

function countDown()
{
  let min=document.timer.elements[0].value;
  let sec=document.timer.elements[1].value;
  
  if( (min=="") && (sec=="") )
  {
    alert("時刻を設定してください！");
    reSet();
  }
  else
  {
    if (min=="") min=0;
    min=parseInt(min);
    
    if (sec=="") sec=0;
    sec=parseInt(sec);
    
    tmWrite(min*60+sec-1);
  }
}

function tmWrite(int)
{
  int=parseInt(int);
  
  if (int<=0)
  {
    reSet();
    alert("時間です！");
  }
  else
  {
    document.timer.elements[0].value=Math.floor(int/60);
    document.timer.elements[1].value=int % 60;
  }
}

function reSet()
{
  document.timer.elements[0].value="0";
  document.timer.elements[1].value="0";
  document.timer.elements[2].disabled=false;
  clearInterval(timer1);
}  
