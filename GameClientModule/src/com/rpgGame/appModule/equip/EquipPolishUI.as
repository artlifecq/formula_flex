package com.rpgGame.appModule.equip
{
	import com.game.engine3D.display.Inter3DContainer;
	import com.game.engine3D.display.InterObject3D;
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.gameClient.utils.HashMap;
	import com.rpgGame.app.manager.chat.ChatManager;
	import com.rpgGame.app.manager.chat.NoticeManager;
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
	import com.rpgGame.coreData.cfg.GlobalSheetData;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.cfg.NotifyCfgData;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.cfg.TipsCfgData;
	import com.rpgGame.coreData.cfg.item.EquipPolishCfg;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.cfg.item.ItemContainerID;
	import com.rpgGame.coreData.clientConfig.Q_equip_polish;
	import com.rpgGame.coreData.enum.AlertClickTypeEnum;
	import com.rpgGame.coreData.enum.AlertTypeEnum;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.alert.AlertSetInfo;
	import com.rpgGame.coreData.info.face.IBaseFaceInfo;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.info.item.EquipInfo;
	import com.rpgGame.coreData.info.item.GridInfo;
	import com.rpgGame.coreData.info.item.ItemUtil;
	import com.rpgGame.coreData.lang.LangAlertInfo;
	import com.rpgGame.coreData.lang.LangSpell;
	import com.rpgGame.coreData.lang.LangUI;
	import com.rpgGame.coreData.type.CharAttributeType;
	import com.rpgGame.coreData.type.chat.EnumChatChannelType;
	import com.rpgGame.coreData.type.item.GridBGType;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	import com.rpgGame.netData.equip.message.ResEquipOperateResultMessage;
	
	import flash.geom.Point;
	
	import app.message.EquipOperateType;
	import app.message.GoodsType;
	
	import away3d.events.Event;
	
	import feathers.controls.List;
	import feathers.controls.ScrollBarDisplayMode;
	import feathers.controls.Scroller;
	import feathers.data.ListCollection;
	import feathers.events.FeathersEventType;
	import feathers.layout.TiledRowsLayout;
	import feathers.utils.filter.GrayFilter;
	
	import gs.TweenMax;
	import gs.easing.Expo;
	
	import org.client.mainCore.manager.EventManager;
	import org.game.netCore.data.long;
	import org.mokylin.skin.app.zhuangbei.Zhuangbei_left;
	import org.mokylin.skin.app.zhuangbei.qianghua.ListItem_Skin;
	import org.mokylin.skin.app.zhuangbei.qianghua.TitileHead;
	import org.mokylin.skin.app.zhuangbei.zuomo.Zuomo_Skin;
	
	import starling.display.DisplayObject;
	
	/**
	 *装备琢磨
	 *@author dik
	 *2017-4-11下午5:55:11
	 */
	public class EquipPolishUI extends AttChangeView
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
		private var tween:TweenMax;
		
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
		private var _progressBar_lv:AwdProgressBar;
		private var isLockRefresh:Boolean;
		
		private var eftCon:Inter3DContainer;
		private var zuomoEft:InterObject3D;
		private static var noAlertUse:Boolean;
		private var alertOkTips:AlertSetInfo;
		
		private var _isMax:Boolean;
		public function EquipPolishUI()
		{
			_skin=new Zuomo_Skin();
			
			super(_skin);
			initView();
			//			_skin.progressBar1.visible=false;
		}
		
		private function initView():void
		{
			_skin.up_title.text="装备属性提升:";
			_skin.lb_up1.width=_skin.lb_up2.width=90;
			
			alertOkTips=new AlertSetInfo(LangAlertInfo.EQUIP_USE_TIPS);
			alertOkTips.isShowCBox=true;
			
			useListIds=new Vector.<long>();
			_leftSkin=_skin.left.skin as Zhuangbei_left;
			
			(_leftSkin.title1.skin as TitileHead).uiLabel.styleName="ui/app/zhuangbei/daizhuomo.png";
			(_leftSkin.title2.skin as TitileHead).uiLabel.styleName="ui/app/zhuangbei/kexiaohao.png";
			
			_progressBar_lv=new AwdProgressBar(_skin.progressBar1,"ui_zuomotiao_lvse");
			_skin.grp_jiacheng.addChild(_progressBar_lv);
			_progressBar=new AwdProgressBar(_skin.progressBar2,"ui_zuomotiao");
			_skin.grp_jiacheng.addChild(_progressBar);
			_skin.grp_jiacheng.addChild(_skin.lb_pro);
			_goodsContainerTarget=new GoodsContainerPanel(_leftSkin.list1,ItemContainerID.POLIST_LIST,createItemRender);
			_goodsContainerUse=new GoodsContainerPanel(_leftSkin.list2,ItemContainerID.POLIST_USE,createItemRender);
			
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
			
			selectedUse=new Vector.<ClientItemInfo>();
			lvDatas=new Array();
			for(var i:int=1;i<11;i++){
				lvDatas.push(ItemUtil.getLevele(i));
			}
			_skin.cmb_dengjie.addEventListener(FeathersEventType.CREATION_COMPLETE,onCreate);
			
			qualityDatas=new Array();
			for(i=1;i<4;i++){
				qualityDatas.push(ItemUtil.getQualityName(i)+LanguageConfig.getText(LangUI.UI_TEXT5));
			}
			_skin.cmb_pinzhi.addEventListener(FeathersEventType.CREATION_COMPLETE,onCreatePinZhi);
			
			_useEquipGrids=new Vector.<DragDropItem>();
			for(i=0;i<6;i++){
				_useEquipGrids.push(new DragDropItem(IcoSizeEnum.ICON_42,i));
				_useEquipGrids[i].gridInfo=new GridInfo(ItemContainerID.POLIST_USE,i);
				_useEquipGrids[i].bindBg(_skin["use"+(i+1)]);
				_skin.use_grp.addChild(_useEquipGrids[i]);
				_useEquipGrids[i].onTouchEndCallBack=onCancelUse;
				//				_useEquipGrids[i].x=_skin["use"+i].x;
				//				_useEquipGrids[i].y=_skin["use"+i].y;
				_useEquipGrids[i].dragAble = true;
			}
			
			_targetEquip=new DragDropItem(IcoSizeEnum.ICON_64,0);
			_targetEquip.wearIsVisble=false;
			_targetEquip.onTouchEndCallBack=onCancelTarget;
			_targetEquip.dragAble = true;
			_targetEquip.checkDrag=checkDrag;
			_skin.container.addChild(_targetEquip);
			_targetEquip.x=614;
			_targetEquip.y=198;
			_targetEquip.bindBg(null);
			
			eftCon=new Inter3DContainer();
			//			zuomoEft=eftCon.playInter3DAt(ClientConfig.getEffect("ui_zhuomo"),-45,10,0);
			this._skin.grp_cilun.addChild(eftCon);
			
			perMon=GlobalSheetData.getSettingInfo(503).q_int_value;
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
			
			if(itemInfo.qItem.q_type!=GoodsType.STRENGTH){
				_goodsContainerUse.setGrayIsSelect(itemInfo,false);
				_goodsContainerTarget.setGrayIsSelect(itemInfo,false);
			}else if(itemInfo.qItem.q_type==GoodsType.STRENGTH){
				var info:ClientItemInfo=_goodsContainerUse.getDragDropItemByLong(itemInfo.itemInfo.itemId);
				if(info){
					info.count = info.itemInfo.num-getItemNum(info);
					_goodsContainerUse.setGrayIsSelect(info,false);
				}
			}
			if(itemInfo.qItem.q_type!=GoodsType.STRENGTH&&isPolish(itemInfo as EquipInfo))
			{
				_goodsContainerTarget.setGrayIsSelect(itemInfo,false);
			}
			addExp=getAddExt();
			if(addExp<0){
				addExp=0;
			}
			updateView();
		}
		
		private function getItemNum(info:ClientItemInfo):int
		{
			if(selectedUse==null||selectedUse.length==0) return 0;
			var num:int=0;
			for(var i:int=0;i<selectedUse.length;i++)
			{
				if(selectedUse[i].itemInfo.itemId.EqualTo(info.itemInfo.itemId))
					num++;
			}
			return num;
		}
		
		private function getAddExt():int
		{
			var ax:int=0;
			if(selectedUse==null||selectedUse.length==0) return ax;
			for(var i:int=0;i<selectedUse.length;i++)
			{
				ax+=selectedUse[i].qItem.q_polish_num;
			}
			return ax;
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
			cancelAllUse();
			var targetGrid:DragDropItem;
			if(targetEquipInfo){
				_goodsContainerTarget.setGrayIsSelect(targetEquipInfo,false);
				if(isUse(targetEquipInfo)){//是消耗品
					useEquips.push(targetEquipInfo);
					useEquips.sort(sortForUse);
					_goodsContainerUse.refleshGridsByDatas(useEquips);
					_goodsContainerUse.setGrayIsSelect(targetEquipInfo,false);
				}
				targetEquipInfo=null;
			}
			
			_targetEquip.setGridEmpty();
			updateView();
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
			grid.showCD=false;
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
			this.playInter3DAt(ClientConfig.getEffect("ui_zhuomojuji"),(_targetEquip.x+_targetEquip.width/2),(_targetEquip.y+_targetEquip.height/2),1);
			
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
					if(item.qItem.q_type==GoodsType.STRENGTH){
						result.push(item);
						continue;
					}
					if(item is EquipInfo&&isDuanZao(item as EquipInfo)){//具有锻造属性
						continue;
					}
					if(item.qItem.q_levelnum<=lv&&item.quality<=quality&&item!=targetEquipInfo){//符合阶数和品质筛选
						result.push(item);
					}
				}
			}
			result.sort(sortForUse);
			
			addExp=0;
			useListIds.length=0;
			isToUp=false;
			userMon=MainRoleManager.actorInfo.totalStat.getResData(CharAttributeType.RES_BIND_MONEY)+ MainRoleManager.actorInfo.totalStat.getResData(CharAttributeType.RES_MONEY);
			for(var i:int=0;i<result.length;i++){
				item=result[i];
				
				if(item.type==GoodsType.STRENGTH){
					for(var j:int=0;j<item.itemInfo.num;j++)
					{
						addExp+=item.qItem.q_strengthen_num;
						useMon=addExp*perMon;
						if(userMon<useMon){//钱不够
							addExp-=item.qItem.q_strengthen_num;
							break;
						}
						useListIds.push(item.itemInfo.itemId);
						if(addExp>EquipPolishCfg.maxCfg.q_exp){
							isToUp=true;//到顶级了
							break;
						}
					}
				}
				else{
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
			}
			
			trace("本次消耗的钱："+useMon);
			
			if(addExp<0){
				addExp=0;
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
			this.playInter3DAt(ClientConfig.getEffect("ui_zhuomojuji"),(_targetEquip.x+_targetEquip.width/2),(_targetEquip.y+_targetEquip.height/2),1);
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
			if(gridInfo.data==null||grid.isSelect){
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
			
			if(_isMax){
				NoticeManager.showNotifyById(6003);
				return;
			}
			
			var itemInfo:ClientItemInfo=gridInfo.data as ClientItemInfo;
			var equip:EquipInfo=itemInfo as EquipInfo;
			if(equip!=null&&isDuanZao(equip)&&!noAlertUse){
				GameAlert.showAlert(alertOkTips,onAlert,[itemInfo]);
			}else{
				setUseItem(itemInfo);
			}
		}
		
		private function isDuanZao(equipInfo:EquipInfo):Boolean
		{
			return equipInfo.strengthExp!=0||equipInfo.polishExp!=0||equipInfo.smeltAtt1!=0||equipInfo.smeltAtt2!=0;
		}
		
		private  function onAlert(gameAlert:GameAlert,datas:Array):void
		{
			if(gameAlert.clickType==AlertClickTypeEnum.TYPE_SURE){
				noAlertUse=gameAlert.isCheckSelected;
				setUseItem(datas[0]);
			}
		}
		
		private function setUseItem(itemInfo:ClientItemInfo):void
		{
			if(itemInfo.qItem.q_type!=GoodsType.STRENGTH)
			{
				_goodsContainerUse.setGrayIsSelect(itemInfo,true);
				useListIds.length=0;
				selectedUse.push(itemInfo);
				refreshUseEquipGrid();
				addExp+=itemInfo.qItem.q_polish_num;
				updateView();			
			}
			else if(itemInfo.qItem.q_type==GoodsType.STRENGTH){
				if(itemInfo.count>0){
					var info:ClientItemInfo=ItemUtil.convertClientItemInfoById(itemInfo.qItem.q_id);
					info.itemInfo.itemId=itemInfo.itemInfo.itemId;
					info.count=1;
					if(!_isMax&&selectedUse.length<6)
					{
						selectedUse.push(info);
						refreshUseEquipGrid();
						addExp+=info.qItem.q_strengthen_num;
						updateView();
						itemInfo.count=itemInfo.itemInfo.num-getItemNum(info);
					}
					if(itemInfo.count>0)
						_goodsContainerUse.setGrayIsSelect(itemInfo,false);	
					else
						_goodsContainerUse.setGrayIsSelect(itemInfo,true);	
				}
			}
			
			if(itemInfo.qItem.q_type!=GoodsType.STRENGTH&&isPolish(itemInfo as EquipInfo)){
				_goodsContainerTarget.setGrayIsSelect(itemInfo,true);
			}	
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
			_isMax=false;
			var gridInfo:GridInfo=targetGrid.gridInfo;
			if(targetEquipInfo){
				_goodsContainerTarget.setGrayIsSelect(targetEquipInfo,false);
				if(isUse(targetEquipInfo)){
					useEquips.push(targetEquipInfo);
					useEquips.sort(sortForUse);
					_goodsContainerUse.refleshGridsByDatas(useEquips);
					_goodsContainerUse.setGrayIsSelect(targetEquipInfo,false);
				}
			}
			
			cancelAllUse();
			
			_targetEquip.gridInfo=gridInfo;
			
			targetEquipInfo=gridInfo.data as EquipInfo;
			_goodsContainerTarget.setGrayIsSelect(targetEquipInfo,true);
			var p:Point=new Point(targetGrid.x,targetGrid.y);
			p=targetGrid.parent.localToGlobal(p);
			p=_targetEquip.parent.globalToLocal(p);
			_targetEquip.x=p.x;
			_targetEquip.y=p.y;
			if(tweenEquip){
				tweenEquip.kill();
			}
			tweenEquip=TweenMax.to(_targetEquip,1,{x:614,y:198,ease:Expo.easeOut});
			
			if(isUse(targetEquipInfo)){
				deleteItems(useEquips,targetEquipInfo);
				_goodsContainerUse.refleshGridsByDatas(useEquips);
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
				_skin.btn_zuomo.filter=null;
				_skin.btn_zuomo_all.visible=true;
				currCfg=EquipPolishCfg.getPolishCfg(targetEquipInfo.polishLevel);
				_skin.lb_name.color=ItemConfig.getItemQualityColor(targetEquipInfo.cfgId);
				_skin.lb_name.text=targetEquipInfo.name;
				//				_skin.lb_dengji.htmlText=LanguageConfig.getText(LangUI.UI_TEXT10)+":"+targetEquipInfo.polishLevel+LanguageConfig.getText(LangUI.UI_TEXT7);
				getUpLv();
				_skin.lb_current.text=(upCfg.q_equip_polish-1)+LanguageConfig.getText(LangUI.UI_TEXT7);
				if(upCfg.q_equip_polish==EquipPolishCfg.maxLv){
					_skin.lb_next.text="MAX";
				}else{
					_skin.lb_next.text=upCfg.q_equip_polish+LanguageConfig.getText(LangUI.UI_TEXT7);
				}
				if(currCfg==null&&targetEquipInfo.polishExp>0&&upCfg.q_equip_polish==1){
					var nextcfg:Q_equip_polish=EquipPolishCfg.getPolishCfg(targetEquipInfo.polishLevel+1);
					_progressBar.maximum=nextcfg.q_exp;
					_progressBar.value=targetEquipInfo.polishExp;
					_progressBar.visible=true;
				}
				else if(currCfg&&currCfg.q_equip_polish+1==upCfg.q_equip_polish)
				{
					_progressBar.maximum=upCfg.q_exp-currCfg.q_exp;
					_progressBar.value=targetEquipInfo.polishExp-currCfg.q_exp;
					_progressBar.visible=true;
				}else	{
					_progressBar.visible=false;
				}
				_progressBar_lv.maximum=allExp;
				_progressBar_lv.value=currentExp;
				if(!_progressBar_lv.visible)
					_progressBar_lv.visible=true;
				_skin.lb_pro.text=currentExp+"/"+allExp;
				useMon=addExp*perMon;
				userMon=MainRoleManager.actorInfo.totalStat.getResData(CharAttributeType.RES_BIND_MONEY)+ MainRoleManager.actorInfo.totalStat.getResData(CharAttributeType.RES_MONEY);
				_leftSkin.lb_yinzi.htmlText=getTitleText(LanguageConfig.getText(LangUI.UI_TEXT4),useMon,userMon);
				
				if(canUpNum!=0){//能升级
					updateAttShow(currCfg,upCfg);
				}else{
					updateAttShow(currCfg);
				}			
				if(_skin.cmb_dengjie.alpha==0&&!tween){
					tween=TweenMax.fromTo(_skin.cmb_dengjie,1,{x:455,alpha:0},{x:384,alpha:1,ease:Expo.easeOut,onComplete:showComplete});
					TweenMax.fromTo(_skin.cmb_pinzhi,1,{x:555,alpha:0},{x:466,alpha:1,ease:Expo.easeOut,onComplete:showComplete});
				}
			}else{
				GrayFilter.gray(_skin.btn_zuomo);
				_skin.btn_zuomo_all.visible=false;
				_skin.lb_current.text=_skin.lb_next.text="";
				_skin.lb_name.text="";
				//				_skin.lb_dengji.text="";
				_skin.lb_pro.text=_skin.lb_baifenbi.text="";
				_skin.up_title.visible=false;
				//				_progressBar.value=0;
				_progressBar.value=0;
				_progressBar_lv.value=0;
				_skin.arrow_up1.visible=_skin.lb_up1.visible=false;
				_skin.arrow_up2.visible=_skin.lb_up2.visible=false;
				_leftSkin.lb_yinzi.text=getTitleText(LanguageConfig.getText(LangUI.UI_TEXT4),0);
				if(_skin.cmb_dengjie.alpha==1&&!tween){
					tween=TweenMax.fromTo(_skin.cmb_dengjie,0.6,{x:384,alpha:1},{x:455,alpha:0,ease:Expo.easeOut,onComplete:showComplete});
					TweenMax.fromTo(_skin.cmb_pinzhi,0.6,{x:466,alpha:1},{x:555,alpha:0,ease:Expo.easeOut,onComplete:showComplete});
				}
			}		
		}
		
		private function showComplete():void
		{
			tween=null;
		}
		
		private function updateAttShow(current:Q_equip_polish,up:Q_equip_polish=null):void
		{
			var current_promote:int;
			if(!current){
				current_promote=0;
			}else{
				current_promote=current.q_promote;
			}
			_skin.lb_baifenbi.text=Number((current_promote/1000).toFixed(1))+"%";
			if(up){
				_skin.arrow_up2.visible=_skin.lb_up2.visible=true;
				_skin.arrow_up1.visible=_skin.lb_up1.visible=true;			
				_skin.lb_up2.text=Number(((up.q_promote-current_promote)/1000).toFixed(1))+"%";
				if(currCfg)
					_skin.lb_up1.text=(nowCfg.q_equip_polish-currCfg.q_equip_polish).toString();
				else
					_skin.lb_up1.text=nowCfg.q_equip_polish.toString();
			}else{
				_skin.arrow_up1.visible=_skin.lb_up1.visible=false;			
				_skin.arrow_up2.visible=_skin.lb_up2.visible=false;		
			}
			
			_skin.lb_baifenbi.width=_skin.lb_baifenbi.textWidth+15;
			_skin.lb_baifenbi.width=_skin.lb_baifenbi.width<36?36:_skin.lb_baifenbi.width;
			_skin.arrow_up2.x=_skin.lb_baifenbi.x+_skin.lb_baifenbi.width+5;
			_skin.lb_up2.x=_skin.arrow_up2.x+_skin.arrow_up2.width+10;
			_skin.up_title.visible=true;
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
		
		private var nowCfg:Q_equip_polish;
		private function getUpLv():void
		{
			var maxLv:int=EquipPolishCfg.maxLv;
			var exp:int=targetEquipInfo.polishExp+addExp;//总值+消耗后获得的值
			if(currCfg)
			{
				exp=exp-currCfg.q_exp;
			}
			var currentLv:int=targetEquipInfo.polishLevel;
			var upExp:int;
			var nextCfg:Q_equip_polish;
			nowCfg=null;
			canUpNum=0;
			if(currentLv<maxLv)
			{
				while(currentLv<=maxLv){
					nowCfg=EquipPolishCfg.getPolishCfg(currentLv);
					currentLv++;
					nextCfg=EquipPolishCfg.getPolishCfg(currentLv);//下一级的配置
					upExp=nextCfg.q_exp-(nowCfg!=null?nowCfg.q_exp:0);//升级所需
					upCfg=nextCfg;
					
					if(exp-upExp<0){//不够升级不查找
						break;
					}else{
						exp=exp-upExp;
					}
					canUpNum++;
				}
				
				if(!upCfg){
					upCfg=nextCfg;
				}
				
				if(nowCfg)
				{
					allExp=upCfg.q_exp-nowCfg.q_exp;		
				}
				else
				{
					allExp=upCfg.q_exp;
				}
				currentExp=exp;
				if(upCfg.q_equip_polish==maxLv&&allExp<=currentExp){
					_isMax=true;
				}else{
					_isMax=false;
				}
			}
			else{
				allExp=0;
				currentExp=0;
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
						_goodsContainerTarget.setGrayIsSelect(item,false);
					}
					if(item.qItem.q_type!=GoodsType.STRENGTH)
					{
						info=getGridInfo(_goodsContainerUse.dataProvider,grid.gridInfo.data);
						if(info){
							_goodsContainerUse.setGrayIsSelect(item,false);
						}
					}else if(item.qItem.q_type==GoodsType.STRENGTH){
						var infoitem:ClientItemInfo=_goodsContainerUse.getDragDropItemByLong(item.itemInfo.itemId);
						if(infoitem){
							infoitem.count=infoitem.itemInfo.num;
							_goodsContainerUse.setGrayIsSelect(infoitem,false);
						}
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
			//			zuomoEft.start();
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
			//			zuomoEft.stop();
			_isMax=false;
			cancelAllUse();
			if(targetEquipInfo){
				_goodsContainerTarget.setGrayIsSelect(targetEquipInfo,false);
				if(isUse(targetEquipInfo)){//是消耗品
					_goodsContainerUse.setGrayIsSelect(targetEquipInfo,false);
				}
				targetEquipInfo=null;
			}
			if(_skin.cmb_dengjie.alpha==1&&!tween){
				tween=TweenMax.fromTo(_skin.cmb_dengjie,0.6,{x:384,alpha:1},{x:455,alpha:0,ease:Expo.easeOut,onComplete:showComplete});
				TweenMax.fromTo(_skin.cmb_pinzhi,0.6,{x:466,alpha:1},{x:555,alpha:0,ease:Expo.easeOut,onComplete:showComplete});
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
				alertOk.alertInfo.alertType=AlertTypeEnum.ALERT_TYPE_OK;
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
				ChatManager.onShowChatInChatBar(alertOk.alertInfo.value, EnumChatChannelType.CHAT_CHANNEL_SYSTEM);
				//				GameAlert.showAlert(alertOk);
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
			var allEquips:Array=ItemManager.getusecailiao();
			var num:int=allEquips.length;
			targetEquips=getPolishEquips(allEquips);
			targetEquips.sort(onSortPolishEquip);
			num=targetEquips.length;
			num=num>MIN_GRID?num:MIN_GRID;
			_goodsContainerTarget.setGridsCount(num,false);
			onTab(null);
			
			useEquips=getUseEquips(allEquips);
			useEquips.sort(sortForUse);
			num=num>MIN_GRID?num:MIN_GRID;
			_goodsContainerUse.setGridsCount(num,false);
			_goodsContainerUse.refleshGridsByDatas(useEquips);
			
			selectedUse.length=0;
			refreshUseEquipGrid();
			
			updateAll();
		}
		
		private function sortForUse(itemA:ClientItemInfo, itemB:ClientItemInfo):int
		{
			if(itemA.qItem.q_type==GoodsType.STRENGTH&&itemB.qItem.q_type==GoodsType.STRENGTH)
			{
				if(itemA.qItem.q_default<itemB.qItem.q_default) return -1;
				else if(itemA.qItem.q_default>itemB.qItem.q_default) return 1;
				else return 0;
			}	
			else if(itemA.qItem.q_type==GoodsType.STRENGTH&&itemB.qItem.q_type!=GoodsType.STRENGTH)
			{
				return -1;
			}
			else if(itemA.qItem.q_type!=GoodsType.STRENGTH&&itemB.qItem.q_type==GoodsType.STRENGTH)
			{
				return 1;
			}
			else{
				var equipA:EquipInfo=itemA as EquipInfo;
				var equipB:EquipInfo=itemB as EquipInfo;
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
			var item:ClientItemInfo;
			for(i=0;i<num;i++){
				info=_goodsContainerTarget.dataProvider.getItemAt(i) as  GridInfo;
				item=info.data as ClientItemInfo;
				_goodsContainerTarget.setGrayIsSelect(item,false);
			}
			num=_goodsContainerUse.dataProvider.length;
			
			for(i=0;i<num;i++){
				info=_goodsContainerUse.dataProvider.getItemAt(i) as  GridInfo;
				item=info.data as ClientItemInfo;
				_goodsContainerUse.setGrayIsSelect(item,false);
			}
			
			if(targetEquipInfo){
				_goodsContainerTarget.setGrayIsSelect(targetEquipInfo,true);
				if(isUse(targetEquipInfo)){
					deleteItems(useEquips,targetEquipInfo);//在消耗列表移除掉
					_goodsContainerUse.refleshGridsByDatas(useEquips);
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
			if(info.qItem.q_type==GoodsType.STRENGTH) return true;
			var equip:EquipInfo=info as EquipInfo;
			if(equip.qItem.q_polish_num!=0&&RoleEquipmentManager.equipIsWearing(equip)==false){//消耗获得的值不为0
				return true;
			}
			return false;
		}
		/**获取提升的属性值（这个是前端自己算的）*/
		private function getupdateAtt(currentLv:EquipInfo,upLv:EquipInfo=null):void
		{
			var has_curr:HashMap=AttValueConfig.getHashByEquip(currentLv);
			var key_curr:Array=has_curr.keys();
			var map_curr:Array=has_curr.values();
			var has_up:HashMap=AttValueConfig.getHashByEquip(upLv);
			var key_up:Array=has_up.keys();
			var map_up:Array=has_up.values();
			var has:HashMap=new HashMap();
			for(var i:int=0;i<key_up.length;i++)
			{
				var num:int=AttValueConfig.getDisAttValue(key_up[i],(map_up[i]-map_curr[i]));
				has.put(key_up[i],num);
			}
			attChangeEft.addChangeHandler(has);
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
				if(info is EquipInfo&&isPolish(info as EquipInfo)){
					if(targetEquipInfo&&info.itemInfo.itemId.ToGID()==targetEquipInfo.itemInfo.itemId.ToGID()){
						if(targetEquipInfo.polishLevel!=(info as EquipInfo).polishLevel)
						{
							getupdateAtt(targetEquipInfo,(info as EquipInfo));
						}
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