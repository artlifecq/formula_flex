package com.rpgGame.app.ui.main.task
{
	import com.rpgGame.app.cmdlistener.enum.EmQuality;
	import com.rpgGame.app.manager.task.MiXinManager;
	import com.rpgGame.app.manager.task.TouJingManager;
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.item.ItemInfo;
	import com.rpgGame.coreData.info.task.MiXinPrizeInfo;
	import com.rpgGame.coreData.info.task.PrizeInfo;
	import com.rpgGame.coreData.info.toujing.TouJingPrizeInfo;
	import com.rpgGame.coreData.type.item.GridBGType;
	
	import app.message.AmountType;
	
	import org.client.mainCore.ds.HashMap;
	
	import starling.display.Sprite;
	
	/**
	 * 奖励物品列表
	 * @author luguozheng
	 * 
	 */	
	public class PrizeGridList extends Sprite
	{
		private static var heightConfigMap:HashMap = new HashMap();
		/**格子list**/
		private var gridList:Array;
		/**当前已添加奖励的编号**/
		private var addIndex:int;
		/**格子大小**/
		private var gridSize:int;
		/** 每行几个，等于-1时表示就是一排 */		
		private var gridRow:int;
		/** 格子之的间距 **/		
		private var gridDis:int;
		/** 传过来的数据 **/
		private var Info:*;
		
		/**
		 * 创建格子
		 * @param size		Ico大小
		 * @param row		一行几个，默认为只排一行
		 * @param gridDis	格子之间的间距
		 * 
		 */		
		public function PrizeGridList( size:int, row:int = -1, gridDis:int = 4) 
		{
			gridList = new Array;
			this.gridRow = row;
			gridSize = size;
			this.gridDis = gridDis;
			this.width = this.height = size;
		}
		setup()
		public static function setup():void
		{
//			heightConfigMap.add( IcoSizeEnum.SIZE_36, 44 );
			heightConfigMap.add( IcoSizeEnum.SIZE_40, 48 );
			heightConfigMap.add( IcoSizeEnum.SIZE_46, 56 );
			heightConfigMap.add( IcoSizeEnum.SIZE_60, 70 );
		}
		
		/**
		 * 设置奖励
		 * @param data 奖励数据
		 * 
		 */		
		public function setPrize( data:PrizeInfo ):void
		{
			clearn();
			
			if( data == null )
				return;
			
			var mGrid:IconCDFace;
			addIndex = 0
			var value:int;
			var rate:Number;
			var normalExpRate:Number;
			
			if ( data.moneyAmount.getAmountByType( AmountType.EXP ) > 0 )
			{
				if( data is TouJingPrizeInfo || data is MiXinPrizeInfo )
				{
					if( data is TouJingPrizeInfo )
					{
						Info = data as TouJingPrizeInfo;
						//灰色经书的时候，拿白色经书的经验【 没接任务的时候，日常任务面板显示基础经验奖励 】
						if( TouJingManager.touJingData != null && TouJingManager.touJingData.isTouSuccess && TouJingManager.curJingShuQuality != EmQuality.QUALITY_GRAY )
						{
							normalExpRate = Info.normalExpMulitple[ TouJingManager.curJingShuQuality ];
							rate = Number( normalExpRate.toFixed(1) );
						}
						else
						{
							rate = 0;
						}
					}
					
					if( data is MiXinPrizeInfo )
					{
						Info = data as MiXinPrizeInfo;
						//经验奖励 EXP 鸡毛信
						if( MiXinManager.mixinTask != null && MiXinManager.mixinTask.isSubmit )
						{
							normalExpRate = Info.normalExpMulitple[ MiXinManager.mixinTask.quality ];
							rate = Number( normalExpRate.toFixed(1) );
						}
						else
						{
							rate = 0;
						}
					}
					value = ( data.moneyAmount.getAmountByType( AmountType.EXP ) / 2 ) + ( data.moneyAmount.getAmountByType( AmountType.EXP ) / 2 ) * rate;
				}
				else
				{
					value = data.moneyAmount.getAmountByType( AmountType.EXP );
				}
				//经验
				mGrid = getGrid();
				setUnItemGrid(mGrid, AmountType.EXP, value );
				addIndex ++;
			}
			if ( data.moneyAmount.getAmountByType( AmountType.MONEY ) > 0 )
			{
				//银两
				mGrid = getGrid();
				setUnItemGrid(mGrid, AmountType.MONEY, data.moneyAmount.getAmountByType( AmountType.MONEY ) );
				addIndex++;
			}
			if (data.moneyAmount.getAmountByType( AmountType.BAND_JINZI ) > 0)
			{
				//元宝
				mGrid = getGrid();
				setUnItemGrid(mGrid, AmountType.BAND_JINZI, data.moneyAmount.getAmountByType( AmountType.BAND_JINZI ) );
				addIndex++;
			}
			
			//物品
			var itemList:Vector.<ItemInfo> = data.itemInfoList;
			var len:int = (itemList == null) ? 0 : itemList.length;
			for (var i:int = 0; i < len; i++) 
			{
				mGrid = getGrid();
				FaceUtil.SetItemGrid( mGrid, itemList[i] );
				addIndex++;
			}
			
			len = gridList.length;
			for (i = 0; i < len; i++)
			{
				mGrid = gridList[i];
				if(i < addIndex)
				{
					mGrid.visible = true;
				}
				else
				{
					mGrid.visible = false;
					mGrid.y = 0;
				}
				
				if( gridRow != -1 )
				{
					mGrid.x = (i % gridRow) * (mGrid.width + gridDis);
					mGrid.y = Math.floor(i / gridRow) * mGrid.height;
				}
				else
				{
					mGrid.x = (mGrid.width + gridDis )* i;
					mGrid.y = 0;
				}
				
			}
		}
		
		/**
		 * 设置非物品的奖励格子效果
		 * @param grid 格子
		 * @param type 格子类型
		 * @param num 指定类型的值
		 * 
		 */		
		private function setUnItemGrid( grid:IconCDFace, type:int, num:int ):void
		{
			grid.visible = true;
			
			var itemInfo:ItemInfo = FaceUtil.getUnItemInfo( type, num );
			FaceUtil.SetUnItemGrid( grid, itemInfo, type );
		}
		
		/**
		 * 得到一个格子
		 * @return 
		 * 
		 */		
		private function getGrid():IconCDFace
		{
			if( addIndex >= gridList.length )
			{
				var grid:IconCDFace = new IconCDFace( gridSize );
				switch( gridSize )
				{
					case IcoSizeEnum.SIZE_40:
						grid.setBg( GridBGType.CHORTCUT_2 );
						grid.setIconPoint(0,0);
						break;
					case IcoSizeEnum.SIZE_46:
						grid.setBg( GridBGType.GRID_SIZE_46 );
						grid.setIconPoint(0,0);
						break;
					case IcoSizeEnum.SIZE_50:
						grid.setBg( GridBGType.GRID_SIZE_46_2 );
						grid.setIconPoint(-2,-2);
						break;
					case IcoSizeEnum.SIZE_60:
						grid.setBg( GridBGType.GRID_SIZE_60 );
						grid.setIconPoint(0,0);
						break;
					default:
						break;
				}
				gridList.push( grid );
				addChild( grid );
				return grid;
			}
			return gridList[ addIndex ];
		}
		
		/**
		 * 清空格子 
		 * 
		 */		
		public function clearn():void 
		{
			var grid:IconCDFace;
			for each(grid in gridList)
			{
				grid.clear();
			}
			addIndex = 0;
		}
		
		/**
		 * 飞图标到背包上
		 * 
		 */		
		public function flyIco():void
		{
			for( var i:int = gridList.length -1; i >= 0; i--)
			{
				if( gridList[i].visible )
				{
					FaceUtil.flyIcoToBackPack( gridList[i] );
				}
			}
		}
		
		/**
		 * 真实高度    格子是正方形的，所以宽高都是一样的
		 * @return 
		 * 
		 */		
		public function getRealHeight():int
		{
			var gridHeight:int = heightConfigMap.getValue( gridSize );
			var count:int = 0;
			var len:int = gridList.length;
			for ( var i:int = 0; i < len; i++ )
			{
				if( gridList[i].visible )
					count ++;
			}
			
			if( gridRow == -1 || count <= 0 )
				return heightConfigMap.getValue( gridSize );
			
			return Math.ceil( count / gridRow ) * gridHeight;
		}
	}
}