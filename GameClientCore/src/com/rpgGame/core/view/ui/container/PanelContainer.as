package com.rpgGame.core.view.ui.container
{
	import starling.display.Sprite;

	/**
	 * 容器
	 * 1、显示、隐藏方法
	 * 2、id 当前容器的标识
	 * @author luguozheng
	 * 
	 */	
	public class PanelContainer extends Sprite
	{
		/**一个标识数据**/
		public var id:int;
		
		public function PanelContainer( id:int = 0 )
		{
			this.id = id;
		}
		
		/**
		 * 显示
		 * 子类自己覆写
		 * 
		 */		
		public function show():void
		{
			this.visible = true;
		}
		
		/**
		 * 隐藏
		 * 子类自己覆写
		 * 
		 */		
		public function hide():void
		{
			this.visible = false;
		}
		
		/**
		 * 更新
		 * 子类自己覆写
		 * 
		 */		
		public function update():void
		{
		
		}
		
	}
}