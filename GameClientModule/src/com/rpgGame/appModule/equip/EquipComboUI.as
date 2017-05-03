package com.rpgGame.appModule.equip
{
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.goods.BackPackManager;
	import com.rpgGame.app.manager.pop.UIPopManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.sender.ItemSender;
	import com.rpgGame.app.ui.common.CenterEftPop;
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.appModule.common.ViewUI;
	import com.rpgGame.appModule.equip.combo.DetailNodeInfo;
	import com.rpgGame.appModule.equip.combo.EquipComboTreeItemRender;
	import com.rpgGame.appModule.equip.combo.MainNodeInfo;
	import com.rpgGame.appModule.equip.combo.SubNodeInfo;
	import com.rpgGame.core.events.ItemEvent;
	import com.rpgGame.core.events.MainPlayerEvent;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.HeChengData;
	import com.rpgGame.coreData.cfg.NotifyCfgData;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.cfg.item.ItemContainerID;
	import com.rpgGame.coreData.clientConfig.Q_hecheng;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.type.CharAttributeType;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	import com.rpgGame.netData.equip.message.ResEquipOperateResultMessage;
	
	import app.message.EquipOperateType;
	
	import feathers.controls.ScrollBarDisplayMode;
	import feathers.controls.UIAsset;
	import feathers.data.ListCollection;
	import feathers.data.TreeNode;
	import feathers.layout.VerticalLayout;
	import feathers.themes.GuiThemeStyle;
	import feathers.utils.filter.GrayFilter;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.zhuangbei.hecheng.HeCheng_Skin;
	import org.mokylin.skin.component.list.ListSkin1;
	
	import starling.events.Event;
	
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
		//合成连接线
		private var _exisList:Vector.<UIAsset>;
		//合成数量
		private var _hechengNum:int=1;
		//能合成的最大数量
		private var _hechengMaxNum:int=1;
		
		private var _nowSelect:Q_hecheng;

		private var cailiaoId:int;
		private var userGold:Number;
		private var userMoney:Number;

		private var findRootNode:TreeNode;
		
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
						children.push(detailNodeInfo);
					}
					tempNode.addChildren(children);//添加根节点
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
			_cailiao=new Vector.<IconCDFace>();
			_exisList=new Vector.<UIAsset>();
			icon=new IconCDFace(IcoSizeEnum.ICON_64);
			icon.selectImgVisible=false;
			icon.x=572;
			icon.y=175;
			_exisList.push(_skin.exist1);
			_exisList.push(_skin.exist2);
			_exisList.push(_skin.exist3);
			_skin.container.addChild(icon);
			
			for(var i:int=0;i<CAILIAO_NUM;i++)
			{
				var ico:IconCDFace=new IconCDFace(IcoSizeEnum.ICON_48);		
				ico.selectImgVisible=false;
				//				ico.setIconResName(ClientConfig.getItemIcon("1001",IcoSizeEnum.ICON_48));
				var uias:UIAsset=_skin.grp_cailiao.getChildByName("cailiao"+(i+1)) as UIAsset;
				ico.x=uias.x;
				ico.y=uias.y;
				_skin.grp_cailiao.addChild(ico);
				_cailiao.push(ico);
			}
			
			clearPanel();
		}
		
		override public function show(data:Object=null):void
		{
			super.show();
			initEvent();
			userGold=MainRoleManager.actorInfo.totalStat.getResData(CharAttributeType.RES_GOLD)+ MainRoleManager.actorInfo.totalStat.getResData(CharAttributeType.RES_BIND_GOLD);
			userMoney=MainRoleManager.actorInfo.totalStat.getResData(CharAttributeType.RES_BIND_MONEY)+ MainRoleManager.actorInfo.totalStat.getResData(CharAttributeType.RES_MONEY);
			
			if(data){
				var node:TreeNode=_skin.tree.rootNode;
				var findId:int=data as int;
				findNode(node,findId);
				expandedNode(findRootNode);
				_skin.tree.updateTree();
				_skin.tree.selectedIndex=getIndexById(findId);
				onSelected(null);
			}
		}
		
		private function getIndexById(findId:int):int
		{
			var datas:ListCollection=_skin.tree.dataProvider;
			var arr:Array=datas.data as Array;
			for(var i:int=0;i<arr.length;i++){
				var node:TreeNode=arr[i] as TreeNode
				if(node.data is DetailNodeInfo&&DetailNodeInfo(node.data).data.q_item_id==findId){
					return i;
				}
			}
			return 0;
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
				node.expanded=true;
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
			_nowSelect=null;
		}
		
		//显示合成的对象
		private function setShowData():void
		{
			if(!_nowSelect) return;
			var itemInfo:ClientItemInfo=new ClientItemInfo(_nowSelect.q_item_id);
			FaceUtil.SetItemGrid(icon,itemInfo);
			icon.selectImgVisible=false;
			icon.setIconResName(ClientConfig.getItemIcon(ItemConfig.getItemIcon(_nowSelect.q_item_id),IcoSizeEnum.ICON_64));		
			
			_skin.equip_name.color=ItemConfig.getItemQualityColor(_nowSelect.q_item_id);
			_skin.equip_name.text=itemInfo.name;
			
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
			_hechengMaxNum=itemByBagNum/cailiaoNum;
			if(itemByBagNum>=cailiaoNum)
			{
				_skin.existall.visible=true;
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
				var itemInfo:ClientItemInfo=new ClientItemInfo(cailiaoId);
				FaceUtil.SetItemGrid(_cailiao[i],itemInfo);
				_cailiao[i].selectImgVisible=false;
				if(itemByBagNum>i)
				{
					_cailiao[i].isGary=false
				}else{
					_cailiao[i].isGary=true;
				}					
			}
		}
		
		private function updateShowNum():void
		{
			_skin.input_txt.text=_hechengNum.toString();
			_skin.lb_msg.htmlText=getTitleText("合成消耗");
		}
		
		private function initEvent():void
		{
			_skin.btn_min.addEventListener(Event.TRIGGERED,btnminHandler);
			_skin.btn_max.addEventListener(Event.TRIGGERED,btnmaxHandler);
			_skin.btnMax.addEventListener(Event.TRIGGERED,btnTomaxHandler);
			_skin.btn_hecheng.addEventListener(Event.TRIGGERED,btnHeChengHandler);
			
			EventManager.addEvent(ItemEvent.ITEM_COMBO_MSG,updateHechengHandler);
			EventManager.addEvent(ItemEvent.ITEM_HECHENG_SELECT,updateHechengHandler);
			
			_skin.tree.addEventListener(Event.SELECT,onSelected);
			
			EventManager.addEvent(ItemEvent.ITEM_ADD,onFreshItems);
			EventManager.addEvent(ItemEvent.ITEM_REMOVE_LIST,onRemoveFreshItems);
			EventManager.addEvent(ItemEvent.ITEM_CHANG,onFreshItems);
			EventManager.addEvent(MainPlayerEvent.STAT_RES_CHANGE,updateAmount);//金钱变化
		}
		
		private function updateAmount(type:int=3):void
		{
			if(type!=CharAttributeType.RES_GOLD&&type!=CharAttributeType.RES_BIND_GOLD&&type!=CharAttributeType.RES_MONEY&&type!=CharAttributeType.RES_BIND_MONEY){
				return;
			}
			userGold=MainRoleManager.actorInfo.totalStat.getResData(CharAttributeType.RES_GOLD)+ MainRoleManager.actorInfo.totalStat.getResData(CharAttributeType.RES_BIND_GOLD);
			userMoney=MainRoleManager.actorInfo.totalStat.getResData(CharAttributeType.RES_BIND_MONEY)+ MainRoleManager.actorInfo.totalStat.getResData(CharAttributeType.RES_MONEY);
			setShowData();
		}
		
		
		private function onFreshItems(info:ClientItemInfo=null):void
		{
			_skin.tree.dataProvider.updateAll();
			
			if(info.containerID==ItemContainerID.BackPack&&info.cfgId==cailiaoId){//背包里的合成对应合成材料
				setShowData();
			}
		}
		
		private function onRemoveFreshItems(list:Vector.<ClientItemInfo>):void
		{
			for each(var item:ClientItemInfo in list){
				if(item.containerID==ItemContainerID.BackPack&&item.cfgId==cailiaoId){//有一个是就去更新展示了
					setShowData();
					break;
				}
			}
			_skin.tree.dataProvider.updateAll();
		}
		
		private function onSelected(e:Event):void
		{
			var treeNode : TreeNode = _skin.tree.selectedItem as  TreeNode;
			if(!treeNode)
				return;
			var data:DetailNodeInfo=treeNode.data as DetailNodeInfo;
			if(!data){
				return;
			}
			
			setSelectItem(data.data);
		}
		
		private function clearEvent():void
		{
			_skin.btn_min.removeEventListener(Event.TRIGGERED,btnminHandler);
			_skin.btn_max.removeEventListener(Event.TRIGGERED,btnmaxHandler);
			_skin.btnMax.removeEventListener(Event.TRIGGERED,btnTomaxHandler);
			_skin.btn_hecheng.removeEventListener(Event.TRIGGERED,btnHeChengHandler);
			_skin.tree.removeEventListener(Event.SELECT,onSelected);
			
			EventManager.removeEvent(ItemEvent.ITEM_STRENGTH_MSG,updateHechengHandler);
		}
		
		private function clearPanel():void
		{
			for(var i:int=0;i<_exisList.length;i++)
			{
				_exisList[i].visible=false;
			}
			_skin.existall.visible=false;
			_hechengNum=1;
			updateShowNum();
		}
		
		private function clearAll():void
		{
			for(var i:int=0;i<_cailiao.length;i++)
			{
				_cailiao[i].clear();				
			}
			icon.clear();
			clearPanel();
		}
		
		//显示金钱的消耗数量
		private function getTitleText(title:String):String
		{
			var des:String="";
//			var userGold:int=MainRoleManager.actorInfo.totalStat.getResData(CharAttributeType.RES_GOLD);
//			var userMoney:int=MainRoleManager.actorInfo.totalStat.getResData(CharAttributeType.RES_MONEY);
		/*	if(_useGold*_hechengNum!=0&&_useGold*_hechengNum<=userGold){
				des=HtmlTextUtil.getTextColor(0x55BD15,(_useGold*_hechengNum).toString()+"元宝");//绿色
			}else if(_useGold*_hechengNum!=0&&_useGold*_hechengNum>userGold){
				des=HtmlTextUtil.getTextColor(0xd02525,(_useGold*_hechengNum).toString()+"元宝");//红色
			}*/
			if(!_nowSelect){
				return "";
			}
			var needMoney:int=_nowSelect.q_money*_hechengNum;
			if(needMoney<=userMoney){
				des+=HtmlTextUtil.getTextColor(0x55BD15,(needMoney).toString()+"银两");//绿色
			}else if(needMoney>userMoney){
				des+=HtmlTextUtil.getTextColor(0xd02525,(needMoney).toString()+"银两");//红色
			}
			return title+":"+des;
		}
		
		/**合成减*/
		private function btnminHandler(e:Event):void
		{
			if(_hechengNum>1)
			{
				_hechengNum--;
				updateShowNum();
			}else{
				NoticeManager.showNotifyById(2010);
			}
		}
		
		/**合成加*/
		private function btnmaxHandler(e:Event):void
		{
			if(_hechengNum<_hechengMaxNum)
			{
				_hechengNum++;
				updateShowNum();
			}else{
				NoticeManager.showNotifyById(2011);
			}
		}
		
		/**合成最大数量*/
		private function btnTomaxHandler(e:Event):void
		{
			if(_hechengNum!=_hechengMaxNum)
			{
				_hechengNum=_hechengMaxNum;
				if(_hechengNum==0) _hechengNum=1;
				updateShowNum();
			}else{
				NoticeManager.showNotifyById(2011);
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
			ItemSender.reqItemCompositionMessage(EquipOperateType.COMBO_NORMAL,_nowSelect.q_id,_hechengNum);
		}
		
		/**合成结果反馈*/
		private function updateHechengHandler(msg:ResEquipOperateResultMessage):void
		{
			if(msg.result==1)
			{
				setCaiLiaoData();
				_skin.tree.dataProvider.updateAll();
				
				this.playInter3DAt(ClientConfig.getEffect("ui_hechenghuiju"),0,0,1,null,addEftComple);
				UIPopManager.showAlonePopUI(CenterEftPop,"ui_hechengchenggong");
			}
		}
		
		private function addEftComple(uint:RenderUnit3D):void
		{
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