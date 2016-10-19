package com.rpgGame.coreData.utils
{
	import feathers.data.TreeNode;
	
	import org.client.mainCore.ds.HashMap;

	/**
	 * 树工具 
	 * @author Mandragora
	 * 
	 */
	public class TreeUtils
	{
		public function TreeUtils()
		{
		}
		
		
		/**
		 * 向根节点中添加一个数组数据，数组里面可以包含数组，类型自定义 
		 * @param root
		 * @param data 如果是数组，那么会把第一个数组内容提取出来作为根节点()
		 * 前面最好用一个Hashmap装起来，下面是HashMap单个的结构
		 * [[{name:"name"},HashMap],[{name:"name"},HashMap],[{name:"name"},Array]...]
		 * 				   HashMap=[data,data,data...]         			   Array=[data,data,data...]
		 * @return 
		 * 
		 */		
		public static function setTreeNode(root:TreeNode,arr:Array):TreeNode
		{
			var data : *;
			for each(data in arr)
			{
				if(!data)
					continue;
				if(data is Array && data.length >0)
				{
					if(data.length == 2 && data[1] is HashMap)//处理第二个是HashMap的情况
					{
						setTreeNode(root.addChildren(data.shift()),data[0].getValues());
					}else
						root.addChildren(data.shift()).addChildrens(data);
				}else
				{
					root.addChildren(data);
				}
			}
			return root;
		}
	}
}