package com.rpgGame.appModule.equip
{
	import com.game.engine3D.display.Inter3DContainer;
	import com.game.engine3D.display.InterObject3D;
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.goods.BackPackManager;
	import com.rpgGame.app.manager.goods.ItemManager;
	import com.rpgGame.app.manager.pop.UIPopManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.sender.ItemSender;
	import com.rpgGame.app.ui.MinMaxValueBar;
	import com.rpgGame.app.ui.common.CenterEftPop;
	import com.rpgGame.app.ui.tab.ViewUI;
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.appModule.equip.combo.DetailNodeInfo;
	import com.rpgGame.appModule.equip.combo.EquipComboTreeItemRender;
	import com.rpgGame.appModule.equip.combo.MainNodeInfo;
	import com.rpgGame.appModule.equip.combo.SubNodeInfo;
	import com.rpgGame.core.events.ItemEvent;
	import com.rpgGame.core.events.MainPlayerEvent;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.HeChengData;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.cfg.TipsCfgData;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.cfg.item.ItemContainerID;
	import com.rpgGame.coreData.clientConfig.Q_hecheng;
	import com.rpgGame.coreData.clientConfig.Q_item;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.info.item.ComboItemInfo;
	import com.rpgGame.coreData.info.item.ItemUtil;
	import com.rpgGame.coreData.lang.LangUI;
	import com.rpgGame.coreData.type.CharAttributeType;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	import com.rpgGame.netData.equip.message.ResEquipOperateResultMessage;
	
	import app.message.EquipOperateType;
	
	import away3d.events.Event;
	
	import feathers.controls.Label;
	import feathers.controls.ScrollBarDisplayMode;
	import feathers.controls.UIAsset;
	import feathers.data.ListCollection;
	import feathers.data.TreeNode;
	import feathers.events.FeathersEventType;
	import feathers.layout.VerticalLayout;
	import feathers.themes.GuiThemeStyle;
	import feathers.utils.filter.GrayFilter;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.zhuangbei.hecheng.HeCheng_Skin;
	import org.mokylin.skin.component.list.ListSkin1;
	
	/**
	 *装备合成
	 *@author dik
	 *2017-4-11下午8:05:55
	 */
	public class EquipComboUI extends ViewUI
	{
		private var _skin:HeCheng_Skin;
		
		private const CAILIAO_NUM:int=3;
		
		private var icon:IconCDFace;
		private var _cailiao:Vector.<IconCDFace>;
		private var _cailiaoName:Vector.<Label>;
		private var minMaxBar:MinMaxValueBar;
		
		//合成连接线
		private var _exisList:Vector.<UIAsset>;
		//合成数量
		private var _hechengNum:int=1;
		
		private var _nowSelect:Q_hecheng;
		
		private var cailiaoId:int;
		private var userGold:Number;
		private var userMoney:Number;
		
		private var findRootNode:TreeNode;
		private var firstId:int;
		private var findId:int;
		
		private var _huoEftContaner1:Inter3DContainer;
		private var _huoEff:InterObject3D;
		public function EquipComboUI()
		{
			_skin=new HeCheng_Skin();
			super(_skin);
			initView();
			initTree();
		}
		
		private function initTree():void
		{
			_skin.tree.rootNode=getTreeNode();
			_skin.tree.itemRendererType = EquipComboTreeItemRender ;
			_skin.tree.scrollBarDisplayMode =  ScrollBarDisplayMode.ALWAYS_VISIBLE;
			GuiThemeStyle.setFeatherSkinClass(_skin.tree, ListSkin1);
			//			GuiThemeStyle.setScrollerStyle(_skin.tree, ScrollBarSkin_pack);
			var lay:VerticalLayout=new VerticalLayout();
			lay.hasVariableItemDimensions=true;
			lay.useVirtualLayout = true;
			lay.padding = 0;
			lay.gap = 0;
			lay.horizontalAlign = "justify";
			lay.verticalAlign = "top";
			_skin.tree.layout=lay;
			_skin.tree.updateTree();
		}
		
		private function getTreeNode():TreeNode
		{
			var rootNodeData:Object = {label:"合成"};
			var rootNode:TreeNode = new TreeNode(rootNodeData);
			var typeList:Array=HeChengData.getTypeList();
			var num:int=typeList.length;
			var tempNodes:Vector.<TreeNode>;
			var children:Array=[];
			var i:int,j:int,k:int;
			var mainNodeInfo:MainNodeInfo;
			var subNodeInfo:SubNodeInfo;
			var detailNodeInfo:DetailNodeInfo;
			
			for(i=0;i<num;i++){
				mainNodeInfo=new MainNodeInfo();
				mainNodeInfo.type=typeList[i];
				children.push(mainNodeInfo);
			}
			tempNodes=rootNode.addChildren(children);//父节点
			num=tempNodes.length;
			var tempNode:TreeNode;
			for(i=0;i<num;i++){
				tempNode=tempNodes[i];
				mainNodeInfo= tempNode.data as MainNodeInfo;
				var subList:Array=HeChengData.getSonTypeListByType(mainNodeInfo.type);
				var details:Array;
				if(subList.length==1){
					details=HeChengData.getSubSonList(mainNodeInfo.type,subList[0]);
					children=[];
					for(j=0;j<details.length;j++){
						detailNodeInfo=new DetailNodeInfo();
						detailNodeInfo.data=HeChengData.getSonbySonTypeListByType(mainNodeInfo.type,subList[0],details[j]);
						if(firstId==0){
							firstId=detailNodeInfo.data.q_item_id;
						}
						children.push(detailNodeInfo);
					}
					tempNode.addChildren(children);//添加节点
				}else{
					children=[];
					var detailList:Array=[];
					for(j=0;j<subList.length;j++){
						subNodeInfo=new SubNodeInfo();
						subNodeInfo.type=mainNodeInfo.type;
						subNodeInfo.subType=subList[j];
						children.push(subNodeInfo);
						details=HeChengData.getSubSonList(mainNodeInfo.type,subList[j]);
						var childrens:Array=[];
						for(k=0;k<details.length;k++){
							detailNodeInfo=new DetailNodeInfo();
							detailNodeInfo.data=HeChengData.getSonbySonTypeListByType(mainNodeInfo.type,subList[j],details[k]);
							if(firstId==0){
								firstId=detailNodeInfo.data.q_item_id;
							}
							childrens.push(detailNodeInfo);
						}
						detailList.push(childrens);
					}
					var nodes:Vector.<TreeNode>=tempNode.addChildren(children);//添加子节点
					for(j=0;j<nodes.length;j++){
						var node:TreeNode=nodes[j];
						node.addChildren(detailList[j]);
					}
				}
			}
			return rootNode;
		}
		
		private function initView():void
		{
			_huoEftContaner1=new Inter3DContainer();
			_skin.container.addChildAt(_huoEftContaner1,_skin.container.numChildren);
			_huoEff=_huoEftContaner1.playInter3DAt(ClientConfig.getEffect("ui_ronglu_huoyan"),590,216,0);
			_skin.input_txt.restrict = "0-9";
			_skin.input_txt.maxChars = 3;
			_cailiao=new Vector.<IconCDFace>();
			_cailiaoName=new Vector.<Label>();
			_exisList=new Vector.<UIAsset>();
			icon=IconCDFace.create(IcoSizeEnum.ICON_64);
			icon.selectImgVisible=false;
			icon.x=574;
			icon.y=145;
			icon.bindBg(null);
			_exisList.push(_skin.exist1);
			_exisList.push(_skin.exist2);
			_exisList.push(_skin.exist3);
			_skin.container.addChild(icon);
			//			_skin.container.addChild(_skin.equip_num);
			
			minMaxBar=new MinMaxValueBar(_skin,changeHecheng);
			
			for(var i:int=0;i<CAILIAO_NUM;i++)
			{
				var ico:IconCDFace=IconCDFace.create(IcoSizeEnum.ICON_48);		
				ico.selectImgVisible=false;
				//				ico.setIconResName(ClientConfig.getItemIcon("1001",IcoSizeEnum.ICON_48));
				var uias:UIAsset=_skin.grp_cailiao.getChildByName("cailiao"+(i+1)) as UIAsset;
				ico.bindBg(uias);
				_skin.grp_cailiao.addChild(ico);
				_cailiao.push(ico);
				var lb:Label=_skin.grp_cailiao.getChildByName("lbCailiao"+(i+1)) as Label;
				_cailiaoName.push(lb);
			}
			
			clearPanel();
		}
		
		private function changeHecheng():void
		{
			_hechengNum=minMaxBar.value;
			updateShowNum();
		}
		
		override public function show(data:Object=null):void
		{
			super.show();
			initEvent();
			minMaxBar.onShow();
			userGold=MainRoleManager.actorInfo.totalStat.getResData(CharAttributeType.RES_GOLD)+ MainRoleManager.actorInfo.totalStat.getResData(CharAttributeType.RES_BIND_GOLD);
			userMoney=MainRoleManager.actorInfo.totalStat.getResData(CharAttributeType.RES_BIND_MONEY)+ MainRoleManager.actorInfo.totalStat.getResData(CharAttributeType.RES_MONEY);
			
			var node:TreeNode=_skin.tree.rootNode;
//			node.expanded=false;
			if(data){
				var info:ComboItemInfo=data as ComboItemInfo;
				if(info.targetId!=0){
					findId=info.targetId;
				}else{
					getFindId(node,info.sourceId);
				}
			}else{
				findId=firstId;
			}
			
			closeNode(node);
			findNode(node,findId);
			expandedNode(findRootNode);
			_skin.tree.updateTree();
			var oldindex:int=_skin.tree.selectedIndex;
			_skin.tree.selectedItem=getDataById(findId);
			_skin.tree.dataProvider.updateItemAt(oldindex);
			_skin.tree.dataProvider.updateItemAt(_skin.tree.selectedIndex);
			_skin.tree.validate();
			onSelected(null);
		}
		
		private function closeNode(node:TreeNode):void
		{
			if(node.expanded&&node.hasChildren)
			{
				node.expanded=false;
			}
			
			var len:int= 0;
			var child:TreeNode = null;
			len = node.children?node.children.length:0;
			for(var i:int = 0; i < len;i++ )
			{
				child = node.children[i];
				closeNode(child);
			}
		}
		
		private function getFindId(node:TreeNode,id:int):Boolean
		{
			var len:int=node.children?node.children.length:0;
			var child:TreeNode = null;
			var detailInfo:DetailNodeInfo;
			var hechengData:Q_hecheng;
			for(var i:int = 0; i < len;i++ )
			{
				child = node.children[i];
				detailInfo=child.data as DetailNodeInfo;
				if(detailInfo){//是跟节点
					hechengData=detailInfo.data;
					var cailiao:Array=JSONUtil.decode(hechengData.q_cost_items);
					cailiaoId=parseInt(cailiao[0]);
					if(cailiaoId==id){//合成材料正确
						findId=hechengData.q_item_id;
						return true;
					}
				}else{
					if(getFindId(child,id)){
						return true;
					}
				}
			}
			return false;
		}
		
		private function getDataById(findId:int):TreeNode
		{
			var datas:ListCollection=_skin.tree.dataProvider;
			var arr:Array=datas.data as Array;
			for(var i:int=0;i<arr.length;i++){
				var node:TreeNode=arr[i] as TreeNode;
				var info:DetailNodeInfo=getinfoById(node,findId);
				if(info)
					return node.children[0];
				//				if(node.data is DetailNodeInfo&&DetailNodeInfo(node.data).data.q_item_id==findId){
				//					return node;
				//				}
			}
			return null;
		}
		
		private function getinfoById(node:TreeNode,id:int): DetailNodeInfo
		{
			if(node.data is MainNodeInfo){
				findRootNode=node;
			}
			var len:int=node.children?node.children.length:0;
			var child:TreeNode = null;
			var detailInfo:DetailNodeInfo;
			var hechengData:Q_hecheng;
			for(var i:int = 0; i < len;i++ )
			{
				child = node.children[i];
				detailInfo=child.data as DetailNodeInfo;
				if(detailInfo){//是跟节点
					hechengData=detailInfo.data;
					if(hechengData.q_item_id==id){//合成目标物
						return detailInfo;
					}
				}else{
					if(getinfoById(child,id)){
						return getinfoById(child,id);
					}
				}
			}
			return null;
		}
		
		private function findNode(node:TreeNode,id:int):Boolean
		{
			if(node.data is MainNodeInfo){
				findRootNode=node;
			}
			var len:int=node.children?node.children.length:0;
			var child:TreeNode = null;
			var detailInfo:DetailNodeInfo;
			var hechengData:Q_hecheng;
			for(var i:int = 0; i < len;i++ )
			{
				child = node.children[i];
				detailInfo=child.data as DetailNodeInfo;
				if(detailInfo){//是跟节点
					hechengData=detailInfo.data;
					if(hechengData.q_item_id==id){//合成目标物
						return true;
					}
				}else{
					if(findNode(child,id)){
						return true;
					}
				}
			}
			return false;
		}
		
		private function expandedNode(node:TreeNode):void
		{
			if(!node.expanded&&node.hasChildren)
			{
				node.expanded=false;
			}
			
			var len:int= 0;
			var child:TreeNode = null;
			len = node.children?node.children.length:0;
			for(var i:int = 0; i < len;i++ )
			{
				child = node.children[i];
				expandedNode(child);
			}
		}
		
		override public function hide():void
		{
			super.hide();
			clearEvent();
			clearAll();
			var oldindex:int=_skin.tree.selectedIndex;
			_skin.tree.selectedItem=null;
			_skin.tree.dataProvider.updateItemAt(oldindex);
			_nowSelect=null;
			minMaxBar.onHide();
		}
		
		//显示合成的对象
		private function setShowData():void
		{
			if(!_nowSelect) return;
			var q_item:Q_item=ItemConfig.getQItemByID(_nowSelect.q_item_id);
			var isbind:int=q_item.q_bind>0?1:0;
			var itemInfo:ClientItemInfo=ItemUtil.convertClientItemInfoById(_nowSelect.q_item_id,1,isbind);
			FaceUtil.SetItemGrid(icon,itemInfo);
			icon.selectImgVisible=false;
			icon.setIconResName(ClientConfig.getItemIcon(ItemConfig.getItemIcon(_nowSelect.q_item_id),IcoSizeEnum.ICON_64));		
			
			_skin.lbEnd.color=ItemConfig.getItemQualityColor(_nowSelect.q_item_id);
			_skin.lbEnd.text=itemInfo.name;
			//			_skin.equip_num.text=_skin.input_txt.text;
			setCaiLiaoData();
		}
		
		//显示或者更新材料显示
		private function setCaiLiaoData():void
		{
			clearPanel();
			if(!_nowSelect) return;
			var cailiao:Array=JSONUtil.decode(_nowSelect.q_cost_items);
			if(cailiao==null) return;
			cailiaoId=parseInt(cailiao[0]);
			var cailiaoNum:int=parseInt(cailiao[1]);
			var itemByBagNum:int=BackPackManager.instance.getBagItemsCountById(cailiaoId);
			minMaxBar.setMinMax(1,itemByBagNum/cailiaoNum);
			if(itemByBagNum>=cailiaoNum)
			{
				_skin.exist4.visible=true;
				_skin.btn_hecheng.filter=null;
			}
			else
			{
				for(var i:int=0;i<_exisList.length;i++)
				{
					_exisList[i].visible=(itemByBagNum>i);
				}
				GrayFilter.gray(_skin.btn_hecheng);
			}
			for(i=0;i<_cailiao.length;i++)
			{
				var q_item:Q_item=ItemConfig.getQItemByID(cailiaoId);
				var isbind:int=q_item.q_bind>0?1:0;
				var itemInfo:ClientItemInfo=ItemUtil.convertClientItemInfoById(cailiaoId,1,isbind);
				FaceUtil.SetItemGrid(_cailiao[i],itemInfo);
				_cailiao[i].selectImgVisible=false;
				if(itemByBagNum>i)
				{
					_cailiao[i].isGary=false
				}else{
					_cailiao[i].isGary=true;
				}			
				_cailiaoName[i].text=ItemConfig.getItemName(cailiaoId);
				_cailiaoName[i].color=ItemConfig.getItemQualityColor(cailiaoId);
			}
		}
		
		private function updateShowNum():void
		{
			_skin.input_txt.text=_hechengNum.toString();
			_skin.lb_msg.htmlText=getTitleText();
			//			_skin.equip_num.text=_skin.input_txt.text;
		}
		
		private function initEvent():void
		{
			_skin.btn_hecheng.addEventListener(Event.TRIGGERED,btnHeChengHandler);
			
			_skin.input_txt.addEventListener(FeathersEventType.FOCUS_IN,forceinHandler);
			_skin.input_txt.addEventListener(FeathersEventType.FOCUS_OUT,forceoutHandler);
			
			//			_skin.input_txt.addEventListener(Event.CHANGE,changeHandler);
			//			_skin.input_txt.addEventListener(FeathersEventType.FOCUS_OUT,focusOutHandler);
			
			EventManager.addEvent(ItemEvent.ITEM_COMBO_MSG,updateHechengHandler);
			EventManager.addEvent(ItemEvent.ITEM_HECHENG_SELECT,updateHechengHandler);
			
			_skin.tree.addEventListener(Event.SELECT,onSelected);
			
			EventManager.addEvent(ItemEvent.ITEM_ADD,onFreshItems);
			EventManager.addEvent(ItemEvent.ITEM_REMOVE_LIST,onRemoveFreshItems);
			EventManager.addEvent(ItemEvent.ITEM_CHANG,onFreshItems);
			EventManager.addEvent(MainPlayerEvent.STAT_RES_CHANGE,updateAmount);//金钱变化
			
			TipTargetManager.show( _skin.btn_shuoming,TargetTipsMaker.makeSimpleTextTips( TipsCfgData.getTipsInfo(23).q_describe));
		}
		
		private function updateAmount(type:int=3):void
		{
			if(type!=CharAttributeType.RES_GOLD&&type!=CharAttributeType.RES_BIND_GOLD&&type!=CharAttributeType.RES_MONEY&&type!=CharAttributeType.RES_BIND_MONEY){
				return;
			}
			userGold=MainRoleManager.actorInfo.totalStat.getResData(CharAttributeType.RES_GOLD)+ MainRoleManager.actorInfo.totalStat.getResData(CharAttributeType.RES_BIND_GOLD);
			userMoney=MainRoleManager.actorInfo.totalStat.getResData(CharAttributeType.RES_BIND_MONEY)+ MainRoleManager.actorInfo.totalStat.getResData(CharAttributeType.RES_MONEY);
			setShowData();
			updateAllList();
		}
		
		
		private function onFreshItems(info:ClientItemInfo=null):void
		{
			//			_skin.tree.dataProvider.updateAll();
			//			var not:TreeNode=getDataById(info.qItem.q_id);
			//			if(not){
			//				var index:int=_skin.tree.dataProvider.getItemIndex(not);
			//				_skin.tree.dataProvider.updateItemAt(index);
			//				_skin.tree.validate();
			//				var nextCfg:Q_hecheng=HeChengData.getHeChengTargetByCaiLiao(info.qItem.q_id);
			//				if(nextCfg){
			//					not=getDataById(nextCfg.q_item_id);
			//					index=_skin.tree.dataProvider.getItemIndex(not);
			//					_skin.tree.dataProvider.updateItemAt(index);
			//					_skin.tree.validate();
			//				}
			//			}
			updateAllList();
			if(info.containerID==ItemContainerID.BackPack&&info.cfgId==cailiaoId){//背包里的合成对应合成材料
				setShowData();
			}
		}
		
		private function updateAllList():void
		{
			for(var i:int=0;i<_skin.tree.dataProvider.length;i++)
			{
				_skin.tree.dataProvider.updateItemAt(i);
			}
		}
		
		private function onRemoveFreshItems(list:Vector.<ClientItemInfo>):void
		{
			for each(var item:ClientItemInfo in list){
				if(item.containerID==ItemContainerID.BackPack&&item.cfgId==cailiaoId){//有一个是就去更新展示了
					setShowData();
					//					var not:TreeNode=getDataById(item.qItem.q_id);
					//					if(not){
					//						var index:int=_skin.tree.dataProvider.getItemIndex(not);
					//						_skin.tree.dataProvider.updateItemAt(index);
					//						_skin.tree.validate();
					//					}
					break;
				}
			}
			updateAllList();
			//			_skin.tree.dataProvider.updateAll();
		}
		
		private function onSelected(e:Event):void
		{
			var treeNode : TreeNode = _skin.tree.selectedItem as  TreeNode;
			if(!treeNode)
				return;
			var data:DetailNodeInfo=treeNode.data as DetailNodeInfo;
			if(!data){
				if(_nowSelect){
					var oldindex:int=_skin.tree.selectedIndex;
					_skin.tree.selectedItem=getDataById(_nowSelect.q_item_id);
					_skin.tree.dataProvider.updateItemAt(oldindex);
					_skin.tree.dataProvider.updateItemAt(_skin.tree.selectedIndex);
					_skin.tree.validate();
				}
				return;
			}
			else
				setSelectItem(data.data);
		}
		
		private function clearEvent():void
		{
			_skin.btn_hecheng.removeEventListener(Event.TRIGGERED,btnHeChengHandler);
			_skin.tree.removeEventListener(Event.SELECT,onSelected);
			
			_skin.input_txt.removeEventListener(FeathersEventType.FOCUS_IN,forceinHandler);
			_skin.input_txt.removeEventListener(FeathersEventType.FOCUS_OUT,forceoutHandler);
			EventManager.removeEvent(ItemEvent.ITEM_STRENGTH_MSG,updateHechengHandler);
			TipTargetManager.remove(_skin.btn_shuoming);
		}
		
		private function clearPanel():void
		{
			for(var i:int=0;i<_exisList.length;i++)
			{
				_exisList[i].visible=false;
			}
			_skin.exist4.visible=false;
			_hechengNum=1;
			updateShowNum();
		}
		
		private function clearAll():void
		{
			for(var i:int=0;i<_cailiao.length;i++)
			{
				_cailiao[i].clear();			
				_cailiaoName[i].text="";
			}
			icon.clear();
			clearPanel();
		}
		
		//显示金钱的消耗数量
		private function getTitleText():String
		{
			var des:String="";
			if(!_nowSelect){
				return "";
			}
			var needMoney:int=_nowSelect.q_money*_hechengNum;
			if(needMoney<=userMoney){
				des+=HtmlTextUtil.getTextColor(StaticValue.GREEN_TEXT,needMoney+LanguageConfig.getText(LangUI.UI_TEXT17));//绿色
			}else if(needMoney>userMoney){
				des+=HtmlTextUtil.getTextColor(StaticValue.RED_TEXT,needMoney+LanguageConfig.getText(LangUI.UI_TEXT17));//红色
			}
			return des;
		}
		
		private function forceinHandler(evt:Event):void
		{
			_skin.input_txt.text="";
		}
		
		private function forceoutHandler(evt:Event):void
		{
			if(_skin.input_txt.text == "")
			{
				_skin.input_txt.text = "1";
			}
			_hechengNum = int(_skin.input_txt.text);
			if(_hechengNum==0) _hechengNum=1;
			else if(_hechengNum>minMaxBar.max)
				_hechengNum=minMaxBar.max;
			updateShowNum();
		}	
		
		private function changeHandler(e:Event):void
		{
			_hechengNum = int(_skin.input_txt.text);
			if(_hechengNum==0) _hechengNum=1;
			else if(_hechengNum>minMaxBar.max)
				_hechengNum=minMaxBar.max;
			updateShowNum();
		}
		
		private function focusOutHandler():void
		{
			if(_skin.input_txt.text == "")
			{
				_skin.input_txt.text ="1";
			}
		}
		
		/**合成请求*/
		private function btnHeChengHandler(e:Event):void
		{
			if(!_nowSelect){
				NoticeManager.showNotifyById(6019);
				return;
			}
			var cailiao:Array=JSONUtil.decode(_nowSelect.q_cost_items);
			if(cailiao==null) return;
			var cailiaoId:int=parseInt(cailiao[0]);
			var cailiaoNum:int=parseInt(cailiao[1]);
			var itemByBagNum:int=BackPackManager.instance.getBagItemsCountById(cailiaoId);
			if(itemByBagNum<cailiaoNum)
			{
				//提示材料不足
				NoticeManager.showNotifyById(6017);
				return;
			}else if(_nowSelect.q_money*_hechengNum>userMoney){
				//提示银两不足
				NoticeManager.showNotifyById(6018);
				return;
			}
			
			if(ItemManager.isCanPushPack(_nowSelect.q_item_id,_hechengNum)==false){
				NoticeManager.showNotifyById(5004);
				return;
			}
			
			ItemSender.reqItemCompositionMessage(EquipOperateType.COMBO_NORMAL,_nowSelect.q_id,_hechengNum);
		}
		
		
		
		/**合成结果反馈*/
		private function updateHechengHandler(msg:ResEquipOperateResultMessage):void
		{
			if(msg.result==1)
			{
				setCaiLiaoData();
				updateAllList();
				//				if(_nowSelect){
				//					var oldindex:int=_skin.tree.selectedIndex;
				//					_skin.tree.selectedItem=getDataById(_nowSelect.q_item_id);
				//					_skin.tree.dataProvider.updateItemAt(oldindex);
				//					_skin.tree.dataProvider.updateItemAt(_skin.tree.selectedIndex);
				//					_skin.tree.validate();
				//				}
				//				_skin.tree.dataProvider.updateAll();
				
				this.playInter3DAt(ClientConfig.getEffect("ui_ronglu"),613,313,1);
				UIPopManager.showAlonePopUI(CenterEftPop,"ui_hechengchenggong");
			}
		}
		
		private function addEftComple(uint:RenderUnit3D):void
		{
			//,null,addEftComple
			uint.play();
		}
		
		private function setSelectItem(mod:Q_hecheng):void
		{
			if(!mod){
				return;
			}
			_nowSelect=mod;
			setShowData();
		}
	}
}