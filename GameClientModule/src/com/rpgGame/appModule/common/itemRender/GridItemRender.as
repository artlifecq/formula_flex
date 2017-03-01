package com.rpgGame.appModule.common.itemRender
{
	import com.rpgGame.app.view.icon.DragDropItem;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.item.GridInfo;
	import com.rpgGame.coreData.type.item.GridBGType;
	
	import feathers.controls.renderers.BaseDefaultListItemRenderer;
	
	/**
	 * 优化的格子项(位于List中,优化渲染)
	 * @author wewell@163.com
	 * 
	 */	
	public class GridItemRender extends BaseDefaultListItemRenderer
	{
		private static var itemIndex:int;
		
		private var size : int;
		
		private var bg : String ;
		
		private var padding:int;
		
		/**
		 * 
		 * @param size 格子尺寸
		 * @param bg 格子背景
		 * @param padding 格子间距
		 * 
		 */
		public function GridItemRender(size:int =  IcoSizeEnum.SIZE_40,bg:String = GridBGType.CHORTCUT_2,padding:int = 0)
		{
			this.size = size;
			this.bg = bg;
			this.padding = padding;
			this.initGrid();
		}
		
		override public function get width():Number
		{
			return size + (padding+1)*2;
		}
		
		override public function get height():Number
		{
			return size +  (padding+1)*2;
		}
		
		protected var grid:DragDropItem;
		private function initGrid():void
		{
			if(this.grid != null)return;
			
			this.grid = new DragDropItem(size,itemIndex++);
			this.grid.setBg( bg );
			grid.width = this.width;
			grid.height = this.height;
			this.grid.dragAble = true;
			
			this.grid.x = grid.y = padding;
			this.addChild(this.grid);
			this.width = this.height = size + (padding+1)*2;
		}
		
		override protected function commitData():void
		{
			var gridInfo:GridInfo = this._data as GridInfo;
			if(gridInfo && this._owner)
			{
				gridInfo.realIndex = this.grid.realIndex;
				grid.setBg(bg);
				grid.gridInfo = gridInfo;
			}
			else
			{
				grid.setGridEmpty();
			}
		}
		
		public function getGrid():DragDropItem
		{
			return grid;
		}
	}
}


