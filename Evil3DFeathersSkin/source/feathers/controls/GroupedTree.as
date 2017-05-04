package feathers.controls
{
	import flash.utils.Dictionary;
	
	import feathers.data.HierarchicalCollection;
	import feathers.skins.IStyleProvider;

	/**
	 * 支持两种header和item为不同itemRender的tree
	 * @author wewell@163.com
	 * 
	 */	
	public class GroupedTree extends GroupedList
	{
		/**
		 * The default <code>IStyleProvider</code> for all <code>GroupedTree</code>
		 * components.
		 *
		 * @default null
		 * @see feathers.core.FeathersControl#styleProvider
		 */
		public static var globalStyleProvider:IStyleProvider;
		
		private var _branches:Array;
		private var _childrenCaches:Array;
		private var _openStatus:Dictionary;
		
		public function GroupedTree()
		{
			_childrenCaches = [];
			_openStatus = new Dictionary();
		}
		
		public function addBranch(header:Object, children:Array, expand:Boolean=true, requiresRedraw:Boolean = false):void
		{
			if(_branches == null)_branches = [];
			_branches.push({header:header, children:children});
			var index:int = _branches.length-1;
			_childrenCaches[index] = children;
			
			expand ? expandBranch(index, false) : foldBranch(index, false);
			
			if(requiresRedraw)updateTree();
		}
		
		public function removeBranch(index:int, requiresRedraw:Boolean = true):void
		{
			_branches.splice(index, 1);
			
			if(_childrenCaches.length > index)
			{
				_childrenCaches.splice(index,1);
			}
			if(requiresRedraw)updateTree();
		}
		
		public function updateBranch(index:int, children:Array , requiresRedraw:Boolean = true):void
		{
			var branch:Object = _branches[index];
			branch.children = children;
			
			if(_childrenCaches.length > index)
			{
				_childrenCaches[index] = children;
			}
			_openStatus[index] ? expandBranch(index, false) : foldBranch(index, false);
			
			if(requiresRedraw)updateTree();
		}
		
		public function expandBranch(index:int, requiresRedraw:Boolean = true):void
		{
			var branch:Object = _branches[index];
			branch.children = _childrenCaches[index];
			_openStatus[index] = true;
			if(requiresRedraw)updateTree();
		}
		
		public function foldBranch(index:int, requiresRedraw:Boolean = true):void
		{
			var branch:Object = _branches[index];
			_childrenCaches[index] = branch.children;
			branch.children = [];
			_openStatus[index] = false;
			if(requiresRedraw)updateTree();
		}
		
		public function isBranchExpand(index:int):Boolean
		{
			return _openStatus[index] == true;
		}
		
		public function switchExpandOrFold(index:int, requiresRedraw:Boolean = true):void
		{
			isBranchExpand(index) ? foldBranch(index, requiresRedraw) : expandBranch(index, requiresRedraw);
		}
		
		public function updateTree():void
		{
			if(dataProvider == null)
			{
				dataProvider = new HierarchicalCollection(_branches);
			}
			dataProvider.updateAll();
		}
	}
}