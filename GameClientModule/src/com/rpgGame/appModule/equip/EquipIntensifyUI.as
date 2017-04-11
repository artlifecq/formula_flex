package com.rpgGame.appModule.equip
{
	import com.rpgGame.app.manager.goods.ItemManager;
	import com.rpgGame.app.manager.goods.RoleEquipmentManager;
	import com.rpgGame.app.view.icon.DragDropItem;
	import com.rpgGame.appModule.common.GoodsContainerPanel;
	import com.rpgGame.appModule.common.itemRender.GridItemRender;
	import com.rpgGame.appModule.common.itemRender.SkinItem;
	import com.rpgGame.appModule.common.itemRender.SkinItemRender;
	import com.rpgGame.core.events.ItemEvent;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.cfg.AttValueConfig;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.cfg.item.ItemContainerID;
	import com.rpgGame.coreData.cfg.item.ItemStrength;
	import com.rpgGame.coreData.clientConfig.Q_att_values;
	import com.rpgGame.coreData.clientConfig.Q_equip_strength;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.info.item.EquipInfo;
	import com.rpgGame.coreData.info.item.GridInfo;
	import com.rpgGame.coreData.info.item.ItemUtil;
	import com.rpgGame.coreData.lang.LangUI;
	import com.rpgGame.coreData.type.CharAttributeType;
	import com.rpgGame.coreData.type.item.GridBGType;
	import com.rpgGame.netData.equip.message.ResEquipOperateResultMessage;
	
	import flash.geom.Point;
	
	import app.message.GoodsType;
	
	import feathers.controls.ComboBox;
	import feathers.controls.List;
	import feathers.controls.Scroller;
	import feathers.controls.SkinnableContainer;
	import feathers.data.ListCollection;
	
	import org.client.mainCore.ds.HashMap;
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.zhuangbei.Zhuangbei_left;
	import org.mokylin.skin.app.zhuangbei.qianghua.ListItem_Skin;
	import org.mokylin.skin.app.zhuangbei.qianghua.Shuxing2_Skin;
	import org.mokylin.skin.app.zhuangbei.qianghua.TitileHead;
	import org.mokylin.skin.app.zhuangbei.qianghua.Zhuangbei_QianghuaSkin;
	
	import starling.core.Starling;
	import starling.display.DisplayObject;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	
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

		private var intensifyItemInfo:EquipInfo;
		
		private var _strenValue:int;
		
		private var lvDatas:Array;
		private var qualityDatas:Array;

		private var currCfg:Q_equip_strength;

		private var nextCfg:Q_equip_strength;
		private var needExp:int;//升级所需要的经验值
		private var currentCom:ComboBox;
		
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
			_skin.cmb_dengjie.addEventListener("creationComplete",onCreate);
			
			qualityDatas=new Array();
			for(i=0;i<5;i++){
				qualityDatas.push(ItemUtil.getQualityName(i));
			}
			_skin.cmb_pinzhi.addEventListener("creationComplete",onCreatePinZhi);
		}
		
		private function onCreatePinZhi(e:Event):void
		{
			_skin.cmb_pinzhi.removeEventListener("creationComplete",onCreatePinZhi);
			_skin.cmb_pinzhi.dataProvider=new ListCollection(qualityDatas);
			_skin.cmb_pinzhi.selectedIndex=0;
			currentCom=_skin.cmb_pinzhi;
			var list:List=currentCom.getList();
			list.itemRendererFactory = createComBoxRender2;
			list.clipContent = true;
			list.scrollBarDisplayMode = "fixed";
			list.verticalScrollBarPosition = "right";
			list.horizontalScrollPolicy = Scroller.SCROLL_POLICY_OFF;
			list.verticalScrollPolicy = Scroller.SCROLL_POLICY_ON;
			list.padding=2;
			
			currentCom.dataProvider=new ListCollection(qualityDatas);
			currentCom.selectedIndex=0;
		}
		
		private function onCreate(e:Event):void
		{
			_skin.cmb_dengjie.removeEventListener("creationComplete",onCreate);
			currentCom=_skin.cmb_dengjie;
			var list:List=currentCom.getList();
			list.itemRendererFactory = createComBoxRender1;
			list.clipContent = true;
			list.scrollBarDisplayMode = "fixed";
			list.verticalScrollBarPosition = "right";
			list.horizontalScrollPolicy = Scroller.SCROLL_POLICY_OFF;
			list.verticalScrollPolicy = Scroller.SCROLL_POLICY_ON;
			list.padding=2;
			currentCom.dataProvider=new ListCollection(lvDatas);
			currentCom.selectedIndex=0;
		}
		
		private function createComBoxRender1():SkinItemRender
		{
			var skin:ListItem_Skin=new ListItem_Skin();
			var skinItem:SkinItem=new SkinItem(_skin.cmb_dengjie,skin);
			var render:SkinItemRender=new SkinItemRender(skinItem);
			return render;
		}
		
		private function createComBoxRender2():SkinItemRender
		{
			var skin:ListItem_Skin=new ListItem_Skin();
			var skinItem:SkinItem=new SkinItem(_skin.cmb_pinzhi,skin);
			var render:SkinItemRender=new SkinItemRender(skinItem);
			return render;
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
			cancelAllUse();
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
			
			if(_strenValue>=needExp){//只有能升级时才显示对比
				updateAttShow(currCfg.q_att_type,nextCfg.q_att_type);
			}else{
				updateAttShow(currCfg.q_att_type);
			}
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
			intensifyItemInfo=gridInfo.data as EquipInfo;
			
			currCfg=ItemStrength.getStrengthCfg(intensifyItemInfo.qItem.q_kind,intensifyItemInfo.qItem.q_job,intensifyItemInfo.strengthLevel);
			nextCfg=ItemStrength.getStrengthCfg(intensifyItemInfo.qItem.q_kind,intensifyItemInfo.qItem.q_job,intensifyItemInfo.strengthLevel+1);
			needExp=currCfg.q_exp-intensifyItemInfo.strengthExp;
			
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
				_skin.lb_current.text=intensifyItemInfo.strengthLevel+"级";
				_skin.lb_up.text=(intensifyItemInfo.strengthLevel+1)+"级";
				var currentExp:int=intensifyItemInfo.strengthExp;
				for each (var equip:EquipInfo in selectedUse) 
				{
					currentExp+=equip.qItem.q_strengthen_num;
				}
				_skin.lb_pro.text=currentExp+"/"+currCfg.q_exp;
				updateAttShow(currCfg.q_att_type);
			}else{
				_skin.lb_dengji.htmlText="请选择要强化的装备!";
				_leftSkin.lb_yinzi.htmlText="0";
				_skin.equip_name.text="";
				for(var i:int=0;i<4;i++){
					var labelUp:SkinnableContainer=_skin["up"+i];
					labelUp.visible=false;
				}
				_skin.lb_pro.text="";
				_skin.progressBar.value=0;
			}
		}
		
		private function updateAttShow(type1:int, type2:int=-1):void
		{
			var attValues1:Q_att_values=AttValueConfig.getAttInfoById(type1);
			var maps1:HashMap=AttValueConfig.getTypeValueMap(attValues1);
			var keys:Array=maps1.keys();
			var values1:Array=maps1.getValues();
			
			var attValues2:Q_att_values;
			var maps2:HashMap;
			var values2:Array;
			if(type2!=-1){
				attValues2=AttValueConfig.getAttInfoById(type2);
				maps2=AttValueConfig.getTypeValueMap(attValues2);
				values2=maps2.getValues();
			}
			
			for(var i:int=0;i<4;i++){
				var labelUp:SkinnableContainer=_skin["up"+i];
				var labelUpSkin:Shuxing2_Skin=_skin["up"+i].skin as Shuxing2_Skin;
				if(i<values1.length){
					labelUpSkin.lb_name.text=CharAttributeType.getCNName(keys[i])+":";
					labelUpSkin.arrow_up.visible=labelUpSkin.lb_up.visible=true;
					if(values2){
						labelUpSkin.lb_num.text=values2[i];
						labelUpSkin.lb_up.text=(values2[i]-values1[i])+"";
					}else{
						labelUpSkin.lb_num.text=values1[i];
						labelUpSkin.arrow_up.visible=labelUpSkin.lb_up.visible=false;
					}
					
					labelUpSkin.lb_num.x=labelUpSkin.lb_name.x+labelUpSkin.lb_name.textWidth;
					labelUpSkin.arrow_up.x=labelUpSkin.lb_num.x+labelUpSkin.lb_num.textWidth;
					labelUpSkin.lb_up.x=labelUpSkin.arrow_up.x+labelUpSkin.arrow_up.width;
				}else{
					labelUp.visible=false;
				}
			}
		}
		
		private function getOneKeyUse():void
		{
			cancelAllUse();
			var lv:int=_skin.cmb_dengjie.selectedIndex+1;
			var quality:int=_skin.cmb_pinzhi.selectedIndex;
			var result:Vector.<ClientItemInfo>=new Vector.<ClientItemInfo>();
			var datas:Array=_goodsContainerUse.dataProvider.data as Array;
			var item:ClientItemInfo;
			for each(var info:GridInfo in datas){
				if(info.data){
					item=info.data as ClientItemInfo;
					if(item.qItem.q_levelnum<=lv&&item.quality<=quality){//符合阶数和品质筛选
						result.push(item);
					}
				}
			}
			result.sort(ItemManager.onSortUseEquip);
			var addExp:int=0;
			var useList:Vector.<ClientItemInfo>=new Vector.<ClientItemInfo>();
			for(var i:int=0;i<6;i++){
				if(i==result.length||addExp>=needExp){
					break;
				}
				item=result[i];
				addExp+=item.qItem.q_strengthen_num;
				useList.push(item);
			}
		}
		
		
		private function cancelAllUse():void
		{
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
		
		private function initEvent():void
		{
			_leftSkin.tab_pack.addEventListener(Event.CHANGE, onTab);
			EventManager.addEvent(ItemEvent.ITEM_STRENGTH_MSG,getStrengthMsg);
		}
		
		private function getStrengthMsg(msg:ResEquipOperateResultMessage):void
		{
			
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
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			switch(target){
				case _skin.btn_qianghua_all:
					break;
				case _skin.btn_qianhua:
					break;
			}
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