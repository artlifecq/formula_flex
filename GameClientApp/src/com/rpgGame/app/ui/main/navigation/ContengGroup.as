package com.rpgGame.app.ui.main.navigation
{
	import com.rpgGame.app.ui.main.buttons.IOpen;
	import com.rpgGame.app.ui.main.buttons.MainButtonBases;
	import com.rpgGame.coreData.clientConfig.FunctionBarInfo;
	
	import feathers.core.FeathersControl;
	
	import starling.display.DisplayObject;
	
	internal class ContengGroup extends FeathersControl
	{
		public static const INVALIDATION_FLAG_POSTION:String = "position";
		private var _helpw:Number;
		private var _helph:Number;
		private var _buttonList:Vector.<IOpen>;
		public function ContengGroup(w:Number,h:Number):void
		{
			_helpw = w;
			_helph = h;
			super();
		}
		private var _openState:Boolean;
		private var _postionY:int;

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
		
		public function reset():void
		{
			_buttonList = new Vector.<IOpen>();
		}
		public function addButton(button:IOpen):void
		{
			if(button==null)
				return ;
			if(_buttonList.indexOf(button)>=0)
				return ;
			_buttonList.push(button);
			this.invalidate(INVALIDATION_FLAG_POSTION);
		}
		
		private function runAction():void
		{
			if(!this.isInitialized)
				return ;
			
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
			var postion:int = 0;
			var item:IOpen
			for(var i:int = 0; i <itemCount; i++)
			{
				item= _buttonList[i];
				if(item is FeathersControl)
					(item as FeathersControl).validate();
				item.x = postion;
				item.y = _helph-item.height;
				postion+= item.width-7;
				this.addChildAt(item as DisplayObject,i);
			}
			this.setSize(postion,_helph);
			this.y = _helph  - height;
//			if(_openState)
				this.x = -postion;
		}

		public function get buttonList():Vector.<IOpen>
		{
			return _buttonList;
		}

	}
}