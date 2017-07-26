package com.rpgGame.app.ui.main.activityBar.item
{
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	
	import org.mokylin.skin.mainui.activityBar.ActiveLabelDg;
	import org.mokylin.skin.mainui.activityBar.ActivityItem;
	
	import starling.display.DisplayObject;
	
	public class ActivityLable
	{
		private var _skin:ActivityItem;
		private var _iconList:Vector.<SkinnableContainer>;
		private var _lastLine:int = 0;
		private var _width:Number = 73;
		public function ActivityLable(skin:ActivityItem):void
		{
			_skin = skin;
			_skin.txtTitle.leading = 3;
			initView();
		}
		
		private function initView():void
		{
			_iconList = new Vector.<SkinnableContainer>();
			_skin.skinBg.visible = false;
		}
		
		public function updataWidth(value:Number):void
		{
			if(_width== value)
				return ;
			refeashSize();
		}
		
		private function refeashSize():void
		{
			var length:int = _skin.container.numChildren;
			for(var i:int = 0;i<length;i++)
			{
				var child:DisplayObject = _skin.container.getChildAt(i);
				child.width = _width;
				child.x = 0;
			}
		}
		public function set text(value:String):void
		{
			_skin.txtTitle.htmlText = value;
			if(value==null||value =="")
				_skin.container.visible = false;
			else{
				_skin.container.visible = true;
				updataSkin(_skin.txtTitle.numLines);
			}
		}
		
		private function updataSkin(line:int):void
		{
			if(_lastLine == line)
				return ;
			_lastLine = line;
			var length:int = _iconList.length;
			var skincontent:SkinnableContainer;
			for(var i:int = 0;i<line;i++)
			{
				if(i <length)
					skincontent = _iconList[i];
				else{
					skincontent = createSkin();
				}
				skincontent.visible = true;
				skincontent.y = 18*i;
			}
			
			length= _iconList.length;
			if(length <= line)
				return ;
			for(i= line;i<length;i++)
			{
				skincontent = _iconList[i];
				skincontent.visible = false;
			}
			refeashSize();
		}
		private function createSkin():SkinnableContainer
		{
			var temp:SkinnableContainer = new SkinnableContainer();
			temp.height = 16;
			var skin:StateSkin = new ActiveLabelDg();
			temp.skin = skin;
			this._skin.container.addChildAt(temp,0);
			return temp;
		}
	}
}