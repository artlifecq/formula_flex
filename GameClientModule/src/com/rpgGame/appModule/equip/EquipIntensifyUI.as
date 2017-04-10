package com.rpgGame.appModule.equip
{
	import com.rpgGame.app.manager.goods.ItemManager;
	import com.rpgGame.app.manager.goods.RoleEquipmentManager;
	import com.rpgGame.app.view.icon.DragDropItem;
	import com.rpgGame.appModule.common.GoodsContainerPanel;
	import com.rpgGame.appModule.common.itemRender.GridItemRender;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.cfg.item.ItemContainerID;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.info.item.GridInfo;
	import com.rpgGame.coreData.info.item.ItemUtil;
	import com.rpgGame.coreData.lang.LangUI;
	import com.rpgGame.coreData.type.item.GridBGType;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	
	import app.message.GoodsType;
	
	import feathers.controls.renderers.DefaultListItemRenderer;
	import feathers.controls.renderers.IListItemRenderer;
	import feathers.data.ListCollection;
	
	import org.mokylin.skin.app.zhuangbei.Zhuangbei_left;
	import org.mokylin.skin.app.zhuangbei.qianghua.TitileHead;
	import org.mokylin.skin.app.zhuangbei.qianghua.Zhuangbei_QianghuaSkin;
	
	import starling.events.Event;
	
	/**
	 *装备强化
	 *@author dik
	 *2017-4-6下午4:01:59
	 */
	public class EquipIntensifyUI extends SkinUI
	{
		private const MIN_GRID:int=28;
		private var _skin:Zhuangbei_QianghuaSkin;
		private var _leftSkin:Zhuangbei_left;
		
		private var _goodsContainerTarget:GoodsContainerPanel;
		private var _goodsContainerUse:GoodsContainerPanel;
		private var _goodsContainerUse1:GoodsContainerPanel;
		private var _intensifyItem:DragDropItem;//强化道具
		private var selectedUse:Vector.<ClientItemInfo>;
		
		private var upEquips:Vector.<ClientItemInfo>;//升级数据
		private var useEquips:Vector.<ClientItemInfo>;//消耗数据

		private var intensifyItemInfo:ClientItemInfo;
		
		private var _strenValue:int;
		
		private var lvDatas:Array;
		private var qualityDatas:Array;
		
		public function EquipIntensifyUI()
		{
			_skin=new Zhuangbei_QianghuaSkin();
			super(_skin);
			initView();			
		}
		
		private function initView():void
		{
			_leftSkin=_skin.left.skin as Zhuangbei_left;
			
			(_leftSkin.title1.skin as TitileHead).labelDisplay.text=LanguageConfig.getText(LangUI.UI_TEXT1);
			(_leftSkin.title2.skin as TitileHead).labelDisplay.text=LanguageConfig.getText(LangUI.UI_TEXT2);
			
			_goodsContainerTarget=new GoodsContainerPanel(_leftSkin.list1,ItemContainerID.INTENSIFY_LIST,createItemRender);
			_goodsContainerUse=new GoodsContainerPanel(_leftSkin.list2,ItemContainerID.INTENSIFY_USE,createItemRender);
			_goodsContainerUse1=new GoodsContainerPanel(_skin.use_list,ItemContainerID.INTENSIFY_USE1,createItemRender1);
			
			_intensifyItem=new DragDropItem(64,0);
			_intensifyItem.setBg(GridBGType.GRID_SIZE_64);
//			_intensifyItem.setQualityImageIconPoint(8,8);
			_intensifyItem.x=615;
			_intensifyItem.y=130;
			_intensifyItem.onTouchEndCallBack=onCancelIntensify;
			_intensifyItem.dragAble = true;
			_intensifyItem.checkDrag=checkDrag;
			_skin.container.addChild(_intensifyItem);
			
			_goodsContainerUse1.setGridsCount(6,false);
			selectedUse=new Vector.<ClientItemInfo>();
			
			lvDatas=new Array();
			for(var i:int=1;i<11;i++){
				lvDatas.push(ItemUtil.getLevele(i));
			}
			_skin.cmb_dengjie.dataProvider=new ListCollection(lvDatas);
			_skin.cmb_dengjie.selectedIndex=0;
			qualityDatas=new Array();
			for(i=0;i<5;i++){
				qualityDatas.push(ItemUtil.getQualityName(i));
			}
			_skin.cmb_pinzhi.dataProvider=new ListCollection(qualityDatas);
			_skin.cmb_pinzhi.selectedIndex=0;
			
			_skin.cmb_dengjie.addEventListener(Event.COMPLETE,onComplete);
		}
		
		private function onComplete():void
		{
			trace("complete");			
		}
		
		private function onCancelIntensify(grid:DragDropItem ):void
		{
			if(intensifyItemInfo){
				upEquips.push(intensifyItemInfo);
				if(isUse(intensifyItemInfo)){//是消耗品
					useEquips.push(intensifyItemInfo);
				}
				intensifyItemInfo=null;
			}
			_intensifyItem.setGridEmpty();
			_goodsContainerTarget.refleshGridsByDatas(upEquips);
			updateView();
			
			//删除放置的所有消耗
			var datas:Array=_goodsContainerUse1.dataProvider.data as Array;
			for each(var info:GridInfo in datas){
				if(info.data){
					var item:ClientItemInfo=info.data as ClientItemInfo;
					deleteItems(selectedUse,item);
					useEquips.push(item);
				}
			}
			
			_goodsContainerUse1.refleshGridsByDatas(selectedUse);
			_goodsContainerUse.refleshGridsByDatas(useEquips);
		}
		
		private function createItemRender1():GridItemRender
		{
			var render:GridItemRender = new GridItemRender(IcoSizeEnum.ICON_48,GridBGType.GRID_SIZE_48);
			var grid:DragDropItem = render.getGrid();
			grid.onTouchEndCallBack = onTouchGrid;
			grid.checkDrag=checkDrag;
			grid.setIconPoint(5,5);
			return render;
		}
		
		private function createItemRender():GridItemRender
		{
			var render:GridItemRender = new GridItemRender(IcoSizeEnum.ICON_42,GridBGType.GRID_SIZE_44);
			var grid:DragDropItem = render.getGrid();
			grid.onTouchEndCallBack = onTouchGrid;
			grid.checkDrag=checkDrag;
//			grid.dragAble=false;
		/*	grid.doubleClickFun = onDoubleClick;
			grid.rightMouseClickFun = onRightMouse;
			grid.onTouchEndCallBack = onTouchGrid;
			grid.checkDrag=checkDrag;*/
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
				addIntensifyItem(gridInfo);
			}else if(gridInfo.containerID==ItemContainerID.INTENSIFY_USE){
				addIntensifyUseItem(gridInfo);
			}else if(gridInfo.containerID==ItemContainerID.INTENSIFY_USE1){
				cancelIntensifyUseItem(gridInfo);
			}
		}
		
		private function cancelIntensifyUseItem(gridInfo:GridInfo):void
		{
			var item:ClientItemInfo=gridInfo.data as ClientItemInfo;
			if(!item){
				return;
			}
			deleteItems(selectedUse,item);
			_goodsContainerUse1.refleshGridsByDatas(selectedUse);
			useEquips.push(item);
			_goodsContainerUse.refleshGridsByDatas(useEquips);
			_strenValue-=item.qItem.q_strengthen_num;
		}
		
		/**
		 *添加强化消耗物 
		 * 
		 */
		private function addIntensifyUseItem(gridInfo:GridInfo):void
		{
			if(!intensifyItemInfo){//没选强化准备
				return;
			}
			var item:ClientItemInfo=gridInfo.data as ClientItemInfo;
			selectedUse.push(item);
			_goodsContainerUse1.refleshGridsByDatas(selectedUse);
			deleteItems(useEquips,item);
			_goodsContainerUse.refleshGridsByDatas(useEquips);
			_strenValue+=item.qItem.q_strengthen_num;
		}
		
		/**
		 *添加强化物 
		 * 
		 */
		private function addIntensifyItem(gridInfo:GridInfo):void
		{
			_intensifyItem.gridInfo=gridInfo;
			if(intensifyItemInfo){
				upEquips.push(intensifyItemInfo);
			}
			intensifyItemInfo=gridInfo.data as ClientItemInfo;
			deleteItems(upEquips,intensifyItemInfo);
			_goodsContainerTarget.refleshGridsByDatas(upEquips);
			
			//从消耗物里删除掉
			deleteItems(useEquips,intensifyItemInfo);
			_goodsContainerUse.refleshGridsByDatas(useEquips);
			updateView();
		}
		
		private function deleteItems(arr:Vector.<ClientItemInfo>,item:ClientItemInfo):void
		{
			var index:int=arr.indexOf(item);
			if(index!=-1){
				arr.splice(index,1);
			}
		}
		
		public function show():void
		{
			ItemManager.getBackEquip(initItem);
			initEvent();
			updateView();
		}
		
		private function updateView():void
		{
			if(intensifyItemInfo){
				_skin.equip_name.color=ItemConfig.getItemQualityColor(intensifyItemInfo.cfgId);
				_skin.equip_name.text=intensifyItemInfo.name;
				_skin.lb_dengji.htmlText="最大强化等级:"+1+"/"+intensifyItemInfo.qItem.q_max_strengthen;
			}else{
				_skin.lb_dengji.htmlText="请选择要强化的装备!";
				_leftSkin.lb_yinzi.htmlText="0";
				_skin.equip_name.text="";
			}
		}
		
		private function initEvent():void
		{
			_leftSkin.tab_pack.addEventListener(Event.CHANGE, onTab);
		}
		
		private function getEquipByType(type:int,datas:Vector.<ClientItemInfo>):Vector.<ClientItemInfo>
		{
			if(type==-1){
				return datas;
			}
			var result:Vector.<ClientItemInfo>=new Vector.<ClientItemInfo>();
			for each(var item:ClientItemInfo in datas){
				if(item.type==type){
					result.push(item);
				}
			}
			return result;
		}
		
		private function onTab(e:Event):void
		{
			var type:int=-1;
			switch(_leftSkin.tab_pack.selectedIndex){
				case 1:
					type=GoodsType.EQUIPMENT;
					break;
				case 2:
					type=GoodsType.EQUIPMENT1;
					break;
				case 3:
					type=GoodsType.EQUIPMENT2;
					break;
			}
			var result:Vector.<ClientItemInfo>=getEquipByType(type,upEquips);
			_goodsContainerTarget.refleshGridsByDatas(result);
			result=getEquipByType(type,useEquips);
			_goodsContainerUse.refleshGridsByDatas(result);
		}
		
		public function hide():void
		{
			
		}
		
		private function initItem():void
		{
			var allEquips:Array=ItemManager.getAllEquipDatas();
			var num:int=allEquips.length;
			
			upEquips=getUpEquips(allEquips);
			num=upEquips.length;
			num=num>MIN_GRID?num:MIN_GRID;
			_goodsContainerTarget.setGridsCount(num,false);
			_goodsContainerTarget.refleshGridsByDatas(upEquips);
			
			
			useEquips=getUseEquips(allEquips);
			num=useEquips.length;
			num=num>MIN_GRID?num:MIN_GRID;
			_goodsContainerUse.setGridsCount(num,false);
			_goodsContainerUse.refleshGridsByDatas(useEquips);
		}
		
		/**
		 *可强化的装备
		 * @return 
		 * 
		 */
		private function getUpEquips(datas:Array):Vector.<ClientItemInfo>
		{
			var num:int=datas.length;
			var result:Vector.<ClientItemInfo>=new Vector.<ClientItemInfo>();
			for(var i:int=0;i<num;i++){
				var info:ClientItemInfo=datas[i];
				if(isStren(info)){//可强化的
					result.push(info);
				}
			}
			return result;
		}
		
		/**
		 *可消耗的装备
		 * @return 
		 * 
		 */
		private function getUseEquips(datas:Array):Vector.<ClientItemInfo>
		{
			var num:int=datas.length;
			var result:Vector.<ClientItemInfo>=new Vector.<ClientItemInfo>();
			for(var i:int=0;i<num;i++){
				if(isUse(datas[i])){
					result.push(datas[i]);
				}
			}
			return result;
		}
		
		private function isStren(info:ClientItemInfo):Boolean
		{
			if(info.qItem.q_max_strengthen!=0){//可强化的
				return true;
			}
			return false;
		}
		
		private function isUse(info:ClientItemInfo):Boolean
		{
			if(info.qItem.q_strengthen_num!=0&&RoleEquipmentManager.equipIsWearing(info)==false){//消耗获得的值不为0
				return true;
			}
			return false;
		}
	}
}