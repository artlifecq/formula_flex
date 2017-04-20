package com.rpgGame.appModule.equip
{
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.goods.ItemManager;
	import com.rpgGame.app.manager.goods.RoleEquipmentManager;
	import com.rpgGame.app.manager.pop.UIPopManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.sender.ItemSender;
	import com.rpgGame.app.ui.alert.GameAlert;
	import com.rpgGame.app.ui.common.CenterEftPop;
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.utils.TouchableUtil;
	import com.rpgGame.app.view.icon.DragDropItem;
	import com.rpgGame.appModule.common.GoodsContainerPanel;
	import com.rpgGame.appModule.common.ViewUI;
	import com.rpgGame.appModule.common.itemRender.GridItemRender;
	import com.rpgGame.appModule.common.itemRender.SkinItem;
	import com.rpgGame.appModule.common.itemRender.SkinItemRender;
	import com.rpgGame.core.events.ItemEvent;
	import com.rpgGame.core.events.MainPlayerEvent;
	import com.rpgGame.core.ui.AwdProgressBar;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.cfg.NotifyCfgData;
	import com.rpgGame.coreData.cfg.item.EquipPolishCfg;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.cfg.item.ItemContainerID;
	import com.rpgGame.coreData.clientConfig.Q_equip_polish;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.alert.AlertSetInfo;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.info.item.EquipInfo;
	import com.rpgGame.coreData.info.item.GridInfo;
	import com.rpgGame.coreData.info.item.ItemUtil;
	import com.rpgGame.coreData.lang.LangSpell;
	import com.rpgGame.coreData.lang.LangUI;
	import com.rpgGame.coreData.type.CharAttributeType;
	import com.rpgGame.coreData.type.item.GridBGType;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	import com.rpgGame.netData.equip.message.ResEquipOperateResultMessage;
	
	import flash.geom.Point;
	
	import app.message.EquipOperateType;
	import app.message.GoodsType;
	
	import feathers.controls.List;
	import feathers.controls.Scroller;
	import feathers.data.ListCollection;
	
	import gs.TweenMax;
	import gs.easing.Expo;
	
	import org.client.mainCore.manager.EventManager;
	import org.game.netCore.data.long;
	import org.mokylin.skin.app.zhuangbei.Zhuangbei_left;
	import org.mokylin.skin.app.zhuangbei.qianghua.ListItem_Skin;
	import org.mokylin.skin.app.zhuangbei.qianghua.TitileHead;
	import org.mokylin.skin.app.zhuangbei.zuomo.Zuomo_Skin;
	
	import starling.display.DisplayObject;
	import starling.events.Event;
	
	/**
	 *装备琢磨
	 *@author dik
	 *2017-4-11下午5:55:11
	 */
	public class EquipPolishUI extends ViewUI
	{
		private const MIN_GRID:int=28;
		private var _skin:Zuomo_Skin;
		private var _leftSkin:Zhuangbei_left;
		
		private var _goodsContainerTarget:GoodsContainerPanel;
		private var _goodsContainerUse:GoodsContainerPanel;
		
		private var lvDatas:Array;
		private var qualityDatas:Array;
		
		private var targetEquips:Vector.<ClientItemInfo>;//目标数据
		private var useEquips:Vector.<ClientItemInfo>;//消耗数据
		private var selectedUse:Vector.<ClientItemInfo>;//被选的消耗品
		
		private var _targetEquip:DragDropItem;//目标道具
		private var targetEquipInfo:EquipInfo;//目标信息
		
		private var _useEquipGrids:Vector.<DragDropItem>;
		private var tweenEquip:TweenMax;
		private var addExp:int;
		private var canUpNum:int;
		private var upCfg:Q_equip_polish;
		private var allExp:int;
		private var currentExp:int;
		private var useMon:int;
		private var userMon:Number;
		private var perMon:int=20;

		private var currCfg:Q_equip_polish;
		private var useListIds:Vector.<long>;
		private var isToUp:Boolean;
		private var _progressBar:AwdProgressBar;
		private var isLockRefresh:Boolean;
		
		public function EquipPolishUI()
		{
			_skin=new Zuomo_Skin();
			
			super(_skin);
			initView();
		}
		
		private function initView():void
		{
			useListIds=new Vector.<long>();
			_leftSkin=_skin.left.skin as Zhuangbei_left;
			
			(_leftSkin.title1.skin as TitileHead).labelDisplay.text=LanguageConfig.getText(LangUI.UI_TEXT9);
			(_leftSkin.title2.skin as TitileHead).labelDisplay.text=LanguageConfig.getText(LangUI.UI_TEXT2);
			
			_progressBar=new AwdProgressBar(_skin.progressBar,"ui_zuomotiao");
			_skin.grp_jiacheng.addChild(_progressBar);
			_skin.grp_jiacheng.addChild(_skin.lb_pro);
			_goodsContainerTarget=new GoodsContainerPanel(_leftSkin.list1,ItemContainerID.POLIST_LIST,createItemRender);
			_goodsContainerUse=new GoodsContainerPanel(_leftSkin.list2,ItemContainerID.POLIST_USE,createItemRender);
			selectedUse=new Vector.<ClientItemInfo>();
			lvDatas=new Array();
			for(var i:int=1;i<11;i++){
				lvDatas.push(ItemUtil.getLevele(i));
			}
			_skin.cmb_dengjie.addEventListener("creationComplete",onCreate);
			
			qualityDatas=new Array();
			for(i=1;i<4;i++){
				qualityDatas.push(ItemUtil.getQualityName(i)+LanguageConfig.getText(LangUI.UI_TEXT5));
			}
			_skin.cmb_pinzhi.addEventListener("creationComplete",onCreatePinZhi);
			
			_useEquipGrids=new Vector.<DragDropItem>();
			for(i=0;i<6;i++){
				_useEquipGrids.push(new DragDropItem(48,i));
				_useEquipGrids[i].gridInfo=new GridInfo(ItemContainerID.POLIST_USE,i);
				_skin.use_grp.addChild(_useEquipGrids[i]);
				_useEquipGrids[i].onTouchEndCallBack=onCancelUse;
				_useEquipGrids[i].x=_skin["use"+i].x;
				_useEquipGrids[i].y=_skin["use"+i].y;
				_useEquipGrids[i].dragAble = true;
			}
			
			_targetEquip=new DragDropItem(64,0);
			_targetEquip.onTouchEndCallBack=onCancelTarget;
			_targetEquip.dragAble = true;
			_targetEquip.checkDrag=checkDrag;
			_skin.container.addChild(_targetEquip);
		}
		
		private function onCancelUse(grid:DragDropItem):void
		{
			var gridInfo:GridInfo=grid.gridInfo;
			var itemInfo:ClientItemInfo=gridInfo.data as ClientItemInfo;
			if(!itemInfo){
				return;
			}
			
			deleteItems(selectedUse,itemInfo);
			refreshUseEquipGrid();
			
			var targetGrid:DragDropItem;
			targetGrid=_goodsContainerUse.getDragDropItemByItemInfo(itemInfo);
			TouchableUtil.ungray(targetGrid);
			
			if(isPolish(itemInfo as EquipInfo)){
				targetGrid=_goodsContainerTarget.getDragDropItemByItemInfo(itemInfo);
				TouchableUtil.ungray(targetGrid);
			}
			
			addExp-=itemInfo.qItem.q_polish_num;
			updateView();
		}
		
		private function deleteItems(arr:Vector.<ClientItemInfo>,item:ClientItemInfo):void
		{
			var index:int=arr.indexOf(item);
			if(index!=-1){
				arr.splice(index,1);
			}
		}
		
		
		private function onCancelTarget(grid:DragDropItem ):void
		{
			var targetGrid:DragDropItem;
			if(targetEquipInfo){
				targetGrid=_goodsContainerTarget.getDragDropItemByItemInfo(targetEquipInfo);
				TouchableUtil.ungray(targetGrid);
				if(isUse(targetEquipInfo)){//是消耗品
					targetGrid=_goodsContainerUse.getDragDropItemByItemInfo(targetEquipInfo);
					TouchableUtil.ungray(targetGrid);
				}
				targetEquipInfo=null;
			}
			
			_targetEquip.setGridEmpty();
			updateView();
			cancelAllUse();
		}
		
		private function onCreate(e:Event):void
		{
			_skin.cmb_dengjie.removeEventListener("creationComplete",onCreate);
			var list:List=_skin.cmb_dengjie.getList();
			list.itemRendererFactory = createComBoxRender1;
			list.clipContent = true;
			list.scrollBarDisplayMode = "fixed";
			list.verticalScrollBarPosition = "right";
			list.horizontalScrollPolicy = Scroller.SCROLL_POLICY_OFF;
			list.verticalScrollPolicy = Scroller.SCROLL_POLICY_ON;
			list.padding=2;
			_skin.cmb_dengjie.dataProvider=new ListCollection(lvDatas);
			_skin.cmb_dengjie.selectedIndex=0;
		}
		
		private function onCreatePinZhi(e:Event):void
		{
			_skin.cmb_pinzhi.removeEventListener("creationComplete",onCreatePinZhi);
			_skin.cmb_pinzhi.dataProvider=new ListCollection(qualityDatas);
			_skin.cmb_pinzhi.selectedIndex=0;
			var list:List=_skin.cmb_pinzhi.getList();
			list.itemRendererFactory = createComBoxRender2;
			list.clipContent = true;
			list.scrollBarDisplayMode = "fixed";
			list.verticalScrollBarPosition = "right";
			list.horizontalScrollPolicy = Scroller.SCROLL_POLICY_OFF;
			list.verticalScrollPolicy = Scroller.SCROLL_POLICY_ON;
			list.padding=2;
			
			_skin.cmb_pinzhi.dataProvider=new ListCollection(qualityDatas);
			_skin.cmb_pinzhi.selectedIndex=0;
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
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			switch(target){
				case _skin.btn_zuomo:
					toPolish();
					break;
				case _skin.btn_zuomo_all:
					oneKeyPolish();
					break;
			}
		}
		
		private function toPolish():void
		{
			useListIds.length=0;
			for(var i:int=0;i<selectedUse.length;i++){
				useListIds.push(selectedUse[i].itemInfo.itemId);
			}
			if(!targetEquipInfo){
				NoticeManager.textNotify(NoticeManager.MOUSE_FOLLOW_TIP, NotifyCfgData.getNotifyTextByID(6012));
				return;
			}
			
			if(selectedUse.length==0){
				NoticeManager.textNotify(NoticeManager.MOUSE_FOLLOW_TIP, NotifyCfgData.getNotifyTextByID(6013));
				return;
			}
			
			if(userMon<useMon){
				NoticeManager.textNotify(NoticeManager.MOUSE_FOLLOW_TIP, NotifyCfgData.getNotifyTextByID(6014));
				return;
			}
			
			var p:Point=new Point(this._skin.btn_zuomo.x+this._skin.btn_zuomo.width/2,this._skin.btn_zuomo.y+this._skin.btn_zuomo.height/2);
			p=this._skin.btn_zuomo_all.parent.localToGlobal(p);
			p=this._skin.container.globalToLocal(p);
			this.playInter3DAt(ClientConfig.getEffect("ui_tongyongdianji"),p.x,p.y,1,null,addComplete);
			
			
			var type:int=RoleEquipmentManager.equipIsWearing(targetEquipInfo)?0:1;
			ItemSender.polishEquip(targetEquipInfo.itemInfo.itemId,type,useListIds,EquipOperateType.POLISH_NORMAL);
		}
		
		private function oneKeyPolish():void
		{
			cancelAllUse();
			if(!targetEquipInfo){
				NoticeManager.textNotify(NoticeManager.MOUSE_FOLLOW_TIP, NotifyCfgData.getNotifyTextByID(6016));
				return;
			}
			
			var lv:int=_skin.cmb_dengjie.selectedIndex+1;
			var quality:int=_skin.cmb_pinzhi.selectedIndex+1;
			var result:Vector.<ClientItemInfo>=new Vector.<ClientItemInfo>();
			var datas:Array=_goodsContainerUse.dataProvider.data as Array;
			var item:ClientItemInfo;
			for each(var info:GridInfo in datas){
				if(info.data){
					item=info.data as ClientItemInfo;
					if(item.qItem.q_levelnum<=lv&&item.quality<=quality&&item!=targetEquipInfo&&item["polishLevel"]==0&&item["polishExp"]==0){//符合阶数和品质筛选
						result.push(item);
					}
				}
			}
			result.sort(ItemManager.onSortUseEquip);
			
			addExp=0;
			useListIds.length=0;
			isToUp=false;
			userMon=MainRoleManager.actorInfo.totalStat.getResData(CharAttributeType.RES_BIND_MONEY)+ MainRoleManager.actorInfo.totalStat.getResData(CharAttributeType.RES_MONEY);
			for(var i:int=0;i<result.length;i++){
				item=result[i];
				addExp+=item.qItem.q_strengthen_num;
				useMon=addExp*perMon;
				if(userMon<useMon){//钱不够
					addExp-=item.qItem.q_strengthen_num;
					break;
				}
				if(addExp>EquipPolishCfg.maxCfg.q_exp){//到顶级了
					isToUp=true;
					break;
				}
				useListIds.push(item.itemInfo.itemId);
			}
			
			if(useListIds.length==0){
				NoticeManager.textNotify(NoticeManager.MOUSE_FOLLOW_TIP, NotifyCfgData.getNotifyTextByID(4205));
				return;
			}
			
			useMon=addExp*perMon;
			if(userMon<useMon||i==0){
				NoticeManager.textNotify(NoticeManager.MOUSE_FOLLOW_TIP, NotifyCfgData.getNotifyTextByID(6014));
				return;
			}
			
			
			var p:Point=new Point(this._skin.btn_zuomo_all.x+this._skin.btn_zuomo_all.width/2,this._skin.btn_zuomo_all.y+this._skin.btn_zuomo_all.height/2);
			p=this._skin.btn_zuomo_all.parent.localToGlobal(p);
			p=this._skin.container.globalToLocal(p);
			this.playInter3DAt(ClientConfig.getEffect("ui_tongyongdianji"),p.x,p.y,1,null,addComplete);
			var type:int=RoleEquipmentManager.equipIsWearing(targetEquipInfo)?0:1;
			isLockRefresh=true;
			ItemSender.polishEquip(targetEquipInfo.itemInfo.itemId,type,useListIds,EquipOperateType.POLISH_ONEKEY);
		}
		
		private function addComplete(render:RenderUnit3D):void
		{
			render.play(0);
		}
		
		private function onTouchGrid( grid:DragDropItem ):void
		{
			var gridInfo:GridInfo=grid.gridInfo;
			if(gridInfo.data==null){
				return;
			}
			if(gridInfo.containerID==ItemContainerID.POLIST_LIST){
				addTargetItem(gridInfo);
			}else if(gridInfo.containerID==ItemContainerID.POLIST_USE){
				addUseItem(gridInfo);
			}
		}
		
		private function addUseItem(gridInfo:GridInfo):void
		{
			if(!targetEquipInfo){//没选强化准备
				NoticeManager.textNotify(NoticeManager.MOUSE_FOLLOW_TIP, NotifyCfgData.getNotifyTextByID(6012));
				return;
			}
			if(selectedUse.length==6){
				NoticeManager.textNotify(NoticeManager.MOUSE_FOLLOW_TIP, NotifyCfgData.getNotifyTextByID(4204));
				return;
			}
			
			var itemInfo:ClientItemInfo=gridInfo.data as ClientItemInfo;
			var targetGrid:DragDropItem;
			targetGrid=_goodsContainerUse.getDragDropItemByItemInfo(itemInfo);
			TouchableUtil.gray(targetGrid);
			
			if(isPolish(itemInfo as EquipInfo)){
				targetGrid=_goodsContainerTarget.getDragDropItemByItemInfo(itemInfo);
				TouchableUtil.gray(targetGrid);
			}
			selectedUse.push(itemInfo);
			refreshUseEquipGrid();
			addExp+=itemInfo.qItem.q_polish_num;
			updateView();
		}
		
		private function refreshUseEquipGrid():void
		{
			for(var i:int=0;i<6;i++){
				if(i<selectedUse.length){
					_useEquipGrids[i].gridInfo.data=selectedUse[i];
					FaceUtil.setGridData(_useEquipGrids[i], selectedUse[i],  _useEquipGrids[i].gridInfo.isTips);
				}else{
					_useEquipGrids[i].setGridEmpty();
				}
			}
		}
		
		private function addTargetItem(gridInfo:GridInfo):void
		{
			var targetGrid:DragDropItem;
			if(targetEquipInfo){
				targetGrid=_goodsContainerTarget.getDragDropItemByItemInfo(targetEquipInfo);
				TouchableUtil.ungray(targetGrid);
				if(isUse(targetEquipInfo)){
					targetGrid=_goodsContainerUse.getDragDropItemByItemInfo(targetEquipInfo);
					TouchableUtil.ungray(targetGrid);
				}
			}
			
			cancelAllUse();
			
			_targetEquip.gridInfo=gridInfo;
			
			targetEquipInfo=gridInfo.data as EquipInfo;
			targetGrid=_goodsContainerTarget.getDragDropItemByItemInfo(targetEquipInfo);
			TouchableUtil.gray(targetGrid);
			var p:Point=new Point(targetGrid.x,targetGrid.y);
			p=targetGrid.parent.localToGlobal(p);
			p=_targetEquip.parent.globalToLocal(p);
			_targetEquip.x=p.x;
			_targetEquip.y=p.y;
			if(tweenEquip){
				tweenEquip.kill();
			}
			tweenEquip=TweenMax.to(_targetEquip,1,{x:607,y:175,ease:Expo.easeOut});
			
			if(isUse(targetEquipInfo)){
				targetGrid=_goodsContainerUse.getDragDropItemByItemInfo(targetEquipInfo);
				TouchableUtil.gray(targetGrid);
			}
			
			addExp=0;
			
			var roleLv:int=MainRoleManager.actorInfo.totalStat.level;
			var index:int=Math.floor(roleLv/10);
			index=index>10?10:index;
			index=index-2;
			index=index<0?0:index;
			_skin.cmb_dengjie.selectedIndex=index;
			
			updateView();
		}
		
		private function updateView():void
		{
			if(targetEquipInfo){
				currCfg=EquipPolishCfg.getPolishCfg(targetEquipInfo.polishLevel);
				_skin.lb_name.color=ItemConfig.getItemQualityColor(targetEquipInfo.cfgId);
				_skin.lb_name.text=targetEquipInfo.name;
				_skin.lb_dengji.htmlText=LanguageConfig.getText(LangUI.UI_TEXT10)+":"+targetEquipInfo.polishLevel+LanguageConfig.getText(LangUI.UI_TEXT7);
				getUpLv();
				_skin.lb_current.text=targetEquipInfo.polishLevel+LanguageConfig.getText(LangUI.UI_TEXT7);
				_skin.lb_next.text=upCfg.q_equip_polish+LanguageConfig.getText(LangUI.UI_TEXT7);
				
				_progressBar.maximum=allExp;
				_progressBar.value=currentExp;
				_skin.lb_pro.text=currentExp+"/"+allExp;
				useMon=addExp*perMon;
				userMon=MainRoleManager.actorInfo.totalStat.getResData(CharAttributeType.RES_BIND_MONEY)+ MainRoleManager.actorInfo.totalStat.getResData(CharAttributeType.RES_MONEY);
				_leftSkin.lb_yinzi.htmlText=getTitleText(LanguageConfig.getText(LangUI.UI_TEXT4),useMon,userMon);
				
				if(canUpNum!=0){//能升级
					updateAttShow(currCfg,upCfg);
				}else{
					updateAttShow(currCfg);
				}				
			}else{
				_skin.lb_current.text=_skin.lb_next.text="";
				_skin.lb_name.text="";
				_skin.lb_dengji.text="";
				_skin.lb_pro.text=_skin.lb_baifenbi.text="";
				_progressBar.value=0;
				_skin.arrow_up2.visible=_skin.lb_up2.visible=false;
				_leftSkin.lb_yinzi.text=getTitleText(LanguageConfig.getText(LangUI.UI_TEXT4),0);
			}
		}
		
		private function updateAttShow(current:Q_equip_polish,up:Q_equip_polish=null):void
		{
			var current_promote:int;
			if(!current){
				current_promote=0;
			}else{
				current_promote=current.q_promote;
			}
			_skin.lb_baifenbi.text=(current_promote/100).toFixed(1)+"%";
			if(up){
				_skin.arrow_up2.visible=_skin.lb_up2.visible=true;
				_skin.arrow_up2.visible=true;
				_skin.lb_up2.text=((up.q_promote-current_promote)/100).toFixed(1)+"%";
			}else{
				_skin.arrow_up2.visible=_skin.lb_up2.visible=false;
			}
			
			_skin.lb_baifenbi.width=_skin.lb_baifenbi.textWidth+15;
			_skin.lb_baifenbi.width=_skin.lb_baifenbi.width<36?36:_skin.lb_baifenbi.width;
			_skin.arrow_up2.x=_skin.lb_baifenbi.x+_skin.lb_baifenbi.width+5;
			_skin.lb_up2.x=_skin.arrow_up2.x+_skin.arrow_up2.width+10;
		}
		
		private function getTitleText(title:String,value:*,value1:int=-1,noSlip:Boolean=true):String
		{
			var wu:String=LanguageConfig.getText(LangSpell.SPELL_PANEL_TEXT12);
			if(value is int){
				if(value==0){
					value=wu;
					return title+":"+value;
				}
			}
			var des:String="";
			if(value<=value1){
				des=noSlip?HtmlTextUtil.getTextColor(0x55BD15,value):HtmlTextUtil.getTextColor(0x55BD15,value+"/"+value1);//绿色
			}else{
				des=noSlip?HtmlTextUtil.getTextColor(0xd02525,value):HtmlTextUtil.getTextColor(0xd02525,value+"/"+value1);//红色
			}
			return title+":"+des;
		}
		
		private function getUpLv():void
		{
			var maxLv:int=EquipPolishCfg.maxLv;
			var exp:int=targetEquipInfo.polishExp+addExp;//总值+消耗后获得的值
			var currentLv:int=targetEquipInfo.polishLevel;
			var upExp:int;
			var nextCfg:Q_equip_polish;
			canUpNum=0;
			while(currentLv<=maxLv){
				currentLv++;
				upCfg=nextCfg;
				nextCfg=EquipPolishCfg.getPolishCfg(currentLv);//下一级的配置
				upExp=nextCfg.q_exp;//升级所需
				
				if(exp<=upExp){//不够升级不查找
					break;
				}
				canUpNum++;
			}
			
			if(!upCfg){
				upCfg=nextCfg;
			}
			
			if(currCfg){
				allExp=upCfg.q_exp-currCfg.q_exp;
				currentExp=exp-currCfg.q_exp;
			}else{
				allExp=upCfg.q_exp;
				currentExp=exp;
			}
		}
		
		private function cancelAllUse():void
		{
			for each(var grid:DragDropItem in _useEquipGrids){
				var item:ClientItemInfo=grid.gridInfo?grid.gridInfo.data as ClientItemInfo:null;
				if(item){
					var gridA:DragDropItem=_goodsContainerTarget.getDragDropItemByItemInfo(item);
					if(grid){
						TouchableUtil.ungray(gridA);
					}
					gridA=_goodsContainerUse.getDragDropItemByItemInfo(item);
					TouchableUtil.ungray(gridA);
				}
				grid.setGridEmpty();
			}
			selectedUse.length=0;
			refreshUseEquipGrid();
		}
		
		override public function show():void
		{
			initEvent();
			refresh();
		}
		
		override public function refresh():void
		{
			ItemManager.getBackEquip(initItem);
		}
		
		private function initEvent():void
		{
			_leftSkin.tab_pack.addEventListener(Event.CHANGE, onTab);
			EventManager.addEvent(ItemEvent.ITEM_POLISH_MSG,getPolishMsg);
			
			EventManager.addEvent(ItemEvent.ITEM_ADD,onFreshItems);
			EventManager.addEvent(ItemEvent.ITEM_REMOVE,onFreshItems);
			EventManager.addEvent(ItemEvent.ITEM_CHANG,onFreshItems);
			EventManager.addEvent(MainPlayerEvent.STAT_RES_CHANGE,updateAmount);//金钱变化
		}
		
		
		override public function hide():void
		{
			cancelAllUse();
			if(targetEquipInfo){
				var targetGrid:DragDropItem=_goodsContainerTarget.getDragDropItemByItemInfo(targetEquipInfo);
				TouchableUtil.ungray(targetGrid);
				if(isUse(targetEquipInfo)){//是消耗品
					targetGrid=_goodsContainerUse.getDragDropItemByItemInfo(targetEquipInfo);
					TouchableUtil.ungray(targetGrid);
				}
				targetEquipInfo=null;
			}
			
			_targetEquip.setGridEmpty();
			
			_leftSkin.tab_pack.removeEventListener(Event.CHANGE, onTab);
			EventManager.removeEvent(ItemEvent.ITEM_POLISH_MSG,getPolishMsg);
			
			EventManager.removeEvent(ItemEvent.ITEM_ADD,onFreshItems);
			EventManager.removeEvent(ItemEvent.ITEM_REMOVE,onFreshItems);
			EventManager.removeEvent(ItemEvent.ITEM_CHANG,onFreshItems);
			EventManager.removeEvent(MainPlayerEvent.STAT_RES_CHANGE,updateAmount);//金钱变化
		}
		
		private function updateAmount(type:int=3):void
		{
			if(type!=CharAttributeType.RES_MONEY&&type!=CharAttributeType.RES_BIND_MONEY){
				return;
			}
			
			if(useListIds.length!=0){//如果是有一键值得 暂时不更新
				return;
			}
			
			updateView();
		}
		
		private function onFreshItems(info:ClientItemInfo=null):void
		{
			if(isLockRefresh){
				return;
			}
				
			if((info.containerID==ItemContainerID.Role||info.containerID==ItemContainerID.BackPack)&&(info.type==GoodsType.EQUIPMENT||info.type==GoodsType.EQUIPMENT1||info.type==GoodsType.EQUIPMENT2)){
				ItemManager.getBackEquip(initItem);
			}
		}
		
		private function getPolishMsg(msg:ResEquipOperateResultMessage):void
		{
			if(msg.opaque==EquipOperateType.POLISH_ONEKEY&&msg.result==1){
				var alertOk:AlertSetInfo=new AlertSetInfo(LangUI.UI_TEXT11);//强化成功
				alertOk.alertInfo.value=alertOk.alertInfo.value.replace("$",addExp);
				alertOk.alertInfo.value=alertOk.alertInfo.value.replace("$",useListIds.length);
				alertOk.alertInfo.value=alertOk.alertInfo.value.replace("$",addExp*perMon);
				alertOk.alertInfo.align="left";
				if(isToUp){
					alertOk.alertInfo.value=LanguageConfig.getText(LangUI.UI_TEXT12)+alertOk.alertInfo.value;
					alertOk.alertInfo.value=alertOk.alertInfo.value.replace("$",addExp);
					alertOk.alertInfo.value=alertOk.alertInfo.value.replace("$",useListIds.length);
					alertOk.alertInfo.value=alertOk.alertInfo.value.replace("$",addExp*perMon);
				}
				GameAlert.showAlert(alertOk);
			}
			if(msg.result==1){
				UIPopManager.showAlonePopUI(CenterEftPop,"ui_qianghuachenggong");
			}
			addExp=0;
			isToUp=false;
			isLockRefresh=false;
			refresh();
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
			var result:Vector.<ClientItemInfo>=getEquipByType(type,targetEquips);
			_goodsContainerTarget.refleshGridsByDatas(result);
			
			var targetGrid:DragDropItem;
			for each(var info:ClientItemInfo in result){
				targetGrid=_goodsContainerTarget.getDragDropItemByItemInfo(info);
				if(!targetGrid){
					continue;
				}
				if(info==targetEquipInfo){
					TouchableUtil.gray(targetGrid);
				}else{
					TouchableUtil.ungray(targetGrid);
				}
			}
			
			result=getEquipByType(type,useEquips);
			
			for each(var info1:ClientItemInfo in result){
				targetGrid=_goodsContainerTarget.getDragDropItemByItemInfo(info1);
				if(!targetGrid){
					continue;
				}
				if(selectedUse.indexOf(info1)!=-1){
					TouchableUtil.gray(targetGrid);
				}else{
					TouchableUtil.ungray(targetGrid);
				}
			}
			_goodsContainerUse.refleshGridsByDatas(result);
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
		
		private function initItem():void
		{
			var allEquips:Array=ItemManager.getAllEquipDatas();
			var num:int=allEquips.length;
			targetEquips=getPolishEquips(allEquips);
			num=targetEquips.length;
			num=num>MIN_GRID?num:MIN_GRID;
			_goodsContainerTarget.setGridsCount(num,false);
			_goodsContainerTarget.refleshGridsByDatas(targetEquips);
			
			useEquips=getUseEquips(allEquips);
			num=num>MIN_GRID?num:MIN_GRID;
			_goodsContainerUse.setGridsCount(num,false);
			_goodsContainerUse.refleshGridsByDatas(useEquips);
		
			selectedUse.length=0;
			refreshUseEquipGrid();
			
			updateAll();
		}
		
		private function updateAll():void
		{
			var targetGrid:DragDropItem;
			for each(targetGrid in _goodsContainerTarget.dndGrids){
				TouchableUtil.ungray(targetGrid);
			}
			
			for each( targetGrid in _goodsContainerUse.dndGrids){
				TouchableUtil.ungray(targetGrid);
			}
			
			if(targetEquipInfo){
				targetGrid=_goodsContainerTarget.getDragDropItemByItemInfo(targetEquipInfo);
				TouchableUtil.gray(targetGrid);
				if(isUse(targetEquipInfo)){
					targetGrid=_goodsContainerUse.getDragDropItemByItemInfo(targetEquipInfo);
					TouchableUtil.gray(targetGrid);
				}
			}
			updateView();
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
				var info:ClientItemInfo=datas[i];
				if(isUse(info)){//可消耗并且不在被选中消耗表里
					result.push(info);
				}
			}
			return result;
		}
		
		private function isUse(info:ClientItemInfo):Boolean
		{
			var equip:EquipInfo=info as EquipInfo;
			if(equip.qItem.q_polish_num!=0&&RoleEquipmentManager.equipIsWearing(equip)==false){//消耗获得的值不为0
				return true;
			}
			return false;
		}
		
		/**
		 *获取琢磨列表 
		 * @param allEquips
		 * @return 
		 * 
		 */
		private function getPolishEquips(datas:Array):Vector.<ClientItemInfo>
		{
			var num:int=datas.length;
			var result:Vector.<ClientItemInfo>=new Vector.<ClientItemInfo>();
			for(var i:int=0;i<num;i++){
				var info:ClientItemInfo=datas[i];
				if(isPolish(info as EquipInfo)){
					if(targetEquipInfo&&info.itemInfo.itemId.ToGID()==targetEquipInfo.itemInfo.itemId.ToGID()){
						targetEquipInfo=info as EquipInfo;//更新掉
						_targetEquip.gridInfo.data=targetEquipInfo;
						_targetEquip.gridInfo=_targetEquip.gridInfo;//只能这样调用更新才能触发更新tips函数。。。
					}
					result.push(info);
				}else{
					if(targetEquipInfo&&info.itemInfo.itemId.ToGID()==targetEquipInfo.itemInfo.itemId.ToGID()){//不可琢磨的 但是在琢磨位置
						targetEquipInfo=null;
						_targetEquip.gridInfo.data=targetEquipInfo;
						_targetEquip.setGridEmpty();
					}
				}
			}
			return result;
		}
		
		private function isPolish(info:EquipInfo):Boolean
		{
			return true;//目前全部都可以琢磨
		}
	}
}