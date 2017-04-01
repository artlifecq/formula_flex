package com.rpgGame.appModule.maps
{
	import feathers.controls.SkinnableContainer;
	
	import org.mokylin.skin.app.tips.mouseHandTips1_Skin;
	
	import starling.display.Sprite;

	public class BigMapTips  extends Sprite
	{
		
		private var _temp:SkinnableContainer;
		private var _skin:mouseHandTips1_Skin;
		private var _maxWidth:int;//移动范围
		private var _maxHight:int;
		public function BigMapTips(maxWidth,maxHight)
		{
			_maxWidth=maxWidth;
			_maxHight=maxHight;
			
			init();
		}
		
		private function init():void
		{
			var temp:SkinnableContainer = new SkinnableContainer();
			_temp=temp;
			
			var skin:mouseHandTips1_Skin = new mouseHandTips1_Skin();
			_skin=skin
			temp.skin=skin;
			skin.lbl_name.text="10000,10000";
			temp.x=28;
			temp.y=28;
			temp.width=100;
			temp.height=30;
			addChild(temp);
			hide();
		}
		public function show(x:Number,y:Number,tx:int,ty:int):void
		{
			this.visible=true;
			setText(tx,ty);
			setTips(x,y);
			
		}
		public function hide():void
		{
			this.visible=false;
		}
		
		private function setTips(x:Number,y:Number):void
		{
			this.x=x;
			this.y=y;
			if((x+_temp.x+_temp.width)>_maxWidth)//使tips不用超出地图区域
			{
				this.x=x-_temp.x-_temp.width;
			}
			if((y+_temp.y+_temp.height)>_maxHight)
			{
				this.y=y-_temp.y-_temp.height;
			}
			/*if((x+_temp.x+_temp.width)>_maxWidth||(y+_temp.y+_temp.height)>_maxHight)
			{
				this.x=x-_temp.x-_temp.width;
				this.y=y-_temp.y-_temp.height;
			}
			else
			{
				this.x=x;
				this.y=y;
			}*/
			
			
		}
		private function setText(tx:int,ty:int):void
		{
			var text:String=tx+","+ty;
			var tleng:int=text.length;
			_temp.width=22+tleng*7.6;
			_skin.lbl_name.maxWidth=_skin.lbl_name.width=tleng*7.6;
			_skin.lbl_name.text=text;
			
			
		}
		
		
		
	}
}