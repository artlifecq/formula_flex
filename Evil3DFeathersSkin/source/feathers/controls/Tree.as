package feathers.controls
{
	import feathers.data.ListCollection;
	import feathers.data.TreeNode;
	
	/**
	 * 树状列表组件
	 * @author wewell@163.com
	 */
	public class Tree extends List
	{
		/**
		 * 构造函数
		 */		
		public function Tree()
		{
			super();
		}
		
		private var _rootNode:TreeNode;
		public function set rootNode(node:TreeNode):void
		{
			_rootNode = node;
		}
		
		public function get rootNode():TreeNode
		{
			return _rootNode;
		}
		
		private var _nodeList:Vector.<TreeNode>;
		private function updateNodeList():Vector.<TreeNode>
		{
			if(_nodeList == null)_nodeList = new Vector.<TreeNode>();
			_nodeList.length = 0;
			if(!_rootNode.expanded)_rootNode.expanded = true;
			findAllExpandedNode(_rootNode);
			return _nodeList;
		}
		
		private function findAllExpandedNode(node:TreeNode):void
		{
			if(node.depth >= 0)
			{
				_nodeList.push(node);
			}
			if(node.expanded)
			{
				var len:int = node.children ? node.children.length : 0;
				var child:TreeNode;
				for (var i:int=0; i<len; i++)
				{
					child = node.children[i];
					if(child.expanded && child.children)
					{
						findAllExpandedNode(child);
					}else{
						_nodeList.push(child);
					}
				}
			}
		}
		
		public function updateTree():void
		{
			if(dataProvider == null)
			{
				dataProvider = new ListCollection();
			}
			
			updateNodeList();
			
			var node:TreeNode;
			var len:int = _nodeList.length;
			var oldLen:int = dataProvider.length;
			for(var i:int=0; i< len; i++)
			{
				node = _nodeList[i];
				if(i < oldLen)
					dataProvider.setItemAt(node, i);
				else
					dataProvider.addItem(node);
			}
			
			for(i=oldLen; i>len; i--)
				dataProvider.removeItemAt(i-1);
		}
		
		/**
		 * 记录最后一次最选中的叶节点 
		 */		
		private var _lastSelectedLeafNode:TreeNode;
		override public function set selectedItem(value:Object):void
		{
			super.selectedItem = value;
			
			var node:TreeNode = value  as TreeNode;
			if(node && !node.hasChildren)
			{
				_lastSelectedLeafNode = node;
			}
		}
		
		public function getSelectedLeafNode():TreeNode
		{
			return _lastSelectedLeafNode;
		}
		
		public function getSelectedNode():TreeNode
		{
			return selectedItem as TreeNode;
		}
	}
}