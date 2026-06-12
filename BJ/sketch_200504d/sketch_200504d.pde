//完成版

int x=0;
int y=0;
int z=0;//パターンわけ
int zx=0;//最初の画面でクリック時に使用
int zy=0;//最初の画面でクリック時に使用
int money=10000;
int bet=0;
int count=0;
int countz=0;

int cardx;
int cardy;

int cardlocx=390;
int cardlocy=380;

int jugdecard=0;
int card10=4;
int locatecardx;
int locatecardy;
int deckcount;
int D_BJ_z;
int tz=0;
int doublejudge=0;
int doubleselect=0;

//deck52枚用意
int[] deck = new int[52];

int rnd;
int ary;

int D_sum=0;
int P_sum=0;
int D_A=0;
int P_A=0;
int D_BJ=0;
int P_BJ=0;
int fin=0;
int D_card[] = new int[52];
int P_card[] = new int[52];
int hit=0;
int stand=0;
int P_count=2;
int deck_count=4;
int D_count=2;

PImage photo1,photo2,photo3,photo4,photo5,photo6,photo7,photo8,photo9,photo10,photo11,photo12,photo13;
PImage photoBJ,photoBJs,photoDeal;

void setup() {
  size(1000, 600);
  background(#06C914);
  PFont font = createFont("Meiryo", 50);
  textFont(font);
  
  noFill();//真ん中枠
  stroke(0);
  strokeWeight(4);
  rect(200, 200, 600, 200);
  
  fill(0);//ブラックジャック文字
  textSize(50);
  text("BLACK JACK", 230, 280);
  
  fill(0);//クリックでスタート文字
  textSize(50);
  text("クリックでスタート", 230, 350);
  
  
  photo1 = loadImage( "A.png" );
  photo2 = loadImage( "2.png" );
  photo3 = loadImage( "3.png" );
  photo4 = loadImage( "4.png" );
  photo5 = loadImage( "5.png" );
  photo6 = loadImage( "6.png" );
  photo7 = loadImage( "7.png" );
  photo8 = loadImage( "8.png" );
  photo9 = loadImage( "9.png" );
  photo10 = loadImage( "10.png" );
  photo11 = loadImage( "J.png" );
  photo12 = loadImage( "Q.png" );
  photo13 = loadImage( "K.png" );
  photoBJ = loadImage( "BJ.png" );
  photoBJs = loadImage( "BJ束.png" );
  photoDeal = loadImage( "dealer2.png" );
  
 
}//void setup()の閉じ


void mousePressed() {//マウスクリックでクリック位置x,yを格納
    if(z==0){//スタート画面
      zx=mouseX;
      zy=mouseY;
    }else if(z==1){//BET選択
      x=mouseX;
      y=mouseY;
    }else if(z>=14){//BET選択
      x=mouseX;
      y=mouseY;
    }
}//void mousePressedの閉じ


void draw(){
  if((z==0)&&((keyPressed == true) && (key == ' '))){
    zx=1;
    zy=1;
  }//if((z==0)&&((keyPressed == true) && (key == スペース)))の閉じ
  
  if ((zx>0)&&(zy>0)){//z=0のとき（BET画面）
  background(#06C914);//リセット
  //DEALER側枠
  stroke(0);
  strokeWeight(2);
  fill(#DBDBDB);
  rect(10, 10, 250, 60, 20);
  
  fill(0);//ディーラー文字
  textSize(50);
  text("DEALER", 40, 58);
  
  
  //PLAYER側枠
  stroke(0);
  strokeWeight(2);
  fill(#DBDBDB);
  rect(10, 530, 250, 60, 20);

  fill(0);//プレイヤー文字
  textSize(50);
  text("PLAYER", 40, 578);
  
  
  //トランプ枠(P)
  stroke(#EDEDED);
  strokeWeight(4);
  fill(#06C914);
  rect(330, 380, 110, 150);

  
  //トランプ枠(D)
  stroke(#EDEDED);
  strokeWeight(4);
  fill(#06C914);
  rect(330, 50, 110, 150);
  
  image( photoDeal, 780, 43 );//ディーラー絵
  image( photoBJs, 800, 350 );//トランプ束
  
  
  
  //所持残高用枠
  stroke(#FFFFFF);
  strokeWeight(2);
  fill(0);
  rect(20, 490, 220, 27);
  
  //所持文字
  textSize(20);
  fill(#FFFFFF);
  text("所持：          　　  円", 30, 511);
  
  //所持金★
  textSize(18);
  fill(#FFFFFF);
  text(money, 110, 510);
  
  //BET額用枠
  stroke(#FFFFFF);
  strokeWeight(2);
  fill(0);
  rect(20, 458, 220, 27);
  
  //BET文字
  textSize(20);
  fill(#FFFFFF);
  text("BET：            　  円", 30, 480);
  
  //BET金★
  textSize(18);
  fill(#FFFFFF);
  text("0", 110, 479);//★
  
  stroke(0);//赤50
  strokeWeight(1);
  fill(#FF0D0D);
  rect(20, 380, 60, 60, 20);
  
  textSize(30);//50文字
  fill(0);
  text("50", 32, 422);
  
  stroke(0);//黄色100
  strokeWeight(1);
  fill(#FAFF0D);
  rect(100, 380, 60, 60, 20);
  
  textSize(30);//100文字
  fill(0);
  text("100", 102, 422);
  
  stroke(0);//オレンジ色500
  strokeWeight(1);
  fill(#FFAF0D);
  rect(180, 380, 60, 60, 20);
  
  textSize(30);//500文字
  fill(0);
  text("500", 182, 422);
  
  stroke(0);//リセット
  strokeWeight(1);
  fill(#FFFFFF);
  rect(100, 335, 140, 40, 20);
  
  textSize(30);//リセット文字
  fill(0);
  text("リセット", 110, 367);
  
  stroke(0);//BET＆スタート
  strokeWeight(1);
  fill(#00F9FF);
  rect(250, 335, 50, 105, 20);
  
  textSize(30);//スタート文字
  fill(0);
  text("開", 260, 380);
  text("始", 260, 420);
  
  textSize(40);//BET題名文字
  fill(#FFFFFF);
  text("BET", 15, 365);
  
  //コメント枠
  stroke(#FFFFFF);
  strokeWeight(2);
  fill(0);
  rect(100, 275, 650, 50);
  
  textSize(30);//クリックでBET数選択文字
  fill(#FFFFFF);
  text("クリックでBET数選択 開始でスタート", 110, 310);
  
  zx=0;
  zy=0;
  z=1;
  }//if ((zx>0)&&(zy>0))の閉じ
  
  
  
  if(z==1){//z=1のときBET選択中
  
   //BET額用枠
  stroke(#FFFFFF);
  strokeWeight(2);
  fill(0);
  rect(20, 458, 220, 27);
  
  //BET文字
  textSize(20);
  fill(#FFFFFF);
  text("BET：            　  円", 30, 480);
  
  //BET金★
  textSize(18);
  fill(#FFFFFF);
  text(bet, 110, 479);//★
  
  if(money<50){
    //コメント枠
    stroke(#FFFFFF);
    strokeWeight(2);
    fill(0);
    rect(100, 275, 650, 50);
  
    textSize(30);//お金がありません。GAME OVER!文字
    fill(#FFFFFF);
    text("お金がありません。GAME OVER!", 110, 310);
  }
  
   if((x>=20)&&(x<=80)&&(y>=380)&&(y<=440)){
     bet=bet+50;
     x=0;
     y=0;
   }else if((x>=100)&&(x<=160)&&(y>=380)&&(y<=440)){
     bet=bet+100;
     x=0;
     y=0;
   }else if((x>=180)&&(x<=240)&&(y>=380)&&(y<=440)){
     bet=bet+500;
     x=0;
     y=0;
   }else if((x>=100)&&(x<=240)&&(y>=335)&&(y<=375)){
     bet=0;
     x=0;
     y=0;
   }//if((x>=20)&&(x<=80)&&(y>=380)&&(y<=440))の閉じ
   
   if (((keyPressed == true) && (key == ENTER))||((x>=250)&&(x<=300)&&(y>=335)&&(y<=440))) {
     if(bet>money){
       //コメント枠
       stroke(#FFFFFF);
       strokeWeight(2);
       fill(0);
       rect(100, 275, 650, 50);
  
       textSize(30);//お金が不足しています文字
       fill(#FFFFFF);
       text("お金が不足しています", 110, 310);
     }else if((bet<=money)&&(bet>0)){
       //コメント枠
       stroke(#FFFFFF);
       strokeWeight(2);
       fill(0);
       rect(100, 275, 650, 50);
  
       textSize(30);//スタート文字
       fill(#FFFFFF);
       text("S T A R T !!", 110, 310);
       
       noStroke();
       fill(#06C914);
       rect(15, 328, 300,120);
       
       money=money-bet;
       
       //所持残高用枠
       stroke(#FFFFFF);
       strokeWeight(2);
       fill(0);
       rect(20, 490, 220, 27);
  
       //所持文字
       textSize(20);
       fill(#FFFFFF);
       text("所持：          　　  円", 30, 511);
  
       //所持金★
       textSize(18);
       fill(#FFFFFF);
       text(money, 110, 510);
       
       z=2;//ゲームスタート
     }else if(bet==0){
       //コメント枠
       stroke(#FFFFFF);
       strokeWeight(2);
       fill(0);
       rect(100, 275, 650, 50);
  
       textSize(30);//50円以上BETしてEnterキーを押してください文字
       fill(#FFFFFF);
       text("50円以上BETして開始を押してください", 110, 310);
     }//if(bet>money)のelseの閉じ
     x=0;
     y=0;
   }//if ((keyPressed == true) && (key == ENTER))||・・・ の閉じ
  }//if(z==1)の閉じ
  
  
  if(z==2){
    //1～52までをdeck配列に格納
     for(int i = 0; i <= 3; i++){
       int a=1;
       a=a+13*i;
       deck[a-1]=1;
       deck[a]=2;
       deck[a+1]=3;
       deck[a+2]=4;
       deck[a+3]=5;
       deck[a+4]=6;
       deck[a+5]=7;
       deck[a+6]=8;
       deck[a+7]=9;
       deck[a+8]=10;
       deck[a+9]=10;
       deck[a+10]=10;
       deck[a+11]=10;
     }

    //deck内をシャッフル
    for(int a=1; a<=52; a++){
     rnd = (int)(Math.random()*100)*52/100;
     ary=deck[a-1];
     deck[a-1]=deck[rnd];
     deck[rnd]=ary;
    }//for(int a=1; a<=52; a++)の閉じ
    
    z=3;
    countz=1;
  }//if(z==2)の閉じ
  
  
  if(z==3){//z=3（時間経過用）
  count++;
   if((countz==1)&&(count==180)){
     z=4;
     count=0;
     countz=0;
   }else if((countz==2)&&(count==60)){
     z=6;
     count=0;
     countz=0;
   }else if((countz==3)&&(count==1)){
     z=6;
     count=0;
     countz=0;
   }else if((countz==4)&&(count==180)){
     z=12;
     count=0;
     countz=0;
     D_BJ_z=2;
   }else if((countz==5)&&(count==120)){
     z=13;
     count=0;
     countz=0;
   }else if((countz==6)&&(count==5)){
     z=11;
     count=0;
     countz=0;
   }else if((countz==7)&&(count==110)){
     z=11;
     count=0;
     countz=0;
     tz=1;
   }else if((countz==8)&&(count==5)){
     z=11;
     count=0;
     countz=0;
     tz=2;
   }else if((countz==9)&&(count==10)){
     z=16;
     tz=5;
     count=0;
     countz=0;
   }else if((countz==10)&&(count==10)){
     z=16;
     tz=6;
     count=0;
     countz=0;
   }else if((countz==11)&&(count==5)){
     z=16;
     tz=7;
     count=0;
     countz=0;
   }else if((countz==12)&&(count==60)){
     z=16;
     tz=8;
     count=0;
     countz=0;
   }else if((countz==13)&&(count==120)){
     z=18;
     count=0;
     countz=0;
   }else if((countz==14)&&(count==60)){
     z=19;
     tz=9;
     count=0;
     countz=0;
   }else if((countz==15)&&(count==10)){
     z=19;
     tz=10;
     count=0;
     countz=0;
   }else if((countz==16)&&(count==60)){
     z=19;
     tz=12;
     count=0;
     countz=0;
   }else if((countz==17)&&(count==10)){
     z=19;
     tz=13;
     count=0;
     countz=0;
     cardlocx=cardlocx+30;
   }else if((countz==18)&&(count==180)){
     z=21;
     count=0;
     countz=0;
   }else if((countz==19)&&(count==60)){
     //BET額用枠
     stroke(#FFFFFF);
     strokeWeight(2);
     fill(0);
     rect(20, 458, 220, 27);
  
     //BET文字
     textSize(20);
     fill(#FFFFFF);
     text("BET：            　  円", 30, 480);
     
     //所持残高用枠
      stroke(#FFFFFF);
      strokeWeight(2);
      fill(0);
      rect(20, 490, 220, 27);
  
      //所持文字
      textSize(20);
      fill(#FFFFFF);
      text("所持：          　　  円", 30, 511);
  
       //所持金★
      textSize(18);
      fill(#FFFFFF);
      text(money, 110, 510);
     
     count=0;
     countz=20;
   }else if((countz==20)&&(count==180)){
     z=0;
     count=0;
     countz=0;
     zx=1;
     zy=1;
   }//if((countz==1)&&(count==120))の閉じ
  }//if(z==3)の閉じ
  
  if(z==4){//P一枚目配布
    //コメント枠
     stroke(#FFFFFF);
     strokeWeight(2);
     fill(0);
     rect(100, 275, 650, 50);
     
     //プレイヤー1枚目配布
     P_card[0]=deck[0];
     if (P_card[0]==1){//1ならAに記録
       P_A=1;
     }
     locatecardx=330;
     locatecardy=380;
     
     z=5;
     deckcount=0;
      
  }//if(z==4)の閉じ
  
  if(z==5){//カード裏表示
    image( photoBJ, locatecardx, locatecardy );//トランプ
      
    countz=2;
    z=3;
  }//if(z==5)の閉じ
  
  
  if(z==6){//カード裏返し
     noStroke();
     fill(#FFFFFF);
     rect(locatecardx,locatecardy+cardy,110,2);
     cardy=cardy+2;
     countz=3;
     z=3;
     
     if(cardy==150){
       z=7;
       cardy=0;
     }//if(cardy==150)の閉じ
  }//if(z==6)の閉じ
    
    if(z==7){//カード判定表示
      jugdecard=deck[deckcount];
      
      if(jugdecard==1) image( photo1, locatecardx, locatecardy );//トランプA
      if(jugdecard==2) image( photo2, locatecardx, locatecardy );//トランプ2
      if(jugdecard==3) image( photo3, locatecardx, locatecardy );//トランプ3
      if(jugdecard==4) image( photo4, locatecardx, locatecardy );//トランプ4
      if(jugdecard==5) image( photo5, locatecardx, locatecardy );//トランプ5
      if(jugdecard==6) image( photo6, locatecardx, locatecardy );//トランプ6
      if(jugdecard==7) image( photo7, locatecardx, locatecardy );//トランプ7
      if(jugdecard==8) image( photo8, locatecardx, locatecardy );//トランプ8
      if(jugdecard==9) image( photo9, locatecardx, locatecardy );//トランプ9
      
      if(jugdecard==10){
        card10=(int)(Math.random()*100)*3/100;
         if(card10==0) image( photo10, locatecardx, locatecardy );//トランプ10
         else if(card10==1) image( photo11, locatecardx, locatecardy );//トランプJ
         else if(card10==2) image( photo12, locatecardx, locatecardy );//トランプQ
         else if(card10==3) image( photo13, locatecardx, locatecardy );//トランプK
      }//if(jugdecard==10)の閉じ
      
      z=8;
    }//if(z==7)の閉じ
    
    if(z==8){//カード表示後どこに戻るか振り分け
      if(deckcount==0) z=9;
      else if(deckcount==1) z=10;
      else if(deckcount==2){
        z=3;
        countz=6;
      }else if((deckcount==3)&&(stand==0)){
        if(D_BJ_z==2){
          z=12;
          D_BJ_z=0;
        }//if(D_BJ_z==2)の閉じ
      }else if((deckcount>=4)&&(stand==0)){
        z=3;
        countz=10;
      }else if((deckcount==3)&&(stand==1)){
        z=3;
        countz=15;
      }else if((deckcount>=4)&&(stand==1)){
        z=3;
        countz=17;
      }//else if(deckcount==3)の閉じ
      
    }//if(z==8)の閉じ
    
    if(z==9){//D1枚目配布
    
    //ディーラー1枚目配布
    D_card[0]=deck[1];
    if (D_card[0]==1){//1ならAに記録
      D_A=1;
    }//if (D_card[0]==1)の閉じ
     locatecardx=330;
     locatecardy=50;
     
     z=5;
     deckcount=1;
    }//if(z==9)の閉じ
    
    if(z==10){
      
    //プレイヤー2枚目配布
    P_card[1]=deck[2];
    if (P_card[1]==1){//1ならAに記録
      P_A=1;
    }

     locatecardx=360;
     locatecardy=380;
     
     z=5;
     deckcount=2;
      }//if(z==10)の閉じ
      
    if(z==11){//PのBJ判定と合計表示、Dの2枚目、BJ判定と合計表示
    
    stroke(#FFFFFF);//プレイヤー合計
    strokeWeight(4);
    fill(#EEFF12);
    rect(20, 350, 210, 90);
    
    //BJ判定
    if ((P_A==1)&&(P_card[0]==10||P_card[1]==10)){
      P_BJ=1;
      textSize(30);//スタート文字
      fill(#FFFFFF);
      text("PLAYER ブラックジャック!!", 110, 310);
      
    textSize(50);
    fill(0);
    text("B J ! !", 52, 410);
    }else{//BJでなければ合計計算
      P_sum=P_card[0]+P_card[1];
      if(P_A==1){//1が入ってたら
        textSize(50);
        fill(0);
        text(P_sum, 42, 410);
        text(" / ", 100, 410);
        text(P_sum+10, 145, 410);
      }
      else{//1がはいってなかったら
        textSize(50);
        fill(0);
        text(P_sum, 95, 410);
      }//if(P_A==1)のelseの閉じ
    }//if ((P_A==1)&&(P_card[0]==10||P_card[1]==10))のelseの閉じ
    
    z=3;
    countz=7;
    
    if(tz==1){//すぐ下まで
    
    //ディーラー2枚目配布（見えない）
    D_card[1]=deck[3];
     if (D_card[1]==1){//1ならAに記録
      D_A=1;
     }//if (D_card[1]==1)の閉じ
     image( photoBJ, 360, 50 );//トランプ
     
     z=3;
     countz=8;
      }//if(tz=1)の閉じ
     
     if(tz==2){//z=11内のここから下全部
     
     stroke(#FFFFFF);//ディーラー合計
     strokeWeight(4);
     fill(#EEFF12);
     rect(20, 90, 210, 90);
    
       if(D_card[0]==1){//1が入ってたら
         textSize(50);
         fill(0);
         text("1 / 11", 52, 150);
         z=3;
         countz=5;
       }else{//1がはいってなかったら
         textSize(50);
         fill(0);
         text(D_card[0], 95, 150);
         z=3;
         countz=5;
       }
       
       D_sum=D_card[0]+D_card[1];//一応Dの合計先に計算しとく
       
       //BJ判定
       if ((D_A==1)&&(D_card[0]==10||D_card[1]==10)){
       D_BJ=1;
       z=12;
       D_BJ_z=1;
       }
       
       tz=3;
     }//if(tz=2)の閉じ
   }//if(z==11)の閉じ
   
   
   if(z==12){
     if(D_BJ_z==1){
       z=3;
       countz=4;
     }else if(D_BJ_z==2){
       locatecardx=360;
       locatecardy=50;
       z=5;
       deckcount=3;
     }else if(D_BJ_z==0){
        stroke(#FFFFFF);
        strokeWeight(2);
        fill(0);
        rect(100, 275, 650, 50);
       
       textSize(30);//スタート文字
       fill(#FFFFFF);
       text("DEALER ブラックジャック!!", 110, 310);
       
       stroke(#FFFFFF);//ディーラー合計
       strokeWeight(4);
       fill(#EEFF12);
       rect(20, 90, 210, 90);
    
       textSize(50);
       fill(0);
       text("B J ! !", 52, 150);
       z=3;
       countz=5;
     }//if(D_BJ_z==1)のelse ifの閉じ
   }//if(z==12)の閉じ
   
   
   
   if(z==13){
     //終了判定
     if((P_BJ==1)&&(D_BJ==1)) fin=3;//引き分け
     else if((P_BJ==1)&&(D_BJ==0)) fin=4;//プレイヤー勝利（BJ)
     else if((P_BJ==0)&&(D_BJ==1)) fin=5;//ディーラー勝利（BJ）
     else fin=0;
     
     if(fin==0) z=14;
       else z=20;
   }//if(z==13)の閉じ
  
  if(z==14){//HIT STAND 1回目
     stroke(#FFFFFF);
     strokeWeight(2);
     fill(0);
     rect(100, 275, 650, 50);
    
    textSize(30);//HITSTAND選択文字
    fill(#FFFFFF);
    text("P L A Y E R ターン", 110, 310);
    
    stroke(#FFFFFF);//HIT赤
    strokeWeight(2);
    fill(#FF0000);
    rect(120, 215, 180, 50, 20);
    
    textSize(30);//HIT文字
    fill(#FFFFFF);
    text("H I T", 173, 250);
    
    if((bet<=money)&&(tz==3)){
    stroke(#FFFFFF);//DOUBLEオレンジ
    strokeWeight(2);
    fill(#FF8400);
    rect(320, 215, 180, 50, 20);
    
    textSize(25);//DOUBLE文字
    fill(#FFFFFF);
    text("D O U B L E", 340, 250);
    doublejudge=1;
    }//if((bet<=money)&&(tz==3))の閉じ
    
    stroke(#FFFFFF);//STAND青
    strokeWeight(2);
    fill(#1400FF);
    rect(520, 215, 180, 50, 20);
    
    textSize(30);//STAND文字
    fill(#FFFFFF);
    text("S T A N D", 540, 250);
    
    //プレイヤーにHIT(hit=1)orSTAND(stand=1)選ばせる
    if (((keyPressed == true) && (key == 'h'))||((x>=120)&&(x<=300)&&(y>=215)&&(y<=265))) {
      z=15;
      tz=4;
      x=0;
      y=0;
    }else if(((keyPressed == true) && (key == 's'))||((x>=520)&&(x<=700)&&(y>=215)&&(y<=265))) {
      stand=1;
      tz=4;
      z=17;
      x=0;
      y=0;
    }else if((((keyPressed == true) && (key == 'd'))||((x>=320)&&(x<=500)&&(y>=215)&&(y<=265)))&&(doublejudge==1)) {
      z=15;
      doubleselect=1;
      tz=4;
      doublejudge=0;
      x=0;
      y=0;
    }
    
  }//if(z==14)の閉じ
  
  if(z==15){//HITの場合（ダブル含む）
    noStroke();//HITSTAND選択画面けす
    fill(#06C914);
    rect(118, 213, 584,54);
  
  
    if(doubleselect==0){
     //コメント枠
     stroke(#FFFFFF);
     strokeWeight(2);
     fill(0);
     rect(100, 275, 650, 50);
  
     textSize(30);//HIT文字
     fill(#FFFFFF);
     text("H I T !!", 110, 310);
    }else if(doubleselect==1){
     //コメント枠
     stroke(#FFFFFF);
     strokeWeight(2);
     fill(0);
     rect(100, 275, 650, 50);
  
     textSize(30);//ダブル文字
     fill(#FFFFFF);
     text("D O U B L E !!", 110, 310);
     
     money=money-bet;
     bet=bet*2;
     
     //BET額用枠
     stroke(#FFFFFF);
     strokeWeight(2);
     fill(0);
     rect(20, 458, 220, 27);
     
     //BET文字
     textSize(20);
     fill(#FFFFFF);
     text("BET：            　  円", 30, 480);
  
     //BET金★
     textSize(18);
     fill(#FFFFFF);
     text(bet, 110, 479);//★
  
     //所持残高用枠
     stroke(#FFFFFF);
     strokeWeight(2);
     fill(0);
     rect(20, 490, 220, 27);
  
     //所持文字
     textSize(20);
     fill(#FFFFFF);
     text("所持：          　　  円", 30, 511);
  
     //所持金★
     textSize(18);
     fill(#FFFFFF);
     text(money, 110, 510);
     
    }//if(doubleselect==0)のelse ifの閉じ
  
  z=3;
  countz=9;
    
  }//if(z==15)の閉じ
  
  if(z==16){
    
    if(tz==5){
    //プレイヤーが[P_count+1]枚目のカードをひく
    P_card[P_count]=deck[deck_count];
    
    //今までの合計が10以下、かつ今引いたカードがAならばAを記録
    if((P_sum<=10)&&(P_card[P_count]==1)){
      P_A=1;
    }//if((P_sum<=10)&&(P_card[P_count]==1))の閉じ
    
    z=5;
    if(doubleselect==1){
      locatecardx=345;
      locatecardy=425;
    }else if(doubleselect==0){
      locatecardx=cardlocx;
      locatecardy=cardlocy;
    }//if(doubleselect==1)のelse ifの閉じ
    deckcount=deck_count;
    
    }//if(tz==5)の閉じ
    
    if(tz==6){
    //合計計算
    P_sum = P_sum + P_card[P_count];
    
    if(P_A==1){//もし1と11どちらでも数えられるAが入っている場合
     if(P_sum==11){
       P_sum=P_sum+10;//Aを含む合計11なら21にする
       P_A=0;
     }else if(P_sum>=12) P_A=0;//Aを含む合計12以上ならAを1と数える
    }//if(P_A==1)の閉じ
    
    z=3;
    countz=11;
    }//if(tz==6)の閉じ
    
    if(tz==7){
      stroke(#FFFFFF);//プレイヤー合計
    strokeWeight(4);
    fill(#EEFF12);
    rect(20, 350, 210, 90);

     if(P_A==1){//1が入ってたら
        textSize(50);
        fill(0);
        text(P_sum, 42, 410);
        text(" / ", 100, 410);
        text(P_sum+10, 145, 410);
      }
      else{//1がはいってなかったら
        textSize(50);
        fill(0);
        text(P_sum, 95, 410);
      }//if(P_A==1)のelseの閉じ
    z=3;
    countz=12;
    }//if(tz==7)の閉じ
    
    
    if(tz==8){
    if(P_sum==21){
      stand=1;
      z=17;
    }else if(P_sum>21){//バースト
      hit=0;
      fin=2;//プレイヤー負け

      stroke(#FFFFFF);
      strokeWeight(2);
      fill(0);
      rect(100, 275, 650, 50);
    
      textSize(30);//TOOMANY文字
      fill(#FFFFFF);
      text("T O O   M A N Y !!!", 110, 310);
      z=20;
    }else{
       if(doubleselect==1){
         stand=1;
         z=17;
       }else{
         z=14;
         cardlocx=cardlocx+30;
       }//if(doubleselect==1)のelseの閉じ
    }//if(P_sum==21)のelseの閉じ
    
    P_count=P_count+1;
    deck_count=deck_count+1;
    if (doubleselect==1) doubleselect=0;
    
    }//if(tz==8)の閉じ
    
  }//if(z==16)の閉じ
  
  if(z==17){ //プレイヤーターン終了
     noStroke();//HITSTAND選択画面けす
     fill(#06C914);
     rect(118, 213, 584,54);
  
     stroke(#FFFFFF);
     strokeWeight(2);
     fill(0);
     rect(100, 275, 650, 50);
  
     textSize(30);//スタンド文字
     fill(#FFFFFF);
     text("S T A N D !!", 110, 310);
     
     cardlocx=360;
     cardlocy=50;
      if(P_A==1) P_sum=P_sum+10;//プレイヤーターン終了なのでAは11として数えておく
     z=3;
     countz=13;
  }//if(z==17)の閉じ
  
  if(z==18){
     stroke(#FFFFFF);
     strokeWeight(2);
     fill(0);
     rect(100, 275, 650, 50);
  
     textSize(30);//ディーラーターン文字
     fill(#FFFFFF);
     text("D E A L E R ターン", 110, 310);
    
    z=3;
    countz=14;
  }//if(z==18)の閉じ
  
  if(z==19){
    if(tz==9){
      locatecardx=cardlocx;
      locatecardy=cardlocy;
      z=5;
      deckcount=3;
      cardlocx=390;
    }//if(tz==9)の閉じ
    
    if(tz==10){
      
     stroke(#FFFFFF);//ディーラー合計
     strokeWeight(4);
     fill(#EEFF12);
     rect(20, 90, 210, 90);
         
      if ((D_A==1)&&(D_sum<7)){//A（＝11）を含む合計16以下
        textSize(50);
        fill(0);
        text(D_sum, 42, 150);
        text(" / ", 100, 150);
        text(D_sum+10, 145, 150);
     }else if((D_A==1)&&(D_sum>=7)){//A（＝11）を含む合計17以上
       D_sum=D_sum+10;
       D_A=0;
        textSize(50);
        fill(0);
        text(D_sum, 90, 150);
     }else{//Aを含まない合計
        textSize(50);
        fill(0);
        text(D_sum, 90, 150);
     }//if(D_A==1)のelseの閉じ
      
     if(D_sum>=17){//合計17以上ならば
     if(D_sum>P_sum) fin=2;//ディーラー勝利
     else if(D_sum==P_sum) fin=3;//引き分け
     else fin=1;//=(D_sum<P_sum),プレイヤー勝利
     
     z=20;
   }else if(D_sum<=16) tz=11;
      
    }//if(tz==10)の閉じ
  
    if(tz==11){
      z=3;
      countz=16;
    }//if(tz==11)の閉じ
  
  
  if(tz==12){
      //ディーラー[D_count+1]枚目のカードを引く
      D_card[D_count]=deck[deck_count];
     
      //今までの合計が10以下、かつ今引いたカードがAならばAを記録
      if((D_sum<=10)&&(D_card[D_count]==1)){
        D_A=1;
      }//if((D_sum<=10)&&(D_card[P_count]==1))の閉じ
      
        z=5;
        deckcount=deck_count;
        locatecardx=cardlocx;
        locatecardy=cardlocy;
    
  }//if(tz==12)の閉じ
  
  if(tz==13){
    //合計計算
    D_sum = D_sum + D_card[D_count];
    
    if(D_A==1){//もし1と11どちらでも数えられるAが入っている場合
    
     if((D_sum>=7)&&(D_sum<=11)){
       D_sum=D_sum+10;//Aを含む合計7(=17)～11(=21)なら+10する
       D_A=0;
     }else if(D_sum>=12){
       D_A=0;//Aを含む合計12以上ならAを1と数える
     }else{
       D_A=1;
     }//if(D_sum>=7)のelseの閉じ
     
    }//if(D_A==1)の閉じ
    
     stroke(#FFFFFF);//ディーラー合計
     strokeWeight(4);
     fill(#EEFF12);
     rect(20, 90, 210, 90);
    
    if ((D_A==1)&&(D_sum<7)){//A（＝11）を含む合計16以下
        textSize(50);
        fill(0);
        text(D_sum, 42, 150);
        text(" / ", 100, 150);
        text(D_sum+10, 145, 150);
     }else if((D_A==1)&&(D_sum>=7)){//A（＝11）を含む合計17以上
       D_sum=D_sum+10;
       D_A=0;
        textSize(50);
        fill(0);
        text(D_sum, 90, 150);
     }else{//Aを含まない合計
        textSize(50);
        fill(0);
        text(D_sum, 90, 150);
     }//if(D_A==1)のelseの閉じ
     
     
      D_count=D_count+1;
      deck_count=deck_count+1;
    
    if(D_sum<17) tz=11;
    else tz=14;
    
  }//if(tz==13)の閉じ
  
  
  if(tz==14){
    
   if(D_sum>21){
     fin=1;//ディーラーバースト＝プレイヤー勝利
     
     stroke(#FFFFFF);
     strokeWeight(2);
     fill(0);
     rect(100, 275, 650, 50);
    
     textSize(30);//TOOMANY文字
     fill(#FFFFFF);
     text("T O O   M A N Y !!!", 110, 310);
     
   }else{
     if(D_sum>P_sum) fin=2;//ディーラー勝利
     else if(D_sum==P_sum) fin=3;//引き分け
     else fin=1;//=(D_sum<P_sum),プレイヤー勝利
   }//if(D_sum>21)のelseの閉じ
   
   z=20;
   
   }//if(tz==14)の閉じ
    
  }//if(z==19)の閉じ
  
  
  if(z==20){
    z=3;
    countz=18;
  }//if(z==20)の閉じ
  
  if(z==21){
    
      stroke(#FFFFFF);
      strokeWeight(2);
      fill(0);
      rect(100, 275, 650, 50);
       
      //勝敗判定
      if(fin==1){
        textSize(30);
        fill(#FFFFFF);
        text("P L A Y E R 勝 利 !!", 110, 310);
        money=money+(bet*2);
      }else if(fin==2){
        textSize(30);
        fill(#FFFFFF);
        text("D E A L E R 勝 利 !!", 110, 310);
      }else if(fin==3){
        textSize(30);
        fill(#FFFFFF);
        text("引 き 分 け !!", 110, 310);
        money=money+bet;
      }else if(fin==4){
        textSize(30);
        fill(#FFFFFF);
        text("P L A Y E R 勝 利 !!（ブラックジャック）", 110, 310);
        money=money+(bet*2)+(bet/2);
      }else if(fin==5){
        textSize(30);
        fill(#FFFFFF);
        text("D E A L E R 勝 利 !!（ブラックジャック）", 110, 310);
      }else{
        println("エラー##fin=0?");
      }//if(fin==1)のelseの閉じ
      
      bet=0;
      z=3;
      countz=19;
      
      P_A=0;
      D_A=0;
      doubleselect=0;
      fin=0;
      tz=0;
      P_BJ=0;
      D_BJ=0;
      stand=0;
      doublejudge=0;
      P_sum=0;
      D_sum=0;
      P_count=2;
      D_count=2;
      deck_count=4;
      cardlocx=390;
      cardlocy=380;
      D_BJ_z=4;
      
      
  }//if(z==21)の閉じ
  
  
}//void draw()の閉じ
