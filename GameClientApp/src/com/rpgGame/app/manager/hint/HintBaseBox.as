package com.rpgGame.app.manager.hint
{
	import com.rpgGame.coreData.cfg.HintCfgData;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.clientConfig.HintTypeSetInfo;
	import com.rpgGame.coreData.enum.HintTypeEnum;
	import com.rpgGame.coreData.info.HintData;
	
	import feathers.controls.Button;
	import feathers.controls.Label;
	
	import starling.display.DisplayObject;
	import starling.display.Sprite;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	import utils.TimerServer;
	
	public class HintBaseBox extends Sprite
	{
		private var _noticeType:int;
		public function HintBaseBox()
		{
			super();
			this.addEventListener( TouchEvent.TOUCH, onTouch );
		}
		private var waitShowMsg : Array = [];
		
		private function onTouch( e:TouchEvent ):void
		{
			var currentTarget:DisplayObject = e.target as DisplayObject;
			
			
			var touch:Touch = e.getTouch( currentTarget );
			
			touch = e.getTouch( currentTarget, TouchPhase.BEGAN ); 
			if( touch == null )
				return;
			if(currentTarget is Button)
			{
				trace("点击了一个按钮");
				var hintLine : HintLineSprite = currentTarget.parent as HintLineSprite;
				var childIndex : int = this.getChildIndex(hintLine);
				removeHintLine(childIndex);
			}
		}
		
		
		/**
		 * 增加一条系统切出提示 
		 * @param $value 支持HTML文本
		 */		
		public function addHint(value:String):void 
		{
			//生成文本
			var label:HintLineSprite = getSprite();
			label.color = StaticValue.tranStrTo16(hintTypeSet.defaultColor);
			label.htmlText = value;
			label.alpha = 0;
			var hintData : HintData = new HintData();
			//检测条数,如果大于限定条数则移除第一个
			if(numChildren>=hintTypeSet.maxShowNumber)
			{
				if(!hintTypeSet.isWaitMsg)
				{
					hintDatas.shift();
					labelPools.push(removeChildAt(0));
					hintDatas[numChildren] = hintData;
					addChild(label);
				}else
				{
					waitShowMsg.push(value);
				}
			}else
			{
				hintDatas[numChildren] = hintData;
				addChild(label);
			}
			if(!TimerServer.has(update))
				TimerServer.addLoop(update,hintTypeSet.updateTime);
			update();
		}
		
		private function update():void
		{
			var i : int = 0;
			var label:HintLineSprite;
			var per : Number;
			var delay:Number = hintTypeSet.waitTime;
			var tt1:Number = hintTypeSet.showTime;//渐现时间
			var tt2:Number = hintTypeSet.hideTime;//渐隐时间
			var duration:Number = delay + tt1 + tt2;//总时间
			var preChild:Label;
			var hintData : HintData;
			var tempMsg : Array = [];
			var isRemoveHintSprite : Boolean = false;
			for(;i<this.numChildren;i++)
			{
				hintData = hintDatas[i];
				if(!hintData)
					continue;
				per = hintData.preTime;
				hintData.preTime+=hintTypeSet.updateTime;//加上刷新时间
				label = getChildAt(i) as HintLineSprite;
				if(!label)
					continue;
				if(hintTypeSet.textIsMove)
				{
					label.alpha = 1;
					//重设位置
					label.y = label.height * i;
					label.updateLabel();
					if(label.textMoveCount >= hintTypeSet.oneHintShowTimes)
					{
						label.textMoveCount = 0;
						if(label.parent!=null)
							label.removeFromParent();
						labelPools.push(label);
						hintDatas.shift();
						if(waitShowMsg.length)
						{
							addHint(waitShowMsg.shift());
						}
						if(numChildren == 0)//移除timer
							TimerServer.remove(update);
					}
					return;
				}
				if(per<tt1)//显示
				{
					label.y = label.height * (i);
					moveByType(hintTypeSet.showDis/hintTypeSet.showTime*hintTypeSet.updateTime,label,hintTypeSet.showHintType);
					label.alpha = per/tt1;
				}else if(per>duration)//流程完了，回收这个label
				{
					if(isRemoveHintSprite)
					{
						continue;//如果已经移除过了，一定要移到下一次循环再执行，不然效果不好。
					}
					else
					{
						isRemoveHintSprite = true;
						//移除
						if(label.parent!=null)
							label.removeFromParent();
						labelPools.push(label);
						hintDatas.shift();
					}
					if(waitShowMsg.length)
					{
						addHint(waitShowMsg.shift());
					}
					if(numChildren == 0)//移除timer
						TimerServer.remove(update);
				}else if(per>delay+tt1)//渐隐
				{
					moveByType(hintTypeSet.hideDis/hintTypeSet.hideTime*hintTypeSet.updateTime,label,hintTypeSet.hideHintType);
					label.alpha = (tt2-(per-delay-tt1))/tt2;
				}
				else//alpha==1显示
				{
					label.y = label.height * (i);
					label.alpha = 1;
					//重设位置
				}
			}
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
		private function moveByType(dis:Number,label:HintLineSprite,type:int):void
		{
			switch(type)
			{
				case HintTypeEnum.ENUM_NORMAL:
					return;
				case HintTypeEnum.ENUM_LEFT_TO_RIGHT:
					label.x += dis;
					break;
				case HintTypeEnum.ENUM_RIGHT_TO_LEFT:
					label.x -= dis;
					break;
				case HintTypeEnum.ENUM_TOP_TO_LOW:
					label.y += dis;
					break;
				case HintTypeEnum.ENUM_LOW_TO_TOP:
					label.y -= dis;
					break;
			}
		}
		
		private function removeHintLine(index:int):void
		{
			if(numChildren<=index)
				return;
			hintDatas.splice(index,1);
			labelPools.push(removeChildAt(index));
			if(waitShowMsg.length)
			{
				addHint(waitShowMsg.shift());
			}
			update();
		}
		
		private function getSprite():HintLineSprite
		{
			var label:HintLineSprite
			if(labelPools.length>0)
			{
				label = labelPools.shift();
				label.resetLine();
			}else
			{
				label = new HintLineSprite(noticeType);
			}
			return label;
		}

		private function get hintTypeSet():HintTypeSetInfo
		{
			return HintCfgData.getHintTypeSet(noticeType);
		}

		public function get noticeType():int
		{
			return _noticeType;
		}

		public function set noticeType(value:int):void
		{
			_noticeType = value;
		}


		private var labelPools : Array = [];
		/**
		 * 用来记录每个提示跑的时间的 
		 */		
		private var hintDatas:Array = [];
		
	}
}
