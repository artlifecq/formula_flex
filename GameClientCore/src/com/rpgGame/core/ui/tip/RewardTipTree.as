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
		private var _roots:HashMap=new HashMap();
		
		public function RewardTipTree()
		{
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
		public function addNode(parentKey:String,key:String,dis:DisplayObjectContainer,dw:int,check:Function,isGray:Boolean=false,param:Object=null):void
		{
			var parentNode:RewardTipNode;
			if (parentKey!=null||parentKey!="") 
			{
				parentNode=getNode(parentKey);
			}
			var child:RewardTipNode=new RewardTipNode(key,dis,dw,check,isGray,param);
			if (parentNode==null) 
			{
				addRoot(key,child);
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
	}
}