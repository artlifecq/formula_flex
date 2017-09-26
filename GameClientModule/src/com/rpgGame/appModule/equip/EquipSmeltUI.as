package com.rpgGame.appModule.equip
{
	import com.game.engine3D.display.Inter3DContainer;
	import com.game.engine3D.display.InterObject3D;
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.gameClient.utils.HashMap;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.goods.BackPackManager;
	import com.rpgGame.app.manager.goods.ItemManager;
	import com.rpgGame.app.manager.goods.RoleEquipmentManager;
	import com.rpgGame.app.manager.pop.UIPopManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.sender.ItemSender;
	import com.rpgGame.app.ui.AttChangeView;
	import com.rpgGame.app.ui.alert.GameAlert;
	import com.rpgGame.app.ui.common.CenterEftPop;
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.view.icon.DragDropItem;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.appModule.bag.ItemGetPathPanel;
	import com.rpgGame.appModule.common.GoodsContainerPanel;
	import com.rpgGame.appModule.common.itemRender.GridItemRender;
	import com.rpgGame.core.events.ItemEvent;
	import com.rpgGame.core.events.MainPlayerEvent;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.coreData.cfg.AttValueConfig;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.cfg.NotifyCfgData;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.cfg.TipsCfgData;
	import com.rpgGame.coreData.cfg.item.EquipWashAttCfg;
	import com.rpgGame.coreData.cfg.item.EquipWashCfg;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.cfg.item.ItemContainerID;
	import com.rpgGame.coreData.clientConfig.Q_equip_wash;
	import com.rpgGame.coreData.clientConfig.Q_equip_wash_attr;
	import com.rpgGame.coreData.enum.AlertClickTypeEnum;
	import com.rpgGame.coreData.enum.SharedObjectEnum;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.alert.AlertSetInfo;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.info.item.EquipInfo;
	import com.rpgGame.coreData.info.item.GridInfo;
	import com.rpgGame.coreData.lang.LangAlertInfo;
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
	
	import feathers.controls.ScrollBarDisplayMode;
	import feathers.controls.Scroller;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.layout.TiledRowsLayout;
	import feathers.utils.filter.GrayFilter;
	
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
	public class EquipSmeltUI extends AttChangeView
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
		private var needMon:Number;
		
		private var userMon:Number;
		
		private var lock:int;
		private var _getPanel:ItemGetPathPanel;
		
		private var oldAtt1:int;
		
		private var oldAtt2:int;
		private var isLockRefresh:Boolean;
		private static var noAlertWash:Boolean;
		private var _alertJiPin:AlertSetInfo;
		private static var noAlertjipin:Boolean;
		
		private var _huoPenEftContaner1:Inter3DContainer;
		//		private var _huoPenEftContaner2:Inter3DContainer;
		//		private var _huoXingEftContaner:Inter3DContainer;
		
		private var _huoPen1:InterObject3D;
		private var _huoPen2:InterObject3D;
		private var _huoXing:InterObject3D;
		
		public function EquipSmeltUI(skin:StateSkin=null)
		{
			_skin=new Xilian_Skin();
			super(_skin);
			initView();
		}
		
		private function initView():void
		{
			_huoPenEftContaner1=new Inter3DContainer();
			_skin.container.addChildAt(_huoPenEftContaner1,3);
			_leftSkin=_skin.left.skin as Zhuangbei_left;
			
			(_leftSkin.title1.skin as TitileHead).uiLabel.styleName="ui/app/zhuangbei/daixilian.png";
			(_leftSkin.title2.skin as TitileHead).uiLabel.styleName="ui/app/zhuangbei/kexiaohao.png";
			
			_goodsContainerTarget=new GoodsContainerPanel(_leftSkin.list1,ItemContainerID.SMELT_LIST,createItemRender);
			_goodsContainerUse=new GoodsContainerPanel(_leftSkin.list2,ItemContainerID.SMELT_USE,createItemRender);
			
			_leftSkin.list1.clipContent = true;
			_leftSkin.list1.scrollBarDisplayMode = ScrollBarDisplayMode.ALWAYS_VISIBLE;
			_leftSkin.list1.horizontalScrollPolicy = Scroller.SCROLL_POLICY_OFF;
			_leftSkin.list1.verticalScrollPolicy = Scroller.SCROLL_POLICY_ON;
			
			_leftSkin.list1.padding=1;
			(_leftSkin.list1.layout as TiledRowsLayout).horizontalGap=1;
			(_leftSkin.list1.layout as TiledRowsLayout).verticalGap=2;
			
			_leftSkin.list2.clipContent = true;
			_leftSkin.list2.scrollBarDisplayMode = ScrollBarDisplayMode.ALWAYS_VISIBLE;
			_leftSkin.list2.horizontalScrollPolicy = Scroller.SCROLL_POLICY_OFF;
			_leftSkin.list2.verticalScrollPolicy = Scroller.SCROLL_POLICY_ON;
			
			_leftSkin.list2.padding=1;
			(_leftSkin.list2.layout as TiledRowsLayout).horizontalGap=1;
			(_leftSkin.list2.layout as TiledRowsLayout).verticalGap=2;
			
			_targetEquip=IconCDFace.create(64);
			_targetEquip.wearIsVisble=false;
			_targetEquip.selectImgVisible=false;
			_useItem=IconCDFace.create(64);
			_useItem.selectImgVisible=false;
			_useItem.bindBg(null);
			_targetEquip.x=506;
			_targetEquip.y=193;
			_targetEquip.bindBg(null);
			_skin.container.addChild(_targetEquip);
			_skin.container.addChild(_useItem);
			_skin.container.addChild(_skin.lb_num);
			_useItem.x=723;
			_useItem.y=193;
			_skin.lb_cailiao.text=LanguageConfig.getText(LangUI.UI_TEXT26);
			
			useItemInfo=new ClientItemInfo();
			useItemInfo.itemInfo=new ItemInfo();
			
			_sharedObject=SharedObject.getLocal(SharedObjectEnum.EQUIP_WASH);
			_getPanel=new ItemGetPathPanel();
			(_skin.left.skin as Zhuangbei_left).monyIcon.removeFromParent(true);
			(_skin.left.skin as Zhuangbei_left).monyTips.removeFromParent(true);
			
			_alertJiPin=new AlertSetInfo(LangAlertInfo.XILIAN_SURE);
			_alertJiPin.isShowCBox=true;
			initEff();
		}
		
		private function initEff():void
		{
			_huoPen1=_huoPenEftContaner1.playInter3DAt(ClientConfig.getEffect("ui_xilian_huopen"),407,270,0);
			_huoPen2=_huoPenEftContaner1.playInter3DAt(ClientConfig.getEffect("ui_xilian_huopen"),881,270,0);
			_huoXing=_huoPenEftContaner1.playInter3DAt(ClientConfig.getEffect("ui_xilian_huopen_huoxing"),467,180,0);
		}
		
		private function createItemRender():GridItemRender
		{
			var render:GridItemRender = new GridItemRender(IcoSizeEnum.ICON_42,GridBGType.GRID_SIZE_44);
			var grid:DragDropItem = render.getGrid();
			grid.onTouchEndCallBack = onTouchGrid;
			grid.checkDrag=checkDrag;
			grid.showCD=false;
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
				_goodsContainerTarget.setGrayIsSelect(targetEquipInfo,false);
			}
			
			var gridInfo:GridInfo=targetGrid.gridInfo;
			targetEquipInfo=gridInfo.data as EquipInfo;
			targetEquipInfo.setContainerId(gridInfo.containerID);
			FaceUtil.SetItemGrid(_targetEquip,targetEquipInfo);
			_targetEquip.selectImgVisible=false;
			_goodsContainerTarget.setGrayIsSelect(targetEquipInfo,true);
			
			var p:Point=new Point(targetGrid.x,targetGrid.y);
			p=targetGrid.parent.localToGlobal(p);
			p=_targetEquip.parent.globalToLocal(p);
			_targetEquip.x=p.x;
			_targetEquip.y=p.y;
			if(tweenEquip){
				tweenEquip.kill();
			}
			tweenEquip=TweenMax.to(_targetEquip,1,{x:506,y:193,ease:Expo.easeOut});
			
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
				case _skin.Item1.skin["lb_name0"]:
					getItemSkin(_skin.Item1).chk_suoding.isSelected=!getItemSkin(_skin.Item1).chk_suoding.isSelected;
					if(getItemSkin(_skin.Item1).chk_suoding.isSelected){
						getItemSkin(_skin.Item2).chk_suoding.isSelected=!getItemSkin(_skin.Item1).chk_suoding.isSelected;
					}
					break;
				case _skin.Item1.skin["chk_suoding"]:
					//					getItemSkin(_skin.Item1).chk_suoding.isSelected=!getItemSkin(_skin.Item1).chk_suoding.isSelected;
					if(getItemSkin(_skin.Item1).chk_suoding.isSelected){
						getItemSkin(_skin.Item2).chk_suoding.isSelected=!getItemSkin(_skin.Item1).chk_suoding.isSelected;
					}
					_leftSkin.lb_yinzi.text=getTitleText(LanguageConfig.getText(LangUI.UI_TEXT27),needMon,userMon);
					break;
				case _skin.Item2.skin["lb_name0"]:
					getItemSkin(_skin.Item2).chk_suoding.isSelected=!getItemSkin(_skin.Item2).chk_suoding.isSelected;
					if(getItemSkin(_skin.Item2).chk_suoding.isSelected){
						getItemSkin(_skin.Item1).chk_suoding.isSelected=!getItemSkin(_skin.Item2).chk_suoding.isSelected;
					}	
					break;
				case _skin.Item2.skin["chk_suoding"]:
					//					getItemSkin(_skin.Item2).chk_suoding.isSelected=!getItemSkin(_skin.Item2).chk_suoding.isSelected;
					if(getItemSkin(_skin.Item2).chk_suoding.isSelected){
						getItemSkin(_skin.Item1).chk_suoding.isSelected=!getItemSkin(_skin.Item2).chk_suoding.isSelected;
					}				
					_leftSkin.lb_yinzi.text=getTitleText(LanguageConfig.getText(LangUI.UI_TEXT27),needMon,userMon);
					break;
				case _skin.lb_cailiao:
					_getPanel.show(useItemInfo.cfgId,0,this._skin.container)
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
				//				alertOk.alertInfo.align="left";
				GameAlert.showAlert(alertOk,onAlert,[type]);
				return;
			}
			if(chackIsHaveMaxAtt()&&!noAlertjipin)
			{
				GameAlert.showAlert(_alertJiPin,onAlertJiPin,[type]);
				return;
			}else
				ItemSender.washEquip(targetEquipInfo.itemInfo.itemId,type,lock);
		}
		
		private function chackIsHaveMaxAtt():Boolean
		{
			var cfg:Q_equip_wash_attr=EquipWashAttCfg.getEquipWashAttr(targetEquipInfo.smeltAtt1);
			if(cfg&&cfg.q_quality>=4&&!getItemSkin(_skin.Item1).chk_suoding.isSelected) return true;
			cfg=EquipWashAttCfg.getEquipWashAttr(targetEquipInfo.smeltAtt2);
			if(cfg&&cfg.q_quality>=4&&!getItemSkin(_skin.Item2).chk_suoding.isSelected) return true;
			return false;
		}
		
		private  function onAlert(gameAlert:GameAlert,datas:Array):void
		{
			noAlertWash=gameAlert.isCheckSelected;
			noAlertjipin=gameAlert.isCheckSelected;
			switch(gameAlert.clickType)
			{
				case AlertClickTypeEnum.TYPE_SURE:
					ItemSender.washEquip(targetEquipInfo.itemInfo.itemId,datas[0],lock);
					break;
			}
		}
		
		private  function onAlertJiPin(gameAlert:GameAlert,datas:Array):void
		{
			noAlertjipin=gameAlert.isCheckSelected;
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
				_goodsContainerTarget.setGrayIsSelect(targetEquipInfo,false);
				targetEquipInfo=null;
			}
			
			for each(var item:ClientItemInfo in useItems){
				_goodsContainerUse.setGrayForData(item,false);
				_goodsContainerUse.setGrayIsSelect(item,false);
			}
			
			_targetEquip.clear();
			_useItem.clear();
			updateView();
		}
		
		private function updateView():void
		{
			if(targetEquipInfo){
				_skin.btn_xilian.filter=null;
				useItemInfo.count=BackPackManager.instance.getBagItemsCountById(washCfg.q_item_id);
				changeAttState(_skin.Item1,true);
				changeAttState(_skin.Item2,true);
				var target:Object;
				needMon=0;
				if(targetEquipInfo.smeltAtt1!=0){
					if(targetEquipInfo.smeltAtt1!=oldAtt1&&oldAtt1!=0){//刷新
						getItemSkin(_skin.Item1).lb_name.htmlText=CharAttributeType.getWashName(targetEquipInfo.smeltAtt1);//新的
						getItemSkin(_skin.Item1).lb_name0.htmlText=CharAttributeType.getWashName(oldAtt1);//老的
						target=getItemSkin(_skin.Item1).lb_name;
						TweenMax.fromTo(target,1,{x:-200,alpha:0},{x:1,alpha:1,ease:Expo.easeOut});
						target=getItemSkin(_skin.Item1).lb_name0;
						TweenMax.fromTo(target,1,{x:1,alpha:1},{x:200,alpha:0,ease:Expo.easeOut});
					}else{
						if(targetEquipInfo.smeltAtt1==oldAtt1){//洗出的是老属性
							getItemSkin(_skin.Item1).lb_name.htmlText=getItemSkin(_skin.Item1).lb_name0.htmlText=CharAttributeType.getWashName(targetEquipInfo.smeltAtt1);
							target=getItemSkin(_skin.Item1).lb_name;
							TweenMax.fromTo(target,1,{x:-200,alpha:0},{x:1,alpha:1,ease:Expo.easeOut});
							target=getItemSkin(_skin.Item1).lb_name0;
							TweenMax.fromTo(target,1,{x:1,alpha:1},{x:200,alpha:0,ease:Expo.easeOut});
						}else{
							getItemSkin(_skin.Item1).lb_name.htmlText=CharAttributeType.getWashName(targetEquipInfo.smeltAtt1);
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
						getItemSkin(_skin.Item2).lb_name.htmlText=CharAttributeType.getWashName(targetEquipInfo.smeltAtt2);//新的
						getItemSkin(_skin.Item2).lb_name0.htmlText=CharAttributeType.getWashName(oldAtt2);//老的
						target=getItemSkin(_skin.Item2).lb_name;
						TweenMax.fromTo(target,1,{x:-200,alpha:0},{x:1,alpha:1,ease:Expo.easeOut});
						target=getItemSkin(_skin.Item2).lb_name0;
						TweenMax.fromTo(target,1,{x:1,alpha:1},{x:200,alpha:0,ease:Expo.easeOut});
					}else{
						if(targetEquipInfo.smeltAtt2==oldAtt2){//洗出的是老属性)
							getItemSkin(_skin.Item2).lb_name.htmlText=getItemSkin(_skin.Item2).lb_name0.htmlText=CharAttributeType.getWashName(targetEquipInfo.smeltAtt2);
						}else{
							getItemSkin(_skin.Item2).lb_name.htmlText=CharAttributeType.getWashName(targetEquipInfo.smeltAtt2);
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
					_skin.lb_num.color=StaticValue.RED_TEXT;
				}else{
					_skin.lb_num.color=StaticValue.GREEN_TEXT;
				}
				
				_leftSkin.lb_yinzi.text=getTitleText(LanguageConfig.getText(LangUI.UI_TEXT27),needMon,userMon);
				
			}else{
				GrayFilter.gray(_skin.btn_xilian);
				changeAttState(_skin.Item1,false);
				changeAttState(_skin.Item2,false);
				_skin.lb_num.text="";
				_skin.lb_item1.text="";
				_skin.lb_item2.text="";
				_skin.lb_cailiao.text="";
				_leftSkin.lb_yinzi.text=getTitleText(LanguageConfig.getText(LangUI.UI_TEXT27),0);
			}
			
			//			_goodsContainerTarget.dataProvider.updateAll();
			//			_goodsContainerUse.dataProvider.updateAll();
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
				des=noSlip?HtmlTextUtil.getTextColor(StaticValue.GREEN_TEXT,value):HtmlTextUtil.getTextColor(StaticValue.GREEN_TEXT,value+"/"+value1);//绿色
			}else{
				des=noSlip?HtmlTextUtil.getTextColor(StaticValue.RED_TEXT,value):HtmlTextUtil.getTextColor(StaticValue.RED_TEXT,value+"/"+value1);//红色
			}
			return title+":"+des;
		}
		
		private function changeAttState(Item:SkinnableContainer,state:Boolean):void
		{
			getItemSkin(Item).lb_name.text="????";
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
					_goodsContainerUse.setGrayIsSelect(item,true);
				}else{
					_goodsContainerUse.setGrayForData(item,true);
					_goodsContainerUse.setGrayIsSelect(item,false);
				}
			}
		}
		
		override public function show(data:Object=null):void
		{
			initEvent();
			getItemSkin(_skin.Item1).chk_suoding.isSelected=false;
			getItemSkin(_skin.Item2).chk_suoding.isSelected=false;
			refresh();
			if( _huoPen1) _huoPen1.start();
			if( _huoPen2) _huoPen2.start();
			if( _huoXing) _huoXing.start();
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
		
		override public function hideView():void
		{
			super.hideView();
			onCancelTarget();
			
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
			if( _huoPen1) _huoPen1.stop();
			if( _huoPen2) _huoPen2.stop();
			if( _huoXing) _huoXing.stop();
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
			onTab(null);
			
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
		
		/**获取提升的属性值（这个是前端自己算的）*/
		private function getupdateAtt(currentLv:EquipInfo,upLv:EquipInfo=null):void
		{
			var has_curr:HashMap=AttValueConfig.getAllAttByEquip(currentLv);
			var has_up:HashMap=AttValueConfig.getAllAttByEquip(upLv);
			var has:HashMap=new HashMap();
			var v1:int;
			var v2:int;
			var keys_curr:Array=has_curr.keys();
			var keys_up:Array=has_up.keys();
			var keys:Array=mergeType(keys_up,keys_curr);
			for(var i:int=0;i<keys.length;i++)
			{
				var type:int=keys[i];
				if(has_curr.getValue(type)) v1=has_curr.getValue(type);
				else v1=0;
				if(has_up.getValue(type)) v2=has_up.getValue(type);
				else v2=0;
				var num:int=AttValueConfig.getDisAttValue(type,(v2-v1));
				if(num!=0)
					has.put(type,num);
			}
			attChangeEft.addChangeHandler(has);
		}
		
		//合并类型
		private function mergeType(arr1:Array,arr2:Array):Array
		{
			var list:Array;
			for(var i:int=0;i<arr2.length;i++)
			{
				if(!hasType(arr1,arr2[i]))
					arr1.push(arr2[i]);
			}
			return arr1;
		}
		
		private function hasType(arr1:Array,type:int):Boolean
		{
			for(var i:int=0;i<arr1.length;i++)
			{
				if(arr1[i]==type) return true;
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
						//						trace("当前的1ID："+targetEquipInfo.smeltAtt1+"  琢磨后的值ID：——"+(info as EquipInfo).smeltAtt1+"\n");
						//						trace("当前的2ID："+targetEquipInfo.smeltAtt2+"  琢磨后的值ID：——"+(info as EquipInfo).smeltAtt2+"\n");
						if(targetEquipInfo.smeltAtt1!=(info as EquipInfo).smeltAtt1||targetEquipInfo.smeltAtt2!=(info as EquipInfo).smeltAtt2)
						{
							getupdateAtt(targetEquipInfo,info as EquipInfo);
						}
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