package com.rpgGame.app.manager.hint
{
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.coreData.cfg.HintCfgData;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.clientConfig.HintTypeSetInfo;
	import com.rpgGame.coreData.enum.HintMoveDirectionEnum;
	
	import flash.utils.getTimer;
	
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.UIAsset;
	
	import gs.TweenMax;
	import gs.easing.Expo;
	
	import starling.display.DisplayObject;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	import utils.TimerServer;
	
	/**
	 * 提示
	 * @author Mandragora
	 * @modifier L.L.M.Sunny
	 * 修改时间：2016-09-13 下午3:05:12
	 *
	 */
	public class HintBaseBox extends Sprite
	{
		private var _bg : UIAsset;
		private var _labelPools : Array = [];
		private var _noticeType : int;
		private var _hintTypeSet : HintTypeSetInfo;
		private var _waitShowMsg : Array = [];
		private var _hintLines : Array = [];
		private var _labelContainer : Sprite;
		private var _labelMask : Quad;
		private var _bgMarginTop : int;
		private var _bgMarginBottom : int;
		private var _bgMarginLeft : int;
		private var _bgMarginRight : int;
		private var _topOffset : int;
		private var _lastHintValue : String;
		
		
		public function HintBaseBox(noticeType : int)
		{
			super();
			_noticeType = noticeType;
			_hintTypeSet = HintCfgData.getHintTypeSet(_noticeType);
			//_hintTypeSet.bg="ui/common/tips/shubiaotiao_bg.png";
			_lastHintValue = null;
			this.addEventListener(TouchEvent.TOUCH, onTouch);
			initSprite();
		}
		
		private function initSprite() : void
		{
			var bgMargins : Array = _hintTypeSet.bgMargin.split(";");
			if (bgMargins.length > 0)
				_bgMarginTop = bgMargins[0];
			else
				_bgMarginTop = 0;
			if (bgMargins.length > 1)
				_bgMarginBottom = bgMargins[1];
			else
				_bgMarginBottom = 0;
			if (bgMargins.length > 2)
				_bgMarginLeft = bgMargins[2];
			else
				_bgMarginLeft = 0;
			if (bgMargins.length > 3)
				_bgMarginRight = bgMargins[3];
			else
				_bgMarginRight = 0;
			
			this.visible = false;
			if (_hintTypeSet.bg)
			{
				_bg = new UIAsset();
				_bg.visible = true;
				_bg.styleName = _hintTypeSet.bg;
				addChild(_bg);
			}
			
			_labelContainer = new Sprite();
			addChild(_labelContainer);
			updateLabels();
		}
		
		private function readjustSize() : void
		{
			var currBoxWidth : int = boxWidth;
			var currBoxHeight : int = boxHeight;
			if (_bg)
			{
				_bg.setSize(currBoxWidth, currBoxHeight);
			}
			if (_hintTypeSet.showMoveDirection == HintMoveDirectionEnum.ENUM_NORMAL)
			{
				_labelContainer.mask = null;
			}
			else
			{
				var maskWidth : int = currBoxWidth - _bgMarginLeft - _bgMarginRight;
				var maskHeight : int = currBoxHeight - _bgMarginTop - _bgMarginBottom;
				if (maskWidth > 0 && maskHeight > 0)
				{
					if (!_labelMask)
					{
						_labelMask = new Quad(maskWidth, maskHeight);
					}
					var topLinePosY : int = 0;
					if (_hintLines.length > 0)
					{
						var firstLabel : HintLineSprite = _hintTypeSet.sequenceInsert ? _hintLines[_hintLines.length - 1] : _hintLines[0];
						topLinePosY = firstLabel.y;
					}
					_labelContainer.mask = _labelMask;
					_labelMask.x = _bgMarginLeft;
					_labelMask.y = _bgMarginTop + topLinePosY;
					_labelMask.readjustSize(maskWidth, maskHeight);
				}
				else
				{
					_labelContainer.mask = null;
				}
			}
		}
		
		public function get boxWidth() : int
		{
			if (_hintTypeSet)
			{
				if (_hintTypeSet.width == 0)
				{
					return _bgMarginLeft + _bgMarginRight + getLinesWidth();
				}
				else
				{
					return _hintTypeSet.width;
				}
			}
			return 0;
		}
		
		public function get boxHeight() : int
		{
			return _bgMarginTop + _bgMarginBottom + getLinesHeight();
		}
		
		public function getLinesWidth() : int
		{
			var result : int = 0;
			if (_hintTypeSet)
			{
				var label : HintLineSprite;
				var len : int = _hintLines.length;
				var lineWidth : int;
				for (var i : int = len - 1; i >= 0; i--)
				{
					label = _hintLines[i];
					lineWidth = label.lineWidth;
					if (lineWidth > result)
					{
						result = lineWidth;
					}
				}
			}
			return result;
		}
		
		public function getLinesHeight() : int
		{
			var result : int = 0;
			if (_hintTypeSet)
			{
				var label : HintLineSprite;
				var len : int = _hintLines.length;
				for (var i : int = len - 1; i >= 0; i--)
				{
					label = _hintLines[i];
					result += label.lineHeight;
				}
			}
			return result;
		}
		
		private function onTouch(e : TouchEvent) : void
		{
			var currentTarget : DisplayObject = e.target as DisplayObject;
			
			var touch : Touch = e.getTouch(currentTarget);
			touch = e.getTouch(currentTarget, TouchPhase.BEGAN);
			if (touch == null)
				return;
			if (currentTarget is Button)
			{
				trace("点击了一个按钮");
				var hintLine : HintLineSprite = currentTarget.parent as HintLineSprite;
				if (hintLine)
				{
					removeLabel(hintLine);
					if (_waitShowMsg.length > 0)
					{
						onAddHint(_waitShowMsg.pop());
					}
					if (_hintLines.length == 0)
					{
						_lastHintValue = null;
						stop();
					}
					updateLabels();
				}
			}
		}
		
		private function addLabel(label : HintLineSprite) : void
		{
			_labelContainer.addChild(label);
			if (_hintTypeSet.sequenceInsert)
				_hintLines.unshift(label);
			else
				_hintLines.push(label);
		}
		
		private function removeLabel(label : HintLineSprite) : void
		{
			if (label.parent != null)
			{
				label.parent.removeChild(label);
			}
			var index : int = _hintLines.indexOf(label);
			if (index > -1)
			{
				_hintLines.splice(index, 1);
			}
			_labelPools.push(label);
		}
		
		/**
		 * 增加一条系统切出提示
		 * @param $value 支持HTML文本
		 */
		public function addHint(value : String) : void
		{
			onAddHint(value);
			updateLabels();
			play();
		}
		
		private function onAddHint(value : String) : void
		{
			var isPushNew : Boolean = false;
			//检测条数,如果大于限定条数则移除第一个
			if (_lastHintValue != null && _hintLines.length >= _hintTypeSet.maxShowCount)
			{
				if (!_hintTypeSet.isWaitMsg)
				{
					if (_hintLines.length > 0)
					{
						var firstLine : HintLineSprite;
						if (_hintTypeSet.sequenceInsert)
							firstLine = _hintLines.pop();
						else
							firstLine = _hintLines.shift();
						removeLabel(firstLine);
					}
					isPushNew = true;
				}
				else
				{
					if (_hintTypeSet.maxShowCount == 1)
					{
						if (_hintLines.length > 0)
						{
							removeLabel(_hintLines[0]);
						}
						_waitShowMsg.push(_lastHintValue);
						isPushNew = true;
					}
					else
					{
						_waitShowMsg.push(value);
					}
					if (_waitShowMsg.length > _hintTypeSet.maxRetainsCount)
					{
						_waitShowMsg.shift();
					}
				}
			}
			else
			{
				isPushNew = true;
			}
			//生成文本
			if (isPushNew)
			{
				_lastHintValue = value;
				var label : HintLineSprite = getSprite();			
				label.setText(value, StaticValue.tranStrTo16(_hintTypeSet.defaultColor));
				if (_hintTypeSet.refreshInterval > 0)
				{
					label.alpha = 0;
				}
				else
				{
					label.alpha = 1;
				}
				if(_hintTypeSet.type==NoticeManager.SYSTEM_SWITCH)
				{
					var w:int=label.width;
					label.scale=1.3;
					label.x=-(label.width-w)/2;
					TweenMax.to(label,0.3,{delay:0.1,scale:1,onUpdate:updatePostion,onUpdateParams:[label,w]});
				}
				addLabel(label);
			}
		}
		
		private function updatePostion(... args):void
		{
			var w:int=parseInt(args[1]);
			args[0].x=-(args[0].width-w)/2;
		}
		
		private function updateLabels() : void
		{
			_topOffset = 0;
			var label : HintLineSprite;
			var lastLine : HintLineSprite = null;
			var i : int;
			var len : int = _hintLines.length;
			if (len > 0)
			{
				var bottomLabel : HintLineSprite = _hintTypeSet.sequenceInsert ? _hintLines[0] : _hintLines[len - 1];
				for (i = len - 1; i >= 0; i--)
				{
					label = _hintLines[i];
					label.updateLabel(lastLine, _topOffset);
					lastLine = label;
					var pageHeight : int;
					if (_hintTypeSet.firstPageHeight > 0)
					{
						pageHeight = _hintTypeSet.firstPageHeight;
					}
					else
					{
						var maxHeight : int = _hintTypeSet.maxShowCount * _hintTypeSet.height;
						pageHeight = maxHeight;
					}
					var nextPos : int = label.y + label.height;
					if (label == bottomLabel)
					{
						_topOffset = pageHeight - nextPos;
					}
					if (nextPos > pageHeight)
					{
						_topOffset = 0;
						break;
					}
				}
				lastLine = null;
				for (i = len - 1; i >= 0; i--)
				{
					label = _hintLines[i];
					label.updateLabel(lastLine, _topOffset);
					lastLine = label;
				}
			}
			readjustSize();
		}
		
		private function update() : void
		{
			var needUpdateLabels : Boolean = false;
			var label : HintLineSprite;
			var delay : Number = _hintTypeSet.waitTime;
			var showTime : Number = _hintTypeSet.showTime; //渐现时间
			var hideTime : Number = _hintTypeSet.hideTime; //渐隐时间
			var lastLine : HintLineSprite = null;
			var len : int = _hintLines.length;
			for (var i : int = len - 1; i >= 0; i--)
			{
				label = _hintLines[i] as HintLineSprite;
				label.preTime += _hintTypeSet.refreshInterval; //加上刷新时间
				label.updateLabel(lastLine, _topOffset);
				lastLine = label;
				if (label.preTime < showTime) //显示
				{
					//moveByType(label, _hintTypeSet.showMoveDirection, _hintTypeSet.showDis / _hintTypeSet.showTime * _hintTypeSet.refreshInterval);
					label.alpha = label.preTime / showTime;
				}
				else if (delay > 0 && label.preTime > delay + showTime) //渐隐
				{
					//moveByType(label, _hintTypeSet.hideMoveDirection, _hintTypeSet.hideDis / _hintTypeSet.hideTime * _hintTypeSet.refreshInterval);
					label.alpha = (hideTime - (label.preTime - delay - showTime)) / hideTime;
				}
				else //alpha==1显示
				{
					label.alpha = 1;
				}
				
				if (label.isFinished)
				{
					removeLabel(label);
					needUpdateLabels = true;
				}
			}
			
			while (_hintLines.length < _hintTypeSet.maxShowCount && _waitShowMsg.length > 0)
			{
				onAddHint(_waitShowMsg.shift());
				needUpdateLabels = true;
			}
			if (_hintLines.length == 0)
			{
				_lastHintValue = null;
				stop();
			}
			if (needUpdateLabels)
			{
				updateLabels();
			}
		}
		
		private function stop() : void
		{
			TimerServer.remove(update);
			this.visible = false;
		}
		
		private function play() : void
		{
			if (_hintTypeSet.refreshInterval > 0)
			{
				if (!TimerServer.has(update))
				{
					TimerServer.addLoop(update, _hintTypeSet.refreshInterval);
				}
			}
			this.visible = true;
		}
		
		/**
		 * 控制移动
		 * @param pre 当前时间
		 * @param time 运动总时间
		 * @param label
		 * @param type 运动类型
		 * @param dis 总运动距离
		 *
		 */
		private function moveByType(label : HintLineSprite, type : int, dis : Number) : void
		{
			switch (type)
			{
				case HintMoveDirectionEnum.ENUM_NORMAL:
					return;
				case HintMoveDirectionEnum.ENUM_LEFT_TO_RIGHT:
					label.x += dis;
					break;
				case HintMoveDirectionEnum.ENUM_RIGHT_TO_LEFT:
					label.x -= dis;
					break;
				case HintMoveDirectionEnum.ENUM_TOP_TO_LOW:
					label.y += dis;
					break;
				case HintMoveDirectionEnum.ENUM_LOW_TO_TOP:
					label.y -= dis;
					break;
			}
		}
		
		private function getSprite() : HintLineSprite
		{
			var label : HintLineSprite;
			if (_labelPools.length > 0)
			{
				label = _labelPools.shift();
				label.resetLine();
			}
			else
			{
				label = new HintLineSprite(_hintTypeSet);
			}
			return label;
		}
		
		public function get hintTypeSet() : HintTypeSetInfo
		{
			return _hintTypeSet;
		}
		
		public function get noticeType() : int
		{
			return _noticeType;
		}
		
		override public function get height() : Number
		{
			return boxHeight;
		}
	}
}
