package  com.rpgGame.app.fight.spell
{
	
	
	import com.rpgGame.app.fight.spell.time.TimeDelay;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.core.utils.MCUtil;
	
	import flash.geom.Point;
	import flash.utils.Dictionary;
	import flash.utils.getTimer;
	
	import gs.TimelineLite;
	import gs.TweenLite;
	import gs.easing.Circ;
	import gs.easing.Expo;
	import gs.easing.Linear;
	import gs.easing.Quart;
	import gs.easing.Sine;
	
	import starling.core.Starling;
	import starling.display.DisplayObject;
	
	
	
	
	public class SpellResultTweenUtil
	{
		private static var _range:Number=0;
		private static var startPos:Point=new Point();
		private static var endPos:Point=new Point();
		private static const BASE_DIS:int=200;
		private static var _timeDic:Dictionary;
		public function SpellResultTweenUtil()
		{
		}
		private static function get range():Number
		{
			_range+=0.2;
			if (_range>=1) 
			{
				_range=0;
			}
			return _range;
		}
		private static function calTargetPos(start:Point,end:Point,len:int=180):void
		{
			var angle:Number=Math.atan2(end.y-start.y,end.x-start.x);
			var rand:Number=1-Math.random()*2;
			angle+=rand*Math.PI/12;
			var dis:int=Point.distance(start,end)+(len+30*rand);
			endPos.x=start.x+Math.cos(angle)*dis;
			endPos.y=start.y+Math.sin(angle)*dis;
		}
		private static function calEndPos(start:Point,end:Point,len:int=BASE_DIS,bool:Boolean=false):void
		{
			var dis:int=Point.distance(start,end);
			if (dis==0) 
			{
				dis=len;
			}
			if(bool)
			{
				endPos=Point.interpolate(start,end,-len/dis*(1+range));//
//				dis=Point.distance(start,endPos);
//				var angle:Number=Math.atan2(endPos.y-start.y,endPos.x-start.x);
//				var tmp:Point=Point.polar(len,angle+Math.PI/8*(1-Math.random()*2));
//				endPos=tmp.add(start);
			}else
			{
				endPos=Point.interpolate(start,end,-len/dis*(1));//
			}
			
		}
		/**
		 *计算x的正负，相对于hurtPos的 
		 * @param attackPos
		 * @param hurtPos
		 * @return 
		 * 
		 */		
		private static function calXPM(attackPos:Point,hurtPos:Point):String
		{
			if (attackPos.x<hurtPos.x) 
			{
				return "+";
			}
			else if (attackPos.x>hurtPos.x) 
			{
				return "-";
			}
			return "+";
		}
		private static function calYPM(attackPos:Point,hurtPos:Point):String
		{
			if (attackPos.y<hurtPos.y) 
			{
				return "+";
			}
			else if (attackPos.y>hurtPos.y) 
			{
				return "-";
			}
			return "+";
		}
		initTime();
		public static function initTime():void
		{
			_timeDic=new Dictionary();
			_timeDic[TweenAttrChange]=new TimeDelay("attr");
			_timeDic[TweenCirt]=new TimeDelay("cirt");
			_timeDic[TweenExp]=new TimeDelay("exp",0.3);
			_timeDic[TweenHurt]=new TimeDelay("hurt");
			_timeDic[TweenDiaoXue]=new TimeDelay("diaoxue");
			_timeDic[TweenZhanHun]=new TimeDelay("zhanhun");
			_timeDic[TweenZhiLiao1]=new TimeDelay("zhiliao");
			_timeDic[TweenHits]=new TimeDelay("hit");
			_timeDic[TweenShanBi]=new TimeDelay("shanbi");
			_timeDic[TweenXiShou]=new TimeDelay("xishou");
			_timeDic[TweenHead]=new TimeDelay("head");
		}
		//暴击
		public static function TweenCirt(showobj:DisplayObject,start:Point, end:Point,callBack:Function):void
		{
			if (!showobj||!start||!end) 
			{
				return;
			}
			//return;
			
		
			showobj.x=start.x;
			showobj.y=start.y;
			//trace(showobj.x,showobj.y)
			showobj.alpha=0;
			showobj.scaleX=showobj.scaleY=0.6;
			
			var pmX:String=calXPM(start,end);
			var pmY:String=calYPM(start,end);
			calTargetPos(start,end,140);
			//calEndPos(start,end,160,true);
			//trace(endPos.x,endPos.y)
			var myTimeline:TimelineLite;
			myTimeline = new TimelineLite({delay:timeDelay(TweenCirt),onComplete:callBack,onCompleteParams:[showobj],autoRemoveChildren:true});
			myTimeline.append(new TweenLite(showobj, 0.25, {x:endPos.x,y:endPos.y,ease:Quart.easeOut}));//,ease:Expo.easeOut
			myTimeline.addLabel("alpha1", 0);
			myTimeline.insert(new TweenLite(showobj, 0.2, {alpha:1,scaleX:0.9,scaleY:0.9}), "alpha1");
			//trace(pmX+"60",showobj.x,endPos.x);
			myTimeline.append(new TweenLite(showobj, 0.3, {delay:0.05,alpha:0,scaleX:0.85,scaleY:0.85,x:pmX+"60",y:pmY+"60",ease:Quart.easeIn}));
		}
		private  static function timeDelay(func:Function):int
		{
			return (_timeDic[func] as TimeDelay).timeDelay;
		}
		private  static function timeIndex(func:Function):int
		{
			return (_timeDic[func] as TimeDelay).getAttrChangeIndex();
		}
		//经验
		public static function TweenExp(showobj:DisplayObject,start:Point, end:Point,callBack:Function):void
		{
			if (!showobj) 
			{
				return;
			}
			start.y+=100;
			
			showobj.x=start.x-60;
			showobj.y=start.y-50;
			showobj.alpha=0;
			showobj.scaleX=showobj.scaleY=0.7;
			
			var myTimeline:TimelineLite;
			myTimeline = new TimelineLite({delay:timeDelay(TweenExp),onComplete:callBack,onCompleteParams:[showobj]});
			myTimeline.append(new TweenLite(showobj, 0.7, {y:start.y-150,ease:Quart.easeOut}));//,ease:Expo.easeOut
			myTimeline.addLabel("alpha1", 0);
			myTimeline.addLabel("alpha0", 0.5);
			myTimeline.insert(new TweenLite(showobj, 0.3, {alpha:1,scaleX:1,scaleY:1}), "alpha1");
			myTimeline.insert(new TweenLite(showobj, 0.2, {alpha:0,y:start.y-170,scaleX:0.65,scaleY:0.65}), "alpha0");//,scaleX:0.5,scaleY:0.5
		}
		//伤害
		public static function TweenHurt(showobj:DisplayObject,start:Point, end:Point,callBack:Function):void
		{
			if (!showobj||!start||!end) 
			{
				return;
			}
			
		
			showobj.x=end.x-60;
			showobj.y=end.y;
			showobj.alpha=0;
			showobj.scaleX=showobj.scaleY=0.3;
			
			var pmX:String=calXPM(start,end);
			var pmY:String=calYPM(start,end);
			//calEndPos(start,end,200,true);
			calTargetPos(start,end,140);
			var xx:String="";
			var yy:String="";
			if(pmX=="-")
			{
				xx="-40";
			}else
			{
				xx="40";
			}
			if(pmY=="-")
			{
				yy="-40";
			}else
			{
				yy="40";
			}
			
			var myTimeline:TimelineLite;
			myTimeline = new TimelineLite({delay:0,onComplete:callBack,onCompleteParams:[showobj]});
			myTimeline.append(new TweenLite(showobj, 0.7, {x:endPos.x,y:endPos.y,ease:Expo.easeOut}));//,ease:Expo.easeOut
			myTimeline.addLabel("alpha1", 0);
			//myTimeline.addLabel("alpha0", 0.6);
			myTimeline.insert(new TweenLite(showobj, 0.4, {alpha:0.75,scaleX:0.75,scaleY:1}), "alpha1");
			myTimeline.append(new TweenLite(showobj, 0.3, {alpha:0,x:xx,y:yy,ease:Sine.easeOut,scaleX:0.3,scaleY:0.3}));//,y:pSH[n].y-105,scaleX:0.82,scaleY:0.82,ease:Sine.easeOut
		}
		//掉血，应该用end
		public static function TweenDiaoXue(showobj:DisplayObject,start:Point, end:Point,callBack:Function):void
		{
			if (!showobj||!start||!end) 
			{
				return;
			}
			
			start.x=end.x;
			start.y=end.y;
			
			showobj.x=start.x-60;
			showobj.y=start.y-10;
			showobj.alpha=0;
			showobj.scaleX=showobj.scaleY=0.55;
			
		
			var myTimeline:TimelineLite;
			myTimeline = new TimelineLite({delay:timeDelay(TweenDiaoXue),onComplete:callBack,onCompleteParams:[showobj]});
			myTimeline.append(new TweenLite(showobj, 0.7, {x:start.x+60,ease:Expo.easeOut}));
			myTimeline.addLabel("alpha1", 0);
			myTimeline.addLabel("alpha0", 0.4);
			myTimeline.insert(new TweenLite(showobj, 0.4, {alpha:1,y:start.y-170,scaleX:0.7,scaleY:0.7,ease:Expo.easeOut}), "alpha1");
			myTimeline.insert(new TweenLite(showobj, 0.3, {alpha:0,x:start.x+80,y:start.y-110,scaleX:0.55,scaleY:0.55}), "alpha0");//,ease:Sine.easeIn
		}
		//战魂
		public static function TweenZhanHun(showobj:DisplayObject,start:Point, end:Point,callBack:Function):void
		{
			if (!showobj||!start||!end) 
			{
				return;
			}
			
		
			showobj.x=end.x;
			showobj.y=end.y-50;
			showobj.alpha=0;
			showobj.scaleX=showobj.scaleY=0.7;
			
		
			//calEndPos(start,end,70);
			var myTimeline:TimelineLite;
			myTimeline = new TimelineLite({delay:timeDelay(TweenZhanHun),onComplete:callBack,onCompleteParams:[showobj]});
			myTimeline.append(new TweenLite(showobj, 0.7, {y:end.y-80,ease:Expo.easeOut}));
			myTimeline.addLabel("alpha1", 0);
			myTimeline.addLabel("alpha0", 0.5);
			myTimeline.insert(new TweenLite(showobj, 0.3, {alpha:1,scaleX:0.55,scaleY:0.55}), "alpha1");
			myTimeline.insert(new TweenLite(showobj, 0.2, {alpha:0,y:end.y-90,scaleX:0.50,scaleY:0.50}), "alpha0");//,ease:Sine.easeIn
		}
		//治疗
		public static function TweenZhiLiao1(showobj:DisplayObject,start:Point, end:Point,callBack:Function):void
		{
			if (!showobj||!start) 
			{
				return;
			}
			
		
			start.y+=100;
			var myTimeline:TimelineLite;
			showobj.x=start.x+int(Math.random()*40-40);
			showobj.y=start.y;
			showobj.alpha=0;
			showobj.scaleX=showobj.scaleY=0.35;
			myTimeline = new TimelineLite({delay:timeDelay(TweenZhiLiao1),onComplete:callBack,onCompleteParams:[showobj]});
			myTimeline.append(new TweenLite(showobj, 0.70, {y:start.y-140,ease:Sine.easeOut}));
			myTimeline.addLabel("alpha1", 0);
			myTimeline.addLabel("alpha0", 0.3);
			myTimeline.insert(new TweenLite(showobj, 0.4, {alpha:1,scaleX:0.68,scaleY:0.68,ease:Expo.easeOut}), "alpha1");
			myTimeline.insert(new TweenLite(showobj, 0.3, {alpha:0,scaleX:0.55,scaleY:0.55,ease:Sine.easeIn}), "alpha0");//,ease:Sine.easeIn
		}
		//治疗
		public static function TweenZhiLiao2(showobj:DisplayObject,start:Point, end:Point,callBack:Function):void
		{
			if (!showobj||!start) 
			{
				return;
			}
			
		
	
			var myTimeline:TimelineLite;
			
			start.y+=100;
			//效果二
			showobj.x=start.x-60;
			showobj.y=start.y-100;
			showobj.alpha=0;
			showobj.scaleX=showobj.scaleY=0.55;
			myTimeline = new TimelineLite({delay:timeDelay(TweenZhiLiao1),onComplete:callBack,onCompleteParams:[showobj]});
			myTimeline.append(new TweenLite(showobj, 0.70, {x:start.x,ease:Sine.easeOut}));
			myTimeline.addLabel("alpha1", 0);
			myTimeline.addLabel("alpha0", 0.3);
			myTimeline.insert(new TweenLite(showobj, 0.4, {x:start.x-30,y:start.y-140,alpha:1,scaleX:0.7,scaleY:0.7,ease:Sine.easeOut}), "alpha1");
			myTimeline.insert(new TweenLite(showobj, 0.3, {x:start.x-10,y:start.y,alpha:0,scaleX:0.55,scaleY:0.55,ease:Sine.easeIn}), "alpha0");//,ease:Sine.easeIn
			
		}
		//未命中
		public static function TweenHits(showobj:DisplayObject,start:Point, end:Point,callBack:Function):void
		{
			if (!showobj||!start||!end) 
			{
				return;
			}
			
		
			showobj.x=end.x-60;
			showobj.y=end.y+40;
			showobj.alpha=0;
			showobj.scaleX=showobj.scaleY=0.8;
			
			var pmX:String=calXPM(start,end);
			var pmY:String=calYPM(start,end);
			calEndPos(start,end,70);
			var myTimeline:TimelineLite;
			myTimeline = new TimelineLite({delay:timeDelay(TweenHits),onComplete:callBack,onCompleteParams:[showobj]});
			myTimeline.append(new TweenLite(showobj, 0.7, {y:end.y-90,ease:Linear.easeOut}));
			myTimeline.addLabel("alpha1", 0);
			myTimeline.addLabel("alpha0", 0.4);
			myTimeline.insert(new TweenLite(showobj, 0.3, {alpha:1,x:end.x-75,scaleX:1.0,scaleY:1.0,ease:Expo.easeOut}), "alpha1");
			myTimeline.insert(new TweenLite(showobj, 0.3, {alpha:0,x:end.x-70,scaleX:0.9,scaleY:0.9,ease:Sine.easeIn}), "alpha0");//,ease:Sine.easeIn
		}
		//闪避
		public static function TweenShanBi(showobj:DisplayObject,start:Point, end:Point,callBack:Function):void
		{
			if (!showobj||!start) 
			{
				return;
			}
			
		
			showobj.x=start.x+60;
			showobj.y=start.y;
			showobj.alpha=0;
			showobj.scaleX=showobj.scaleY=0.8;
			
		
			var myTimeline:TimelineLite;
			myTimeline = new TimelineLite({delay:timeDelay(TweenShanBi),onComplete:callBack,onCompleteParams:[showobj]});
			myTimeline.append(new TweenLite(showobj, 0.7, {y:start.y-90,ease:Linear.easeNone}));
			myTimeline.addLabel("alpha1", 0);
			myTimeline.addLabel("alpha0", 0.4);
			myTimeline.insert(new TweenLite(showobj, 0.3, {alpha:1,x:start.x+85,scaleX:1.0,scaleY:1.0,ease:Expo.easeOut}), "alpha1");
			myTimeline.insert(new TweenLite(showobj, 0.3, {alpha:0,x:start.x+75,scaleX:0.9,scaleY:0.9,ease:Sine.easeIn}), "alpha0");//,ease:Sine.easeIn
		}
		//护盾吸收
		public static function TweenXiShou(showobj:DisplayObject,start:Point, end:Point,callBack:Function):void
		{
			if (!showobj||!start) 
			{
				return;
			}
			
			
		
	
			var myTimeline:TimelineLite;
			
			showobj.y=start.y+20;
			showobj.alpha=0;
			showobj.scaleX=showobj.scaleY=0.6;
			myTimeline = new TimelineLite({delay:timeDelay(TweenXiShou),onComplete:callBack,onCompleteParams:[showobj]});
			var _dir:int=1;
			if(_dir==0)
			{
				showobj.x=start.x+120;
				myTimeline.append(new TweenLite(showobj, 0.7, {x:start.x+00,ease:Linear.easeNone}));
			}else if(_dir==1)
			{
				showobj.x=start.x-240;
				myTimeline.append(new TweenLite(showobj, 0.7, {x:start.x-100,ease:Linear.easeNone}));
			}
			myTimeline.addLabel("alpha1", 0);
			myTimeline.addLabel("alpha0", 0.4);
			myTimeline.insert(new TweenLite(showobj, 0.2, {alpha:1,scaleX:0.6,scaleY:0.6,ease:Circ.easeIn}), "alpha1");
			myTimeline.insert(new TweenLite(showobj, 0.3, {alpha:0,y:start.y-50,scaleX:0.5,scaleY:0.5,ease:Sine.easeOut}), "alpha0");//,ease:Sine.easeIn
		}//护盾吸收
		public static function TweenXiShou1(showobj:DisplayObject,start:Point, end:Point,callBack:Function):void
		{
			if (!showobj||!start) 
			{
				return;
			}
			
			
		

			var myTimeline:TimelineLite;
			
			
			showobj.x=start.x+int(Math.random()*40-40);
			showobj.y=start.y+20;
			showobj.alpha=0;
			showobj.scaleX=showobj.scaleY=0.35;
			myTimeline = new TimelineLite({delay:timeDelay(TweenXiShou),onComplete:callBack,onCompleteParams:[showobj]});
			myTimeline.append(new TweenLite(showobj, 0.7, {y:start.y-140,ease:Sine.easeOut}));
			myTimeline.addLabel("alpha1", 0);
			myTimeline.addLabel("alpha0", 0.3);
			myTimeline.insert(new TweenLite(showobj, 0.4, {alpha:1,scaleX:0.58,scaleY:0.58,ease:Expo.easeOut}), "alpha1");
			myTimeline.insert(new TweenLite(showobj, 0.3, {alpha:0,scaleX:0.5,scaleY:0.5,ease:Sine.easeIn}), "alpha0");//,ease:Sine.easeIn
			
		}
		//护盾吸收
		public static function TweenXiShou2(showobj:DisplayObject,start:Point, end:Point,callBack:Function):void
		{
			if (!showobj||!start) 
			{
				return;
			}
			
			
		
		
			var myTimeline:TimelineLite;
			
			
			showobj.x=start.x-140;
			showobj.y=start.y-90;
			showobj.alpha=0;
			showobj.scaleX=showobj.scaleY=0.65;
			myTimeline = new TimelineLite({delay:timeDelay(TweenXiShou),onComplete:callBack,onCompleteParams:[showobj]});
			myTimeline.append(new TweenLite(showobj, 0.7, {x:start.x,ease:Sine.easeOut}));
			myTimeline.addLabel("alpha1", 0);
			myTimeline.addLabel("alpha0", 0.4);
			myTimeline.insert(new TweenLite(showobj, 0.4, {x:start.x-100,y:start.y-120,alpha:1,scaleX:0.7,scaleY:0.7,ease:Sine.easeOut}), "alpha1");
			myTimeline.insert(new TweenLite(showobj, 0.3, {x:start.x-60,y:start.y,alpha:0,scaleX:0.5,scaleY:0.5,ease:Sine.easeIn}), "alpha0");//,ease:Sine.easeIn
			
		}
		//护盾吸收
		public static function TweenXiShou3(showobj:DisplayObject,start:Point, end:Point,callBack:Function):void
		{
			if (!showobj||!start) 
			{
				return;
			}
			
			
		
	
			var myTimeline:TimelineLite;
			
			
			
			showobj.x=start.x+140;
			showobj.y=start.y-50;
			showobj.alpha=0;
			showobj.scaleX=showobj.scaleY=0.65;
			myTimeline = new TimelineLite({delay:timeDelay(TweenXiShou),onComplete:callBack,onCompleteParams:[showobj]});
			myTimeline.append(new TweenLite(showobj, 0.7, {x:start.x+40,ease:Expo.easeOut}));
			myTimeline.addLabel("alpha1", 0);
			myTimeline.insert(new TweenLite(showobj, 0.2, {alpha:1,scaleX:0.7,scaleY:0.7,ease:Expo.easeOut}), "alpha1");
			myTimeline.append(new TweenLite(showobj, 0.3, {alpha:0,x:start.x+20,scaleX:0.50,scaleY:0.50,ease:Sine.easeIn}));//y:-120-30,
			
		}
		//头顶飘字
		public static function TweenHead(showobj:DisplayObject,start:Point, end:Point,callBack:Function):void
		{
			if (!showobj||!start) 
			{
				return;
			}
			
			start.x-=50;
			showobj.x=start.x;
			showobj.y=start.y-80;
			showobj.alpha=0;
			showobj.scaleX=showobj.scaleY=0.8;
			
			var myTimeline:TimelineLite;
			myTimeline = new TimelineLite({delay:timeDelay(TweenHead),onComplete:callBack,onCompleteParams:[showobj]});
			myTimeline.append(new TweenLite(showobj, 0.7, {x:start.x-90,ease:Linear.easeOut}));
			myTimeline.addLabel("alpha1", 0);
			myTimeline.addLabel("alpha0", 0.4);
			myTimeline.insert(new TweenLite(showobj, 0.3, {alpha:1,y:start.y-140,scaleX:1.0,scaleY:1.0,ease:Expo.easeOut}), "alpha1");
			myTimeline.insert(new TweenLite(showobj, 0.3, {alpha:0,y:start.y-110,scaleX:0.9,scaleY:0.9,ease:Sine.easeIn}), "alpha0");//,ease:Sine.easeIn
		}
		
		//属性
		public static function TweenAttrChange(showobj:DisplayObject,start:Point, end:Point,callBack:Function):void
		{
			if (!showobj||!start) 
			{
				return;
			}
			start.x=Starling.current.nativeStage.stageWidth/2;
			start.y=Starling.current.nativeStage.stageHeight/2-220;
			showobj.x=start.x;
			var i:int=timeIndex(TweenAttrChange);
			showobj.y=start.y+28*i+20;
			showobj.alpha=0.0;
			showobj.scaleX=showobj.scaleY=0.7;
			var myTimeline:TimelineLite;
			myTimeline = new TimelineLite({delay:i*0.05,onComplete:callBack,onCompleteParams:[showobj]});
			
			myTimeline.append(new TweenLite(showobj, 0.3, {alpha:1,x:start.x+70,y:start.y+35*i,scaleX:1.0,scaleY:1.0,ease:Circ.easeOut}));
			//myTimeline.addLabel("alpha1", 0);
			//myTimeline.addLabel("alpha0", 0.4);
			myTimeline.append(new TweenLite(showobj, 0.2, {delay:1.0+0.03*i,alpha:0,x:start.x+120,y:start.y+35*i-30,scaleX:0.8,scaleY:0.8,ease:Expo.easeIn}));
			
		}
	}
}