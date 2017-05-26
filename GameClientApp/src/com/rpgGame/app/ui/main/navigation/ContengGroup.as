package com.rpgGame.app.ui.main.navigation
{
	import com.rpgGame.app.ui.main.buttons.MainButtonBases;
	import com.rpgGame.coreData.clientConfig.FunctionBarInfo;
	
	import feathers.core.FeathersControl;
	
	internal class ContengGroup extends FeathersControl
	{
		public static const INVALIDATION_FLAG_POSTION:String = "position";
		private var _helpw:Number;
		private var _helph:Number;
		private var _buttonList:Vector.<MainButtonBases>;
		public function ContengGroup(w:Number,h:Number):void
		{
			_helpw = w;
			_helph = h;
			super();
		}
		
		override protected function initialize():void
		{
			/*var layout:HorizontalLayout = new HorizontalLayout();
			layout.gap = 5;
			this.layout = layout;*/
			_buttonList = new Vector.<MainButtonBases>();
		}
		
		private var _openState:Boolean;

		public function set openState(value:Boolean):void
		{
			if(_openState == value)
				return ;
			_openState = value;
		}
		override protected function draw():void
		{
			super.draw();
			var positionInvalid:Boolean = this.isInvalid(INVALIDATION_FLAG_POSTION);
			if(positionInvalid )
			{
				this.refreshPostion();
			}
		}
		
		public function addButton(button:MainButtonBases,index:int):void
		{
			if(button==null)
				return ;
			if(_buttonList.indexOf(button)>=0)
				return ;
			index = Math.min(index,_buttonList.length);
			_buttonList.splice(index,0,button);
			this.invalidate(INVALIDATION_FLAG_POSTION);
		}
		
		public function removeButton(button:MainButtonBases):void
		{
			if(button==null)
				return ;
			if(_buttonList.indexOf(button)<0)
				return ;
			var index:int = _buttonList.indexOf(button);
			_buttonList.splice(index,1);
			this.invalidate(INVALIDATION_FLAG_POSTION);
		}
		
		private function runAction():void
		{
			if(!this.isInitialized)
				return ;
			trace("动画啊十大阿斯顿发生发大水发达省份的");
		}
		public function checkHaveButton(info:FunctionBarInfo):Boolean
		{
			var itemCount:int =this.numChildren
			for(var i:int = 0; i < itemCount; i++)
			{
				var item:MainButtonBases = getChildAt(i) as MainButtonBases;
				if(item.info.id == info.id)
					return true;
			}
			return false;
		}
		
		private function refreshPostion():void
		{
			this.removeChildren();
			var itemCount:int =this._buttonList.length;
			for(var i:int = 0; i < itemCount; i++)
			{
				var item:MainButtonBases = _buttonList[i];
				
			}
			/*if(_openState)
				this.x = -width-_helpw;
			else
				this.x = 0;
			this.y = _helph  - height;*/
		}
	}
}