package com.rpgGame.core.ui.tip
{
	import com.gameClient.utils.HashMap;
	
	import starling.display.DisplayObjectContainer;

	/**
	 *奖励图标树 
	 * @author Administrator
	 * 
	 */	
	public class RewardTipTree
	{
		public static var ins:RewardTipTree=new RewardTipTree();
		private var _roots:HashMap=new HashMap();
		public var recordNodeState2Server:Function;
		private var _serverRecord:HashMap;
		public function RewardTipTree()
		{
		}
		public function setServerData(hash:HashMap):void
		{
			this._serverRecord=hash;
			var keys:Array=hash.keys();
			var tmp:RewardTipNode;
			for each (var key:String in keys) 
			{
				tmp=getNode(key);
				if (tmp) 
				{
					tmp.setState(Boolean(hash.remove(key)),true);
				}
			}
		}
		public function getNode(key:String):RewardTipNode
		{
			return RewardTipNode.allNode.getValue(key);
		}
		private function addRoot(key:String,node:RewardTipNode):void
		{
			if (!_roots.containsValue(key)) 
			{
				_roots.put(key,node);
			}
		}
		public function addNode(parentKey:String,key:String,dis:DisplayObjectContainer,dw:int,check:Function,isGray:Boolean=false,param:Object=null,isInTimer:Boolean=false):void
		{
			var parentNode:RewardTipNode;
			if (parentKey!=null||parentKey!="") 
			{
				parentNode=getNode(parentKey);
			}
			var child:RewardTipNode=new RewardTipNode(key,dis,dw,check,isGray,param,isInTimer);
			if (parentNode==null) 
			{
				addRoot(key,child);
				child.isRoot=true;
				if (_serverRecord&&_serverRecord.containsKey(key)) 
				{
					child.setState(Boolean(_serverRecord.remove(key)),true);
				}
			}
			else
			{
				parentNode.addChildNode(child);
			}
		}
		public function removeNode(key:String):void
		{
			var node:RewardTipNode=getNode(key);
			if (node) 
			{
				node.clear();
			}
		}
		public function updateNode(key:String):void
		{
			var node:RewardTipNode=getNode(key);
			if (node) 
			{
				node.update();
			}
		}
		public function setState(key:String,state:Boolean):void
		{
			var node:RewardTipNode=getNode(key);
			if (node) 
			{
				node.setState(state);
			}
		}
	}
}