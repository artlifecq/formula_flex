package feathers.data
{
	/**
	 * 树－数据结构
	 * @author wewell@163.com
	 */	
	public class TreeNode
	{
		public function TreeNode(data:Object)
		{
			_data = data;
		}
		//父节点, 如果为空表示为根结点
		private var _parent:TreeNode;
		
		//子结点
		private var _children:Vector.<TreeNode>;
		
		//层深 -1表示树根，－棵树只能有一个根
		private var _depth:int= -1;
		
		//此节点应用数据
		private var _data:Object;
		
		//头节点，用于GroupedTree
		public var header:Object;
		
		//是否已经展开
		public var expanded:Boolean;
		
		public function addChild(childNodeData:Object):TreeNode
		{
			var node:TreeNode = childNodeData is TreeNode ? childNodeData as TreeNode : new TreeNode(childNodeData);
			return addNode(node);
		}
		
		public function addChildren(childrensNodeDataList:Array):Vector.<TreeNode>
		{
			var len:int = childrensNodeDataList.length;
			for(var i:int = 0; i< len; i++)
			{
				addChild(childrensNodeDataList[i]);
			}
			return _children;
		}
		
		public function addNode(node:TreeNode):TreeNode
		{
			node._parent = this;
			node._depth = this._depth + 1;
			
			if(_children == null)_children = new Vector.<TreeNode>();
			_children.push(node);
			return node;
		}
		
		public function removeNode(node:TreeNode):void
		{
			var index:int = _children ?  _children.indexOf(node) : -1;
			if(index < 0)return;
			removeChildren(index);
		}
		
		public function removeFromParent():void
		{
			if(_parent == null)
			{
				//移除根
				this._children = null;
				return;
			}
			
			//从父结点中移除自己
			var nodes:Vector.<TreeNode> = _parent.children;
			var len:int = nodes.length;
			var node:TreeNode;
			for (var i:int=0; i<len; i++)
			{
				node = nodes[i];
				if(node == this)
				{
					_parent.children.splice(i, 1);
					node._parent = null;
					node._children = null;
					break;
				}
			}
		}
		
		public function removeChildren(index:int):void
		{
			if(_children && _children.length > index)
			{
				_children.splice(index, 1);
			}
		}
		
		public function updateData(data:Object):void
		{
			this._data = data;	
		}
		
		public function get children():Vector.<TreeNode>
		{
			return _children;
		}
		
		public function get parent():TreeNode
		{
			return _parent;
		}
		
		public function get depth():int
		{
			return _depth;
		}
		
		public function get data():Object
		{
			return _data;
		}
		
		public function get hasChildren():Boolean
		{
			return children && children.length;
		}
	}
}