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
	import com.rpgGame.app.ui.tab.ViewUI;
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.view.icon.DragDropItem;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.appModule.common.GoodsContainerPanel;
	import com.rpgGame.appModule.common.itemRender.GridItemRender;
	import com.rpgGame.core.events.ItemEvent;
	import com.rpgGame.core.events.MainPlayerEvent;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.core.ui.tip.RTNodeID;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.cfg.NotifyCfgData;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.cfg.TipsCfgData;
	import com.rpgGame.coreData.cfg.item.EquipJiChengData;
	import com.rpgGame.coreData.cfg.item.EquipStrengthCfg;
	import com.rpgGame.coreData.cfg.item.ItemContainerID;
	import com.rpgGame.coreData.clientConfig.Q_equip_inherit_cost;
	import com.rpgGame.coreData.enum.AlertClickTypeEnum;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.alert.AlertSetInfo;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.info.item.EquipInfo;
	import com.rpgGame.coreData.info.item.GridInfo;
	import com.rpgGame.coreData.lang.LangSpell;
	import com.rpgGame.coreData.lang.LangUI;
	import com.rpgGame.coreData.type.CharAttributeType;
	import com.rpgGame.coreData.type.item.GridBGType;
	import com.rpgGame.coreData.type.item.ItemQualityType;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	import com.rpgGame.netData.equip.message.ResEquipOperateResultMessage;
	
	import flash.geom.Point;
	
	import app.message.EquipOperateType;
	import app.message.GoodsType;
	
	import away3d.events.Event;
	
	import feathers.controls.ScrollBarDisplayMode;
	import feathers.controls.Scroller;
	import feathers.controls.ToggleButton;
	import feathers.layout.TiledRowsLayout;
	import feathers.utils.filter.GrayFilter;
	
	import gs.TweenMax;
	import gs.easing.Expo;
	
	import org.client.mainCore.manager.EventManager;
	import org.game.netCore.data.long;
	import org.mokylin.skin.app.zhuangbei.Zhuangbei_left;
	import org.mokylin.skin.app.zhuangbei.jicheng.Jicheng_Skin;
	import org.mokylin.skin.app.zhuangbei.qianghua.TitileHead;
	
	import starling.display.DisplayObject;
	
	/**
	 *装备继承
	 *@author dik
	 *2017-4-11下午7:56:56
	 */
	public class EquipInheritUI extends ViewUI
	{
		private const MIN_GRID:int=28;
		private var _skin:Jicheng_Skin;
		private var _leftSkin:Zhuangbei_left;
		
		//身上的装备列表
		private var _goodsbyPlayer:GoodsContainerPanel;
		private var _goodsbyBag:GoodsContainerPanel;
		
		private var _targetEquip:IconCDFace;//继承目标道具
		private var _targetEquipInfo:EquipInfo;//继承目标信息 
		
		private var _useEquip:IconCDFace;//消耗源道具
		private var _useEuipInfo:EquipInfo;//消耗源信息
		
		private var targetEquips:Vector.<ClientItemInfo>;//目标数据
		private var useItems:Vector.<ClientItemInfo>;//消耗数据
		
		private var _optionsList:Vector.<EquipJiChengItem>;
		
		private var tweenEquip:TweenMax;
		
		private var pointY:Array;
		
		public function EquipInheritUI()
		{
			_skin=new Jicheng_Skin();
			pointY=[257,339,398];
			super(_skin);
			initView();
			
		}
		
		override public function show(data:Object=null):void
		{
			initEvent();
			refresh();
		}
		
		override public function hide():void
		{
			deleteTargetEquip();
			_leftSkin.lb_yinzi.htmlText=getTitleText(LanguageConfig.getText(LangUI.UI_TEXT4),0);
			clearEvent();
		}
		
		private function initEvent():void
		{
			_leftSkin.tab_pack.addEventListener(Event.CHANGE, onTab);
			EventManager.addEvent(ItemEvent.ITEM_JICHENG_MSG,resEquipOperateResultMessage);
			
			EventManager.addEvent(ItemEvent.ITEM_ADD,onFreshItems);
			EventManager.addEvent(ItemEvent.ITEM_REMOVE,onFreshItems);
			EventManager.addEvent(ItemEvent.ITEM_CHANG,onFreshItems);
			EventManager.addEvent(MainPlayerEvent.STAT_RES_CHANGE,updateMoney);//金钱变化
			TipTargetManager.show( _skin.btn_shuoming,TargetTipsMaker.makeSimpleTextTips( TipsCfgData.getTipsInfo(26).q_describe));
		}
		
		private function clearEvent():void
		{
			_leftSkin.tab_pack.removeEventListener(Event.CHANGE, onTab);
			EventManager.removeEvent(ItemEvent.ITEM_JICHENG_MSG,resEquipOperateResultMessage);
			
			EventManager.removeEvent(ItemEvent.ITEM_ADD,onFreshItems);
			EventManager.removeEvent(ItemEvent.ITEM_REMOVE,onFreshItems);
			EventManager.removeEvent(ItemEvent.ITEM_CHANG,onFreshItems);
			EventManager.removeEvent(MainPlayerEvent.STAT_RES_CHANGE,updateMoney);//金钱变化
			TipTargetManager.remove( _skin.btn_shuoming);
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			if(target is ToggleButton)
			{
				var index:int=parseInt((target as ToggleButton).name);
				_optionsList[index].isSelect=(target as ToggleButton).isSelected;
			}
			else
			{
				switch(target)
				{
					case _targetEquip:
						deleteTargetEquip();
						break;
					case _useEquip:
						deleteUseEquip();
						break;
					case _skin.btn_jicheng:
						onInherit();
						break;
				}
			}
		}
		
		private function initView():void
		{
			_optionsList=new Vector.<EquipJiChengItem>();
			_leftSkin=_skin.left.skin as Zhuangbei_left;
			_leftSkin.lb_yinzi.htmlText=getTitleText(LanguageConfig.getText(LangUI.UI_TEXT4),0);
			//设置格子组标题
			(_leftSkin.title1.skin as TitileHead).uiLabel.styleName="ui/app/zhuangbei/jichengjieguo.png";
			(_leftSkin.title2.skin as TitileHead).uiLabel.styleName="ui/app/zhuangbei/jichengcailiao.png";
			
			//初始化格子
			_goodsbyPlayer=new GoodsContainerPanel(_leftSkin.list1,ItemContainerID.IHT_LIST,createItemRender);
			_goodsbyBag=new GoodsContainerPanel(_leftSkin.list2,ItemContainerID.IHT_USE,createItemRender);
			
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
			
			_targetEquip=IconCDFace.create(IcoSizeEnum.ICON_64);
			_targetEquip.selectImgVisible=false;
			_targetEquip.wearIsVisble=false;
			_targetEquip.bindBg(null);
			_useEquip=IconCDFace.create(IcoSizeEnum.ICON_64);
			_useEquip.selectImgVisible=false;
			_useEquip.bindBg(null);
			
			_skin.container.addChild(_targetEquip);
			_skin.container.addChild(_useEquip);
			_targetEquip.x=747;
			_targetEquip.y=141;
			_useEquip.x=482;
			_useEquip.y=141;
			
			//初始化选项
			for(var i:int=0;i<3;i++)
			{
				var item:EquipJiChengItem=new EquipJiChengItem();
				item.SetData(i);
				item.x=388;
				item.y=pointY[i];
				_skin.container.addChild(item);
				_optionsList.push(item);
			}
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
			if(gridInfo.data==null||grid.isSelect){
				return;
			}
			if(gridInfo.containerID==ItemContainerID.IHT_LIST){
				addTargetEquip(gridInfo);
			}else if(gridInfo.containerID==ItemContainerID.IHT_USE){
				addUseEquip(gridInfo);
			}
		}
		
		//添加继承结果装备
		private function addTargetEquip(gridInfo:GridInfo):void
		{
			var targetGrid:DragDropItem;
			if(_targetEquipInfo){
				targetGrid=_goodsbyPlayer.getDragDropItemByItemInfo(_targetEquipInfo);
				targetGrid.isSelect=false;
				targetGrid=_goodsbyBag.getDragDropItemByItemInfo(_targetEquipInfo);
				if(targetGrid)
				{
					targetGrid.isSelect=false;
				}
				if(_useEuipInfo)
				{
					deleteUseEquip();
				}
			}
			
			_skin.btn_jicheng.filter=null;
			_targetEquipInfo=gridInfo.data as EquipInfo;
			_targetEquipInfo.setContainerId(gridInfo.containerID);
			FaceUtil.SetItemGrid(_targetEquip,_targetEquipInfo);
			_targetEquip.selectImgVisible=false;
			targetGrid=_goodsbyPlayer.getDragDropItemByItemInfo(_targetEquipInfo);
			targetGrid.isSelect=true;
			var p:Point=new Point(targetGrid.x,targetGrid.y);
			p=targetGrid.parent.localToGlobal(p);
			p=_targetEquip.parent.globalToLocal(p);
			_targetEquip.x=p.x;
			_targetEquip.y=p.y;
			if(tweenEquip){
				tweenEquip.kill();
			}
			tweenEquip=TweenMax.to(_targetEquip,1,{x:747,y:141,ease:Expo.easeOut});
			
			updateUsePanel();
			targetGrid=_goodsbyBag.getDragDropItemByItemInfo(_targetEquipInfo);
			if(targetGrid)
			{
				targetGrid.isSelect=true;
			}
			updateRightPanel();
		}
		
		//取消继承选择
		private function deleteTargetEquip():void
		{
			var targetGrid:DragDropItem;
			if(_targetEquipInfo){
				targetGrid=_goodsbyPlayer.getDragDropItemByItemInfo(_targetEquipInfo);
				targetGrid.isSelect=false;
				targetGrid=_goodsbyBag.getDragDropItemByItemInfo(_targetEquipInfo);
				if(targetGrid)
					targetGrid.isSelect=false;
				_targetEquipInfo=null;
			}
			deleteUseEquip();
			_targetEquip.clear();
			initPanel();
			updateRightPanel();
			GrayFilter.gray(_skin.btn_jicheng);
		}
		
		//添加被继承装备
		private function addUseEquip(gridInfo:GridInfo):void
		{
			var targetGrid:DragDropItem;
			if(_useEuipInfo){
				targetGrid=_goodsbyBag.getDragDropItemByItemInfo(_useEuipInfo);
				targetGrid.isSelect=false;
				targetGrid=_goodsbyPlayer.getDragDropItemByItemInfo(_useEuipInfo);
				if(targetGrid)
				{
					targetGrid.isSelect=false;
				}
			}
			
			_useEuipInfo=gridInfo.data as EquipInfo;
			_useEuipInfo.setContainerId(gridInfo.containerID);
			FaceUtil.SetItemGrid(_useEquip,_useEuipInfo);
			_useEquip.selectImgVisible=false;
			targetGrid=_goodsbyBag.getDragDropItemByItemInfo(_useEuipInfo);
			targetGrid.isSelect=true;
			var p:Point=new Point(targetGrid.x,targetGrid.y);
			p=targetGrid.parent.localToGlobal(p);
			p=_useEquip.parent.globalToLocal(p);
			_useEquip.x=p.x;
			_useEquip.y=p.y;
			if(tweenEquip){
				tweenEquip.kill();
			}
			tweenEquip=TweenMax.to(_useEquip,1,{x:482,y:141,ease:Expo.easeOut});
			targetGrid=_goodsbyPlayer.getDragDropItemByItemInfo(_useEuipInfo);
			if(targetGrid)
			{
				targetGrid.isSelect=true;
			}
			updateRightPanel();
		}
		
		//取消继承选择
		private function deleteUseEquip():void
		{
			var targetGrid:DragDropItem;
			if(_useEuipInfo){
				targetGrid=_goodsbyBag.getDragDropItemByItemInfo(_useEuipInfo);
				targetGrid.isSelect=false;
				targetGrid=_goodsbyPlayer.getDragDropItemByItemInfo(_useEuipInfo);
				if(targetGrid)
					targetGrid.isSelect=false;
				_useEuipInfo=null;
			}
			_useEquip.clear();
			updateRightPanel();
		}
		
		override public function refresh():void
		{
			ItemManager.getBackEquip(initPanel);
			GrayFilter.gray(_skin.btn_jicheng);
		}
		
		private function initPanel():void
		{
			deleteUseEquip();
			updateTaragetPanel();
			updateUsePanel();
			updateAll();
		}
		
		//刷新可继承装备
		private function updateTaragetPanel():void
		{
			var allEquips:Array=ItemManager.getAllEquipDatas();
			var num:int=allEquips.length;
			
			targetEquips=getInheritanceEquips(allEquips);
			num=targetEquips.length;
			num=num>MIN_GRID?num:MIN_GRID;
			_goodsbyPlayer.setGridsCount(num,false);
			_goodsbyPlayer.refleshGridsByDatas(targetEquips);
		}
		
		//刷新可被继承装备
		private function updateUsePanel():void
		{
			var backDatas:Array=BackPackManager.instance.getAllItem();		
			useItems=getUseEquip(backDatas);
			var num:int=useItems.length;
			num=num>MIN_GRID?num:MIN_GRID;
			_goodsbyBag.setGridsCount(num,false);
			_goodsbyBag.refleshGridsByDatas(useItems);
			notifyUpdate(RTNodeID.EQUIP_JC);
		}
		
		private function updateAll():void
		{
			var targetGrid:DragDropItem;
			for each(targetGrid in _goodsbyPlayer.dndGrids){
				targetGrid.isSelect=false;
			}
			
			for each( targetGrid in _goodsbyBag.dndGrids){
				targetGrid.isSelect=false;
			}
			
			if(_targetEquipInfo){
				targetGrid=_goodsbyPlayer.getDragDropItemByItemInfo(_targetEquipInfo);
				if(targetGrid)
					targetGrid.isSelect=true;
				targetGrid=_goodsbyBag.getDragDropItemByItemInfo(_targetEquipInfo);
				if(targetGrid)
					targetGrid.isSelect=true;
				updateUsePanel();
				updateRightPanel();
			}
		}
		
		//刷新右侧面板
		private function updateRightPanel():void
		{
			if(_targetEquipInfo!=null&&_useEuipInfo!=null)
			{
				for(var i:int=0;i<_optionsList.length;i++)
				{
					_optionsList[i].ShowAttribute(_targetEquipInfo,_useEuipInfo);
				}			
			}
			else
			{
				for(i=0;i<_optionsList.length;i++)
				{
					_optionsList[i].ClearAttribute();
				}			
			}
			showMoney();
		}
		
		//更新消耗
		private function showMoney():void
		{
			if(_targetEquipInfo!=null&&_useEuipInfo!=null)
			{
				var q_jicheng:Q_equip_inherit_cost=EquipJiChengData.getJiChengCfg
					
					(_targetEquipInfo.qItem.q_kind,_targetEquipInfo.qItem.q_levelnum);
				if(q_jicheng)
					var useMon:int=q_jicheng.q_cast;
				else
					useMon=0;
				var userMon:int=MainRoleManager.actorInfo.totalStat.getResData(CharAttributeType.RES_BIND_MONEY)+ 
					
					MainRoleManager.actorInfo.totalStat.getResData(CharAttributeType.RES_MONEY);
				_leftSkin.lb_yinzi.htmlText=getTitleText(LanguageConfig.getText(LangUI.UI_TEXT4),useMon,userMon);
			}
			else
			{
				_leftSkin.lb_yinzi.htmlText=getTitleText(LanguageConfig.getText(LangUI.UI_TEXT4),0);
			}
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
		
		
		/**获取可继承的装备*/
		private function getInheritanceEquips(datas:Array):Vector.<ClientItemInfo>
		{
			var num:int=datas.length;
			var result:Vector.<ClientItemInfo>=new Vector.<ClientItemInfo>();
			for(var i:int=0;i<num;i++){
				var info:ClientItemInfo=datas[i];
				if(isCanInheritance(info as EquipInfo)){
					if(_targetEquipInfo&&info.itemInfo.itemId.ToGID()==_targetEquipInfo.itemInfo.itemId.ToGID()){
						_targetEquipInfo=info as EquipInfo;//更新掉
						_targetEquipInfo.setContainerId(info.containerID);
						FaceUtil.SetItemGrid(_targetEquip, _targetEquipInfo, true);
					}
					result.push(info);
				}else{
					if(_targetEquipInfo&&info.itemInfo.itemId.ToGID()==_targetEquipInfo.itemInfo.itemId.ToGID()){
						_targetEquipInfo=null;
						_targetEquip.clear();
					}
				}
			}
			return result;
		}
		
		/**获取背包中可被继承的装备*/
		private function getUseEquip(datas:Array):Vector.<ClientItemInfo>
		{
			var num:int=datas.length;
			var result:Vector.<ClientItemInfo>=new Vector.<ClientItemInfo>();
			for(var i:int=0;i<num;i++){
				var info:ClientItemInfo=datas[i];
				if(info is EquipInfo)
				{
					if(isCanInheritanceTo(info as EquipInfo)){
						if(_useEuipInfo&&info.itemInfo.itemId.ToGID()==_useEuipInfo.itemInfo.itemId.ToGID()){
							_useEuipInfo=info as EquipInfo;//更新掉
							_useEuipInfo.setContainerId(info.containerID);
							FaceUtil.SetItemGrid(_useEquip, _useEuipInfo, true);
						}
						result.push(info);
					}else{
						if(_useEuipInfo&&info.itemInfo.itemId.ToGID()==_useEuipInfo.itemInfo.itemId.ToGID()){
							_useEuipInfo=null;
							_useEquip.clear();
						}
					}
				}
			}
			return result;
		}
		
		//判断是否可以继承
		private function isCanInheritance(info:EquipInfo):Boolean
		{
			if(_useEuipInfo!=null)
			{
				if(info.qItem.q_kind==_useEuipInfo.qItem.q_kind&&(info.strengthLevel<_useEuipInfo.strengthLevel
					||info.polishLevel<_useEuipInfo.polishLevel)&&info.qItem.q_max_strengthen>0&&!EquipStrengthCfg.isMax
					
					(info.strengthLevel))
				{
					return true;
				}
				else return false;
			}
			else
			{
				if(info.qItem.q_max_strengthen>0&&!EquipStrengthCfg.isMax(info.strengthLevel))
					return true;
			}
			return false;
		}
		
		//判断是否可以被继承
		private function isCanInheritanceTo(info:EquipInfo):Boolean
		{
			var job:int=MainRoleManager.actorInfo.job;
			if(_targetEquipInfo!=null&&info!=_targetEquipInfo)
			{
				if((info.qItem.q_job==job||info.qItem.q_job==0)&&info.qItem.q_kind==_targetEquipInfo.qItem.q_kind&&info.qItem.q_level<=_targetEquipInfo.qItem.q_level&&((info.strengthExp!=0&&info.strengthExp>_targetEquipInfo.strengthExp)||
					(info.polishExp!=0&&info.polishExp>_targetEquipInfo.polishExp)||info.smeltAtt1!=0||info.smeltAtt2!=0))
				{
					return true;
				}
			}
			return false;
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
		
		private function getLock():int
		{
			var lock:int=0;
			var val:int=0;
			var tmp:int=0;
			for(var i:int=0;i<_optionsList.length;i++)
			{
				val |= (_optionsList[i].isSelect?1:0) << i;
			}
			return val;
		}
		
		private function isCanInherit():Boolean
		{
			if(_targetEquipInfo==null){
				NoticeManager.textNotify(NoticeManager.MOUSE_FOLLOW_TIP, NotifyCfgData.getNotifyTextByID(6101));
				return false;
			}
			else if(_useEuipInfo==null){
				NoticeManager.textNotify(NoticeManager.MOUSE_FOLLOW_TIP, NotifyCfgData.getNotifyTextByID(6102));
				return false;
			}
			else if(!isSelectItem())
			{
				NoticeManager.textNotify(NoticeManager.MOUSE_FOLLOW_TIP, NotifyCfgData.getNotifyTextByID(6103));
				return false;
			}
			else if(_targetEquipInfo!=null&&_useEuipInfo!=null)
			{
				var q_jicheng:Q_equip_inherit_cost=EquipJiChengData.getJiChengCfg
					
					(_targetEquipInfo.qItem.q_kind,_targetEquipInfo.qItem.q_levelnum);
				if(q_jicheng)
					var useMon:int=q_jicheng.q_cast;
				else useMon=0;
				var userMon:int=MainRoleManager.actorInfo.totalStat.getResData(CharAttributeType.RES_BIND_MONEY)+ 
					
					MainRoleManager.actorInfo.totalStat.getResData(CharAttributeType.RES_MONEY);
				if(useMon>userMon)
				{
					NoticeManager.textNotify(NoticeManager.MOUSE_FOLLOW_TIP, NotifyCfgData.getNotifyTextByID(2007));
					return false;
				}
			}		
			return true;
		}
		
		private function isSelectItem():Boolean
		{
			if(_optionsList==null) return false;
			for(var i:int=0;i<_optionsList.length;i++)
			{
				if(_optionsList[i].isSelect) return true;
			}
			return false;
		}
		
		private function onInherit():void
		{
			if(isCanInherit())
			{
				var type:int=RoleEquipmentManager.equipIsWearing(_targetEquipInfo)?0:1;
				var lock:int=getLock();
				var alertSet:AlertSetInfo= new AlertSetInfo( LangUI.UI_TEXT15);
				alertSet.alertInfo.value=alertSet.alertInfo.value.replace("$",HtmlTextUtil.getTextColor(ItemQualityType.getColorValue(_targetEquipInfo.quality),_useEuipInfo.name));
				alertSet.alertInfo.checkText=LanguageConfig.getText(LangUI.UI_TEXT31);
				alertSet.alertInfo.align="left";
				alertSet.isShowCBox = true;
				GameAlert.showAlert(alertSet,onToUp,EquipOperateType.JICHENG_NORMAL,_useEuipInfo.itemInfo.itemId,_targetEquipInfo.itemInfo.itemId,type,lock);
				
				//				var p:Point=new Point(this._skin.btn_jicheng.x+this._skin.btn_jicheng.width/2,this._skin.btn_jicheng.y+this._skin.btn_jicheng.height/2);
				//				p=this._skin.btn_jicheng.parent.localToGlobal(p);
				//				p=this._skin.container.globalToLocal(p);
				//				this.playInter3DAt(ClientConfig.getEffect("ui_tongyongdianji"),p.x,p.y,1,null,addComplete);
				
			}
		}
		
		private function onToUp(gameAlert:GameAlert,opaqueType:int,fromEquipId:long,toEquipId:long,toType:int,index:int):void
		{
			switch(gameAlert.clickType)
			{
				case AlertClickTypeEnum.TYPE_SURE:
					ItemSender.reqEquipInheritMessage(opaqueType,fromEquipId,toEquipId,toType,index);		
					break;
			}		
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
			_goodsbyPlayer.refleshGridsByDatas(result);
			
			var targetGrid:DragDropItem;
			for each(var info:ClientItemInfo in result){
				targetGrid=_goodsbyPlayer.getDragDropItemByItemInfo(info);
				if(!targetGrid){
					continue;
				}
				if(info==_targetEquipInfo){
					targetGrid.isSelect=true;
				}else{
					targetGrid.isSelect=false;
				}
			}
		}
		
		/**物品发生改变*/
		private function onFreshItems(info:ClientItemInfo=null):void
		{
			if((info.containerID==ItemContainerID.Role||info.containerID==ItemContainerID.BackPack)&&
				(info.type==GoodsType.EQUIPMENT||info.type==GoodsType.EQUIPMENT1||
					info.type==GoodsType.EQUIPMENT2)){
				ItemManager.getBackEquip(initPanel);
			}		
		}
		
		private function updateMoney(type:int=3):void
		{
			if(type!=CharAttributeType.RES_GOLD&&type!=CharAttributeType.RES_BIND_GOLD){
				return;
			}
			showMoney();
		}
		
		private function addComplete(render:RenderUnit3D):void
		{
			render.play(0);
		}
		
		/**继承结果反馈*/
		private function resEquipOperateResultMessage(msg:ResEquipOperateResultMessage):void
		{
			var targetGrid:DragDropItem;
			if(msg.opaque==EquipOperateType.JICHENG_NORMAL&&msg.result==1)
			{
				this.playInter3DAt(ClientConfig.getEffect("ui_jicheng"),(_useEquip.x+_useEquip.width/2),(_useEquip.y+_useEquip.height/2),1);
				UIPopManager.showAlonePopUI(CenterEftPop,"ui_jichengchenggong");
				if(_useEuipInfo){
					targetGrid=_goodsbyBag.getDragDropItemByItemInfo(_useEuipInfo);
					targetGrid.isSelect=false;
					targetGrid=_goodsbyPlayer.getDragDropItemByItemInfo(_useEuipInfo);
					if(targetGrid)
					{
						targetGrid.isSelect=false;
					}
				}
				_useEquip.clear();
				_useEuipInfo=null;
				updateUsePanel();
				updateRightPanel();
			}
		}
	}
}