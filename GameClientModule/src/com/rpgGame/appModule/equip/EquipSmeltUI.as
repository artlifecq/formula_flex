package com.rpgGame.appModule.equip
{
	import com.rpgGame.app.manager.goods.ItemManager;
	import com.rpgGame.app.view.icon.DragDropItem;
	import com.rpgGame.appModule.common.GoodsContainerPanel;
	import com.rpgGame.appModule.common.ViewUI;
	import com.rpgGame.appModule.common.itemRender.GridItemRender;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.cfg.item.ItemContainerID;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.item.EquipInfo;
	import com.rpgGame.coreData.info.item.GridInfo;
	import com.rpgGame.coreData.lang.LangUI;
	import com.rpgGame.coreData.type.item.GridBGType;
	
	import feathers.controls.StateSkin;
	
	import org.mokylin.skin.app.zhuangbei.Zhuangbei_left;
	import org.mokylin.skin.app.zhuangbei.qianghua.TitileHead;
	import org.mokylin.skin.app.zhuangbei.xilian.Xilian_Skin;
	
	/**
	 *装备洗练
	 *@author dik
	 *2017-4-11下午7:50:15
	 */
	public class EquipSmeltUI extends ViewUI
	{
		private const MIN_GRID:int=28;
		private var _skin:Xilian_Skin;
		private var _leftSkin:Zhuangbei_left;
		
		private var _goodsContainerTarget:GoodsContainerPanel;
		private var _goodsContainerUse:GoodsContainerPanel;
		
		private var _targetEquip:DragDropItem;//目标道具
		private var targetEquipInfo:EquipInfo;//目标信息
		
		public function EquipSmeltUI(skin:StateSkin=null)
		{
			_skin=new Xilian_Skin();
			super(skin);
			initView();
		}
		
		private function initView():void
		{
			_leftSkin=_skin.left.skin as Zhuangbei_left;
			
			(_leftSkin.title1.skin as TitileHead).labelDisplay.text=LanguageConfig.getText(LangUI.UI_TEXT1);
			(_leftSkin.title2.skin as TitileHead).labelDisplay.text=LanguageConfig.getText(LangUI.UI_TEXT2);
			
			_goodsContainerTarget=new GoodsContainerPanel(_leftSkin.list1,ItemContainerID.INTENSIFY_LIST,createItemRender);
			_goodsContainerUse=new GoodsContainerPanel(_leftSkin.list2,ItemContainerID.INTENSIFY_USE,createItemRender);
		}
		
		private function createItemRender():GridItemRender
		{
			var render:GridItemRender = new GridItemRender(IcoSizeEnum.ICON_42,GridBGType.GRID_SIZE_44);
			var grid:DragDropItem = render.getGrid();
			grid.onTouchEndCallBack = onTouchGrid;
			grid.checkDrag=checkDrag;
			return render;
		}
		
		private function checkDrag():Boolean
		{
			return true;
		}
		
		private function onTouchGrid( grid:DragDropItem ):void
		{
			var gridInfo:GridInfo=grid.gridInfo;
			if(gridInfo.data==null){
				return;
			}
			if(gridInfo.containerID==ItemContainerID.INTENSIFY_LIST){
				//				addIntensifyItem(gridInfo);
			}else if(gridInfo.containerID==ItemContainerID.INTENSIFY_USE){
				//				addIntensifyUseItem(gridInfo);
			}
		}
		
		override public function show():void
		{
			initEvent();
			refresh();
		}
		
		private function initEvent():void
		{
			
		}
		
		override public function refresh():void
		{
			ItemManager.getBackEquip(initItem);
		}
		
		private function initItem():void
		{
			var allEquips:Array=ItemManager.getAllEquipDatas();
			var num:int=allEquips.length;
			
		/*	targetEquips=getPolishEquips(allEquips);
			num=targetEquips.length;
			num=num>MIN_GRID?num:MIN_GRID;
			_goodsContainerTarget.setGridsCount(num,false);
			_goodsContainerTarget.refleshGridsByDatas(targetEquips);
			
			useEquips=getUseEquips(allEquips);
			if(targetEquipInfo){
				for each( var equip:EquipInfo in selectedUse){
					deleteItems(useEquips,equip);
				}
			}else{
				selectedUse.length=0;
			}
			
			num=useEquips.length;
			num=num>MIN_GRID?num:MIN_GRID;
			_goodsContainerUse.setGridsCount(num,false);
			_goodsContainerUse.refleshGridsByDatas(useEquips);
			updateView();*/
		}
	}
}