package com.rpgGame.app.ui.main.task
{
	import com.rpgGame.app.manager.task.TaskManager;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.task.PrizeInfo;
	import com.rpgGame.coreData.info.task.TaskDataInfo;
	import com.rpgGame.coreData.utils.ColorUtils;
	
	import starling.display.Sprite;
	import starling.text.TextField;

	/**
	 * 任务 奖励列表，包括要显示选择物品
	 * @author luguozheng
	 * 
	 */	
	public class TaskPrizeList extends Sprite
	{
		private static const ROW_COUNT:int = 4;
		/** 固定奖励 **/
		private var fixGridList:PrizeGridList;
		/** 可选奖励-----文本 **/
		private var selectedText:TextField;
		/** 可选奖励 **/
		private var selectedListVect:Vector.<PrizeGridList>;
		
		public function TaskPrizeList()
		{
			init();
		}
		
		/**
		 * 初始化 
		 * 
		 */		
		private function init():void
		{
			selectedListVect = new Vector.<PrizeGridList>;
			
			fixGridList = new PrizeGridList( IcoSizeEnum.SIZE_40, 4 );
			addChild( fixGridList );
			
			selectedText = new TextField( 100, 20, "可选择奖励：" );
			addChild( selectedText );
			selectedText.color = StaticValue.COLOR_CODE_1;
			selectedText.bold = true;
		}		
		
		/**
		 * 单个任务详细数据 
		 * @param taskDataInfo
		 * 
		 */		
		public function setData( taskDataInfo:TaskDataInfo ):void
		{
			if(taskDataInfo == null)
				return;
		
			fixGridList.setPrize( taskDataInfo.fixPrize );
			
			hideSelectPrize();
			if( taskDataInfo.selectablePrizeInfoVect == null || taskDataInfo.selectablePrizeInfoVect.length <= 0 )
			{
				selectedText.visible = false;
				return;
			}
			
			selectedText.visible = true;
			
			updatePosition();
			
			updateSelectPrize( taskDataInfo.selectablePrizeInfoVect );
		}
		
		/**
		 * 更新可选奖励文本位置坐标 
		 * 
		 */				
		private function updatePosition():void
		{
			selectedText.y = fixGridList.getRealHeight();
		}
		
		/**
		 * 更新可选奖励数据 
		 * @param selectablePrizeInfoVect
		 * 
		 */		
		private function updateSelectPrize( selectablePrizeInfoVect:Vector.<PrizeInfo> ):void
		{
			var startPosy:int = selectedText.y + selectedText.height + 10;
			
			var listLen:int = selectedListVect.length;
			var len:int = selectablePrizeInfoVect.length;
			var list:PrizeGridList;
			const gap:int = 6;
			for( var i:int = 0; i < len; i ++ )
			{
				if( i < listLen)
				{
					list = selectedListVect[i];
				}
				else
				{
					list = new PrizeGridList( IcoSizeEnum.SIZE_40, gap );
					addChild( list ); 
					selectedListVect.push( list );
				}
				
				list.setPrize( selectablePrizeInfoVect[i] );
				
				list.x = (i % ROW_COUNT) * (list.width + gap);
				list.y = startPosy + Math.floor( i / ROW_COUNT ) * (list.getRealHeight() + gap);
				
				list.visible = true;
			}
		}
		
		/**
		 * 隐藏可选奖励格子 
		 * 
		 */		
		private function hideSelectPrize():void
		{
			for(var i:int = selectedListVect.length - 1 ;i>= 0 ;i --)
			{
				selectedListVect[i].visible = false;
			}
		}
		
		/**
		 * 奖励飞行 
		 * 
		 */		
		public function flyPrizeIco():void
		{
			fixGridList.flyIco();
			
			if( !selectedText.visible )
				return;
			
			var curSelectPrizeIndex:int = TaskManager.curSelectPrizeIndex;
			if( curSelectPrizeIndex < 0 )
				return;
			
			if( curSelectPrizeIndex >= selectedListVect.length )
				return;
			
			selectedListVect[ curSelectPrizeIndex ].flyIco();
		}
	}
}