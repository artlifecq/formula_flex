package com.rpgGame.appModule.equip
{
	import com.game.engine3D.display.Inter3DContainer;
	import com.game.engine3D.display.InterObject3D;
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
	import com.rpgGame.app.view.icon.DragDropItem;
	import com.rpgGame.appModule.common.GoodsContainerPanel;
	import com.rpgGame.appModule.common.ViewUI;
	import com.rpgGame.appModule.common.itemRender.GridItemRender;
	import com.rpgGame.appModule.common.itemRender.SkinItem;
	import com.rpgGame.appModule.common.itemRender.SkinItemRender;
	import com.rpgGame.core.events.ItemEvent;
	import com.rpgGame.core.events.MainPlayerEvent;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.core.ui.AwdProgressBar;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.cfg.NotifyCfgData;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.cfg.TipsCfgData;
	import com.rpgGame.coreData.cfg.item.EquipPolishCfg;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.cfg.item.ItemContainerID;
	import com.rpgGame.coreData.clientConfig.Q_equip_polish;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.alert.AlertSetInfo;
	import com.rpgGame.coreData.info.face.IBaseFaceInfo;
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

		private var eftCon:Inter3DContainer;
		private var zuomoEft:InterObject3D;
		
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
			
			eftCon=new Inter3DContainer();
			zuomoEft=eftCon.playInter3DAt(ClientConfig.getEffect("ui_zhuomo"),-45,10,0);
			this._skin.grp_cilun.addChild(eftCon);
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
			
			_goodsContainerUse.setGrayForData(itemInfo,false);
			
			if(isPolish(itemInfo as EquipInfo)){
				_goodsContainerTarget.setGrayForData(itemInfo,false);
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
				_goodsContainerTarget.setGrayForData(targetEquipInfo,false);
				if(isUse(targetEquipInfo)){//是消耗品
					_goodsContainerUse.setGrayForData(targetEquipInfo,false);
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
			isLockRefresh=true;
			ItemSender.polishEquip(targetEquipInfo.itemInfo.itemId,type,useListIds,EquipOperateType.POLISH_NORMAL);
		}
		
		private function oneKeyPolish():void
		{
			cancelAllUse();
			updateView();
			if(!targetEquipInfo){
				NoticeManager.textNotify(NoticeManager.MOUSE_FOLLOW_TIP, NotifyCfgData.getNotifyTextByID(6012));
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
				useListIds.push(item.itemInfo.itemId);
				if(addExp>EquipPolishCfg.maxCfg.q_exp){//到顶级了
					isToUp=true;
					break;
				}
			}
			
			useMon=addExp*perMon;
			if(userMon<useMon||(addExp==0&&result.length!=0)){
				NoticeManager.textNotify(NoticeManager.MOUSE_FOLLOW_TIP, NotifyCfgData.getNotifyTextByID(6014));
				return;
			}
			
			if(useListIds.length==0){
				NoticeManager.textNotify(NoticeManager.MOUSE_FOLLOW_TIP, NotifyCfgData.getNotifyTextByID(4205));
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
			if(gridInfo.data==null||grid.isGary){
				return;
			}
			if(gridInfo.containerID==ItemContainerID.POLIST_LIST){
				addTargetItem(grid);
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
				NoticeManager.textNotify(NoticeManager.MOUSE_FOLLOW_TIP, NotifyCfgData.getNotifyTextByID(6016));
				return;
			}
			
			var itemInfo:ClientItemInfo=gridInfo.data as ClientItemInfo;
			_goodsContainerUse.setGrayForData(itemInfo,true);
			
			if(isPolish(itemInfo as EquipInfo)){
				_goodsContainerTarget.setGrayForData(itemInfo,true);
			}
			useListIds.length=0;
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
		
		private function addTargetItem(targetGrid:DragDropItem):void
		{
			var gridInfo:GridInfo=targetGrid.gridInfo;
			if(targetEquipInfo){
				_goodsContainerTarget.setGrayForData(targetEquipInfo,false);
				if(isUse(targetEquipInfo)){
					_goodsContainerUse.setGrayForData(targetEquipInfo,false);
				}
			}
			
			cancelAllUse();
			
			_targetEquip.gridInfo=gridInfo;
			
			targetEquipInfo=gridInfo.data as EquipInfo;
			_goodsContainerTarget.setGrayForData(targetEquipInfo,true);
			var p:Point=new Point(targetGrid.x,targetGrid.y);
			p=targetGrid.parent.localToGlobal(p);
			p=_targetEquip.parent.globalToLocal(p);
			_targetEquip.x=p.x;
			_targetEquip.y=p.y;
			if(tweenEquip){
				tweenEquip.kill();
			}
			tweenEquip=TweenMax.to(_targetEquip,1,{x:612,y:177,ease:Expo.easeOut});
			
			if(isUse(targetEquipInfo)){
				_goodsContainerUse.setGrayForData(targetEquipInfo,true);
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
			
			_goodsContainerTarget.dataProvider.updateAll();
			_goodsContainerUse.dataProvider.updateAll();
		}
		
		private function updateAttShow(current:Q_equip_polish,up:Q_equip_polish=null):void
		{
			var current_promote:int;
			if(!current){
				current_promote=0;
			}else{
				current_promote=current.q_promote;
			}
			_skin.lb_baifenbi.text=Number((current_promote/100).toFixed(1))+"%";
			if(up){
				_skin.arrow_up2.visible=_skin.lb_up2.visible=true;
				_skin.arrow_up2.visible=true;
				_skin.lb_up2.text=Number(((up.q_promote-current_promote)/100).toFixed(1))+"%";
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
				des=noSlip?HtmlTextUtil.getTextColor(StaticValue.UI_GREEN1,value):HtmlTextUtil.getTextColor(StaticValue.UI_GREEN1,value+"/"+value1);//绿色
			}else{
				des=noSlip?HtmlTextUtil.getTextColor(StaticValue.UI_RED1,value):HtmlTextUtil.getTextColor(StaticValue.UI_RED1,value+"/"+value1);//红色
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
				
				if(exp<upExp){//不够升级不查找
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
					addExp-=item.qItem.q_polish_num;
					
					var info:GridInfo=getGridInfo(_goodsContainerTarget.dataProvider,grid.gridInfo.data);
					if(info){
						info.isGray=false;
					}
					info=getGridInfo(_goodsContainerUse.dataProvider,grid.gridInfo.data);
					if(info){
						info.isGray=false;
					}
				}
				grid.setGridEmpty();
			}
			selectedUse.length=0;
			if(addExp<0){
				addExp=0;
			}
			refreshUseEquipGrid();
		}
		
		private function getGridInfo(list:ListCollection,item:IBaseFaceInfo):GridInfo
		{
			var datas:Array=list.data as Array;
			for each(var info:GridInfo in datas){
				if(info.data==item){
					return info
				}
			}
			return null;
		}
		
		override public function show(data:Object=null):void
		{
			initEvent();
			refresh();
			zuomoEft.start();
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
			EventManager.addEvent(ItemEvent.ITEM_REMOVE_LIST,onRemoveFreshItems);
			EventManager.addEvent(ItemEvent.ITEM_CHANG,onFreshItems);
			EventManager.addEvent(ItemEvent.UNWEAR_EQUIPITEM,onFreshItems);
			
			EventManager.addEvent(MainPlayerEvent.STAT_RES_CHANGE,updateAmount);//金钱变化
			TipTargetManager.show( _skin.btn_shuoming,TargetTipsMaker.makeSimpleTextTips( TipsCfgData.getTipsInfo(25).q_describe));
		}
		
		private function onRemoveFreshItems(list:Vector.<ClientItemInfo>):void
		{
			if(isLockRefresh){
				return;
			}
			ItemManager.getBackEquip(initItem);
		}
		
		
		override public function hide():void
		{
			zuomoEft.stop();
			cancelAllUse();
			if(targetEquipInfo){
				_goodsContainerTarget.setGrayForData(targetEquipInfo,false);
				if(isUse(targetEquipInfo)){//是消耗品
					_goodsContainerUse.setGrayForData(targetEquipInfo,false);
				}
				targetEquipInfo=null;
			}
			
			_targetEquip.setGridEmpty();
			
			_leftSkin.tab_pack.removeEventListener(Event.CHANGE, onTab);
			EventManager.removeEvent(ItemEvent.ITEM_POLISH_MSG,getPolishMsg);
			
			EventManager.removeEvent(ItemEvent.ITEM_ADD,onFreshItems);
			EventManager.removeEvent(ItemEvent.ITEM_REMOVE_LIST,onRemoveFreshItems);
			EventManager.removeEvent(ItemEvent.ITEM_CHANG,onFreshItems);
			EventManager.removeEvent(ItemEvent.UNWEAR_EQUIPITEM,onFreshItems);
			EventManager.removeEvent(MainPlayerEvent.STAT_RES_CHANGE,updateAmount);//金钱变化
			TipTargetManager.remove( _skin.btn_shuoming);
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
				UIPopManager.showAlonePopUI(CenterEftPop,"ui_zhuomochenggong");
			}
			addExp=0;
			isToUp=false;
			isLockRefresh=false;
			useListIds.length=0;
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
			targetEquips.sort(onSortPolishEquip);
			num=targetEquips.length;
			num=num>MIN_GRID?num:MIN_GRID;
			_goodsContainerTarget.setGridsCount(num,false);
			_goodsContainerTarget.refleshGridsByDatas(targetEquips);
			
			useEquips=getUseEquips(allEquips);
			useEquips.sort(sortForUse);
			num=num>MIN_GRID?num:MIN_GRID;
			_goodsContainerUse.setGridsCount(num,false);
			_goodsContainerUse.refleshGridsByDatas(useEquips);
		
			selectedUse.length=0;
			refreshUseEquipGrid();
			
			updateAll();
		}
		
		private function sortForUse(equipA:EquipInfo, equipB:EquipInfo):int
		{
			if(equipA.qItem.q_levelnum==equipB.qItem.q_levelnum){//阶数相同
				if(equipA.qItem.q_default==equipB.qItem.q_default){//品质相同
					if(equipA.polishLevel==equipB.polishLevel){//强化等级相同
						if(isleftKind(equipA.qItem.q_kind,equipB.qItem.q_kind)){//根据部件排序
							return -1;
						}else{
							if(equipA.qItem.q_kind==equipB.qItem.q_kind){
								return 0;
							}else{
								return 1;
							}
						}
					}else{
						if(equipA.polishLevel==equipB.polishLevel){
							if(equipA.polishExp==equipB.polishExp){
								return 0;
							}
							if(equipA.polishExp<equipB.polishExp){
								return -1;
							}else{
								return 1;
							}
						}
						
						if(equipA.polishLevel<equipB.polishLevel){
							return -1;
						}else{
							return 1;
						}
					}
				}else{
					if(equipA.qItem.q_default==equipB.qItem.q_default){
						return 0;
					}
					if(equipA.qItem.q_default<equipB.qItem.q_default){
						return -1;
					}else{
						return 1;
					}
				}
			}else{
				if(equipA.qItem.q_levelnum==equipB.qItem.q_levelnum){
					return 0;
				}
				if(equipA.qItem.q_levelnum<equipB.qItem.q_levelnum){
					return -1;
				}else{
					return 1;
				}
			}
			return 0;
		}
		
		/**
		 *排序提升装备 
		 * @return 
		 * 
		 */
		private  function onSortPolishEquip(equipA : EquipInfo, equipB : EquipInfo):int
		{
			if(RoleEquipmentManager.equipIsWearing(equipA)){//穿着的
				if(!RoleEquipmentManager.equipIsWearing(equipB)){
					return -1;
				}else{//都是穿着的
					return sortForLevelNum(equipA,equipB);
				}
			}else{
				if(RoleEquipmentManager.equipIsWearing(equipB)){
					return 1;
				}else{
					return sortForLevelNum(equipA,equipB);
				}
			}
			return 0;
		}
		
		private function isleftKind(kindA:int,kindB:int):Boolean
		{
			var kindList:Array=[0,1,4,5,2,3,6,7,8,9];
			if(kindList.indexOf(kindA)<kindList.indexOf(kindB)){
				return true;
			}
			return false;
		}
		
		private function sortForLevelNum(equipA:EquipInfo, equipB:EquipInfo):int
		{
			if(equipA.qItem.q_levelnum==equipB.qItem.q_levelnum){//阶数相同
				if(equipA.qItem.q_default==equipB.qItem.q_default){//品质相同
					if(equipA.polishLevel==equipB.polishLevel){//强化等级相同
						if(isleftKind(equipA.qItem.q_kind,equipB.qItem.q_kind)){//根据部件排序
							return -1;
						}else{
							if(equipA.qItem.q_kind==equipB.qItem.q_kind){
								return 0;
							}else{
								return 1;
							}
						}
					}else{
						if(equipA.polishLevel==equipB.polishLevel){
							return 0;
						}
						
						if(equipA.polishLevel>equipB.polishLevel){
							return -1;
						}else{
							return 1;
						}
					}
				}else{
					if(equipA.qItem.q_default==equipB.qItem.q_default){
						return 0;
					}
					if(equipA.qItem.q_default>equipB.qItem.q_default){
						return -1;
					}else{
						return 1;
					}
				}
			}else{
				if(equipA.qItem.q_levelnum==equipB.qItem.q_levelnum){
					return 0;
				}
				if(equipA.qItem.q_levelnum>equipB.qItem.q_levelnum){
					return -1;
				}else{
					return 1;
				}
			}
			return 0;
		}
		
		private function updateAll():void
		{
			var num:int=_goodsContainerTarget.dataProvider.length;
			var info:GridInfo;
			var i:int;
			for(i=0;i<num;i++){
				info=_goodsContainerTarget.dataProvider.getItemAt(i) as  GridInfo;
				if(info){
					info.isGray=false;
				}
			}
			num=_goodsContainerUse.dataProvider.length;
			
			for(i=0;i<num;i++){
				info=_goodsContainerUse.dataProvider.getItemAt(i) as  GridInfo;
				if(info){
					info.isGray=false;
				}
			}
			
			if(targetEquipInfo){
				_goodsContainerTarget.setGrayForData(targetEquipInfo,true);
				if(isUse(targetEquipInfo)){
					_goodsContainerUse.setGrayForData(targetEquipInfo,true);
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
			var job:int=MainRoleManager.actorInfo.job;
			if(info.qItem.q_job==job){
				return true;
			}
			return false;
		}
	}
}