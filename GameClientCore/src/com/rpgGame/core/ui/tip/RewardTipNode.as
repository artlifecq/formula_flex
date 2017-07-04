package com.rpgGame.core.ui.tip
{
	import com.game.mainCore.core.timer.GameTimer;
	import com.gameClient.utils.HashMap;
	
	import flash.utils.getTimer;
	
	import starling.display.DisplayObjectContainer;

	public class RewardTipNode
	{
		public static const allNode:HashMap=new HashMap();
		private static const timeNodes:Vector.<RewardTipNode>=new Vector.<RewardTipNode>()
		private static var checkTime:int;
		private static var timerIndex:int=0;
		private static const STEP:int=2;
		private static function onTimer():void
		{
			// TODO Auto Generated method stub
			if (getTimer()-checkTime>5000) 
			{
				checkTime=getTimer();
				allNode.eachValue(setTip2Top);
			}
			var len:int=timeNodes.length;
			if (timerIndex>=len) 
			{
				timerIndex=0;
			}
			var time:int=getTimer();
			for (var i:int = 0; i < STEP; i++) 
			{
				if (timerIndex<=len-1) 
				{
					timeNodes[timerIndex].update();
				}
				timerIndex++;
			}
			//trace("usetime2:"+(getTimer()-time));
		}
		private static const _timer:GameTimer=new GameTimer("RewardTipNode",1000,0,onTimer);
		_timer.start();
		private static function setTip2Top(node:RewardTipNode):void
		{
			node._tipCtrl.setTip2Top();
		}
		private static function timeUpdate(node:RewardTipNode):void
		{
			node.update();
		}
		private var _checkFunc:Function;
		private var _checkParam:Object;
		private var _tipCtrl:RewardMarkTip;
		private var _parentNodeKey:String;
		private var _childrenNodes:Vector.<String>;
		private var _key:String;
		public static function getNode(key:String):RewardTipNode
		{
			return allNode.getValue(key);
		}
		public function RewardTipNode(key:String,dis:DisplayObjectContainer,dw:int,check:Function,isGray:Boolean=false,param:Object=null,isInTimer:Boolean=false)
		{
			this._key=key;
			this._checkParam=param;
			this._tipCtrl=new RewardMarkTip(dis,dw,isGray);
			this._checkFunc=check;
			allNode.put(_key,this);
			if (isInTimer) 
			{
				timeNodes.push(this);
				update();
			}
		}
		public function update():void
		{
			var ret:Boolean=false;
			if (_checkFunc) 
			{
				if (_checkParam) 
				{
					ret=_checkFunc.call(null,_checkParam);
				}
				else
				{
					ret=_checkFunc();
				}
				
			}
			if (!ret&&_childrenNodes) 
			{
				for each (var key:String in _childrenNodes) 
				{
					var child:RewardTipNode=getNode(key);
					if (child&&child.hasReward) 
					{
						ret=true;
						break;
					}
				}
			}
			setState(ret);
		}
		/**
		 *设置状态 
		 * @param state 为true父节点直接设为true,false,父节点会检测
		 * 
		 */		
		public function setState(state:Boolean):void
		{
			if (_tipCtrl) 
			{
				_tipCtrl.hasReward=state;
			}
			if (_parentNodeKey) 
			{
				var p:RewardTipNode=getNode(_parentNodeKey);
				if (p) 
				{
					if (state) 
					{
						p.setState(state);
					}
					else
					{
						p.update();
					}
				}
			
			}
		}
		public function addChildNode(node:RewardTipNode):void
		{
			if (node) 
			{
				if (!_childrenNodes) 
				{
					_childrenNodes=new Vector.<String>();
				}
				_childrenNodes.push(node._key);
				node._parentNodeKey=this._key;
				update();
			}
		}
		public function removeNode(node:RewardTipNode,isUpdate:Boolean=true):void
		{
			if (!node||!_childrenNodes) 
			{
				return;
			}
			var index:int=_childrenNodes.indexOf(node._key);
			if (index!=-1) 
			{
				_childrenNodes.splice(index,1);
			}
			node._parentNodeKey=null;
			if (isUpdate) 
			{
				update();
			}
		}
		public function get hasReward():Boolean
		{
			if (_tipCtrl) 
			{
				return _tipCtrl.hasReward;
			}
			return false;
		}
		public function clear():void
		{
			_tipCtrl.clear();
			_tipCtrl=null;
			_checkFunc=null;
			
		
			if (_childrenNodes) 
			{
				for each (var key:String in _childrenNodes) 
				{
					var node:RewardTipNode=getNode(key);
					if (node) 
					{
						node._parentNodeKey=null;
						node.clear();
					}
				}
				_childrenNodes.length=0;
			}
			allNode.remove(_key);
			var index:int=timeNodes.indexOf(this);
			if (index!=-1) 
			{
				timeNodes.splice(index,1);
			}
			if (_parentNodeKey) 
			{
				var p:RewardTipNode=getNode(_parentNodeKey);
				if (p) 
				{
					p.removeNode(this);
				}
				_parentNodeKey=null;
			}
			
		}
		
	}
}