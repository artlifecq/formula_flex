package com.rpgGame.app.ui.main.activityBar.item
{
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	
	import org.mokylin.skin.mainui.activityBar.ActiveLabelDg;
	import org.mokylin.skin.mainui.activityBar.ActivityItem;
	
	public class ActivityLable
	{
		private var _skin:ActivityItem;
		private var _iconList:Vector.<SkinnableContainer>;
		private var _lastLine:int = 1;
		private var _width:int;
		public function ActivityLable(skin:ActivityItem):void
		{
			_skin = skin;
			_skin.txtTitle.leading = 3;
			initView();
		}
		
		private function initView():void
		{
			_iconList = new Vector.<SkinnableContainer>();
			_iconList.push(_skin.skinBg);
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
			var length:int = _iconList.length;
			var skincontent:SkinnableContainer;
			for(var i:int = 0;i<line;i++)
			{
				if(i <length)
					skincontent = _iconList[i];
				else{
					skincontent = createSkin();
				}
				if(skincontent.parent == null)
				{
					this._skin.container.addChildAt(skincontent,0);
				}
				skincontent.y = 17*i;
			}
			
			length= _iconList.length;
			if(length <= line)
				return ;
			for(i= line;i<length;i++)
			{
				skincontent = _iconList[i];
				if(skincontent.parent!=null)
					this._skin.container.removeChild(skincontent);
			}
		}
		private function createSkin():SkinnableContainer
		{
			var temp:SkinnableContainer = new SkinnableContainer();
			temp.height = 16;
			var skin:StateSkin = new ActiveLabelDg();
			temp.skin = skin;
			temp.width = 80;
			temp.x = 17;
			return temp;
		}
	}
}