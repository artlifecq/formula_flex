package com.rpgGame.app.richText.component
{
	
	import starling.display.DisplayObject;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	/**
	 * 富文本单元,包括链接、图片、动画等组件
	 * @author luguozheng
	 * 
	 */	
	public class RichTextUnit
	{
		private static var unitPool : Vector.<RichTextUnit> = new Vector.<RichTextUnit>;
		
		public static function getUnit() : RichTextUnit
		{
			var sprite : RichTextUnit;
			if (unitPool.length > 0)
			{
				sprite = unitPool.shift();
			}
			else
				sprite = new RichTextUnit();
			return sprite;
		}
		
		public static function putUnit(sprite : RichTextUnit) : void
		{
			if (sprite == null)
				return;
			sprite.dispose();
			unitPool.push(sprite);
		}
		
		private var _unitData:RichTextUnitData;
		public var onLoaded:Function
		
		public var displayObj:DisplayObject;
		
		public function get unitData():RichTextUnitData
		{
			return _unitData;
		}
		
		public function setUnitData(value:RichTextUnitData):void
		{
			_unitData = value;
			if(RichTextArea3D.updateUnitDisplayObjFunc != null)
			{
				RichTextArea3D.updateUnitDisplayObjFunc(this);
			}
			if(RichTextArea3D.onMouseClickUnit != null || RichTextArea3D.onMouseMoveUnit != null || RichTextArea3D.onMouseOutUnit != null)
			{
				if(displayObj)
				{
					displayObj.addEventListener( TouchEvent.TOUCH, onTouch );
				}
			}
		}
		
		public function RichTextUnit()
		{
			super();
		}
		
		public function onDisplayObjLoaded(...args):void
		{
			if(onLoaded != null)
			{
				onLoaded(this);
			}
		}
		
		//-------------------------------
		//Event
		//-----------------------------------
		
		private function onTouch( e:TouchEvent ):void
		{
			var touch:Touch = e.getTouch( displayObj );
			if( touch == null )
			{
				onMouseOut();
				return;
			}
			else onMouseOver();
					
			touch = e.getTouch( displayObj, TouchPhase.HOVER ); 
			if( touch != null )
			{
				onMouseMove();
			}
			
			touch = e.getTouch( displayObj, TouchPhase.BEGAN ); 
			if( touch == null )
				return;
			
			onMouseClick();
		}
		
		/**
		 * 点击事件
		 * 
		 */		
		private function onMouseClick():void
		{
			if(RichTextArea3D.onMouseClickUnit != null)
			{
				RichTextArea3D.onMouseClickUnit(this);
			}
		}
		
		/**
		 * 鼠标移入事件
		 * */
		private function onMouseOver():void
		{
			if(RichTextArea3D.onMouseOverUnit != null)
			{
				RichTextArea3D.onMouseOverUnit(this);
			}
		}
		
		/**
		 * 鼠标移出事件
		 * 
		 */		
		private function onMouseOut():void
		{
			if(RichTextArea3D.onMouseOutUnit != null)
			{
				RichTextArea3D.onMouseOutUnit(this);
			}
		}
		
		/**
		 * 鼠标移动事件
		 * 
		 */		
		private function onMouseMove():void
		{
			if(RichTextArea3D.onMouseMoveUnit != null)
			{
				RichTextArea3D.onMouseMoveUnit(this);
			}
		}		
		
		//------------------------------------------------
		/**
		 * 销毁
		 * 
		 */		
		public function dispose():void
		{
			_unitData = null;
			
			if( displayObj != null)
			{
				displayObj.removeEventListener(TouchEvent.TOUCH, onTouch );
				if(displayObj.parent != null)
				{
					displayObj.parent.removeChild( displayObj );
					displayObj.dispose();
					displayObj = null;
				}
			}
			displayObj = null;
		}
		
	}
}