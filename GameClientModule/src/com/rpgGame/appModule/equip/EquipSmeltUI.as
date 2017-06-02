package com.rpgGame.appModule.equip
{
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.goods.BackPackManager;
	import com.rpgGame.app.manager.goods.ItemManager;
	import com.rpgGame.app.manager.goods.RoleEquipmentManager;
	import com.rpgGame.app.manager.pop.UIPopManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.sender.ItemSender;
	import com.rpgGame.app.ui.alert.GameAlert;
	import com.rpgGame.app.ui.common.CenterEftPop;
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.view.icon.DragDropItem;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.appModule.bag.ItemGetPathPanel;
	import com.rpgGame.appModule.common.GoodsContainerPanel;
	import com.rpgGame.appModule.common.ViewUI;
	import com.rpgGame.appModule.common.itemRender.GridItemRender;
	import com.rpgGame.core.events.ItemEvent;
	import com.rpgGame.core.events.MainPlayerEvent;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.cfg.NotifyCfgData;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.cfg.TipsCfgData;
	import com.rpgGame.coreData.cfg.item.EquipWashCfg;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.cfg.item.ItemContainerID;
	import com.rpgGame.coreData.clientConfig.Q_equip_wash;
	import com.rpgGame.coreData.enum.AlertClickTypeEnum;
	import com.rpgGame.coreData.enum.SharedObjectEnum;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.alert.AlertSetInfo;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.info.item.EquipInfo;
	import com.rpgGame.coreData.info.item.GridInfo;
	import com.rpgGame.coreData.lang.LangSpell;
	import com.rpgGame.coreData.lang.LangUI;
	import com.rpgGame.coreData.type.CharAttributeType;
	import com.rpgGame.coreData.type.item.GridBGType;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	import com.rpgGame.netData.backpack.bean.ItemInfo;
	import com.rpgGame.netData.equip.message.ResEquipOperateResultMessage;
	
	import flash.geom.Point;
	import flash.net.SharedObject;
	
	import app.message.GoodsType;
	
	import away3d.events.Event;
	
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	
	import gs.TweenMax;
	import gs.easing.Expo;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.zhuangbei.Zhuangbei_left;
	import org.mokylin.skin.app.zhuangbei.qianghua.TitileHead;
	import org.mokylin.skin.app.zhuangbei.xilian.XiLianItem;
	import org.mokylin.skin.app.zhuangbei.xilian.Xilian_Skin;
	
	import starling.display.DisplayObject;
	
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
		
		private var _targetEquip:IconCDFace;//目标道具
		private var targetEquipInfo:EquipInfo;//目标信息
		
		private var _useItem:IconCDFace;
		private var useItemInfo:ClientItemInfo;
		
		private var targetEquips:Vector.<ClientItemInfo>;//目标数据
		private var useItems:Vector.<ClientItemInfo>;//消耗数据
		private var tweenEquip:TweenMax;

		private var washCfg:Q_equip_wash;
		
		private var _sharedObject:SharedObject;
		private var needMon:int;

		private var userMon:int;

		private var lock:int;
		private var _getPanel:ItemGetPathPanel;

		private var oldAtt1:int;

		private var oldAtt2:int;
		private var isLockRefresh:Boolean;
		private static var noAlertWash:Boolean;
		
		public function EquipSmeltUI(skin:StateSkin=null)
		{
			_skin=new Xilian_Skin();
			super(_skin);
			initView();
		}
		
		private function initView():void
		{
			_leftSkin=_skin.left.skin as Zhuangbei_left;
			
			(_leftSkin.title1.skin as TitileHead).labelDisplay.text=LanguageConfig.getText(LangUI.UI_TEXT1);
			(_leftSkin.title2.skin as TitileHead).labelDisplay.text=LanguageConfig.getText(LangUI.UI_TEXT2);
			
			_goodsContainerTarget=new GoodsContainerPanel(_leftSkin.list1,ItemContainerID.SMELT_LIST,createItemRender);
			_goodsContainerUse=new GoodsContainerPanel(_leftSkin.list2,ItemContainerID.SMELT_USE,createItemRender);
			
			_targetEquip=new IconCDFace(64);
			_targetEquip.selectImgVisible=false;
			_useItem=new IconCDFace(64);
			_useItem.selectImgVisible=false;
			_skin.container.addChild(_targetEquip);
			_skin.container.addChild(_useItem);
			_skin.container.addChild(_skin.lb_num);
			_useItem.x=730;
			_useItem.y=130;
			_skin.lb_cailiao.text=LanguageConfig.getText(LangUI.UI_TEXT26);
			
			useItemInfo=new ClientItemInfo();
			useItemInfo.itemInfo=new ItemInfo();
			
			_sharedObject=SharedObject.getLocal(SharedObjectEnum.EQUIP_WASH);
			_getPanel=new ItemGetPathPanel();
			(_skin.left.skin as Zhuangbei_left).monyIcon.removeFromParent(true);
			(_skin.left.skin as Zhuangbei_left).monyTips.removeFromParent(true);
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
			if(gridInfo.data==null||grid.isGary){
				return;
			}
			if(gridInfo.containerID==ItemContainerID.SMELT_LIST){
				addTargetEquip(grid);
			}else if(gridInfo.containerID==ItemContainerID.SMELT_USE){
				//				addIntensifyUseItem(gridInfo);
			}
		}
		
		private function addTargetEquip(targetGrid:DragDropItem):void
		{
			if(targetEquipInfo){
				_goodsContainerTarget.setGrayForData(targetEquipInfo,false);
			}
			
			var gridInfo:GridInfo=targetGrid.gridInfo;
			targetEquipInfo=gridInfo.data as EquipInfo;
			targetEquipInfo.setContainerId(gridInfo.containerID);
			FaceUtil.SetItemGrid(_targetEquip,targetEquipInfo);
			_targetEquip.selectImgVisible=false;
			_goodsContainerTarget.setGrayForData(targetEquipInfo,true);
			
			var p:Point=new Point(targetGrid.x,targetGrid.y);
			p=targetGrid.parent.localToGlobal(p);
			p=_targetEquip.parent.globalToLocal(p);
			_targetEquip.x=p.x;
			_targetEquip.y=p.y;
			if(tweenEquip){
				tweenEquip.kill();
			}
			tweenEquip=TweenMax.to(_targetEquip,1,{x:475,y:130,ease:Expo.easeOut});
			
			showUseItem();
			
			updateView();
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			switch(target){
				case _targetEquip:
					onCancelTarget();
					break;
				case _skin.btn_xilian:
					onWash();
					break;
				case _skin.Item1.skin["chk_suoding"]:
					if(getItemSkin(_skin.Item1).chk_suoding.isSelected){
						getItemSkin(_skin.Item2).chk_suoding.isSelected=!getItemSkin(_skin.Item1).chk_suoding.isSelected;
					}
					_leftSkin.lb_yinzi.text=getTitleText(LanguageConfig.getText(LangUI.UI_TEXT27),needMon,userMon);
					break;
				case _skin.Item2.skin["chk_suoding"]:
					if(getItemSkin(_skin.Item2).chk_suoding.isSelected){
						getItemSkin(_skin.Item1).chk_suoding.isSelected=!getItemSkin(_skin.Item2).chk_suoding.isSelected;
					}
					_leftSkin.lb_yinzi.text=getTitleText(LanguageConfig.getText(LangUI.UI_TEXT27),needMon,userMon);
					break;
				case _skin.lb_cailiao:
					_getPanel.show(useItemInfo.cfgId,"",this._skin.container)
					break;
			}
			if(targetEquipInfo){
				_sharedObject.data[targetEquipInfo.itemInfo.itemId.ToGID()+"_1"]=getItemSkin(_skin.Item1).chk_suoding.isSelected;
				_sharedObject.data[targetEquipInfo.itemInfo.itemId.ToGID()+"_2"]=getItemSkin(_skin.Item2).chk_suoding.isSelected;
			}
		}
		
		private function onWash():void
		{
			if(!targetEquipInfo){
				NoticeManager.textNotify(NoticeManager.MOUSE_FOLLOW_TIP, LanguageConfig.getText(LangUI.UI_TEXT28));
				return;
			}
			if(useItemInfo.count<washCfg.q_item_num){
				NoticeManager.textNotify(NoticeManager.MOUSE_FOLLOW_TIP, LanguageConfig.getText(LangUI.UI_TEXT29));
				return;
			}
			
			lock=getLock();
			var type:int=RoleEquipmentManager.equipIsWearing(targetEquipInfo)?0:1;
			if(userMon<needMon){
				NoticeManager.textNotify(NoticeManager.MOUSE_FOLLOW_TIP, NotifyCfgData.getNotifyTextByID(2008));
				return;
			}
			
			oldAtt1=	targetEquipInfo.smeltAtt1;
			oldAtt2=	targetEquipInfo.smeltAtt2;
			isLockRefresh=true;
			
			if(needMon!=0&&!noAlertWash){
				 var alertOk:AlertSetInfo=new AlertSetInfo(LangUI.UI_TEXT30);//强化成功
				alertOk.alertInfo.value=LanguageConfig.getText(LangUI.UI_TEXT30)+needMon;
				alertOk.isShowCBox=true;
				alertOk.alertInfo.checkText=LanguageConfig.getText(LangUI.UI_TEXT31);
				alertOk.alertInfo.align="left";
				GameAlert.showAlert(alertOk,onAlert,[type]);
				return;
			}
			
			ItemSender.washEquip(targetEquipInfo.itemInfo.itemId,type,lock);
		}
		
		
		private  function onAlert(gameAlert:GameAlert,datas:Array):void
		{
			noAlertWash=gameAlert.isCheckSelected;
			
			switch(gameAlert.clickType)
			{
				case AlertClickTypeEnum.TYPE_SURE:
					ItemSender.washEquip(targetEquipInfo.itemInfo.itemId,datas[0],lock);
					break;
			}
		}
		
		private function getLock():int
		{
			var lock:int=0;
			needMon=0;
			if(getItemSkin(_skin.Item1).chk_suoding.isSelected){
				lock=1;
				needMon+=10;
			}
			if(getItemSkin(_skin.Item2).chk_suoding.isSelected){
				if(lock==1){
					lock=3;
				}else{
					lock=2;
				}
				needMon+=10;
			}
			return lock;
		}
		
		private function onCancelTarget():void
		{
			var targetGrid:DragDropItem;
			if(targetEquipInfo){
				_goodsContainerTarget.setGrayForData(targetEquipInfo,false);
				targetEquipInfo=null;
			}
			
			for each(var item:ClientItemInfo in useItems){
				_goodsContainerUse.setGrayForData(item,false);
			}
			
			_targetEquip.clear();
			_useItem.clear();
			updateView();
		}
		
		private function updateView():void
		{
			if(targetEquipInfo){
				useItemInfo.count=BackPackManager.instance.getBagItemsCountById(washCfg.q_item_id);
				changeAttState(_skin.Item1,true);
				changeAttState(_skin.Item2,true);
				var target:Object;
				needMon=0;
				if(targetEquipInfo.smeltAtt1!=0){
					if(targetEquipInfo.smeltAtt1!=oldAtt1&&oldAtt1!=0){//刷新
						getItemSkin(_skin.Item1).lb_name.htmlText=CharAttributeType.getWashAttDes(targetEquipInfo.smeltAtt1);//新的
						getItemSkin(_skin.Item1).lb_name0.htmlText=CharAttributeType.getWashAttDes(oldAtt1);//老的
						target=getItemSkin(_skin.Item1).lb_name;
						TweenMax.fromTo(target,1,{x:-200,alpha:0},{x:1,alpha:1,ease:Expo.easeOut});
						target=getItemSkin(_skin.Item1).lb_name0;
						TweenMax.fromTo(target,1,{x:1,alpha:1},{x:200,alpha:0,ease:Expo.easeOut});
					}else{
						if(targetEquipInfo.smeltAtt1==oldAtt1){//洗出的是老属性
							getItemSkin(_skin.Item1).lb_name.htmlText=getItemSkin(_skin.Item1).lb_name0.htmlText=CharAttributeType.getWashAttDes(targetEquipInfo.smeltAtt1);
							target=getItemSkin(_skin.Item1).lb_name;
							TweenMax.fromTo(target,1,{x:-200,alpha:0},{x:1,alpha:1,ease:Expo.easeOut});
							target=getItemSkin(_skin.Item1).lb_name0;
							TweenMax.fromTo(target,1,{x:1,alpha:1},{x:200,alpha:0,ease:Expo.easeOut});
						}else{
							getItemSkin(_skin.Item1).lb_name.htmlText=CharAttributeType.getWashAttDes(targetEquipInfo.smeltAtt1);
							getItemSkin(_skin.Item1).lb_name0.htmlText="";
						}
					}
					getItemSkin(_skin.Item1).chk_suoding.isSelected=_sharedObject.data[targetEquipInfo.itemInfo.itemId.ToGID()+"_1"];
					if(getItemSkin(_skin.Item1).chk_suoding.isSelected){
						needMon=10;
					}
				}else{
					changeAttState(_skin.Item1,false);
				}
				if(targetEquipInfo.smeltAtt2!=0){
					if(targetEquipInfo.smeltAtt2!=oldAtt2&&oldAtt2!=0){//刷新
						getItemSkin(_skin.Item2).lb_name.htmlText=CharAttributeType.getWashAttDes(targetEquipInfo.smeltAtt2);//新的
						getItemSkin(_skin.Item2).lb_name0.htmlText=CharAttributeType.getWashAttDes(oldAtt2);//老的
						target=getItemSkin(_skin.Item2).lb_name;
						TweenMax.fromTo(target,1,{x:-200,alpha:0},{x:1,alpha:1,ease:Expo.easeOut});
						target=getItemSkin(_skin.Item2).lb_name0;
						TweenMax.fromTo(target,1,{x:1,alpha:1},{x:200,alpha:0,ease:Expo.easeOut});
					}else{
						if(targetEquipInfo.smeltAtt2==oldAtt2){//洗出的是老属性)
							getItemSkin(_skin.Item2).lb_name.htmlText=getItemSkin(_skin.Item2).lb_name0.htmlText=CharAttributeType.getWashAttDes(targetEquipInfo.smeltAtt2);
						}else{
							getItemSkin(_skin.Item2).lb_name.htmlText=CharAttributeType.getWashAttDes(targetEquipInfo.smeltAtt2);
							getItemSkin(_skin.Item2).lb_name0.htmlText="";
						}
					}
				/*	target=getItemSkin(_skin.Item2).lb_name;
					TweenMax.fromTo(target,1,{x:-200,alpha:0},{x:1,alpha:1,ease:Expo.easeOut});
					target=getItemSkin(_skin.Item2).lb_name0;
					TweenMax.fromTo(target,1,{x:1,alpha:1},{x:200,alpha:0,ease:Expo.easeOut});*/
					getItemSkin(_skin.Item2).chk_suoding.isSelected=_sharedObject.data[targetEquipInfo.itemInfo.itemId.ToGID()+"_2"];
					if(getItemSkin(_skin.Item2).chk_suoding.isSelected){
						needMon=10;
					}
				}else{
					changeAttState(_skin.Item2,false);
				}
				
//				_useItem.setSubString(useItemInfo.count+"/"+washCfg.q_item_num);
				_skin.lb_cailiao.text=LanguageConfig.getText(LangUI.UI_TEXT26);
				_useItem.countText.text="";
				_skin.lb_item1.color=ItemConfig.getItemQualityColor(targetEquipInfo.cfgId);
				_skin.lb_item2.color=ItemConfig.getItemQualityColor(useItemInfo.cfgId);
				_skin.lb_item1.text=targetEquipInfo.name;
				_skin.lb_item2.text=useItemInfo.name;
				_skin.lb_num.text=useItemInfo.count+"/"+washCfg.q_item_num;
				if(useItemInfo.count<washCfg.q_item_num){
					_skin.lb_num.color=StaticValue.UI_RED1;
				}else{
					_skin.lb_num.color=StaticValue.Q_GREEN;
				}
				
				_leftSkin.lb_yinzi.text=getTitleText(LanguageConfig.getText(LangUI.UI_TEXT27),needMon,userMon);
				
			}else{
				changeAttState(_skin.Item1,false);
				changeAttState(_skin.Item2,false);
				_skin.lb_num.text="";
				_skin.lb_item1.text="";
				_skin.lb_item2.text="";
				_skin.lb_cailiao.text="";
				_leftSkin.lb_yinzi.text=getTitleText(LanguageConfig.getText(LangUI.UI_TEXT27),0);
			}
			
			_goodsContainerTarget.dataProvider.updateAll();
			_goodsContainerUse.dataProvider.updateAll();
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
		
		private function changeAttState(Item:SkinnableContainer,state:Boolean):void
		{
				getItemSkin(Item).lb_name.text=LanguageConfig.getText(LangUI.UI_TEXT32);
				getItemSkin(Item).chk_suoding.isSelected=state;
				getItemSkin(Item).chk_suoding.visible=state;
				getItemSkin(Item).lb_yuanbao.visible=state;
				getItemSkin(Item).lb_lock.visible=state;
		}		
		
		private function getItemSkin(state:SkinnableContainer):XiLianItem
		{
			return state.skin as XiLianItem;
		}
		
		private function showUseItem():void
		{
			washCfg=EquipWashCfg.getCfgByLvAndKind(targetEquipInfo.qItem.q_levelnum,targetEquipInfo.qItem.q_kind);
			useItemInfo.cfgId=washCfg.q_item_id;
			FaceUtil.SetItemGrid(_useItem,useItemInfo);
			_useItem.selectImgVisible=false;
			
			var targetGrid:DragDropItem;
			for each(var item:ClientItemInfo in useItems){
				if(item.cfgId==useItemInfo.cfgId){
					_goodsContainerUse.setGrayForData(item,false);
				}else{
					_goodsContainerUse.setGrayForData(item,true);
				}
			}
		}
		
		override public function show(data:Object=null):void
		{
			initEvent();
			refresh();
		}
		
		private function initEvent():void
		{
			_leftSkin.tab_pack.addEventListener(Event.CHANGE, onTab);
			EventManager.addEvent(ItemEvent.ITEM_WASH_MSG,getWashMsg);
			
			EventManager.addEvent(ItemEvent.ITEM_ADD,onFreshItems);
			EventManager.addEvent(ItemEvent.ITEM_REMOVE,onFreshItems);
			EventManager.addEvent(ItemEvent.ITEM_CHANG,onFreshItems);
			EventManager.addEvent(ItemEvent.UNWEAR_EQUIPITEM,onFreshItems);
			EventManager.addEvent(ItemEvent.ITEM_REMOVE_LIST,onRemoveFreshItems);
			EventManager.addEvent(MainPlayerEvent.STAT_RES_CHANGE,updateAmount);//金钱变化
			TipTargetManager.show( _skin.btn_shuoming,TargetTipsMaker.makeSimpleTextTips( TipsCfgData.getTipsInfo(21).q_describe));
		}
		
		override public function hide():void
		{
			_leftSkin.tab_pack.removeEventListener(Event.CHANGE, onTab);
			EventManager.removeEvent(ItemEvent.ITEM_WASH_MSG,getWashMsg);
			
			EventManager.removeEvent(ItemEvent.ITEM_ADD,onFreshItems);
			EventManager.removeEvent(ItemEvent.ITEM_REMOVE,onFreshItems);
			EventManager.removeEvent(ItemEvent.ITEM_CHANG,onFreshItems);
			EventManager.removeEvent(ItemEvent.UNWEAR_EQUIPITEM,onFreshItems);
			EventManager.removeEvent(ItemEvent.ITEM_REMOVE_LIST,onRemoveFreshItems);
			EventManager.removeEvent(MainPlayerEvent.STAT_RES_CHANGE,updateAmount);//金钱变化
			TipTargetManager.remove( _skin.btn_shuoming);
			oldAtt1=oldAtt2=0;
			
			GameAlert.closeAlert(LangUI.UI_TEXT30);
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
			if(type!=CharAttributeType.RES_GOLD&&type!=CharAttributeType.RES_BIND_GOLD){
				return;
			}
			
			userMon=MainRoleManager.actorInfo.totalStat.getResData(CharAttributeType.RES_GOLD)+ MainRoleManager.actorInfo.totalStat.getResData(CharAttributeType.RES_BIND_GOLD);
			updateView();
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
		
		private function onFreshItems(info:ClientItemInfo=null):void
		{
			if(isLockRefresh&&info.cfgId!=targetEquipInfo.cfgId){
				return;
			}
			
			if((info.containerID==ItemContainerID.Role||info.containerID==ItemContainerID.BackPack)&&
				(info.type==GoodsType.EQUIPMENT||info.type==GoodsType.EQUIPMENT1||
				info.type==GoodsType.EQUIPMENT2||isUse(info))){
				ItemManager.getBackEquip(initItem);
			}
		}
		
		private function getWashMsg(msg:ResEquipOperateResultMessage):void
		{
			if(msg.result==1){
				UIPopManager.showAlonePopUI(CenterEftPop,"ui_xilianchenggong");
				_sharedObject.flush();
				if(targetEquipInfo.smeltAtt1!=oldAtt1||(lock==0&&targetEquipInfo.smeltAtt2==oldAtt2)||lock==2){//洗的第一条
					this.playInter3DAt(ClientConfig.getEffect("ui_xiliansaoguang"),_skin.Item1.x+_skin.Item1.width/2,_skin.Item1.y+_skin.Item1.height/2,1,null,addEftComple);
				}else {//洗的第二条属性
					this.playInter3DAt(ClientConfig.getEffect("ui_xiliansaoguang"),_skin.Item2.x+_skin.Item2.width/2,_skin.Item2.y+_skin.Item2.height/2,1,null,addEftComple);
				}
			}
			isLockRefresh=false;
			refresh();
		}
		
		private function addEftComple(uint:RenderUnit3D):void
		{
			uint.play();
		}
		
		override public function refresh():void
		{
			userMon=MainRoleManager.actorInfo.totalStat.getResData(CharAttributeType.RES_GOLD)+ MainRoleManager.actorInfo.totalStat.getResData(CharAttributeType.RES_BIND_GOLD);
			ItemManager.getBackEquip(initItem);
		}
		
		private function initItem():void
		{
			var allEquips:Array=ItemManager.getAllEquipDatas();
			var num:int=allEquips.length;
			
			targetEquips=getSmeltEquips(allEquips);
			
			targetEquips.sort(onSortWashEquip);
			num=targetEquips.length;
			num=num>MIN_GRID?num:MIN_GRID;
			_goodsContainerTarget.setGridsCount(num,false);
			_goodsContainerTarget.refleshGridsByDatas(targetEquips);
			
			BackPackManager.instance.setCheckType([GoodsType.MATERIAL_COMBO]);//筛选出合成材料
			var backDatas:Array=BackPackManager.instance.getAllItem();
			BackPackManager.instance.setCheckType(null);//重置掉筛选
			
			useItems=getUseItems(backDatas);
			num=num>MIN_GRID?num:MIN_GRID;
			_goodsContainerUse.setGridsCount(num,false);
			_goodsContainerUse.refleshGridsByDatas(useItems);
			updateView();
		}
		
		/**
		 *排序提升装备 
		 * @return 
		 * 
		 */
		private  function onSortWashEquip(equipA : EquipInfo, equipB : EquipInfo):int
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
		
		/**
		 *可消耗的装备
		 * @return 
		 * 
		 */
		private function getUseItems(datas:Array):Vector.<ClientItemInfo>
		{
			var num:int=datas.length;
			var result:Vector.<ClientItemInfo>=new Vector.<ClientItemInfo>();
			for(var i:int=0;i<num;i++){
				var info:ClientItemInfo=datas[i];
				if(isUse(info)){//可消耗
					result.push(info);
				}
			}
			return result;
		}
		
		private function isUse(info:ClientItemInfo):Boolean
		{
			if(EquipWashCfg.washItems.indexOf(info.cfgId)!=-1){
				return true;
			}
			return false;
		}
		
		private function getSmeltEquips(datas:Array):Vector.<ClientItemInfo>
		{
			var num:int=datas.length;
			var result:Vector.<ClientItemInfo>=new Vector.<ClientItemInfo>();
			for(var i:int=0;i<num;i++){
				var info:ClientItemInfo=datas[i];
				if(isSmelt(info as EquipInfo)){
					if(targetEquipInfo&&info.itemInfo.itemId.ToGID()==targetEquipInfo.itemInfo.itemId.ToGID()){
						targetEquipInfo=info as EquipInfo;//更新掉
						targetEquipInfo.setContainerId(info.containerID);
						FaceUtil.SetItemGrid(_targetEquip, targetEquipInfo, true);
					}
					result.push(info);
				}else{
					if(targetEquipInfo&&info.itemInfo.itemId.ToGID()==targetEquipInfo.itemInfo.itemId.ToGID()){
						targetEquipInfo=null;
						_targetEquip.clear();
					}
				}
			}
			return result;
		}
		
		private function isSmelt(info:EquipInfo):Boolean
		{
			var job:int=MainRoleManager.actorInfo.job;
			if(info.qItem.q_job==job){
				return true;
			}
			return false;
		}
	}
}