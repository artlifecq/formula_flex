package com.rpgGame.appModule.jingmai.sub
{
	import com.game.engine3D.utils.MathUtil;
	
	import flash.geom.Point;
	
	import feathers.controls.UIAsset;
	
	import gs.TimelineLite;
	import gs.TweenLite;
	
	import starling.display.Sprite;
	
	/**
	 *线段图 
	 * @author Administrator
	 * 
	 */	
	public class MeridianMapLine extends Sprite
	{
		private var _innerSkin:String;
		private var _blackSkin:String;
		private var _posArr:Array;
		private var _lineArr:Array;
		private var _isDraw:Boolean=false;
		public function MeridianMapLine(skin:String,black:String,data:Array)
		{
			super();
			this._innerSkin=skin;
			this._blackSkin=black;
			this._posArr=data;
			this._lineArr=[];
			drawLine(black);
		}
		public function drawInner():void
		{
			if (_isDraw) 
			{
				return;
			}
			drawLine(_innerSkin);
			_isDraw=true;
		}
		public function drawLine(skin:String,h:int=0):void
		{
			if (_posArr==null||_posArr.length<2) 
			{
				return;
			}
			var lineNum:int=_posArr.length-1;
			var tmp:UIAsset;
			var startP:Point;
			var endP:Point;
			var dis:int;
			for (var i:int = 0; i < lineNum; i++) 
			{
				startP=_posArr[i];
				endP=_posArr[i+1];
				tmp=createLine(skin,startP,endP,h);
				_lineArr.push(tmp);
				tmp.width=Math.ceil(MathUtil.getDistance(endP.x,endP.y,startP.x,startP.y))+(lineNum>1?int(tmp.height/2):0);
				if (h!=0) 
				{
					tmp.height=h;
				}
				this.addChild(tmp);
			}
			
		}
		private static function createLine(skin:String,startP:Point,endP:Point,h:int=0):UIAsset
		{
			var r:Number;
			var tmp:UIAsset;
			tmp=new UIAsset();
			tmp.touchable=false;
			tmp.repeatSkin=true;
			tmp.styleName=skin;
			if (h!=0) 
			{
				tmp.pivotY=h/2;
			}
			else
			{
				tmp.pivotY=tmp.height/2;
			}
			
			
			tmp.x=startP.x;
			tmp.y=startP.y;
			r=Math.atan2(endP.y-startP.y,endP.x-startP.x);
			tmp.rotation=r;
			return tmp;
		}
		public function tweenDrawInnerLine():void
		{
			if (_isDraw) 
			{
				return;
			}
			_isDraw=true;
			if (_posArr==null||_posArr.length<2) 
			{
				return;
			}
			var lineNum:int=_posArr.length-1;
			var tmp:UIAsset;
			var startP:Point;
			var endP:Point;
			var dis:int;
			var timeLine:TimelineLite=new TimelineLite();
			var tw:int;
			for (var i:int = 0; i < lineNum; i++) 
			{
				startP=_posArr[i];
				endP=_posArr[i+1];
				tmp=createLine(_innerSkin,startP,endP);
				tmp.width=0;
				//tmp.height=5;
				_lineArr.push(tmp);
				tw=Math.ceil(MathUtil.getDistance(endP.x,endP.y,startP.x,startP.y))+(lineNum>1?int(tmp.height/2):0);
				
				this.addChild(tmp);
				timeLine.append(TweenLite.to(tmp,tw/50,{width:tw}));
			}
			
		}

		public function get isDraw():Boolean
		{
			return _isDraw;
		}

	}
}