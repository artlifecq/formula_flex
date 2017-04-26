package com.rpgGame.appModule.equip
{
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.goods.BackPackManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.sender.ItemSender;
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
	import feathers.data.TreeNode;
	import feathers.layout.VerticalAlign;
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
			var lay:VerticalLayout=new VerticalLayout();
			lay.verticalAlign=VerticalAlign.TOP;
			lay.hasVariableItemDimensions=true;
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
						detailNodeInfo.type=mainNodeInfo.type;
						detailNodeInfo.subType=subList[0];
						detailNodeInfo.detailType=details[j];
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
							detailNodeInfo.type=mainNodeInfo.type;
							detailNodeInfo.subType=subList[j];
							detailNodeInfo.detailType=details[k];
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
		
		override public function show():void
		{
			super.show();
			initEvent();
		}
		
		override public function hide():void
		{
			super.hide();
			clearEvent();
			clearAll();
		}
		
		//显示合成的对象
		private function setShowData():void
		{
			if(!_nowSelect) return;
			var itemInfo:ClientItemInfo=new ClientItemInfo(_nowSelect.q_item_id);
			FaceUtil.SetItemGrid(icon,itemInfo);
			icon.selectImgVisible=false;
			icon.setIconResName(ClientConfig.getItemIcon(ItemConfig.getItemIcon(_nowSelect.q_item_id),IcoSizeEnum.ICON_64));		
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
			
			setSelectItem(HeChengData.getSonbySonTypeListByType(data.type,data.subType,data.detailType));
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
			}
		}
		
		/**合成加*/
		private function btnmaxHandler(e:Event):void
		{
			if(_hechengNum<_hechengMaxNum)
			{
				_hechengNum++;
				updateShowNum();
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
			}
		}
		
		/**合成请求*/
		private function btnHeChengHandler(e:Event):void
		{
			if(!_nowSelect) return;
			var cailiao:Array=JSONUtil.decode(_nowSelect.q_cost_items);
			if(cailiao==null) return;
			var cailiaoId:int=parseInt(cailiao[0]);
			var cailiaoNum:int=parseInt(cailiao[1]);
			var itemByBagNum:int=BackPackManager.instance.getBagItemsCountById(cailiaoId);
			if(itemByBagNum<cailiaoNum)
			{
				//提示材料不足
				NoticeManager.textNotify(NoticeManager.MOUSE_FOLLOW_TIP, NotifyCfgData.getNotifyTextByID(6012));
				return;
			}else if(_nowSelect.q_money*_hechengNum>userMoney){
				//提示银两不足
				NoticeManager.textNotify(NoticeManager.MOUSE_FOLLOW_TIP, NotifyCfgData.getNotifyTextByID(6012));
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
			}
		}
		
		private function setSelectItem(mod:Q_hecheng):void
		{
			if(!mod){
				return;
			}
			if(_nowSelect&&_nowSelect.q_subson_type==mod.q_subson_type) return;
			_nowSelect=mod;
			setShowData();
		}
	}
}