package com.rpgGame.appModule.activety.jixiantiaozhan
{
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.view.icon.DragDropItem;
	import com.rpgGame.appModule.common.itemRender.GridItemRender;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.cfg.active.JiXianAcInfo;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.info.item.GridInfo;
	import com.rpgGame.coreData.type.item.GridBGType;
	
	import org.mokylin.skin.app.activety.jixiantiaozhan.TiaoZhanPaiHang_Item;
	
	public class JiXianTiaoZhanPaiHangItem extends SkinUI
	{
		private var _skin:TiaoZhanPaiHang_Item;
		private var _render:GridItemRender;
		private var _grids:Vector.<DragDropItem>=new Vector.<DragDropItem>();
		
		public function JiXianTiaoZhanPaiHangItem()
		{
			_skin=new TiaoZhanPaiHang_Item();
			super(_skin);
			_render = new GridItemRender(IcoSizeEnum.ICON_48,GridBGType.GRID_SIZE_48);
		}
		
		public function setdate(info:JiXianAcInfo):void
		{
			var initX:int=_skin.ico1.x;
			var initY:int=_skin.ico1.y;
			if(info.nowRank-info.upRank==1){
				_skin.num.label = info.nowRank.toString();
				_skin.gRank.x = 137;
			}
			else
			{
				_skin.num.label = info.upRank.toString()+"-"+info.nowRank.toString();
				_skin.gRank.x = 176;
			}
			if(info.reWard is Array)
			{
				for(var i:int=0;i<info.reWard.length;i++)
				{
					var item:DragDropItem=_render.getGrid();
					var clientItemInfo:ClientItemInfo=new ClientItemInfo(info.reWard[i].mod);	
					clientItemInfo.count=info.reWard[i].num;
					item.gridInfo = new GridInfo(0,i);
					item.x = initX;
					item.y = initY;
					FaceUtil.SetItemGrid(item, clientItemInfo);
					_grids.push(item);
					_skin.container.addChild(item);
					initX+=item.width;
				}
			}
			else
			{
				item=_render.getGrid();
				clientItemInfo=new ClientItemInfo(info.reWard.mod);	
				clientItemInfo.count=info.reWard.num;
				item.gridInfo = new GridInfo(0,0);
				item.x = initX;
				item.y = initY;
				FaceUtil.SetItemGrid(item, clientItemInfo);
				_grids.push(item);
				_skin.container.addChild(item);
			}
		}
		
		public function clear():void
		{
			if(_grids!=null&&_grids.length>0)
			{
				for(var i:int=0;i<_grids.length;i++)
				{
					_skin.container.removeChild(_grids[i]);
				}
				_grids.length=0;
			}
		}
	}
}