package com.rpgGame.appModule.equip
{
	import com.gameClient.utils.HashMap;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.goods.ItemManager;
	import com.rpgGame.app.manager.goods.RoleEquipmentManager;
	import com.rpgGame.app.manager.pop.UIPopManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.sender.ItemSender;
	import com.rpgGame.app.ui.alert.GameAlert;
	import com.rpgGame.app.ui.common.CenterEftPop;
	import com.rpgGame.app.ui.tab.ViewUI;
	import com.rpgGame.app.view.icon.DragDropItem;
	import com.rpgGame.appModule.common.GoodsContainerPanel;
	import com.rpgGame.appModule.common.itemRender.GridItemRender;
	import com.rpgGame.appModule.common.itemRender.SkinItem;
	import com.rpgGame.appModule.common.itemRender.SkinItemRender;
	import com.rpgGame.core.events.ItemEvent;
	import com.rpgGame.core.events.MainPlayerEvent;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.core.ui.AwdProgressBar;
	import com.rpgGame.coreData.cfg.AttValueConfig;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.cfg.NotifyCfgData;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.cfg.TipsCfgData;
	import com.rpgGame.coreData.cfg.item.EquipStrengthCfg;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.cfg.item.ItemContainerID;
	import com.rpgGame.coreData.clientConfig.Q_att_values;
	import com.rpgGame.coreData.clientConfig.Q_equip_strength;
	import com.rpgGame.coreData.enum.AlertClickTypeEnum;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.alert.AlertSetInfo;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.info.item.EquipInfo;
	import com.rpgGame.coreData.info.item.GridInfo;
	import com.rpgGame.coreData.info.item.ItemUtil;
	import com.rpgGame.coreData.lang.LangAlertInfo;
	import com.rpgGame.coreData.lang.LangSpell;
	import com.rpgGame.coreData.lang.LangUI;
	import com.rpgGame.coreData.type.CharAttributeType;
	import com.rpgGame.coreData.type.item.GridBGType;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	import com.rpgGame.netData.equip.message.ResEquipOperateResultMessage;
	
	import flash.geom.Point;
	
	import app.message.EquipOperateType;
	import app.message.GoodsType;
	
	import away3d.events.Event;
	
	import feathers.controls.List;
	import feathers.controls.Scroller;
	import feathers.controls.SkinnableContainer;
	import feathers.data.ListCollection;
	import feathers.events.FeathersEventType;
	
	import gs.TweenMax;
	import gs.easing.Expo;
	
	import org.client.mainCore.manager.EventManager;
	import org.game.netCore.data.long;
	import org.mokylin.skin.app.zhuangbei.Zhuangbei_left;
	import org.mokylin.skin.app.zhuangbei.qianghua.ListItem_Skin;
	import org.mokylin.skin.app.zhuangbei.qianghua.Shuxing2_Skin;
	import org.mokylin.skin.app.zhuangbei.qianghua.TitileHead;
	import org.mokylin.skin.app.zhuangbei.qianghua.Zhuangbei_QianghuaSkin;
	
	import starling.display.DisplayObject;
	
	/**
	 *装备强化
	 *@author dik
	 *2017-4-6下午4:01:59
	 */
	public class EquipIntensifyUI extends ViewUI
	{
		private const MIN_GRID:int=28;
		private var _skin:Zhuangbei_QianghuaSkin;
		private var _leftSkin:Zhuangbei_left;
		
		private var _goodsContainerTarget:GoodsContainerPanel;
		private var _goodsContainerUse:GoodsContainerPanel;
		private var _goodsContainerUse1:GoodsContainerPanel;
		private var _targetEquip:DragDropItem;//强化道具
		private var selectedUse:Vector.<ClientItemInfo>;
		
		private var targetEquips:Vector.<ClientItemInfo>;//升级数据
		private var useEquips:Vector.<ClientItemInfo>;//消耗数据

		private var targetEquipInfo:EquipInfo;//目标装备
		
		private var addExp:int;
		
		private var lvDatas:Array;
		private var qualityDatas:Array;

		private var currCfg:Q_equip_strength;

		private var useListIds:Vector.<long>;
		private var perMon:int=20;
		private var canUpNum:int;

		private var upCfg:Q_equip_strength;

		private var tween:TweenMax;

		private var tweenEquip:TweenMax;

		private var allExp:int;
		private var currentExp:int;

		private var useMon:int;

		private var userMon:int;
		private var isToUp:Boolean;
		private var _progressBar:AwdProgressBar;
		private var isLockRefresh:Boolean;
		private static var noAlertUse:Boolean;

		private var alertOk:AlertSetInfo;
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
			
			_progressBar=new AwdProgressBar(_skin.progressBar,"ui_zuomotiao");
			_skin.grp_pro.addChild(_progressBar);
			_skin.grp_pro.addChild(_skin.lb_pro);
			
			_goodsContainerTarget=new GoodsContainerPanel(_leftSkin.list1,ItemContainerID.INTENSIFY_LIST,createItemRender);
			_goodsContainerUse=new GoodsContainerPanel(_leftSkin.list2,ItemContainerID.INTENSIFY_USE,createItemRender);
			_goodsContainerUse1=new GoodsContainerPanel(_skin.use_list,ItemContainerID.INTENSIFY_USE1,createItemRender1);
			
			_targetEquip=new DragDropItem(IcoSizeEnum.ICON_64,0);
//			_targetEquip.setBg(GridBGType.GRID_SIZE_64);
//			_intensifyItem.setQualityImageIconPoint(8,8);
			_targetEquip.x=621;
			_targetEquip.y=150;
			_targetEquip.onTouchEndCallBack=onCancelIntensify;
			_targetEquip.dragAble = true;
			_targetEquip.checkDrag=checkDrag;
			_targetEquip.bindBg(null);
			_skin.container.addChild(_targetEquip);
			
			_goodsContainerUse1.setGridsCount(6,false);
			selectedUse=new Vector.<ClientItemInfo>();
			
			lvDatas=new Array();
			for(var i:int=1;i<11;i++){
				lvDatas.push(ItemUtil.getLevele(i));
			}
			_skin.cmb_dengjie.addEventListener(FeathersEventType.CREATION_COMPLETE,onCreate);
			_skin.cmb_dengjie.alpha=0;
			
			
			qualityDatas=new Array();
			for(i=1;i<4;i++){
				qualityDatas.push(ItemUtil.getQualityName(i)+LanguageConfig.getText(LangUI.UI_TEXT5));
			}
			_skin.cmb_pinzhi.addEventListener(FeathersEventType.CREATION_COMPLETE,onCreatePinZhi);
			_skin.cmb_pinzhi.alpha=0;
			
			alertOk=new AlertSetInfo(LangAlertInfo.EQUIP_USE_TIPS);
			alertOk.isShowCBox=true;
		}
		
		private function onCreatePinZhi(e:Event):void
		{
			_skin.cmb_pinzhi.removeEventListener(FeathersEventType.CREATION_COMPLETE,onCreatePinZhi);
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
		
		private function onCreate(e:Event):void
		{
			_skin.cmb_dengjie.removeEventListener(FeathersEventType.CREATION_COMPLETE,onCreate);
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
			cancelAllUse();
			var targetGrid:DragDropItem;
			if(targetEquipInfo){
				_goodsContainerTarget.setGrayForData(targetEquipInfo,false);
				if(isUse(targetEquipInfo)){//是消耗品
					useEquips.push(targetEquipInfo);
					useEquips.sort(sortForUse);
					_goodsContainerUse.refleshGridsByDatas(useEquips);
					_goodsContainerUse.setGrayForData(targetEquipInfo,false);
				}
				targetEquipInfo=null;
			}
			
			_targetEquip.setGridEmpty();
			updateView();
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
			if(gridInfo.data==null||grid.isGary){
				return;
			}
			if(gridInfo.containerID==ItemContainerID.INTENSIFY_LIST){
				addIntensifyItem(grid);
			}else if(gridInfo.containerID==ItemContainerID.INTENSIFY_USE){
				addIntensifyUseItem(gridInfo);
			}else if(gridInfo.containerID==ItemContainerID.INTENSIFY_USE1){
				cancelIntensifyUseItem(gridInfo);
			}
		}
		
		private function cancelIntensifyUseItem(gridInfo:GridInfo):void
		{
			var itemInfo:ClientItemInfo=gridInfo.data as ClientItemInfo;
			if(!itemInfo){
				return;
			}
			deleteItems(selectedUse,itemInfo);
			_goodsContainerUse1.refleshGridsByDatas(selectedUse);
			var targetGrid:DragDropItem;
			_goodsContainerUse.setGrayForData(itemInfo,false);
			if(isStren(itemInfo as EquipInfo)){
				_goodsContainerTarget.setGrayForData(itemInfo,false);
			}
			addExp-=itemInfo.qItem.q_strengthen_num;
			if(addExp<0){
				addExp=0;
			}
			updateView();
		}
		
		/**
		 *添加强化消耗物 
		 * 
		 */
		private function addIntensifyUseItem(gridInfo:GridInfo):void
		{
			if(!targetEquipInfo){//没选强化准备
				NoticeManager.textNotify(NoticeManager.MOUSE_FOLLOW_TIP, NotifyCfgData.getNotifyTextByID(4204));
				return;
			}
			if(selectedUse.length==6){
				NoticeManager.textNotify(NoticeManager.MOUSE_FOLLOW_TIP, NotifyCfgData.getNotifyTextByID(6016));
				return;
			}
			var itemInfo:ClientItemInfo=gridInfo.data as ClientItemInfo;
			var equip:EquipInfo=itemInfo as EquipInfo;
			if(isDuanZao(equip)&&!noAlertUse){
				GameAlert.showAlert(alertOk,onAlert,[itemInfo]);
			}else{
				setUseItem(itemInfo);
			}
				
		}
		
		/**
		 *是否具有锻造属性 
		 * @param equipInfo
		 * @return 
		 * 
		 */
		private function isDuanZao(equipInfo:EquipInfo):Boolean
		{
			return equipInfo.strengthExp!=0||equipInfo.polishExp!=0||equipInfo.smeltAtt1!=0||equipInfo.smeltAtt2!=0;
		}
		
		private function setUseItem(itemInfo:ClientItemInfo):void
		{
			_goodsContainerUse.setGrayForData(itemInfo,true);
			
			if(isStren(itemInfo as EquipInfo)){
				_goodsContainerTarget.setGrayForData(itemInfo,true);
			}
			
			selectedUse.push(itemInfo);
			_goodsContainerUse1.refleshGridsByDatas(selectedUse);
			addExp+=itemInfo.qItem.q_strengthen_num;
			updateView();
		}
		
		private  function onAlert(gameAlert:GameAlert,datas:Array):void
		{
			if(gameAlert.clickType==AlertClickTypeEnum.TYPE_SURE){
				noAlertUse=gameAlert.isCheckSelected;
				setUseItem(datas[0]);
			}
		}
		
		private function onCompleteTweenUse(tweenGrid:DragDropItem,grid:DragDropItem):void
		{
			tweenGrid.removeFromParent();
			grid.gridInfo.data=tweenGrid.gridInfo.data;
		}
		
		/**
		 *添加强化物 
		 * 
		 */
		private function addIntensifyItem(grid:DragDropItem):void
		{
			var gridInfo:GridInfo=grid.gridInfo;
			if(targetEquipInfo){
				_goodsContainerTarget.setGrayForData(targetEquipInfo,false);
				if(isUse(targetEquipInfo)){
					useEquips.push(targetEquipInfo);//放回去
					useEquips.sort(sortForUse);
					_goodsContainerUse.refleshGridsByDatas(useEquips);
					_goodsContainerUse.setGrayForData(targetEquipInfo,false);
				}
			}
			cancelAllUse();
			
			_targetEquip.gridInfo=gridInfo;
			
			targetEquipInfo=gridInfo.data as EquipInfo;
			_goodsContainerTarget.setGrayForData(targetEquipInfo,true);
			
			var p:Point=new Point(grid.x,grid.y);
			p=grid.parent.localToGlobal(p);
			p=_targetEquip.parent.globalToLocal(p);
			_targetEquip.x=p.x;
			_targetEquip.y=p.y;
			if(tweenEquip){
				tweenEquip.kill();
			}
			tweenEquip=TweenMax.to(_targetEquip,1,{x:621,y:150,ease:Expo.easeOut});
			
			if(isUse(targetEquipInfo)){
				deleteItems(useEquips,targetEquipInfo);//在消耗列表移除掉
				_goodsContainerUse.refleshGridsByDatas(useEquips);
			}
			currCfg=EquipStrengthCfg.getStrengthCfg(targetEquipInfo.qItem.q_kind,targetEquipInfo.qItem.q_job,targetEquipInfo.strengthLevel);
			addExp=0;
			
			var roleLv:int=MainRoleManager.actorInfo.totalStat.level;
			var index:int=Math.floor(roleLv/10);
			index=index>10?10:index;
			index=index-2;
			index=index<0?0:index;
			_skin.cmb_dengjie.selectedIndex=index;
			
			updateView();
		}
		
		
		private function deleteItems(arr:Vector.<ClientItemInfo>,item:ClientItemInfo):void
		{
			var index:int=arr.indexOf(item);
			if(index!=-1){
				arr.splice(index,1);
			}
		}
		
		override public function show(data:Object=null):void
		{
			initEvent();
			refresh();
			
			/*var alertOk:AlertSetInfo=new AlertSetInfo(LangUI.UI_TEXT3);//强化成功
			alertOk.alertInfo.value=alertOk.alertInfo.value.replace("$",10);
			alertOk.alertInfo.value=alertOk.alertInfo.value.replace("$",10);
			alertOk.alertInfo.value=alertOk.alertInfo.value.replace("$",1000);
			alertOk.alertInfo.align="center";
			GameAlert.showAlert(alertOk);*/
		}
		
		override public function refresh():void
		{
			ItemManager.getBackEquip(initItem);
		}
		
		private function updateView():void
		{
			if(targetEquipInfo){
				currCfg=EquipStrengthCfg.getStrengthCfg(targetEquipInfo.qItem.q_kind,targetEquipInfo.qItem.q_job,targetEquipInfo.strengthLevel);
				_skin.equip_name.color=ItemConfig.getItemQualityColor(targetEquipInfo.cfgId);
				_skin.equip_name.text=targetEquipInfo.name;
				_skin.lb_dengji.htmlText=LanguageConfig.getText(LangUI.UI_TEXT6)+":"+targetEquipInfo.strengthLevel+"/"+targetEquipInfo.qItem.q_max_strengthen;
				_skin.lb_current.text=targetEquipInfo.strengthLevel+LanguageConfig.getText(LangUI.UI_TEXT7);
				getUpLv();
				_skin.lb_up.text=upCfg.q_strength+LanguageConfig.getText(LangUI.UI_TEXT7);
				if(currCfg&&upCfg&&canUpNum!=0){//能升级
					updateAttShow(currCfg,upCfg);
				}else{
					updateAttShow(currCfg);
				}
				_progressBar.value=currentExp;
				_progressBar.maximum=allExp;
				_skin.lb_pro.text=currentExp+"/"+allExp;
				useMon=addExp*perMon;
				userMon=MainRoleManager.actorInfo.totalStat.getResData(CharAttributeType.RES_BIND_MONEY)+ MainRoleManager.actorInfo.totalStat.getResData(CharAttributeType.RES_MONEY);
				_leftSkin.lb_yinzi.htmlText=getTitleText(LanguageConfig.getText(LangUI.UI_TEXT4),useMon,userMon);
				
				if(_skin.cmb_dengjie.alpha==0&&!tween){
					tween=TweenMax.fromTo(_skin.cmb_dengjie,1,{x:455,alpha:0},{x:405,alpha:1,ease:Expo.easeOut,onComplete:showComplete});
					TweenMax.fromTo(_skin.cmb_pinzhi,1,{x:555,alpha:0},{x:475,alpha:1,ease:Expo.easeOut,onComplete:showComplete});
				}
			}else{
				_skin.lb_dengji.htmlText="";
				_leftSkin.lb_yinzi.htmlText=getTitleText(LanguageConfig.getText(LangUI.UI_TEXT4),0);
				_skin.equip_name.text="";
				for(var i:int=0;i<4;i++){
					var labelUp:SkinnableContainer=_skin["up"+i];
					labelUp.visible=false;
				}
				_skin.lb_pro.text="";
				_progressBar.value=0;
				_skin.lb_current.text=_skin.lb_up.text="";
				
				if(_skin.cmb_dengjie.alpha==1&&!tween){
					tween=TweenMax.fromTo(_skin.cmb_dengjie,0.6,{x:405,alpha:1},{x:455,alpha:0,ease:Expo.easeOut,onComplete:showComplete});
					TweenMax.fromTo(_skin.cmb_pinzhi,0.6,{x:475,alpha:1},{x:555,alpha:0,ease:Expo.easeOut,onComplete:showComplete});
				}
			}
			
//			_goodsContainerTarget.dataProvider.updateAll();
//			_goodsContainerUse.dataProvider.updateAll();
		}
		
		private function showComplete():void
		{
			tween=null;
		}
		
		private function getUpLv():void
		{
			var maxLv:int=targetEquipInfo.qItem.q_max_strengthen;//最大强化等级
			var exp:int=targetEquipInfo.strengthExp+addExp;//强化总值+消耗后获得的值
			var nextLv:int;//下一级
			var currentLv:int=targetEquipInfo.strengthLevel;
			var upExp:int;
			var nextCfg:Q_equip_strength;
			canUpNum=0;
			while(currentLv<=maxLv){
				currentLv++;
				nextCfg=EquipStrengthCfg.getStrengthCfg(targetEquipInfo.qItem.q_kind,targetEquipInfo.qItem.q_job,currentLv);//下一级的配置
				upExp=nextCfg.q_exp;//升级所需强化值
				upCfg=nextCfg;
				
				if(exp<upExp){//不够升级不查找
					break;
				}
				canUpNum++;
			}
			
			allExp=upCfg.q_exp-currCfg.q_exp;//当前级所需的总经验
			currentExp=exp-currCfg.q_exp;
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
		
		private function updateAttShow(current:Q_equip_strength,up:Q_equip_strength=null):void
		{
			var attValues1:Q_att_values;
			var maps1:HashMap;
			var types:Array;
			var values1:Array;
			attValues1=AttValueConfig.getAttInfoById(current.q_att_type);
			maps1=AttValueConfig.getTypeValueMap(attValues1);
			types=maps1.keys();
			values1=maps1.values();
			
			var attValues2:Q_att_values;
			var maps2:HashMap;
			var values2:Array;
			if(up){
				attValues2=AttValueConfig.getAttInfoById(up.q_att_type);
				maps2=AttValueConfig.getTypeValueMap(attValues2);
				values2=maps2.values();
			}
			
			for(var i:int=0;i<4;i++){
				var labelUp:SkinnableContainer=_skin["up"+i];
				var labelUpSkin:Shuxing2_Skin=_skin["up"+i].skin as Shuxing2_Skin;
				if(i<values1.length){
					labelUpSkin.lb_name.text=CharAttributeType.getCNName(types[i])+":";
					labelUpSkin.arrow_up.visible=labelUpSkin.lb_up.visible=true;
					labelUp.visible=true;
					if(values2){
						labelUpSkin.lb_num.text=AttValueConfig.getDisAttValueStr(types[i],values1[i]);
						labelUpSkin.lb_up.text=(AttValueConfig.getDisAttValue(types[i],values2[i])-AttValueConfig.getDisAttValue(types[i],values1[i]))+CharAttributeType.getAttrUnit(types[i]);
					}else{
						labelUpSkin.lb_num.text=values1[i];
						labelUpSkin.arrow_up.visible=labelUpSkin.lb_up.visible=false;
					}
					
					labelUpSkin.lb_num.x=labelUpSkin.lb_name.x+labelUpSkin.lb_name.textWidth;
					labelUpSkin.arrow_up.x=labelUpSkin.lb_num.x+labelUpSkin.lb_num.textWidth+4;
					labelUpSkin.lb_up.x=labelUpSkin.arrow_up.x+labelUpSkin.arrow_up.width+2;
				}else{
					labelUp.visible=false;
				}
			}
		}
		
		private function getOneKeyUse():void
		{
			cancelAllUse();
			
			if(!targetEquipInfo){
				NoticeManager.textNotify(NoticeManager.MOUSE_FOLLOW_TIP, NotifyCfgData.getNotifyTextByID(4204));
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
					if(isDuanZao(item as EquipInfo)){//具有锻造属性
						continue;
					}
					if(item.qItem.q_levelnum<=lv&&item.quality<=quality&&item!=targetEquipInfo){
						result.push(item);
					}
				}
			}
			result.sort(ItemManager.onSortUseEquip);
			addExp=0;
			useListIds=new Vector.<long>();
			isToUp=false;
			var maxCfg:Q_equip_strength=EquipStrengthCfg.getStrengthCfg(targetEquipInfo.qItem.q_kind,targetEquipInfo.qItem.q_job,targetEquipInfo.qItem.q_max_strengthen);
			for(var i:int=0;i<result.length;i++){
				item=result[i];
				addExp+=item.qItem.q_strengthen_num;
				useMon=addExp*perMon;
				if(userMon<useMon){//钱不够
					addExp-=item.qItem.q_strengthen_num;
					break;
				}
				useListIds.push(item.itemInfo.itemId);
				if(addExp>maxCfg.q_exp){
					isToUp=true;//到顶级了
					break;
				}
			}
			
			if(addExp<0){
				addExp=0;
			}
			
			useMon=addExp*perMon;
			if(userMon<useMon||(addExp==0&&result.length!=0)){
				NoticeManager.textNotify(NoticeManager.MOUSE_FOLLOW_TIP, NotifyCfgData.getNotifyTextByID(4202));
				return;
			}
			
			
			if(useListIds.length==0){
				NoticeManager.textNotify(NoticeManager.MOUSE_FOLLOW_TIP, NotifyCfgData.getNotifyTextByID(4205));
				return;
			}
			
			useMon=addExp*perMon;
			userMon=MainRoleManager.actorInfo.totalStat.getResData(CharAttributeType.RES_BIND_MONEY)+ MainRoleManager.actorInfo.totalStat.getResData(CharAttributeType.RES_MONEY);
			
			if(userMon<useMon){
				NoticeManager.textNotify(NoticeManager.MOUSE_FOLLOW_TIP, NotifyCfgData.getNotifyTextByID(4202));
				return;
			}
			
			var p:Point=new Point(this._stage.mouseX,this._stage.mouseY);
			p=this.globalToLocal(p);
			this.playInter3DAt(ClientConfig.getEffect("ui_tongyongdianji"),p.x,p.y,1);
			var type:int=RoleEquipmentManager.equipIsWearing(targetEquipInfo)?0:1;
			isLockRefresh=true;
			ItemSender.strengthEquip(targetEquipInfo.itemInfo.itemId,type,useListIds,EquipOperateType.STRENGTH_ONEKEY);
		}
		
		
		private function cancelAllUse():void
		{
			var datas:Array=_goodsContainerUse1.dataProvider.data as Array;
			while(datas[0].data){
				var item:ClientItemInfo=datas[0].data as ClientItemInfo;
				addExp-=item.qItem.q_strengthen_num;
				deleteItems(selectedUse,item);
				cancelIntensifyUseItem(datas[0]);
			}
			_goodsContainerUse1.refleshGridsByDatas(selectedUse);
		}
		
		private function initEvent():void
		{
			_leftSkin.tab_pack.addEventListener(Event.CHANGE, onTab);
			EventManager.addEvent(ItemEvent.ITEM_STRENGTH_MSG,getStrengthMsg);
			EventManager.addEvent(ItemEvent.ITEM_ADD,onFreshItems);
			EventManager.addEvent(ItemEvent.ITEM_REMOVE_LIST,onRemoveFreshItems);
			EventManager.addEvent(ItemEvent.ITEM_CHANG,onFreshItems);
			EventManager.addEvent(ItemEvent.UNWEAR_EQUIPITEM,onFreshItems);
			EventManager.addEvent(MainPlayerEvent.STAT_RES_CHANGE,updateAmount);//金钱变化
			TipTargetManager.show( _skin.btn_shuoming,TargetTipsMaker.makeSimpleTextTips( TipsCfgData.getTipsInfo(24).q_describe));
		}
		
		private function onRemoveFreshItems(list:Vector.<ClientItemInfo>):void
		{
			if(isLockRefresh){
				return;
			}
			ItemManager.getBackEquip(initItem);
		}
		
		private function updateAmount(type:int=3):void
		{
			if(type!=CharAttributeType.RES_MONEY&&type!=CharAttributeType.RES_BIND_MONEY){
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
		
		private function getStrengthMsg(msg:ResEquipOperateResultMessage):void
		{
			if(msg.opaque==EquipOperateType.STRENGTH_ONEKEY&&msg.result==1){
				var alertOk:AlertSetInfo=new AlertSetInfo(LangUI.UI_TEXT3);//强化成功
				alertOk.alertInfo.value=alertOk.alertInfo.value.replace("$",addExp);
				alertOk.alertInfo.value=alertOk.alertInfo.value.replace("$",useListIds.length);
				alertOk.alertInfo.value=alertOk.alertInfo.value.replace("$",addExp*perMon);
				alertOk.alertInfo.align="left";
				if(isToUp){
					alertOk.alertInfo.value=LanguageConfig.getText(LangUI.UI_TEXT8)+alertOk.alertInfo.value;
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
			useListIds.length=0;
			refresh();
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
			var result:Vector.<ClientItemInfo>=getEquipByType(type,targetEquips);
			_goodsContainerTarget.refleshGridsByDatas(result);
		}
		
		override public function hide():void
		{
			_leftSkin.tab_pack.removeEventListener(Event.CHANGE, onTab);
			EventManager.removeEvent(ItemEvent.ITEM_STRENGTH_MSG,getStrengthMsg);
			cancelAllUse();
			onCancelIntensify(null);
			EventManager.removeEvent(ItemEvent.ITEM_ADD,onFreshItems);
			EventManager.removeEvent(ItemEvent.ITEM_REMOVE_LIST,onRemoveFreshItems);
			EventManager.removeEvent(ItemEvent.ITEM_CHANG,onFreshItems);
			EventManager.removeEvent(MainPlayerEvent.STAT_RES_CHANGE,updateAmount);//金钱变化
			EventManager.removeEvent(ItemEvent.UNWEAR_EQUIPITEM,onFreshItems);
			TipTargetManager.remove( _skin.btn_shuoming);
			GameAlert.closeAlert(LangUI.UI_TEXT3);
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			switch(target){
				case _skin.btn_qianghua_all:
					getOneKeyUse();
					break;
				case _skin.btn_qianhua:
					toIntensifyUse();
					break;
			}
		}
		
		private function toIntensifyUse():void
		{
			useListIds=new Vector.<long>();
			for(var i:int=0;i<selectedUse.length;i++){
				useListIds.push(selectedUse[i].itemInfo.itemId);
			}
			if(!targetEquipInfo){
				NoticeManager.textNotify(NoticeManager.MOUSE_FOLLOW_TIP, NotifyCfgData.getNotifyTextByID(4204));
				return;
			}
			
			if(selectedUse.length==0){
				NoticeManager.textNotify(NoticeManager.MOUSE_FOLLOW_TIP, NotifyCfgData.getNotifyTextByID(4201));
				return;
			}
			
			if(userMon<useMon){
				NoticeManager.textNotify(NoticeManager.MOUSE_FOLLOW_TIP, NotifyCfgData.getNotifyTextByID(4202));
				return;
			}
			
			var p:Point=new Point(this._stage.mouseX,this._stage.mouseY);
			p=this.globalToLocal(p);
			this.playInter3DAt(ClientConfig.getEffect("ui_tongyongdianji"),p.x,p.y,1);
			var type:int=RoleEquipmentManager.equipIsWearing(targetEquipInfo)?0:1;
			isLockRefresh=true;
			ItemSender.strengthEquip(targetEquipInfo.itemInfo.itemId,type,useListIds,EquipOperateType.STRENGTH_NORMAL);
		}
		
		private function initItem():void
		{
			var allEquips:Array=ItemManager.getAllEquipDatas();
			var num:int=allEquips.length;
			
			targetEquips=getUpEquips(allEquips);
			targetEquips.sort(onSortStrenEquip);
			num=targetEquips.length;
			num=num>MIN_GRID?num:MIN_GRID;
			_goodsContainerTarget.setGridsCount(num,false);
			onTab(null);
			
			
			
			useEquips=getUseEquips(allEquips);
			useEquips.sort(sortForUse);
			num=useEquips.length;
			num=num>MIN_GRID?num:MIN_GRID;
			_goodsContainerUse.setGridsCount(num,false);
			_goodsContainerUse.refleshGridsByDatas(useEquips);
			selectedUse.length=0;
			_goodsContainerUse1.refleshGridsByDatas(selectedUse);
			
			updateAll();
		}
		
		private function sortForUse(equipA:EquipInfo, equipB:EquipInfo):int
		{
			if(equipA.qItem.q_levelnum==equipB.qItem.q_levelnum){//阶数相同
				if(equipA.qItem.q_default==equipB.qItem.q_default){//品质相同
					if(equipA.strengthLevel==equipB.strengthLevel){//强化等级相同
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
						if(equipA.strengthLevel==equipB.strengthLevel){
							if(equipA.strengthExp==equipA.strengthExp){
								return 0
							}
							if(equipA.strengthExp<equipA.strengthExp){
								return -1;
							}else{
								return 1;
							}
						}
						if(equipA.strengthLevel<equipB.strengthLevel){
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
		private  function onSortStrenEquip(equipA : EquipInfo, equipB : EquipInfo):int
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
					if(equipA.strengthLevel==equipB.strengthLevel){//强化等级相同
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
						if(equipA.strengthLevel==equipB.strengthLevel){
							return 0;
						}
						if(equipA.strengthLevel>equipB.strengthLevel){
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
					deleteItems(useEquips,targetEquipInfo);//在消耗列表移除掉
					_goodsContainerUse.refleshGridsByDatas(useEquips);
				}
			}
			
			updateView();
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
				if(isStren(info as EquipInfo)){//可强化的并且不是在强化列表列
					if(targetEquipInfo&&info.itemInfo.itemId.ToGID()==targetEquipInfo.itemInfo.itemId.ToGID()){
						targetEquipInfo=info as EquipInfo;//更新掉
						_targetEquip.gridInfo.data=targetEquipInfo;
						_targetEquip.gridInfo=_targetEquip.gridInfo;//只能这样调用更新才能触发更新tips函数。。。
						currCfg=EquipStrengthCfg.getStrengthCfg(targetEquipInfo.qItem.q_kind,targetEquipInfo.qItem.q_job,targetEquipInfo.strengthLevel);
					}
					result.push(info);
				}else{
					if(targetEquipInfo&&info.itemInfo.itemId.ToGID()==targetEquipInfo.itemInfo.itemId.ToGID()){//不可强化，在强化位置
						targetEquipInfo=null;
						_targetEquip.gridInfo.data=targetEquipInfo;
						_targetEquip.setGridEmpty();
					}
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
				var info:ClientItemInfo=datas[i];
				if(isUse(info)){//可消耗并且不在被选中消耗表里
					result.push(info);
				}
			}
			return result;
		}
		
		private function isStren(info:EquipInfo):Boolean
		{
			var job:int=MainRoleManager.actorInfo.job;
			if(info.qItem.q_max_strengthen!=0&&info.strengthLevel<info.qItem.q_max_strengthen&&info.qItem.q_job==job){//可强化的
				return true;
			}
			return false;
		}
		
		private function isUse(info:ClientItemInfo):Boolean
		{
			var equip:EquipInfo=info as EquipInfo;
			if(equip.qItem.q_strengthen_num!=0&&RoleEquipmentManager.equipIsWearing(equip)==false){//消耗获得的值不为0
				return true;
			}
			return false;
		}
	}
}