package com.rpgGame.app.richText.component
{
	
	
	import flash.utils.getTimer;
	
	import gs.TweenLite;
	
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
				sprite = unitPool.pop();
			}
			else
				sprite = new RichTextUnit();
			return sprite;
		}
		
		public static function putUnit(sprite : RichTextUnit) : void
		{
			if (sprite == null)
				return;
			sprite.reset();
			unitPool.push(sprite);
		}
		
		private static var _doubleClickTween:TweenLite;
		
		private var _unitData:RichTextUnitData;
		public var onLoaded:Function;
		
		public var displayObj:DisplayObject;
		private var _clickCount:uint;

		public function get unitData():RichTextUnitData
		{
			return _unitData;
		}

		public function setUnitData(value:RichTextUnitData):void
		{
			_unitData = value;
			if(RichTextArea3D.onUpdateRichUnit != null)
			{
				RichTextArea3D.onUpdateRichUnit(this);
			}
			if(_unitData.linkType)
			{
				if(RichTextArea3D.onMouseClickUnit != null || RichTextArea3D.onMouseMoveUnit != null || RichTextArea3D.onMouseOutUnit != null)
				{
					if(displayObj)
					{
						displayObj.addEventListener( TouchEvent.TOUCH, onTouch );
					}
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
//			else onMouseOver();
			
			touch = e.getTouch( displayObj, TouchPhase.HOVER ); 
			if( touch != null )
			{
				onMouseMove();
			}
			
			touch = e.getTouch( displayObj, TouchPhase.ENDED ); 
			if( touch != null )
			{
				onMouseClick();
			}
		}
		
		/**
		 * 点击事件
		 * 
		 */		
		private function onMouseClick():void
		{
			if(unitData.doubleClick)
			{
				_clickCount ++;
				var currentTime:int = getTimer();
				if(_clickCount >= 2)
				{
					if(_doubleClickTween)
					{
						_doubleClickTween.kill();
					}
					if(RichTextArea3D.onMouseDoubleClickUnit != null)
					{
						RichTextArea3D.onMouseDoubleClickUnit(this);
					}
					_clickCount = 0;
				}
				else
				{
					_doubleClickTween = TweenLite.delayedCall(0.3,onClickDelay);
				}
			}
			else
			{
				if(RichTextArea3D.onMouseClickUnit !== null)
				{
					RichTextArea3D.onMouseClickUnit(this);
				}
			}
		}
		
		private function onClickDelay():void
		{
			if(_clickCount >= 2)
			{
				if(RichTextArea3D.onMouseDoubleClickUnit != null)
				{
					RichTextArea3D.onMouseDoubleClickUnit(this);
				}
			}
			else
			{
				if(RichTextArea3D.onMouseClickUnit !== null)
				{
					RichTextArea3D.onMouseClickUnit(this);
				}
			}
			_clickCount = 0;
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
		 * 重置，用于回收
		 * 
		 */		
		public function reset():void
		{
			_clickCount = 0;
			if(_unitData)
			{
				RichTextUnitData.pushToPool(_unitData);
			}
			_unitData = null;
			
			if( displayObj != null)
			{
				displayObj.removeEventListener(TouchEvent.TOUCH, onTouch );
				displayObj.removeFromParent();
				if(RichTextArea3D.onGetBackDisplayObjWhenUnitDispose != null)
				{
					RichTextArea3D.onGetBackDisplayObjWhenUnitDispose(displayObj);
				}
				else
				{
					displayObj.dispose();
				}
			}
			displayObj = null;
			if(_doubleClickTween)
			{
				_doubleClickTween.kill();
				_doubleClickTween = null;
			}
		}
		
	}
}